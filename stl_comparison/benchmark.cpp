/**
 * Benchmark: cv::vector vs std::vector
 * 
 * Compares the performance of ConstantVector against the standard library vector.
 * 
 * Barrier Strategy: Uses volatile sink with back() for equal overhead
 * - Push: Sink back() after loop - depends on pushed values
 * - Pop: Sink back() before each pop - prevents DCE, equal overhead
 * - Access/Iteration: Sink accumulated sum to ensure computation happens
 */

#include <benchmark/benchmark.h>
#include <vector>
#include "constant_vector.hpp"

// Volatile sink prevents compiler from optimizing away operations
// This is simpler and more reliable than inline asm barriers
static volatile int64_t sink = 0;

// === Push Benchmarks ===
static void BM_StdVectorPush(benchmark::State& state) {
    for (auto _ : state) {
        std::vector<int> v;
        for (int i = 0; i < state.range(0); ++i) {
            v.push_back(i);
            sink = i;
        }
    }
}

static void BM_ConstantVectorPush(benchmark::State& state) {
    for (auto _ : state) {
        cv::vector<int> v;
        for (int i = 0; i < state.range(0); ++i) {
            v.push_back(i);
            sink = i;
        }
    }
}

// === Pop Benchmarks ===
// Per-iteration sink required - otherwise compiler can optimize entire loop away
static void BM_StdVectorPop(benchmark::State& state) {
    for (auto _ : state) {
        state.PauseTiming();
        std::vector<int> v;
        int n = state.range(0);
        for (int i = 0; i < n; ++i) {
            v.push_back(i);
        }
        state.ResumeTiming();
        
        for (int i = 0; i < n; ++i) {
            v.pop_back();
            sink = i;
        }
    }
}

static void BM_ConstantVectorPop(benchmark::State& state) {
    for (auto _ : state) {
        state.PauseTiming();
        cv::vector<int> v;
        int n = state.range(0);
        for (int i = 0; i < n; ++i) {
            v.push_back(i);
        }
        state.ResumeTiming();
        

        for (int i = 0; i < n; ++i) {
            v.pop_back();
            sink = i;
        }
    }
}

// === Pop with Shrink Benchmarks ===
// Both use cached size counter for fair comparison (cv::vector's size() has slight overhead)
// std::vector: pop_back + shrink_to_fit when size < capacity/2
// cv::vector: pop_back + shrink_to_fit (deallocates empty blocks)

static void BM_StdVectorPopWithShrink(benchmark::State& state) {
    for (auto _ : state) {
        state.PauseTiming();
        std::vector<int> v;
        int n = state.range(0);
        for (int i = 0; i < n; ++i) {
            v.push_back(i);
        }
        state.ResumeTiming();
        
        size_t current_size = n;  // Track size locally
        for (int i = 0; i < n; ++i) {
            v.pop_back();
            --current_size;
            // Shrink when size drops below half capacity
            if (current_size < v.capacity() / 2) {
                v.shrink_to_fit();
            }
            sink = i;
        }
    }
}

static void BM_ConstantVectorPopWithShrink(benchmark::State& state) {
    for (auto _ : state) {
        state.PauseTiming();
        cv::vector<int> v;
        int n = state.range(0);
        for (int i = 0; i < n; ++i) {
            v.push_back(i);
        }
        state.ResumeTiming();
        
        // Uses cv::vector's built-in pop_back_with_shrink
        // Deallocates blocks when they become empty - O(1) with automatic memory reclamation
        for (int i = 0; i < n; ++i) {
            v.pop_back_with_shrink();
            sink = i;
        }
    }
}


// === Random Access Benchmarks ===
static void BM_StdVectorAccess(benchmark::State& state) {
    std::vector<int> v;
    for (int i = 0; i < state.range(0); ++i) {
        v.push_back(i);
    }
    
    for (auto _ : state) {
        int64_t sum = 0;
        for (int i = 0; i < state.range(0); ++i) {
            sum += v[i];
            sink = sum;
        }
    }
}

static void BM_ConstantVectorAccess(benchmark::State& state) {
    cv::vector<int> v;
    for (int i = 0; i < state.range(0); ++i) {
        v.push_back(i);
    }
    
    for (auto _ : state) {
        int64_t sum = 0;
        for (int i = 0; i < state.range(0); ++i) {
            sum += v[i];
            sink = sum;
        }
    }
}

// === Iteration Benchmarks ===
static void BM_StdVectorIteration(benchmark::State& state) {
    std::vector<int> v;
    for (int i = 0; i < state.range(0); ++i) {
        v.push_back(i);
    }
    
    for (auto _ : state) {
        int64_t sum = 0;
        for (auto it = v.begin(); it != v.end(); ++it) {
            sum += *it;
            sink = sum;
        }
    }
}

static void BM_ConstantVectorIteration(benchmark::State& state) {
    cv::vector<int> v;
    for (int i = 0; i < state.range(0); ++i) {
        v.push_back(i);
    }
    
    for (auto _ : state) {
        int64_t sum = 0;
        for (auto it = v.begin(); it != v.end(); ++it) {
            sum += *it;
            sink = sum;
        }
    }
}

// === Benchmark Registration ===
#define ITERATIONS 100
#define START_SIZE 10
#define END_SIZE int(1e8)
#define RANGE_MULTIPLIER 10

// Push
BENCHMARK(BM_StdVectorPush)->Iterations(ITERATIONS)->RangeMultiplier(RANGE_MULTIPLIER)->Range(START_SIZE, END_SIZE);
BENCHMARK(BM_ConstantVectorPush)->Iterations(ITERATIONS)->RangeMultiplier(RANGE_MULTIPLIER)->Range(START_SIZE, END_SIZE);

// Pop
BENCHMARK(BM_StdVectorPop)->Iterations(ITERATIONS)->RangeMultiplier(RANGE_MULTIPLIER)->Range(START_SIZE, END_SIZE);
BENCHMARK(BM_ConstantVectorPop)->Iterations(ITERATIONS)->RangeMultiplier(RANGE_MULTIPLIER)->Range(START_SIZE, END_SIZE);

// Pop with Shrink (memory-conscious pop)
BENCHMARK(BM_StdVectorPopWithShrink)->Iterations(ITERATIONS)->RangeMultiplier(RANGE_MULTIPLIER)->Range(START_SIZE, END_SIZE);
BENCHMARK(BM_ConstantVectorPopWithShrink)->Iterations(ITERATIONS)->RangeMultiplier(RANGE_MULTIPLIER)->Range(START_SIZE, END_SIZE);

// Access
BENCHMARK(BM_StdVectorAccess)->Iterations(ITERATIONS)->RangeMultiplier(RANGE_MULTIPLIER)->Range(START_SIZE, END_SIZE);
BENCHMARK(BM_ConstantVectorAccess)->Iterations(ITERATIONS)->RangeMultiplier(RANGE_MULTIPLIER)->Range(START_SIZE, END_SIZE);

// Iteration
BENCHMARK(BM_StdVectorIteration)->Iterations(ITERATIONS)->RangeMultiplier(RANGE_MULTIPLIER)->Range(START_SIZE, END_SIZE);
BENCHMARK(BM_ConstantVectorIteration)->Iterations(ITERATIONS)->RangeMultiplier(RANGE_MULTIPLIER)->Range(START_SIZE, END_SIZE);

BENCHMARK_MAIN();
