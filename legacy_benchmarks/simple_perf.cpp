#include "constant_vector.h"
#include "stl_vector.h"
#include <vector>
#include <chrono>
#include <iostream>

// Replicate DoNotOptimize behavior - FORCE MEMORY
template <class Tp>
inline void DoNotOptimize(Tp const& value) {
    asm volatile("" : : "m"(value) : "memory");
}

int main() {
    const int N = 100000000;
    ConstantVector<int> cv;
    STLVector<int> sv;

    for(int i=0; i<N; ++i) cv.push_back(i);
    for(int i=0; i<N; ++i) sv.push_back(i);

    // Warmup
    for(int i=0; i<5; ++i) {
        long long s=0; for(int x: cv) { s+=x; DoNotOptimize(s); }
        long long s2=0; for(int x: sv) { s2+=x; DoNotOptimize(s2); }
    }

    auto start = std::chrono::high_resolution_clock::now();
    long long sum_cv = 0;
    for(int x : cv) {
        sum_cv += x;
        DoNotOptimize(sum_cv);
    }
    auto mid = std::chrono::high_resolution_clock::now();
    long long sum_sv = 0;
    for(int x : sv) {
        sum_sv += x;
        DoNotOptimize(sum_sv);
    }
    auto end = std::chrono::high_resolution_clock::now();

    auto cv_ms = std::chrono::duration_cast<std::chrono::milliseconds>(mid - start).count();
    auto sv_ms = std::chrono::duration_cast<std::chrono::milliseconds>(end - mid).count();

    std::cout << "ConstantVector: " << cv_ms << "ms" << std::endl;
    std::cout << "STLVector:      " << sv_ms << "ms" << std::endl;
}
