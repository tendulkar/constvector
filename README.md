## Introduction
This repository implements a vector, O(1) worstcase time for all operations
Implemented as a part of my idea, but found that it's not novel, 
already invented in [1999](https://cs.uwaterloo.ca/research/tr/1999/09/CS-99-09.pdf).

The paper and my idea implements vector operations: push, pop and operator[] with O(1) worstcase time complexity. Note that STL vector or deque from C++ (even at C++20 standard) doesn't provide O(1) time for these operations.

The paper also optimised the extra space to  &Theta;($\sqrt N$), while my algorithm in &Theta;(N). 
My algorithm described in the slides [here](https://docs.google.com/presentation/d/1zHFswkLQOmpZ0-j5z1kHkkywEColxSCnFhcCCM90Mw0/edit?usp=sharing). It has visual representation of algorithm, pseduo code, time and space complexity analysis, benchmarks, effects on memory management and CPU cache. 

## Summary of vector to support constant push, pop, operator[]
* we start with array of size 8
* assume all 'N' push operations, for first 8 pushes we fill the array
* when we get  9th push, we create new array with size 16, **but don't copy** the old elements, new array will contain elements only from index 8
* when we get 25th push, we create new array with size 32, **but don't copy** the old elements, new array will contain elements only from index 24
* when we get 57th push, we create new array with size 64, **but don't copy** the old elements, new array will contain elements only from index 56
* ...
* So we'll have log(N) *array blocks*, where *i-th* array will have 2^(i+3) size. total size of all array is O(N)

#### Pop elements
* remove the last element from last array, if the last array becomes empty deallocate the *array block* all together

#### operator[]
* given i, find which *array block* will have the element, for example if i = 90, it'll be in 4th array (index will be 3)
* we use logarithm to calculate the index with offset, (in implements we used __builtin_clz (count leading zeros)) for efficient implementation
* once we know the *array block* index, we can calulate the position of ith element in the array block by subtracting number of elements before this array
* for the example for 90, we go to *array block* with index 3, and subtract 56, so we go to 34th index 
* all this math operations can be done in O(1) time.

## Files description
* constant_vector.h --> contains implementation for new vector 
* stl_vector.h --> contains stl implementation of vector
* benchmark_vectors.cpp --> uses [google/benchmark](https://github.com/google/benchmark) library to calculate benchmarks


#### Why don't we use existing STL vector to compare, why create a new implemeatation of STL vector ?
* STL vector pushes don't only push the element, it invalidates the iterators and does some more work, in our internal testing, the STL push is taking >40ns / operation, but when we implement the STL push, it's < 6ns! Since other operations are taking more time, we felt it's not right to compare with actual STL implemenations.
* So we have written both implemenations with same level of optimisations (same allocators, same method modifiers, same number of function calls to the code), so that our comparision could be more accurate. we have choosen to keep implementations simple so that we could actually test the actual code instead of calculating overhead of multiple function calls (a function call typically takes > 1ns)

## Benchmark results
Setup: Apple m2 max, 96 GB RAM, Clang, Std = C++20. 
Please find it in the slides [here](https://docs.google.com/presentation/d/1zHFswkLQOmpZ0-j5z1kHkkywEColxSCnFhcCCM90Mw0/edit?usp=sharing)
Idea is that this implemenation has **better time / op due to removing reallocations**

### Command to build and run
```
g++ -std=c++20 benchmark_vectors.cpp -isystem <filepath>/google/benchmark/include  -L<filepath>/google/benchmark/build/src -lbenchmark -lpthread  -o benchmark_vectors.out

./benchmark_vectors.out --benchmark_format=json
```

### Tried following operations: 
* push
* pop
* operator[]
* pop and back operations together
* iteration using iterators

Used vector sizes 1K to 1B, tried 10 iterations, the library showed a warning that the `Estimated CPU frequency may be incorrect`
```
{
  "context": {
    "date": "2024-04-10T19:22:38+05:30",
    "host_name": "Yugandhars-MacBook-Pro.local",
    "executable": "./benchmark_vectors.out",
    "num_cpus": 12,
    "mhz_per_cpu": 24,
    "cpu_scaling_enabled": false,
    "caches": [
      {
        "type": "Data",
        "level": 1,
        "size": 65536,
        "num_sharing": 0
      },
      {
        "type": "Instruction",
        "level": 1,
        "size": 131072,
        "num_sharing": 0
      },
      {
        "type": "Unified",
        "level": 2,
        "size": 4194304,
        "num_sharing": 1
      }
    ],
    "load_avg": [3.4375,3.30225,3.31104],
    "library_version": "v1.8.3-60-g15769911",
    "library_build_type": "release",
    "json_schema_version": 1
  },
  "benchmarks": [
    {
      "name": "BM_ConstantVectorPush/1000/iterations:10",
      "family_index": 0,
      "per_family_instance_index": 0,
      "run_name": "BM_ConstantVectorPush/1000/iterations:10",
      "run_type": "iteration",
      "repetitions": 1,
      "repetition_index": 0,
      "threads": 1,
      "iterations": 10,
      "real_time": 4.4540502130985260e+03,
      "cpu_time": 4.4999999999961738e+03,
      "time_unit": "ns"
    },
    {
      "name": "BM_ConstantVectorPush/10000/iterations:10",
      "family_index": 0,
      "per_family_instance_index": 1,
      "run_name": "BM_ConstantVectorPush/10000/iterations:10",
      "run_type": "iteration",
      "repetitions": 1,
      "repetition_index": 0,
      "threads": 1,
      "iterations": 10,
      "real_time": 3.3320859074592590e+04,
      "cpu_time": 3.2900000000002372e+04,
      "time_unit": "ns"
    },
    {
      "name": "BM_ConstantVectorPush/100000/iterations:10",
      "family_index": 0,
      "per_family_instance_index": 2,
      "run_name": "BM_ConstantVectorPush/100000/iterations:10",
      "run_type": "iteration",
      "repetitions": 1,
      "repetition_index": 0,
      "threads": 1,
      "iterations": 10,
      "real_time": 3.3292090520262718e+05,
      "cpu_time": 3.2039999999999849e+05,
      "time_unit": "ns"
    },
    {
      "name": "BM_ConstantVectorPush/1000000/iterations:10",
      "family_index": 0,
      "per_family_instance_index": 3,
      "run_name": "BM_ConstantVectorPush/1000000/iterations:10",
      "run_type": "iteration",
      "repetitions": 1,
      "repetition_index": 0,
      "threads": 1,
      "iterations": 10,
      "real_time": 3.4664291888475418e+06,
      "cpu_time": 3.4104000000000135e+06,
      "time_unit": "ns"
    },
    {
      "name": "BM_ConstantVectorPush/10000000/iterations:10",
      "family_index": 0,
      "per_family_instance_index": 4,
      "run_name": "BM_ConstantVectorPush/10000000/iterations:10",
      "run_type": "iteration",
      "repetitions": 1,
      "repetition_index": 0,
      "threads": 1,
      "iterations": 10,
      "real_time": 3.4122470859438181e+07,
      "cpu_time": 3.3307099999999989e+07,
      "time_unit": "ns"
    },
    {
      "name": "BM_ConstantVectorPush/100000000/iterations:10",
      "family_index": 0,
      "per_family_instance_index": 5,
      "run_name": "BM_ConstantVectorPush/100000000/iterations:10",
      "run_type": "iteration",
      "repetitions": 1,
      "repetition_index": 0,
      "threads": 1,
      "iterations": 10,
      "real_time": 3.5352062499150634e+08,
      "cpu_time": 3.4453760000000000e+08,
      "time_unit": "ns"
    },
    {
      "name": "BM_ConstantVectorPush/1000000000/iterations:10",
      "family_index": 0,
      "per_family_instance_index": 6,
      "run_name": "BM_ConstantVectorPush/1000000000/iterations:10",
      "run_type": "iteration",
      "repetitions": 1,
      "repetition_index": 0,
      "threads": 1,
      "iterations": 10,
      "real_time": 3.6139006707817316e+09,
      "cpu_time": 3.4808775000000010e+09,
      "time_unit": "ns"
    },
    {
      "name": "BM_ConstantVectorPop/1000/iterations:10",
      "family_index": 1,
      "per_family_instance_index": 0,
      "run_name": "BM_ConstantVectorPop/1000/iterations:10",
      "run_type": "iteration",
      "repetitions": 1,
      "repetition_index": 0,
      "threads": 1,
      "iterations": 10,
      "real_time": 5.0207599997520447e+03,
      "cpu_time": 5.0000000030081537e+03,
      "time_unit": "ns"
    },
    {
      "name": "BM_ConstantVectorPop/10000/iterations:10",
      "family_index": 1,
      "per_family_instance_index": 1,
      "run_name": "BM_ConstantVectorPop/10000/iterations:10",
      "run_type": "iteration",
      "repetitions": 1,
      "repetition_index": 0,
      "threads": 1,
      "iterations": 10,
      "real_time": 3.6608148366212845e+04,
      "cpu_time": 3.4999999998319705e+04,
      "time_unit": "ns"
    },
    {
      "name": "BM_ConstantVectorPop/100000/iterations:10",
      "family_index": 1,
      "per_family_instance_index": 2,
      "run_name": "BM_ConstantVectorPop/100000/iterations:10",
      "run_type": "iteration",
      "repetitions": 1,
      "repetition_index": 0,
      "threads": 1,
      "iterations": 10,
      "real_time": 3.8080401718616486e+05,
      "cpu_time": 3.8070000000018917e+05,
      "time_unit": "ns"
    },
    {
      "name": "BM_ConstantVectorPop/1000000/iterations:10",
      "family_index": 1,
      "per_family_instance_index": 3,
      "run_name": "BM_ConstantVectorPop/1000000/iterations:10",
      "run_type": "iteration",
      "repetitions": 1,
      "repetition_index": 0,
      "threads": 1,
      "iterations": 10,
      "real_time": 3.5875958390533924e+06,
      "cpu_time": 3.4610000000014910e+06,
      "time_unit": "ns"
    },
    {
      "name": "BM_ConstantVectorPop/10000000/iterations:10",
      "family_index": 1,
      "per_family_instance_index": 4,
      "run_name": "BM_ConstantVectorPop/10000000/iterations:10",
      "run_type": "iteration",
      "repetitions": 1,
      "repetition_index": 0,
      "threads": 1,
      "iterations": 10,
      "real_time": 3.5342166572809219e+07,
      "cpu_time": 3.4174400000000559e+07,
      "time_unit": "ns"
    },
    {
      "name": "BM_ConstantVectorPop/100000000/iterations:10",
      "family_index": 1,
      "per_family_instance_index": 5,
      "run_name": "BM_ConstantVectorPop/100000000/iterations:10",
      "run_type": "iteration",
      "repetitions": 1,
      "repetition_index": 0,
      "threads": 1,
      "iterations": 10,
      "real_time": 3.4824117934331298e+08,
      "cpu_time": 3.3868530000000018e+08,
      "time_unit": "ns"
    },
    {
      "name": "BM_ConstantVectorPop/1000000000/iterations:10",
      "family_index": 1,
      "per_family_instance_index": 6,
      "run_name": "BM_ConstantVectorPop/1000000000/iterations:10",
      "run_type": "iteration",
      "repetitions": 1,
      "repetition_index": 0,
      "threads": 1,
      "iterations": 10,
      "real_time": 3.4819615961052475e+09,
      "cpu_time": 3.3665639999999981e+09,
      "time_unit": "ns"
    },
    {
      "name": "BM_ConstantVectorAccess/1000/iterations:10",
      "family_index": 2,
      "per_family_instance_index": 0,
      "run_name": "BM_ConstantVectorAccess/1000/iterations:10",
      "run_type": "iteration",
      "repetitions": 1,
      "repetition_index": 0,
      "threads": 1,
      "iterations": 10,
      "real_time": 3.9374455809593201e+03,
      "cpu_time": 3.9000000001010449e+03,
      "time_unit": "ns"
    },
    {
      "name": "BM_ConstantVectorAccess/10000/iterations:10",
      "family_index": 2,
      "per_family_instance_index": 1,
      "run_name": "BM_ConstantVectorAccess/10000/iterations:10",
      "run_type": "iteration",
      "repetitions": 1,
      "repetition_index": 0,
      "threads": 1,
      "iterations": 10,
      "real_time": 3.7708319723606110e+04,
      "cpu_time": 3.7700000000029380e+04,
      "time_unit": "ns"
    },
    {
      "name": "BM_ConstantVectorAccess/100000/iterations:10",
      "family_index": 2,
      "per_family_instance_index": 2,
      "run_name": "BM_ConstantVectorAccess/100000/iterations:10",
      "run_type": "iteration",
      "repetitions": 1,
      "repetition_index": 0,
      "threads": 1,
      "iterations": 10,
      "real_time": 3.7216255441308022e+05,
      "cpu_time": 3.7090000000006286e+05,
      "time_unit": "ns"
    },
    {
      "name": "BM_ConstantVectorAccess/1000000/iterations:10",
      "family_index": 2,
      "per_family_instance_index": 3,
      "run_name": "BM_ConstantVectorAccess/1000000/iterations:10",
      "run_type": "iteration",
      "repetitions": 1,
      "repetition_index": 0,
      "threads": 1,
      "iterations": 10,
      "real_time": 3.8171707652509212e+06,
      "cpu_time": 3.7500000000008522e+06,
      "time_unit": "ns"
    },
    {
      "name": "BM_ConstantVectorAccess/10000000/iterations:10",
      "family_index": 2,
      "per_family_instance_index": 4,
      "run_name": "BM_ConstantVectorAccess/10000000/iterations:10",
      "run_type": "iteration",
      "repetitions": 1,
      "repetition_index": 0,
      "threads": 1,
      "iterations": 10,
      "real_time": 3.8196216616779566e+07,
      "cpu_time": 3.7807099999999136e+07,
      "time_unit": "ns"
    },
    {
      "name": "BM_ConstantVectorAccess/100000000/iterations:10",
      "family_index": 2,
      "per_family_instance_index": 5,
      "run_name": "BM_ConstantVectorAccess/100000000/iterations:10",
      "run_type": "iteration",
      "repetitions": 1,
      "repetition_index": 0,
      "threads": 1,
      "iterations": 10,
      "real_time": 3.8557620830833912e+08,
      "cpu_time": 3.7859370000000042e+08,
      "time_unit": "ns"
    },
    {
      "name": "BM_ConstantVectorAccess/1000000000/iterations:10",
      "family_index": 2,
      "per_family_instance_index": 6,
      "run_name": "BM_ConstantVectorAccess/1000000000/iterations:10",
      "run_type": "iteration",
      "repetitions": 1,
      "repetition_index": 0,
      "threads": 1,
      "iterations": 10,
      "real_time": 3.8649080917239189e+09,
      "cpu_time": 3.7931973000000014e+09,
      "time_unit": "ns"
    },
    {
      "name": "BM_ConstantVectorPopAndBack/1000/iterations:10",
      "family_index": 3,
      "per_family_instance_index": 0,
      "run_name": "BM_ConstantVectorPopAndBack/1000/iterations:10",
      "run_type": "iteration",
      "repetitions": 1,
      "repetition_index": 0,
      "threads": 1,
      "iterations": 10,
      "real_time": 7.5954943895339966e+03,
      "cpu_time": 7.2999999986222974e+03,
      "time_unit": "ns"
    },
    {
      "name": "BM_ConstantVectorPopAndBack/10000/iterations:10",
      "family_index": 3,
      "per_family_instance_index": 1,
      "run_name": "BM_ConstantVectorPopAndBack/10000/iterations:10",
      "run_type": "iteration",
      "repetitions": 1,
      "repetition_index": 0,
      "threads": 1,
      "iterations": 10,
      "real_time": 5.6929234415292740e+04,
      "cpu_time": 5.7200000000534601e+04,
      "time_unit": "ns"
    },
    {
      "name": "BM_ConstantVectorPopAndBack/100000/iterations:10",
      "family_index": 3,
      "per_family_instance_index": 2,
      "run_name": "BM_ConstantVectorPopAndBack/100000/iterations:10",
      "run_type": "iteration",
      "repetitions": 1,
      "repetition_index": 0,
      "threads": 1,
      "iterations": 10,
      "real_time": 6.2874592840671539e+05,
      "cpu_time": 6.1969999999291752e+05,
      "time_unit": "ns"
    },
    {
      "name": "BM_ConstantVectorPopAndBack/1000000/iterations:10",
      "family_index": 3,
      "per_family_instance_index": 3,
      "run_name": "BM_ConstantVectorPopAndBack/1000000/iterations:10",
      "run_type": "iteration",
      "repetitions": 1,
      "repetition_index": 0,
      "threads": 1,
      "iterations": 10,
      "real_time": 5.7803044095635414e+06,
      "cpu_time": 5.7563999999928232e+06,
      "time_unit": "ns"
    },
    {
      "name": "BM_ConstantVectorPopAndBack/10000000/iterations:10",
      "family_index": 3,
      "per_family_instance_index": 4,
      "run_name": "BM_ConstantVectorPopAndBack/10000000/iterations:10",
      "run_type": "iteration",
      "repetitions": 1,
      "repetition_index": 0,
      "threads": 1,
      "iterations": 10,
      "real_time": 5.8344941586256027e+07,
      "cpu_time": 5.7018299999995746e+07,
      "time_unit": "ns"
    },
    {
      "name": "BM_ConstantVectorPopAndBack/100000000/iterations:10",
      "family_index": 3,
      "per_family_instance_index": 5,
      "run_name": "BM_ConstantVectorPopAndBack/100000000/iterations:10",
      "run_type": "iteration",
      "repetitions": 1,
      "repetition_index": 0,
      "threads": 1,
      "iterations": 10,
      "real_time": 5.8015015833079815e+08,
      "cpu_time": 5.6610890000000036e+08,
      "time_unit": "ns"
    },
    {
      "name": "BM_ConstantVectorPopAndBack/1000000000/iterations:10",
      "family_index": 3,
      "per_family_instance_index": 6,
      "run_name": "BM_ConstantVectorPopAndBack/1000000000/iterations:10",
      "run_type": "iteration",
      "repetitions": 1,
      "repetition_index": 0,
      "threads": 1,
      "iterations": 10,
      "real_time": 5.9445072247646751e+09,
      "cpu_time": 5.8021020999999990e+09,
      "time_unit": "ns"
    },
    {
      "name": "BM_ConstantVectorIteration/1000/iterations:10",
      "family_index": 4,
      "per_family_instance_index": 0,
      "run_name": "BM_ConstantVectorIteration/1000/iterations:10",
      "run_type": "iteration",
      "repetitions": 1,
      "repetition_index": 0,
      "threads": 1,
      "iterations": 10,
      "real_time": 6.1667524278163910e+03,
      "cpu_time": 6.2000000070838723e+03,
      "time_unit": "ns"
    },
    {
      "name": "BM_ConstantVectorIteration/10000/iterations:10",
      "family_index": 4,
      "per_family_instance_index": 1,
      "run_name": "BM_ConstantVectorIteration/10000/iterations:10",
      "run_type": "iteration",
      "repetitions": 1,
      "repetition_index": 0,
      "threads": 1,
      "iterations": 10,
      "real_time": 5.6679081171751022e+04,
      "cpu_time": 5.6599999993522943e+04,
      "time_unit": "ns"
    },
    {
      "name": "BM_ConstantVectorIteration/100000/iterations:10",
      "family_index": 4,
      "per_family_instance_index": 2,
      "run_name": "BM_ConstantVectorIteration/100000/iterations:10",
      "run_type": "iteration",
      "repetitions": 1,
      "repetition_index": 0,
      "threads": 1,
      "iterations": 10,
      "real_time": 5.8906665071845055e+05,
      "cpu_time": 5.7489999999233987e+05,
      "time_unit": "ns"
    },
    {
      "name": "BM_ConstantVectorIteration/1000000/iterations:10",
      "family_index": 4,
      "per_family_instance_index": 3,
      "run_name": "BM_ConstantVectorIteration/1000000/iterations:10",
      "run_type": "iteration",
      "repetitions": 1,
      "repetition_index": 0,
      "threads": 1,
      "iterations": 10,
      "real_time": 5.7754917070269585e+06,
      "cpu_time": 5.6595000000015711e+06,
      "time_unit": "ns"
    },
    {
      "name": "BM_ConstantVectorIteration/10000000/iterations:10",
      "family_index": 4,
      "per_family_instance_index": 4,
      "run_name": "BM_ConstantVectorIteration/10000000/iterations:10",
      "run_type": "iteration",
      "repetitions": 1,
      "repetition_index": 0,
      "threads": 1,
      "iterations": 10,
      "real_time": 5.9748416580259800e+07,
      "cpu_time": 5.6909699999999925e+07,
      "time_unit": "ns"
    },
    {
      "name": "BM_ConstantVectorIteration/100000000/iterations:10",
      "family_index": 4,
      "per_family_instance_index": 5,
      "run_name": "BM_ConstantVectorIteration/100000000/iterations:10",
      "run_type": "iteration",
      "repetitions": 1,
      "repetition_index": 0,
      "threads": 1,
      "iterations": 10,
      "real_time": 5.7638774588704109e+08,
      "cpu_time": 5.6615520000000286e+08,
      "time_unit": "ns"
    },
    {
      "name": "BM_ConstantVectorIteration/1000000000/iterations:10",
      "family_index": 4,
      "per_family_instance_index": 6,
      "run_name": "BM_ConstantVectorIteration/1000000000/iterations:10",
      "run_type": "iteration",
      "repetitions": 1,
      "repetition_index": 0,
      "threads": 1,
      "iterations": 10,
      "real_time": 5.7945160624571142e+09,
      "cpu_time": 5.6866012000000019e+09,
      "time_unit": "ns"
    },
    {
      "name": "BM_VectorPush/1000/iterations:10",
      "family_index": 5,
      "per_family_instance_index": 0,
      "run_name": "BM_VectorPush/1000/iterations:10",
      "run_type": "iteration",
      "repetitions": 1,
      "repetition_index": 0,
      "threads": 1,
      "iterations": 10,
      "real_time": 5.3708441555500031e+03,
      "cpu_time": 5.3999999977349944e+03,
      "time_unit": "ns"
    },
    {
      "name": "BM_VectorPush/10000/iterations:10",
      "family_index": 5,
      "per_family_instance_index": 1,
      "run_name": "BM_VectorPush/10000/iterations:10",
      "run_type": "iteration",
      "repetitions": 1,
      "repetition_index": 0,
      "threads": 1,
      "iterations": 10,
      "real_time": 5.1537528634071350e+04,
      "cpu_time": 5.1600000000462387e+04,
      "time_unit": "ns"
    },
    {
      "name": "BM_VectorPush/100000/iterations:10",
      "family_index": 5,
      "per_family_instance_index": 2,
      "run_name": "BM_VectorPush/100000/iterations:10",
      "run_type": "iteration",
      "repetitions": 1,
      "repetition_index": 0,
      "threads": 1,
      "iterations": 10,
      "real_time": 5.8765411376953125e+05,
      "cpu_time": 5.4020000000605243e+05,
      "time_unit": "ns"
    },
    {
      "name": "BM_VectorPush/1000000/iterations:10",
      "family_index": 5,
      "per_family_instance_index": 3,
      "run_name": "BM_VectorPush/1000000/iterations:10",
      "run_type": "iteration",
      "repetitions": 1,
      "repetition_index": 0,
      "threads": 1,
      "iterations": 10,
      "real_time": 4.8958041705191135e+06,
      "cpu_time": 4.7449000000028713e+06,
      "time_unit": "ns"
    },
    {
      "name": "BM_VectorPush/10000000/iterations:10",
      "family_index": 5,
      "per_family_instance_index": 4,
      "run_name": "BM_VectorPush/10000000/iterations:10",
      "run_type": "iteration",
      "repetitions": 1,
      "repetition_index": 0,
      "threads": 1,
      "iterations": 10,
      "real_time": 5.5835350044071674e+07,
      "cpu_time": 5.4295500000000633e+07,
      "time_unit": "ns"
    },
    {
      "name": "BM_VectorPush/100000000/iterations:10",
      "family_index": 5,
      "per_family_instance_index": 5,
      "run_name": "BM_VectorPush/100000000/iterations:10",
      "run_type": "iteration",
      "repetitions": 1,
      "repetition_index": 0,
      "threads": 1,
      "iterations": 10,
      "real_time": 5.2844334580004215e+08,
      "cpu_time": 5.1039729999999964e+08,
      "time_unit": "ns"
    },
    {
      "name": "BM_VectorPush/1000000000/iterations:10",
      "family_index": 5,
      "per_family_instance_index": 6,
      "run_name": "BM_VectorPush/1000000000/iterations:10",
      "run_type": "iteration",
      "repetitions": 1,
      "repetition_index": 0,
      "threads": 1,
      "iterations": 10,
      "real_time": 5.1345221291296177e+09,
      "cpu_time": 4.9147994999999981e+09,
      "time_unit": "ns"
    },
    {
      "name": "BM_VectorPop/1000/iterations:10",
      "family_index": 6,
      "per_family_instance_index": 0,
      "run_name": "BM_VectorPop/1000/iterations:10",
      "run_type": "iteration",
      "repetitions": 1,
      "repetition_index": 0,
      "threads": 1,
      "iterations": 10,
      "real_time": 6.6078267991542816e+03,
      "cpu_time": 6.5000000006421033e+03,
      "time_unit": "ns"
    },
    {
      "name": "BM_VectorPop/10000/iterations:10",
      "family_index": 6,
      "per_family_instance_index": 1,
      "run_name": "BM_VectorPop/10000/iterations:10",
      "run_type": "iteration",
      "repetitions": 1,
      "repetition_index": 0,
      "threads": 1,
      "iterations": 10,
      "real_time": 9.5358397811651230e+04,
      "cpu_time": 6.9300000001248918e+04,
      "time_unit": "ns"
    },
    {
      "name": "BM_VectorPop/100000/iterations:10",
      "family_index": 6,
      "per_family_instance_index": 2,
      "run_name": "BM_VectorPop/100000/iterations:10",
      "run_type": "iteration",
      "repetitions": 1,
      "repetition_index": 0,
      "threads": 1,
      "iterations": 10,
      "real_time": 5.8208322152495384e+05,
      "cpu_time": 5.8180000000334077e+05,
      "time_unit": "ns"
    },
    {
      "name": "BM_VectorPop/1000000/iterations:10",
      "family_index": 6,
      "per_family_instance_index": 3,
      "run_name": "BM_VectorPop/1000000/iterations:10",
      "run_type": "iteration",
      "repetitions": 1,
      "repetition_index": 0,
      "threads": 1,
      "iterations": 10,
      "real_time": 5.6550330482423306e+06,
      "cpu_time": 5.5564000000231322e+06,
      "time_unit": "ns"
    },
    {
      "name": "BM_VectorPop/10000000/iterations:10",
      "family_index": 6,
      "per_family_instance_index": 4,
      "run_name": "BM_VectorPop/10000000/iterations:10",
      "run_type": "iteration",
      "repetitions": 1,
      "repetition_index": 0,
      "threads": 1,
      "iterations": 10,
      "real_time": 5.8928137551993132e+07,
      "cpu_time": 5.8144299999997877e+07,
      "time_unit": "ns"
    },
    {
      "name": "BM_VectorPop/100000000/iterations:10",
      "family_index": 6,
      "per_family_instance_index": 5,
      "run_name": "BM_VectorPop/100000000/iterations:10",
      "run_type": "iteration",
      "repetitions": 1,
      "repetition_index": 0,
      "threads": 1,
      "iterations": 10,
      "real_time": 5.7189202504232526e+08,
      "cpu_time": 5.5451330000000787e+08,
      "time_unit": "ns"
    },
    {
      "name": "BM_VectorPop/1000000000/iterations:10",
      "family_index": 6,
      "per_family_instance_index": 6,
      "run_name": "BM_VectorPop/1000000000/iterations:10",
      "run_type": "iteration",
      "repetitions": 1,
      "repetition_index": 0,
      "threads": 1,
      "iterations": 10,
      "real_time": 5.5267511457204819e+09,
      "cpu_time": 5.3154611000000048e+09,
      "time_unit": "ns"
    },
    {
      "name": "BM_VectorAccess/1000/iterations:10",
      "family_index": 7,
      "per_family_instance_index": 0,
      "run_name": "BM_VectorAccess/1000/iterations:10",
      "run_type": "iteration",
      "repetitions": 1,
      "repetition_index": 0,
      "threads": 1,
      "iterations": 10,
      "real_time": 3.5124830901622772e+03,
      "cpu_time": 3.4000000027845090e+03,
      "time_unit": "ns"
    },
    {
      "name": "BM_VectorAccess/10000/iterations:10",
      "family_index": 7,
      "per_family_instance_index": 1,
      "run_name": "BM_VectorAccess/10000/iterations:10",
      "run_type": "iteration",
      "repetitions": 1,
      "repetition_index": 0,
      "threads": 1,
      "iterations": 10,
      "real_time": 3.3804215490818024e+04,
      "cpu_time": 3.3499999995001417e+04,
      "time_unit": "ns"
    },
    {
      "name": "BM_VectorAccess/100000/iterations:10",
      "family_index": 7,
      "per_family_instance_index": 2,
      "run_name": "BM_VectorAccess/100000/iterations:10",
      "run_type": "iteration",
      "repetitions": 1,
      "repetition_index": 0,
      "threads": 1,
      "iterations": 10,
      "real_time": 3.3145826309919357e+05,
      "cpu_time": 3.3130000000483048e+05,
      "time_unit": "ns"
    },
    {
      "name": "BM_VectorAccess/1000000/iterations:10",
      "family_index": 7,
      "per_family_instance_index": 3,
      "run_name": "BM_VectorAccess/1000000/iterations:10",
      "run_type": "iteration",
      "repetitions": 1,
      "repetition_index": 0,
      "threads": 1,
      "iterations": 10,
      "real_time": 3.3195124939084053e+06,
      "cpu_time": 3.3132000000023255e+06,
      "time_unit": "ns"
    },
    {
      "name": "BM_VectorAccess/10000000/iterations:10",
      "family_index": 7,
      "per_family_instance_index": 4,
      "run_name": "BM_VectorAccess/10000000/iterations:10",
      "run_type": "iteration",
      "repetitions": 1,
      "repetition_index": 0,
      "threads": 1,
      "iterations": 10,
      "real_time": 3.4044145885854959e+07,
      "cpu_time": 3.3265999999997575e+07,
      "time_unit": "ns"
    },
    {
      "name": "BM_VectorAccess/100000000/iterations:10",
      "family_index": 7,
      "per_family_instance_index": 5,
      "run_name": "BM_VectorAccess/100000000/iterations:10",
      "run_type": "iteration",
      "repetitions": 1,
      "repetition_index": 0,
      "threads": 1,
      "iterations": 10,
      "real_time": 3.4245970407500863e+08,
      "cpu_time": 3.3801230000000256e+08,
      "time_unit": "ns"
    },
    {
      "name": "BM_VectorAccess/1000000000/iterations:10",
      "family_index": 7,
      "per_family_instance_index": 6,
      "run_name": "BM_VectorAccess/1000000000/iterations:10",
      "run_type": "iteration",
      "repetitions": 1,
      "repetition_index": 0,
      "threads": 1,
      "iterations": 10,
      "real_time": 3.4548114750534296e+09,
      "cpu_time": 3.3975733999999933e+09,
      "time_unit": "ns"
    },
    {
      "name": "BM_VectorPopAndBack/1000/iterations:10",
      "family_index": 8,
      "per_family_instance_index": 0,
      "run_name": "BM_VectorPopAndBack/1000/iterations:10",
      "run_type": "iteration",
      "repetitions": 1,
      "repetition_index": 0,
      "threads": 1,
      "iterations": 10,
      "real_time": 9.3166716396808624e+03,
      "cpu_time": 9.5000000101208570e+03,
      "time_unit": "ns"
    },
    {
      "name": "BM_VectorPopAndBack/10000/iterations:10",
      "family_index": 8,
      "per_family_instance_index": 1,
      "run_name": "BM_VectorPopAndBack/10000/iterations:10",
      "run_type": "iteration",
      "repetitions": 1,
      "repetition_index": 0,
      "threads": 1,
      "iterations": 10,
      "real_time": 1.8009571358561516e+05,
      "cpu_time": 1.0529999998425410e+05,
      "time_unit": "ns"
    },
    {
      "name": "BM_VectorPopAndBack/100000/iterations:10",
      "family_index": 8,
      "per_family_instance_index": 2,
      "run_name": "BM_VectorPopAndBack/100000/iterations:10",
      "run_type": "iteration",
      "repetitions": 1,
      "repetition_index": 0,
      "threads": 1,
      "iterations": 10,
      "real_time": 8.0069564282894135e+05,
      "cpu_time": 7.9650000003539387e+05,
      "time_unit": "ns"
    },
    {
      "name": "BM_VectorPopAndBack/1000000/iterations:10",
      "family_index": 8,
      "per_family_instance_index": 3,
      "run_name": "BM_VectorPopAndBack/1000000/iterations:10",
      "run_type": "iteration",
      "repetitions": 1,
      "repetition_index": 0,
      "threads": 1,
      "iterations": 10,
      "real_time": 7.8927374444901943e+06,
      "cpu_time": 7.7262999999675229e+06,
      "time_unit": "ns"
    },
    {
      "name": "BM_VectorPopAndBack/10000000/iterations:10",
      "family_index": 8,
      "per_family_instance_index": 4,
      "run_name": "BM_VectorPopAndBack/10000000/iterations:10",
      "run_type": "iteration",
      "repetitions": 1,
      "repetition_index": 0,
      "threads": 1,
      "iterations": 10,
      "real_time": 8.2236429210752249e+07,
      "cpu_time": 8.0722300000024915e+07,
      "time_unit": "ns"
    },
    {
      "name": "BM_VectorPopAndBack/100000000/iterations:10",
      "family_index": 8,
      "per_family_instance_index": 5,
      "run_name": "BM_VectorPopAndBack/100000000/iterations:10",
      "run_type": "iteration",
      "repetitions": 1,
      "repetition_index": 0,
      "threads": 1,
      "iterations": 10,
      "real_time": 8.0873813331127167e+08,
      "cpu_time": 7.8438640000002801e+08,
      "time_unit": "ns"
    },
    {
      "name": "BM_VectorPopAndBack/1000000000/iterations:10",
      "family_index": 8,
      "per_family_instance_index": 6,
      "run_name": "BM_VectorPopAndBack/1000000000/iterations:10",
      "run_type": "iteration",
      "repetitions": 1,
      "repetition_index": 0,
      "threads": 1,
      "iterations": 10,
      "real_time": 8.0588113664649429e+09,
      "cpu_time": 7.8172557000000095e+09,
      "time_unit": "ns"
    },
    {
      "name": "BM_VectorIteration/1000/iterations:10",
      "family_index": 9,
      "per_family_instance_index": 0,
      "run_name": "BM_VectorIteration/1000/iterations:10",
      "run_type": "iteration",
      "repetitions": 1,
      "repetition_index": 0,
      "threads": 1,
      "iterations": 10,
      "real_time": 5.8083795011043549e+03,
      "cpu_time": 5.6999999969775672e+03,
      "time_unit": "ns"
    },
    {
      "name": "BM_VectorIteration/10000/iterations:10",
      "family_index": 9,
      "per_family_instance_index": 1,
      "run_name": "BM_VectorIteration/10000/iterations:10",
      "run_type": "iteration",
      "repetitions": 1,
      "repetition_index": 0,
      "threads": 1,
      "iterations": 10,
      "real_time": 5.1670800894498825e+04,
      "cpu_time": 5.1700000005894253e+04,
      "time_unit": "ns"
    },
    {
      "name": "BM_VectorIteration/100000/iterations:10",
      "family_index": 9,
      "per_family_instance_index": 2,
      "run_name": "BM_VectorIteration/100000/iterations:10",
      "run_type": "iteration",
      "repetitions": 1,
      "repetition_index": 0,
      "threads": 1,
      "iterations": 10,
      "real_time": 5.3346659988164902e+05,
      "cpu_time": 5.2299999999831925e+05,
      "time_unit": "ns"
    },
    {
      "name": "BM_VectorIteration/1000000/iterations:10",
      "family_index": 9,
      "per_family_instance_index": 3,
      "run_name": "BM_VectorIteration/1000000/iterations:10",
      "run_type": "iteration",
      "repetitions": 1,
      "repetition_index": 0,
      "threads": 1,
      "iterations": 10,
      "real_time": 5.2569542080163956e+06,
      "cpu_time": 5.1875999999992931e+06,
      "time_unit": "ns"
    },
    {
      "name": "BM_VectorIteration/10000000/iterations:10",
      "family_index": 9,
      "per_family_instance_index": 4,
      "run_name": "BM_VectorIteration/10000000/iterations:10",
      "run_type": "iteration",
      "repetitions": 1,
      "repetition_index": 0,
      "threads": 1,
      "iterations": 10,
      "real_time": 5.2752712555229664e+07,
      "cpu_time": 5.2606199999991074e+07,
      "time_unit": "ns"
    },
    {
      "name": "BM_VectorIteration/100000000/iterations:10",
      "family_index": 9,
      "per_family_instance_index": 5,
      "run_name": "BM_VectorIteration/100000000/iterations:10",
      "run_type": "iteration",
      "repetitions": 1,
      "repetition_index": 0,
      "threads": 1,
      "iterations": 10,
      "real_time": 5.3072969997301692e+08,
      "cpu_time": 5.2693890000000465e+08,
      "time_unit": "ns"
    },
    {
      "name": "BM_VectorIteration/1000000000/iterations:10",
      "family_index": 9,
      "per_family_instance_index": 6,
      "run_name": "BM_VectorIteration/1000000000/iterations:10",
      "run_type": "iteration",
      "repetitions": 1,
      "repetition_index": 0,
      "threads": 1,
      "iterations": 10,
      "real_time": 5.3523085958324375e+09,
      "cpu_time": 5.2863295999999876e+09,
      "time_unit": "ns"
    }
  ]
}
```