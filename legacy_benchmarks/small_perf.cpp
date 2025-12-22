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
    const int N = 250; 
    const int ITERATIONS = 100000;
    
    ConstantVector<int> cv;
    STLVector<int> sv;

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

    std::cout << "ConstantVector (" << N << " items x " << ITERATIONS << "): " << cv_ms << "ms" << std::endl;
    std::cout << "STLVector      (" << N << " items x " << ITERATIONS << "): " << sv_ms << "ms" << std::endl;
}
