#include "constant_vector.h"
#include "stl_vector.h"

// Force compiler to emit code for these function instances
// We use a simple sum with an optimization barrier

void constantVectorLoop(ConstantVector<int>& cv) {
    long long sum = 0;
    for (int x : cv) {
        sum += x;
        // Optimization barrier: forces 'sum' to be computed
        // effectively same as benchmark::DoNotOptimize
        asm volatile("" : "+r"(sum));
    }
}

void stlVectorLoop(STLVector<int>& sv) {
    long long sum = 0;
    for (int x : sv) {
        sum += x;
        // Optimization barrier
        asm volatile("" : "+r"(sum));
    }
}
