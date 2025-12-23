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
    const int N = 100000000;
    ConstantVector<int> cv;
    STLVector<int> sv;

    for(int i=0; i<N; ++i) cv.push_back(i);
    for(int i=0; i<N; ++i) sv.push_back(i);

    // Manual Unrolling Factor
    const int U = 8;
    
    // Warmup
    for(int i=0; i<3; ++i) {
        long long s = 0;
        auto it = cv.begin();
        auto end = cv.end();
        while(it != end) { s += *it; ForceMemory(s); ++it; }
    }

    // --- ConstantVector Unrolled ---
    auto start = std::chrono::high_resolution_clock::now();
    long long sum_cv = 0;
    {
        auto it = cv.begin();
        auto end = cv.end();
        // Since N is divisible by 8 (100M % 8 == 0), we can skip boundary checks for simplicity here
        // But for correctness in general loops, we would need a tail loop.
        // We know structure is big enough.
        while (it != end) {
            sum_cv += *it; ForceMemory(sum_cv); ++it;
            sum_cv += *it; ForceMemory(sum_cv); ++it;
            sum_cv += *it; ForceMemory(sum_cv); ++it;
            sum_cv += *it; ForceMemory(sum_cv); ++it;
            sum_cv += *it; ForceMemory(sum_cv); ++it;
            sum_cv += *it; ForceMemory(sum_cv); ++it;
            sum_cv += *it; ForceMemory(sum_cv); ++it;
            sum_cv += *it; ForceMemory(sum_cv); ++it;
        }
    }
    auto mid = std::chrono::high_resolution_clock::now();

    // --- STLVector Unrolled ---
    long long sum_sv = 0;
    {
        auto it = sv.begin();
        auto end = sv.end();
        while (it != end) {
            sum_sv += *it; ForceMemory(sum_sv); ++it;
            sum_sv += *it; ForceMemory(sum_sv); ++it;
            sum_sv += *it; ForceMemory(sum_sv); ++it;
            sum_sv += *it; ForceMemory(sum_sv); ++it;
            sum_sv += *it; ForceMemory(sum_sv); ++it;
            sum_sv += *it; ForceMemory(sum_sv); ++it;
            sum_sv += *it; ForceMemory(sum_sv); ++it;
            sum_sv += *it; ForceMemory(sum_sv); ++it;
        }
    }
    auto end_time = std::chrono::high_resolution_clock::now();

    auto cv_ms = std::chrono::duration_cast<std::chrono::milliseconds>(mid - start).count();
    auto sv_ms = std::chrono::duration_cast<std::chrono::milliseconds>(end_time - mid).count();

    std::cout << "ConstantVector (Unrolled 8x): " << cv_ms << "ms" << std::endl;
    std::cout << "STLVector      (Unrolled 8x): " << sv_ms << "ms" << std::endl;
}
