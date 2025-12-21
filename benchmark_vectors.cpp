#include <iostream>
#include <deque>
#include <vector>
#include <benchmark/benchmark.h>
#include "stl_vector.h"
#include "constant_vector.h"

using namespace std;

// STRICT Memory Barrier for Apples-to-Apples Latency Benchmark
// This forces a store to memory, preventing register-only optimizations.
template <class Tp>
inline void ForceMemory(Tp const& value) {
    asm volatile("" : : "m"(value) : "memory");
}

typedef ConstantVector<int> BenchVector;
int constantVectorPush(BenchVector &sv, int n)
{
    for (int i = 0; i < n; i++)
    {
        sv.push_back(i);
        ForceMemory(sv);
    }
    return sv.size();
}

int constantVectorPushPop(BenchVector &sv, int n)
{
    // int n = int(2e8);
    for (int i = 0; i < n; i++)
    {
        sv.push_back(i);
    }
    for (int i = 0; i < n; i++)
    {
        sv.pop_back();
    }

    if (sv.size()) {
        cout << "ConstantVector Push Pop didn't do all push/pop elements, n: " << n << ", sv size: " << sv.size() << endl;
    }
    return sv.size();

    // cout << "Stellar vector size: " << sv.size() << endl;
    // cout << "Stellar vector capacity: " << sv.capacity() << endl;
}

int constantVectorPop(BenchVector &sv, int n)
{
    for (int i = 0; i < n; i++)
    {
        sv.pop_back();
        ForceMemory(sv);
    }
    return sv.size();
}

int constantVectorPopNoShrink(BenchVector &sv, int n)
{
    for (int i = 0; i < n; i++)
    {
        sv.pop_back_no_shrink();
        ForceMemory(sv);
    }
    return sv.size();
}

int constantVectorPopFront(BenchVector &sv, int n)
{
    // int n = int(2e8);
    for (int i = 0; i < n; i++)
    {
        sv.pop_front();
    }
    if (!sv.empty()) {
        cout << "Stellar vector pop front didn't complete successfully, n: " << n << ", sv size: " << sv.size() << endl;
    }
    return sv.size();
}

int constantVectorPopAndBack(BenchVector &sv, int n)
{
    for (int i = 0; i < n; i++)
    {

        if (sv.back() != n - i - 1)
        {
            cout << " Steller vector back() is not matching: " << sv.back() << ", n-i-1: " << n - i - 1 << endl;
            return sv.size();
        }
        sv.pop_back();
    }

    if (!sv.empty())
    {
        cout << "Stellar vector Pop_back() and back() didn't run completely" << endl;
    }

    return sv.size();
}


long long constantVectorElementAccess(BenchVector &sv, int n)
{
    long long sum = 0;
    for (size_t i = 0; i < n; i++)
    {
        sum += sv[i];
        ForceMemory(sum);
    }
    return sum;
}

long long constantVectorSum(BenchVector &sv)
{
    long long s = 0;
    for (int x : sv)
    {
        s += x;
        ForceMemory(s);
    }
    return s;
}

typedef STLVector<int> BaseVector;
int vectorPush(BaseVector &v, int n)
{
    for (int i = 0; i < n; i++)
    {
        v.push_back(i);
        ForceMemory(v);
    }
    return v.size();
}


long long vectorElementAccess(BaseVector &v, int n)
{
    long long sum = 0;
    for (size_t i = 0; i < n; i++)
    {
        sum += v[i];
        ForceMemory(sum);
    }
    return sum;
}

int vectorPushPop(BaseVector &v, int n)
{
    // int n = int(2e8);
    for (int i = 0; i < n; i++)
    {
        v.push_back(i);
    }
    for (int i = 0; i < n; i++)
    {
        v.pop_back();
    }

    if (!v.empty())
    {
        cout << "Vector Pop didn't complete successfully in VectorPushPop" << endl;
    }
    // cout << "Vector size:" << v.size() << endl;
    // cout << "Vector capacity:" << v.capacity() << endl;
    return v.size();
}

int vectorPop(BaseVector &v, int n)
{
    for (int i = 0; i < n; i++)
    {
        v.pop_back();
        ForceMemory(v);
    }
    return v.size();
}



int vectorPopAndBack(BaseVector &v, int n)
{
    for (int i = 0; i < n; i++)
    {
        // cout << "VectorPopAndback:: i: " << i << ", v.back(): " << v.back() << ", n-i-1: " << n-i-1 << endl;
        if (v.back() != n - i - 1)
        {
            return v.size();
        }
        v.pop_back();
    }
    if (!v.empty())
    {
        cout << "vector Pop_back() and back() didn't run completely" << endl;
    }
    return v.size();
}

long long vectorSum(BaseVector &v)
{
    long long s = 0;
    for (int x : v)
    {
        s += x;
        ForceMemory(s);
    }
    return s;
}

static void BM_ConstantVectorPush(benchmark::State &state)
{
    // Perform setup here
    for (auto _ : state)
    {
        // This code gets timed
        BenchVector sv;
        constantVectorPush(sv, state.range(0));
    }
}

static void BM_ConstantVectorPop(benchmark::State &state)
{
    // Perform setup here
    for (auto _ : state)
    {
        // This code gets timed
        state.PauseTiming();
        BenchVector sv;
        constantVectorPush(sv, state.range(0));
        state.ResumeTiming();
        constantVectorPop(sv, state.range(0));
    }
}

static void BM_ConstantVectorPopNoShrink(benchmark::State &state)
{
    // Perform setup here
    for (auto _ : state)
    {
        // This code gets timed
        state.PauseTiming();
        BenchVector sv;
        constantVectorPush(sv, state.range(0));
        state.ResumeTiming();
        constantVectorPopNoShrink(sv, state.range(0));
    }
}


static void BM_ConstantVectorPushPop(benchmark::State &state)
{
    // Perform setup here
    BenchVector sv;
    for (auto _ : state)
    {
        // This code gets timed
        constantVectorPushPop(sv, state.range(0));
    }
}


static void BM_ConstantVectorPopAndBack(benchmark::State &state)
{
    // Perform setup here
    for (auto _ : state)
    {
        // This code gets timed
        state.PauseTiming();
        BenchVector sv;
        constantVectorPush(sv, state.range(0));
        state.ResumeTiming();
        constantVectorPopAndBack(sv, state.range(0));
    }
}

static void BM_ConstantVectorAccess(benchmark::State &state)
{
    // Perform setup here
    BenchVector sv;
    constantVectorPush(sv, state.range(0));

    for (auto _ : state)
    {
        // This code gets timed - use DoNotOptimize to prevent elimination
        benchmark::DoNotOptimize(constantVectorElementAccess(sv, state.range(0)));
    }
}

static void BM_ConstantVectorIteration(benchmark::State &state)
{
    // Perform setup here
    BenchVector sv;
    constantVectorPush(sv, state.range(0));

    for (auto _ : state)
    {
        // This code gets timed - use DoNotOptimize to prevent elimination
        benchmark::DoNotOptimize(constantVectorSum(sv));
    }
}

static void BM_VectorPush(benchmark::State &state)
{
    // Perform setup here
    for (auto _ : state)
    {
        // This code gets timed
        BaseVector v;
        vectorPush(v, state.range(0));
    }
}


static void BM_VectorPop(benchmark::State &state)
{
    // Perform setup here
    for (auto _ : state)
    {
        // This code gets timed
        state.PauseTiming();
        BaseVector v;
        vectorPush(v, state.range(0));
        state.ResumeTiming();
        vectorPop(v, state.range(0));
    }
}


static void BM_VectorPopAndBack(benchmark::State &state)
{
    // Perform setup here
    for (auto _ : state)
    {
        // This code gets timed
        state.PauseTiming();
        BaseVector v;
        vectorPush(v, state.range(0));
        state.ResumeTiming();
        vectorPopAndBack(v, state.range(0));
    }
}

static void BM_VectorPushPop(benchmark::State &state)
{
    // Perform setup here
    BaseVector v;
    vectorPush(v, state.range(0));
    for (auto _ : state)
    {
        // This code gets timed
        vectorPop(v, state.range(0));
    }
}

static void BM_VectorAccess(benchmark::State &state)
{
    // Perform setup here
    BaseVector v;
    vectorPush(v, state.range(0));
    for (auto _ : state)
    {
        // This code gets timed - use DoNotOptimize to prevent elimination
        benchmark::DoNotOptimize(vectorElementAccess(v, state.range(0)));
    }
}


static void BM_VectorIteration(benchmark::State &state)
{
    // Perform setup here
    BaseVector v;
    vectorPush(v, state.range(0));
    for (auto _ : state)
    {
        // This code gets timed - use ForceMemory to prevent elimination
        auto s = vectorSum(v);
        ForceMemory(s);
    }
}

#define ITERATIONS 30           // Statistically significant (n>=30 for CLT)
#define START_SIZE int(10)
#define END_SIZE int(1e8)
#define RANGE_MULTIPLIER 10

// Register the function as a benchmark
BENCHMARK(BM_ConstantVectorPush)->Iterations(ITERATIONS)->RangeMultiplier(RANGE_MULTIPLIER)->Range(START_SIZE, END_SIZE);
BENCHMARK(BM_ConstantVectorPop)->Iterations(ITERATIONS)->RangeMultiplier(RANGE_MULTIPLIER)->Range(START_SIZE, END_SIZE);
BENCHMARK(BM_ConstantVectorPopNoShrink)->Iterations(ITERATIONS)->RangeMultiplier(RANGE_MULTIPLIER)->Range(START_SIZE, END_SIZE);
BENCHMARK(BM_ConstantVectorAccess)->Iterations(ITERATIONS)->RangeMultiplier(RANGE_MULTIPLIER)->Range(START_SIZE, END_SIZE);
BENCHMARK(BM_ConstantVectorIteration)->Iterations(ITERATIONS)->RangeMultiplier(RANGE_MULTIPLIER)->Range(START_SIZE, END_SIZE);
BENCHMARK(BM_VectorPush)->Iterations(ITERATIONS)->RangeMultiplier(RANGE_MULTIPLIER)->Range(START_SIZE, END_SIZE);
BENCHMARK(BM_VectorPop)->Iterations(ITERATIONS)->RangeMultiplier(RANGE_MULTIPLIER)->Range(START_SIZE, END_SIZE);
BENCHMARK(BM_VectorAccess)->Iterations(ITERATIONS)->RangeMultiplier(RANGE_MULTIPLIER)->Range(START_SIZE, END_SIZE);
BENCHMARK(BM_VectorIteration)->Iterations(ITERATIONS)->RangeMultiplier(RANGE_MULTIPLIER)->Range(START_SIZE, END_SIZE);
// Run the benchmark
BENCHMARK_MAIN();
