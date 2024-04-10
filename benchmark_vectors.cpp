#include <iostream>
#include <deque>
#include <vector>
#include <benchmark/benchmark.h>
#include "stl_vector.h"
#include "constant_vector.h"

using namespace std;


typedef ConstantVector<int> BenchVector;
int constantVectorPush(BenchVector &sv, int n)
{
    // int n = int(2e8);
    for (int i = 0; i < n; i++)
    {
        sv.push_back(i);
    }
    if (sv.size() != n) {
        cout << "ConstantVector Push Front didn't push all elements, n: " << n << ", sv size: " << sv.size() << endl;
    }
    return 0;

    // cout << "Stellar vector size: " << sv.size() << endl;
    // cout << "Stellar vector capacity: " << sv.capacity() << endl;
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
    // int n = int(2e8);
    for (int i = 0; i < n; i++)
    {
        sv.pop_back();
    }

    if (sv.size()) {
        cout << "ConstantVector Pop didn't do all pop_back()'s , n: " << n << ", sv size: " << sv.size() << endl;
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


int constantVectorElementAccess(BenchVector &sv, int n)
{
    // int n = sv.size();
    for (size_t i = 0; i < n; i++)
    {
        if (sv[i] != i)
        {
            cout << "Stellar vector element access Failed at index: " << i << ", sv[i]: " << sv[i] << endl;
            return -1;
        }
    }
    return 0;
}

long long constantVectorSum(BenchVector &sv)
{
    long long s = 0;
    for (int x : sv)
    {
        s += x;
    }
    return s;
}

typedef STLVector<int> BaseVector;
int vectorPush(BaseVector &v, int n)
{
    // int n = int(2e8);
    for (int i = 0; i < n; i++)
    {
        v.push_back(i);
    }

    if (v.size() != n) {
        cout << "Vector Push didn't push all elements, n: " << n << ", v size: " << v.size() << endl;
    }

    return v.size();
    // cout << "Vector size:" << v.size() << endl;
    // cout << "Vector capacity:" << v.capacity() << endl;
}


int vectorElementAccess(BaseVector &v, int n)
{
    // int n = v.size();
    for (size_t i = 0; i < n; i++)
    {
        if (v[i] != i)
        {
            return -1;
        }
    }
    return 0;
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
    }
    if (!v.empty())
    {
        cout << "Vector Pop didn't complete successfully" << endl;
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
        // This code gets timed
        constantVectorElementAccess(sv, state.range(0));
    }
}

static void BM_ConstantVectorIteration(benchmark::State &state)
{
    // Perform setup here
    BenchVector sv;
    constantVectorPush(sv, state.range(0));

    for (auto _ : state)
    {
        // This code gets timed
        constantVectorSum(sv);
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
        // This code gets timed
        vectorElementAccess(v, state.range(0));
    }
}


static void BM_VectorIteration(benchmark::State &state)
{
    // Perform setup here
    BaseVector v;
    vectorPush(v, state.range(0));
    for (auto _ : state)
    {
        // This code gets timed
        vectorSum(v);
    }
}

#define ITERATIONS 10
#define START_SIZE 1000
#define END_SIZE int(1e9)
#define RANGE_MULTIPLIER 10

// Register the function as a benchmark
BENCHMARK(BM_ConstantVectorPush)->Iterations(ITERATIONS)->RangeMultiplier(RANGE_MULTIPLIER)->Range(START_SIZE, END_SIZE);
BENCHMARK(BM_ConstantVectorPop)->Iterations(ITERATIONS)->RangeMultiplier(RANGE_MULTIPLIER)->Range(START_SIZE, END_SIZE);
BENCHMARK(BM_ConstantVectorAccess)->Iterations(ITERATIONS)->RangeMultiplier(RANGE_MULTIPLIER)->Range(START_SIZE, END_SIZE);
BENCHMARK(BM_ConstantVectorPopAndBack)->Iterations(ITERATIONS)->RangeMultiplier(RANGE_MULTIPLIER)->Range(START_SIZE, END_SIZE);
BENCHMARK(BM_ConstantVectorIteration)->Iterations(ITERATIONS)->RangeMultiplier(RANGE_MULTIPLIER)->Range(START_SIZE, END_SIZE);
BENCHMARK(BM_VectorPush)->Iterations(ITERATIONS)->RangeMultiplier(RANGE_MULTIPLIER)->Range(START_SIZE, END_SIZE);
BENCHMARK(BM_VectorPop)->Iterations(ITERATIONS)->RangeMultiplier(RANGE_MULTIPLIER)->Range(START_SIZE, END_SIZE);
BENCHMARK(BM_VectorAccess)->Iterations(ITERATIONS)->RangeMultiplier(RANGE_MULTIPLIER)->Range(START_SIZE, END_SIZE);
BENCHMARK(BM_VectorPopAndBack)->Iterations(ITERATIONS)->RangeMultiplier(RANGE_MULTIPLIER)->Range(START_SIZE, END_SIZE);
BENCHMARK(BM_VectorIteration)->Iterations(ITERATIONS)->RangeMultiplier(RANGE_MULTIPLIER)->Range(START_SIZE, END_SIZE);
// Run the benchmark
BENCHMARK_MAIN();
