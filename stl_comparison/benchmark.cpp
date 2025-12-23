/**
 * Benchmark: cv::vector vs std::vector
 * 
 * Compares the performance of ConstantVector against the standard library vector.
 */

#include <benchmark/benchmark.h>
#include <vector>
#include "constant_vector.hpp"

// Force memory barrier to prevent optimization
template <typename T>
void DoNotOptimize(T& value) {
    asm volatile("" : "+r,m"(value) : : "memory");
}

// === Push Benchmarks ===
// Barrier AFTER loop - push_back has observable side effects (grows vector)
// No per-iteration barrier needed since push cannot be DCE'd
static void BM_StdVectorPush(benchmark::State& state) {
    for (auto _ : state) {
        std::vector<int> v;
        for (int i = 0; i < state.range(0); ++i) {
            v.push_back(i);
        }
        DoNotOptimize(v);  // Single barrier after all pushes
    }
}

static void BM_ConstantVectorPush(benchmark::State& state) {
    for (auto _ : state) {
        cv::vector<int> v;
        for (int i = 0; i < state.range(0); ++i) {
            v.push_back(i);
        }
        DoNotOptimize(v);  // Single barrier after all pushes
    }
}

// === Pop Benchmarks ===
// Barrier AFTER loop - pop_back has observable side effects (shrinks size)
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
        }
        benchmark::DoNotOptimize(v.size());  // Barrier on final size
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
        }
        benchmark::DoNotOptimize(v.size());  // Barrier on final size
    }
}

// === Random Access Benchmarks ===
// Accumulate result, barrier AFTER loop on the accumulated sum
static void BM_StdVectorAccess(benchmark::State& state) {
    std::vector<int> v;
    for (int i = 0; i < state.range(0); ++i) {
        v.push_back(i);
    }
    
    for (auto _ : state) {
        long long sum = 0;
        for (int i = 0; i < state.range(0); ++i) {
            sum += v[i];
        }
        benchmark::DoNotOptimize(sum);  // Barrier on accumulated result
    }
}

static void BM_ConstantVectorAccess(benchmark::State& state) {
    cv::vector<int> v;
    for (int i = 0; i < state.range(0); ++i) {
        v.push_back(i);
    }
    
    for (auto _ : state) {
        long long sum = 0;
        for (int i = 0; i < state.range(0); ++i) {
            sum += v[i];
        }
        benchmark::DoNotOptimize(sum);  // Barrier on accumulated result
    }
}

// === Iteration Benchmarks ===
// Accumulate result, barrier AFTER loop on the accumulated sum
static void BM_StdVectorIteration(benchmark::State& state) {
    std::vector<int> v;
    for (int i = 0; i < state.range(0); ++i) {
        v.push_back(i);
    }
    
    for (auto _ : state) {
        long long sum = 0;
        for (auto it = v.begin(); it != v.end(); ++it) {
            sum += *it;
        }
        benchmark::DoNotOptimize(sum);  // Barrier on accumulated result
    }
}

static void BM_ConstantVectorIteration(benchmark::State& state) {
    cv::vector<int> v;
    for (int i = 0; i < state.range(0); ++i) {
        v.push_back(i);
    }
    
    for (auto _ : state) {
        long long sum = 0;
        for (auto it = v.begin(); it != v.end(); ++it) {
            sum += *it;
        }
        benchmark::DoNotOptimize(sum);  // Barrier on accumulated result
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

// Access
BENCHMARK(BM_StdVectorAccess)->Iterations(ITERATIONS)->RangeMultiplier(RANGE_MULTIPLIER)->Range(START_SIZE, END_SIZE);
BENCHMARK(BM_ConstantVectorAccess)->Iterations(ITERATIONS)->RangeMultiplier(RANGE_MULTIPLIER)->Range(START_SIZE, END_SIZE);

// Iteration
BENCHMARK(BM_StdVectorIteration)->Iterations(ITERATIONS)->RangeMultiplier(RANGE_MULTIPLIER)->Range(START_SIZE, END_SIZE);
BENCHMARK(BM_ConstantVectorIteration)->Iterations(ITERATIONS)->RangeMultiplier(RANGE_MULTIPLIER)->Range(START_SIZE, END_SIZE);

BENCHMARK_MAIN();

