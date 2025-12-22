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
static void BM_StdVectorPush(benchmark::State& state) {
    for (auto _ : state) {
        std::vector<int> v;
        for (int i = 0; i < state.range(0); ++i) {
            v.push_back(i);
            DoNotOptimize(v.back());  // Use back() - depends on push, equal for both
        }
        DoNotOptimize(v);
    }
}

static void BM_ConstantVectorPush(benchmark::State& state) {
    for (auto _ : state) {
        cv::vector<int> v;
        for (int i = 0; i < state.range(0); ++i) {
            v.push_back(i);
            DoNotOptimize(v.back());  // Use back() - depends on push, equal for both
        }
        DoNotOptimize(v);
    }
}

// === Pop Benchmarks (neither shrinks - matches std::vector) ===
static void BM_StdVectorPop(benchmark::State& state) {
    for (auto _ : state) {
        state.PauseTiming();
        std::vector<int> v;
        for (int i = 0; i < state.range(0); ++i) {
            v.push_back(i);
        }
        state.ResumeTiming();
        
        while (!v.empty()) {
            v.pop_back();
            auto cap = v.capacity();
            DoNotOptimize(cap);  // Use capacity - simple member access for both
        }
        DoNotOptimize(v);
    }
}

static void BM_ConstantVectorPop(benchmark::State& state) {
    for (auto _ : state) {
        state.PauseTiming();
        cv::vector<int> v;
        for (int i = 0; i < state.range(0); ++i) {
            v.push_back(i);
        }
        state.ResumeTiming();
        
        while (!v.empty()) {
            v.pop_back();
            auto cap = v.capacity();
            DoNotOptimize(cap);  // Use capacity - simple member access for both
        }
        DoNotOptimize(v);
    }
}

// === Random Access Benchmarks ===
static void BM_StdVectorAccess(benchmark::State& state) {
    std::vector<int> v;
    for (int i = 0; i < state.range(0); ++i) {
        v.push_back(i);
    }
    
    for (auto _ : state) {
        long long sum = 0;
        for (int i = 0; i < state.range(0); ++i) {
            auto val = v[i];
            DoNotOptimize(val);  // Light barrier - prevents DCE, allows vectorization
            sum += val;
        }
        DoNotOptimize(sum);
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
            auto val = v[i];
            DoNotOptimize(val);  // Light barrier - prevents DCE, allows vectorization
            sum += val;
        }
        DoNotOptimize(sum);
    }
}

// === Iteration Benchmarks ===
static void BM_StdVectorIteration(benchmark::State& state) {
    std::vector<int> v;
    for (int i = 0; i < state.range(0); ++i) {
        v.push_back(i);
    }
    
    for (auto _ : state) {
        long long sum = 0;
        for (auto it = v.begin(); it != v.end(); ++it) {
            auto val = *it;
            DoNotOptimize(val);  // Light barrier
            sum += val;
        }
        DoNotOptimize(sum);
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
            auto val = *it;
            DoNotOptimize(val);  // Light barrier
            sum += val;
        }
        DoNotOptimize(sum);
    }
}

// === Benchmark Registration ===
#define ITERATIONS 30
#define START_SIZE 10
#define END_SIZE int(1e7)
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

