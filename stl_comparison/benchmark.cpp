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
            if (current_size <= v.capacity() / 2) {
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
        for (int i = 0; i < state.range(0); ++i) {
            sink = v[i];
        }
    }
}

static void BM_ConstantVectorAccess(benchmark::State& state) {
    cv::vector<int> v;
    for (int i = 0; i < state.range(0); ++i) {
        v.push_back(i);
    }
    
    for (auto _ : state) {
        for (int i = 0; i < state.range(0); ++i) {
            sink = v[i];
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
        for (auto it = v.begin(); it != v.end(); ++it) {
            sink = *it;
        }
    }
}

static void BM_ConstantVectorIteration(benchmark::State& state) {
    cv::vector<int> v;
    for (int i = 0; i < state.range(0); ++i) {
        v.push_back(i);
    }
    
    for (auto _ : state) {
        for (auto it = v.begin(); it != v.end(); ++it) {
            sink = *it;
        }
    }
}

// === std::deque Benchmarks ===
#include <deque>

static void BM_DequePush(benchmark::State& state) {
    for (auto _ : state) {
        std::deque<int> d;
        for (int i = 0; i < state.range(0); ++i) {
            d.push_back(i);
            sink = i;
        }
    }
}

static void BM_DequePop(benchmark::State& state) {
    for (auto _ : state) {
        state.PauseTiming();
        std::deque<int> d;
        int n = state.range(0);
        for (int i = 0; i < n; ++i) {
            d.push_back(i);
        }
        state.ResumeTiming();
        
        for (int i = 0; i < n; ++i) {
            d.pop_back();
            sink = i;
        }
    }
}

static void BM_DequePopWithShrink(benchmark::State& state) {
    for (auto _ : state) {
        state.PauseTiming();
        std::deque<int> d;
        int n = state.range(0);
        for (int i = 0; i < n; ++i) {
            d.push_back(i);
        }
        state.ResumeTiming();
        
        size_t current_size = n;
        for (int i = 0; i < n; ++i) {
            d.pop_back();
            --current_size;
            // std::deque has shrink_to_fit since C++11
            if (current_size <= d.size() / 2 && current_size > 0) {
                d.shrink_to_fit();
            }
            sink = i;
        }
    }
}

static void BM_DequeAccess(benchmark::State& state) {
    std::deque<int> d;
    for (int i = 0; i < state.range(0); ++i) {
        d.push_back(i);
    }
    
    for (auto _ : state) {
        int64_t sum = 0;
        for (int i = 0; i < state.range(0); ++i) {
            sum += d[i];
            sink = sum;
        }
    }
}

static void BM_DequeIteration(benchmark::State& state) {
    std::deque<int> d;
    for (int i = 0; i < state.range(0); ++i) {
        d.push_back(i);
    }
    
    for (auto _ : state) {
        for (auto it = d.begin(); it != d.end(); ++it) {
            sink = *it;
        }
    }
}

// === Random Access Benchmarks (shuffled indices - cache unfriendly) ===
#include <algorithm>
#include <random>

static void BM_StdVectorRandomAccess(benchmark::State& state) {
    int n = state.range(0);
    std::vector<int> v;
    for (int i = 0; i < n; ++i) {
        v.push_back(i);
    }
    
    // Create shuffled indices (done once, outside timing)
    std::vector<int> indices(n);
    for (int i = 0; i < n; ++i) indices[i] = i;
    std::mt19937 rng(42);  // Fixed seed for reproducibility
    std::shuffle(indices.begin(), indices.end(), rng);
    
    for (auto _ : state) {
        for (int i = 0; i < n; ++i) {
            sink = v[indices[i]];
        }
    }
}

static void BM_ConstantVectorRandomAccess(benchmark::State& state) {
    int n = state.range(0);
    cv::vector<int> v;
    for (int i = 0; i < n; ++i) {
        v.push_back(i);
    }
    
    // Create shuffled indices (done once, outside timing)
    std::vector<int> indices(n);
    for (int i = 0; i < n; ++i) indices[i] = i;
    std::mt19937 rng(42);  // Fixed seed for reproducibility
    std::shuffle(indices.begin(), indices.end(), rng);
    
    for (auto _ : state) {
        for (int i = 0; i < n; ++i) {
            sink = v[indices[i]];
        }
    }
}

static void BM_DequeRandomAccess(benchmark::State& state) {
    int n = state.range(0);
    std::deque<int> d;
    for (int i = 0; i < n; ++i) {
        d.push_back(i);
    }
    
    // Create shuffled indices (done once, outside timing)
    std::vector<int> indices(n);
    for (int i = 0; i < n; ++i) indices[i] = i;
    std::mt19937 rng(42);  // Fixed seed for reproducibility
    std::shuffle(indices.begin(), indices.end(), rng);
    
    for (auto _ : state) {
        for (int i = 0; i < n; ++i) {
            sink = d[indices[i]];
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
BENCHMARK(BM_DequePush)->Iterations(ITERATIONS)->RangeMultiplier(RANGE_MULTIPLIER)->Range(START_SIZE, END_SIZE);

// Pop
BENCHMARK(BM_StdVectorPop)->Iterations(ITERATIONS)->RangeMultiplier(RANGE_MULTIPLIER)->Range(START_SIZE, END_SIZE);
BENCHMARK(BM_ConstantVectorPop)->Iterations(ITERATIONS)->RangeMultiplier(RANGE_MULTIPLIER)->Range(START_SIZE, END_SIZE);
BENCHMARK(BM_DequePop)->Iterations(ITERATIONS)->RangeMultiplier(RANGE_MULTIPLIER)->Range(START_SIZE, END_SIZE);

// Pop with Shrink (memory-conscious pop)
BENCHMARK(BM_StdVectorPopWithShrink)->Iterations(ITERATIONS)->RangeMultiplier(RANGE_MULTIPLIER)->Range(START_SIZE, END_SIZE);
BENCHMARK(BM_ConstantVectorPopWithShrink)->Iterations(ITERATIONS)->RangeMultiplier(RANGE_MULTIPLIER)->Range(START_SIZE, END_SIZE);
BENCHMARK(BM_DequePopWithShrink)->Iterations(ITERATIONS)->RangeMultiplier(RANGE_MULTIPLIER)->Range(START_SIZE, END_SIZE);

// Access
BENCHMARK(BM_StdVectorAccess)->Iterations(ITERATIONS)->RangeMultiplier(RANGE_MULTIPLIER)->Range(START_SIZE, END_SIZE);
BENCHMARK(BM_ConstantVectorAccess)->Iterations(ITERATIONS)->RangeMultiplier(RANGE_MULTIPLIER)->Range(START_SIZE, END_SIZE);
BENCHMARK(BM_DequeAccess)->Iterations(ITERATIONS)->RangeMultiplier(RANGE_MULTIPLIER)->Range(START_SIZE, END_SIZE);

// Iteration
BENCHMARK(BM_StdVectorIteration)->Iterations(ITERATIONS)->RangeMultiplier(RANGE_MULTIPLIER)->Range(START_SIZE, END_SIZE);
BENCHMARK(BM_ConstantVectorIteration)->Iterations(ITERATIONS)->RangeMultiplier(RANGE_MULTIPLIER)->Range(START_SIZE, END_SIZE);
BENCHMARK(BM_DequeIteration)->Iterations(ITERATIONS)->RangeMultiplier(RANGE_MULTIPLIER)->Range(START_SIZE, END_SIZE);

// Random Access (shuffled indices - cache unfriendly)
BENCHMARK(BM_StdVectorRandomAccess)->Iterations(ITERATIONS)->RangeMultiplier(RANGE_MULTIPLIER)->Range(START_SIZE, END_SIZE);
BENCHMARK(BM_ConstantVectorRandomAccess)->Iterations(ITERATIONS)->RangeMultiplier(RANGE_MULTIPLIER)->Range(START_SIZE, END_SIZE);
BENCHMARK(BM_DequeRandomAccess)->Iterations(ITERATIONS)->RangeMultiplier(RANGE_MULTIPLIER)->Range(START_SIZE, END_SIZE);

BENCHMARK_MAIN();
