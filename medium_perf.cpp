#include "constant_vector.h"
#include "stl_vector.h"
#include <vector>
#include <chrono>
#include <iostream>

// STRICT Memory Barrier
template <class Tp>
inline void ForceMemory(Tp const& value) {
    asm volatile("" : : "m"(value) : "memory");
}

int main() {
    const int N = 1000000; // 1 Million (matches Initial Capacity)
    // Run enough times to get stable measurement
    const int ITERATIONS = 100;
    
    ConstantVector<int> cv;
    STLVector<int> sv;

    // Push exactly 1M elements (should fit in first block)
    for(int i=0; i<N; ++i) cv.push_back(i);
    for(int i=0; i<N; ++i) sv.push_back(i);

    // Warmup
    for(int i=0; i<5; ++i) {
        long long s=0; for(int x: cv) { s+=x; ForceMemory(s); }
        long long s2=0; for(int x: sv) { s2+=x; ForceMemory(s2); }
    }

    auto start = std::chrono::high_resolution_clock::now();
    long long sum_cv = 0;
    for(int k=0; k<ITERATIONS; ++k) {
        for(int x : cv) {
            sum_cv += x;
            ForceMemory(sum_cv);
        }
    }
    auto mid = std::chrono::high_resolution_clock::now();
    
    long long sum_sv = 0;
    for(int k=0; k<ITERATIONS; ++k) {
        for(int x : sv) {
            sum_sv += x;
            ForceMemory(sum_sv);
        }
    }
    auto end = std::chrono::high_resolution_clock::now();

    auto cv_ms = std::chrono::duration_cast<std::chrono::milliseconds>(mid - start).count();
    auto sv_ms = std::chrono::duration_cast<std::chrono::milliseconds>(end - mid).count();

    std::cout << "ConstantVector (1M Single Block): " << cv_ms << "ms" << std::endl;
    std::cout << "STLVector      (1M Single Block): " << sv_ms << "ms" << std::endl;
}
