#ifndef CONSTANT_VECTOR_HPP
#define CONSTANT_VECTOR_HPP

#include <memory>
#include <stdexcept>
#include <initializer_list>
#include <iterator>
#include <algorithm>
#include <cstdint>

namespace cv {

// Configuration constants
constexpr size_t INITIAL_BLOCK_CAPACITY = 256;
constexpr size_t INITIAL_BLOCK_BITS = 8;
constexpr size_t CLZ_OFFSET = 23;  // 32 - 1 - 8

/**
 * ConstantVector - A vector with O(1) worst-case push_back and pop_back.
 * 
 * Implements a subset of std::vector API for direct comparison.
 * Uses a segmented array design where each block is 2x the previous.
 */
template <typename T, typename Allocator = std::allocator<T>>
class vector {
public:
    // Standard type definitions
    using value_type = T;
    using allocator_type = Allocator;
    using size_type = std::size_t;
    using difference_type = std::ptrdiff_t;
    using reference = T&;
    using const_reference = const T&;
    using pointer = T*;
    using const_pointer = const T*;

private:
    // Inline meta array - no dynamic allocation for block pointers
    T* _blocks[64] = {nullptr};
    size_type _capacity = 0;
    
    // Pointer-based state for O(1) push/pop (no _size member needed!)
    T* _write_ptr = nullptr;       // Points to next write location
    T* _block_start = nullptr;     // Start of current block
    T* _block_end = nullptr;       // End of current block
    size_type _write_block = 0;    // Current block index
    size_type _full_blocks_size = 0;  // Sum of capacities of blocks before current
    
    [[no_unique_address]] Allocator _alloc;

    // Helper to get block and element index for random access
    [[gnu::always_inline]] inline void get_indices(size_type index, size_type& block, size_type& elem) const noexcept {
        const unsigned int adjusted = static_cast<unsigned int>(index) + INITIAL_BLOCK_CAPACITY;
        block = CLZ_OFFSET - static_cast<unsigned int>(__builtin_clz(adjusted));
        elem = adjusted ^ (INITIAL_BLOCK_CAPACITY << block);
    }

    // Advance to next block (slow path for push_back)
    void _advance_block() {
        _full_blocks_size += static_cast<size_type>(_block_end - _block_start);  // Add current block's capacity
        ++_write_block;
        size_type block_cap = INITIAL_BLOCK_CAPACITY << _write_block;
        if (_blocks[_write_block] == nullptr) {
            _blocks[_write_block] = _alloc.allocate(block_cap);
            _capacity += block_cap;
        }
        _block_start = _blocks[_write_block];
        _write_ptr = _block_start;
        _block_end = _block_start + block_cap;
    }

    // Retreat to previous block (slow path for pop_back)
    void _retreat_block() {
        --_write_block;
        size_type prev_cap = INITIAL_BLOCK_CAPACITY << _write_block;
        _full_blocks_size -= prev_cap;
        _block_start = _blocks[_write_block];
        _block_end = _block_start + prev_cap;
        _write_ptr = _block_end;  // Points one past last element of previous block
    }

public:
    // === Iterator Classes ===
    class iterator {
    public:
        using iterator_category = std::forward_iterator_tag;
        using value_type = T;
        using difference_type = std::ptrdiff_t;
        using pointer = T*;
        using reference = T&;

    private:
        T* _ptr;
        T* _block_end;
        T** _block_ptr;

    public:
        iterator(T** block_ptr, size_type offset, T* block_end)
            : _block_ptr(block_ptr), _block_end(block_end) {
            _ptr = block_ptr ? (*block_ptr + offset) : nullptr;
        }
        
        explicit iterator(T* ptr) : _ptr(ptr), _block_end(nullptr), _block_ptr(nullptr) {}

        iterator& operator++() noexcept {
            ++_ptr;
            if (__builtin_expect(!(reinterpret_cast<uintptr_t>(_ptr) ^ reinterpret_cast<uintptr_t>(_block_end)), 0)) [[unlikely]] {
                ++_block_ptr;
                // Only advance if next block exists (lazy allocation support)
                if (*_block_ptr) {
                    _ptr = *_block_ptr;
                    _block_end = _ptr + ((_block_end - *(_block_ptr - 1)) << 1);
                }
                // else: _ptr stays at _block_end, which equals end()
            }
            return *this;
        }

        iterator operator++(int) noexcept { iterator tmp = *this; ++(*this); return tmp; }
        reference operator*() const noexcept { return *_ptr; }
        pointer operator->() const noexcept { return _ptr; }
        bool operator==(const iterator& other) const noexcept { return _ptr == other._ptr; }
        bool operator!=(const iterator& other) const noexcept { return _ptr != other._ptr; }
    };

    class const_iterator {
    public:
        using iterator_category = std::forward_iterator_tag;
        using value_type = T;
        using difference_type = std::ptrdiff_t;
        using pointer = const T*;
        using reference = const T&;

    private:
        const T* _ptr;
        const T* _block_end;
        T* const* _block_ptr;

    public:
        const_iterator(T* const* block_ptr, size_type offset, const T* block_end)
            : _block_ptr(block_ptr), _block_end(block_end) {
            _ptr = block_ptr ? (*block_ptr + offset) : nullptr;
        }
        
        explicit const_iterator(const T* ptr) : _ptr(ptr), _block_end(nullptr), _block_ptr(nullptr) {}

        const_iterator& operator++() noexcept {
            ++_ptr;
            if (__builtin_expect(!(reinterpret_cast<uintptr_t>(_ptr) ^ reinterpret_cast<uintptr_t>(_block_end)), 0)) [[unlikely]] {
                ++_block_ptr;
                // Only advance if next block exists (lazy allocation support)
                if (*_block_ptr) {
                    _ptr = *_block_ptr;
                    _block_end = _ptr + ((_block_end - *(_block_ptr - 1)) << 1);
                }
                // else: _ptr stays at _block_end, which equals end()
            }
            return *this;
        }

        const_iterator operator++(int) noexcept { const_iterator tmp = *this; ++(*this); return tmp; }
        reference operator*() const noexcept { return *_ptr; }
        pointer operator->() const noexcept { return _ptr; }
        bool operator==(const const_iterator& other) const noexcept { return _ptr == other._ptr; }
        bool operator!=(const const_iterator& other) const noexcept { return _ptr != other._ptr; }
    };

    // === Constructors ===
    vector() {
        _blocks[0] = _alloc.allocate(INITIAL_BLOCK_CAPACITY);
        _capacity = INITIAL_BLOCK_CAPACITY;
        _block_start = _blocks[0];
        _write_ptr = _block_start;
        _block_end = _block_start + INITIAL_BLOCK_CAPACITY;
        _write_block = 0;
        _full_blocks_size = 0;
    }

    explicit vector(size_type count, const T& value = T()) : vector() {
        for (size_type i = 0; i < count; ++i) {
            push_back(value);
        }
    }

    vector(std::initializer_list<T> init) : vector() {
        for (const auto& val : init) {
            push_back(val);
        }
    }

    // Copy constructor
    vector(const vector& other) : vector() {
        for (size_type i = 0; i < other.size(); ++i) {
            push_back(other[i]);
        }
    }

    // Move constructor
    vector(vector&& other) noexcept 
        : _capacity(other._capacity), 
          _write_ptr(other._write_ptr), _block_start(other._block_start),
          _block_end(other._block_end), _write_block(other._write_block),
          _full_blocks_size(other._full_blocks_size), _alloc(std::move(other._alloc)) {
        for (size_type i = 0; i < 64; ++i) {
            _blocks[i] = other._blocks[i];
            other._blocks[i] = nullptr;
        }
        other._capacity = 0;
        other._write_ptr = nullptr;
        other._block_start = nullptr;
        other._block_end = nullptr;
        other._write_block = 0;
        other._full_blocks_size = 0;
    }

    // Destructor
    ~vector() {
        clear();
        // Deallocate all blocks that have been allocated
        for (size_type i = 0; i < 64; ++i) {
            if (_blocks[i]) {
                _alloc.deallocate(_blocks[i], INITIAL_BLOCK_CAPACITY << i);
            }
        }
    }

    // === Assignment ===
    vector& operator=(const vector& other) {
        if (this != &other) {
            clear();
            for (size_type i = 0; i < other.size(); ++i) {
                push_back(other[i]);
            }
        }
        return *this;
    }

    vector& operator=(vector&& other) noexcept {
        if (this != &other) {
            // Clean up current - deallocate all blocks
            clear();
            for (size_type i = 0; i < 64; ++i) {
                if (_blocks[i]) {
                    _alloc.deallocate(_blocks[i], INITIAL_BLOCK_CAPACITY << i);
                    _blocks[i] = nullptr;
                }
            }
            // Move from other
            _capacity = other._capacity;
            _write_ptr = other._write_ptr;
            _block_start = other._block_start;
            _block_end = other._block_end;
            _write_block = other._write_block;
            _full_blocks_size = other._full_blocks_size;
            for (size_type i = 0; i < 64; ++i) {
                _blocks[i] = other._blocks[i];
                other._blocks[i] = nullptr;
            }
            other._capacity = 0;
        }
        return *this;
    }

    // === Iterators ===
    iterator begin() noexcept {
        if (empty()) return end();
        T* block_end = _blocks[0] + INITIAL_BLOCK_CAPACITY;
        return iterator(&_blocks[0], 0, block_end);
    }

    iterator end() noexcept {
        if (empty()) return iterator(nullptr);
        return iterator(_write_ptr);
    }

    const_iterator begin() const noexcept {
        if (empty()) return end();
        const T* block_end = _blocks[0] + INITIAL_BLOCK_CAPACITY;
        return const_iterator(&_blocks[0], 0, block_end);
    }

    const_iterator end() const noexcept {
        if (empty()) return const_iterator(nullptr);
        return const_iterator(_write_ptr);
    }

    const_iterator cbegin() const noexcept { return begin(); }
    const_iterator cend() const noexcept { return end(); }

    // === Capacity ===
    [[nodiscard]] bool empty() const noexcept { 
        // Fast: compare cached pointers. Empty when write_ptr at block_start AND no full blocks
        return _full_blocks_size == 0 && _write_ptr == _block_start;
    }
    
    size_type size() const noexcept { 
        return _full_blocks_size + static_cast<size_type>(_write_ptr - _block_start);
    }
    
    size_type capacity() const noexcept { return _capacity; }
    size_type max_size() const noexcept { return static_cast<size_type>(-1) / sizeof(T); }

    void reserve(size_type new_cap) {
        // No-op for ConstantVector - blocks are allocated on demand
        (void)new_cap;
    }

    void shrink_to_fit() {
        // Deallocate all empty blocks beyond current usage
        if (empty()) {
            // Deallocate all but the first block
            for (size_type i = 1; i < 64; ++i) {
                if (_blocks[i]) {
                    _alloc.deallocate(_blocks[i], INITIAL_BLOCK_CAPACITY << i);
                    _capacity -= (INITIAL_BLOCK_CAPACITY << i);
                    _blocks[i] = nullptr;
                }
            }
            _block_start = _blocks[0];
            _write_ptr = _block_start;
            _block_end = _block_start + INITIAL_BLOCK_CAPACITY;
            _write_block = 0;
            _full_blocks_size = 0;
        } else {
            // Deallocate blocks beyond current write block
            for (size_type i = _write_block + 1; i < 64; ++i) {
                if (_blocks[i]) {
                    _alloc.deallocate(_blocks[i], INITIAL_BLOCK_CAPACITY << i);
                    _capacity -= (INITIAL_BLOCK_CAPACITY << i);
                    _blocks[i] = nullptr;
                }
            }
        }
    }

    // === Element Access ===
    [[gnu::always_inline]] reference operator[](size_type index) noexcept {
        size_type block, elem;
        get_indices(index, block, elem);
        return _blocks[block][elem];
    }

    [[gnu::always_inline]] const_reference operator[](size_type index) const noexcept {
        size_type block, elem;
        get_indices(index, block, elem);
        return _blocks[block][elem];
    }

    reference at(size_type index) {
        if (index >= size()) {
            throw std::out_of_range("cv::vector::at: index out of range");
        }
        return (*this)[index];
    }

    const_reference at(size_type index) const {
        if (index >= size()) {
            throw std::out_of_range("cv::vector::at: index out of range");
        }
        return (*this)[index];
    }

    reference front() { return _blocks[0][0]; }
    const_reference front() const { return _blocks[0][0]; }

    reference back() {
        return *(_write_ptr - 1);
    }
    const_reference back() const {
        return *(_write_ptr - 1);
    }

    // === Modifiers ===
    // Optimized push_back - check boundary before write for lazy allocation
    void push_back(const T& value) {
        if (__builtin_expect(_write_ptr == _block_end, 0)) [[unlikely]] {
            _advance_block();
        }
        *_write_ptr = value;
        ++_write_ptr;
    }

    void push_back(T&& value) {
        if (__builtin_expect(_write_ptr == _block_end, 0)) [[unlikely]] {
            _advance_block();
        }
        *_write_ptr = std::move(value);
        ++_write_ptr;
    }

    template <typename... Args>
    reference emplace_back(Args&&... args) {
        if (__builtin_expect(_write_ptr == _block_end, 0)) [[unlikely]] {
            _advance_block();
        }
        std::allocator_traits<Allocator>::construct(_alloc, _write_ptr, std::forward<Args>(args)...);
        T& ref = *_write_ptr;
        ++_write_ptr;
        return ref;
    }

    // pop_back - O(1) decrement, rare block retreat
    void pop_back() noexcept {
        if (__builtin_expect(_write_ptr == _block_start, 0)) [[unlikely]] {
            _retreat_block();
        }
        --_write_ptr;
    }

    void clear() noexcept {
        _block_start = _blocks[0];
        _write_ptr = _block_start;
        _block_end = _block_start + INITIAL_BLOCK_CAPACITY;
        _write_block = 0;
        _full_blocks_size = 0;
    }

    void resize(size_type count) {
        resize(count, T());
    }

    void resize(size_type count, const T& value) {
        while (size() > count) {
            pop_back();
        }
        while (size() < count) {
            push_back(value);
        }
    }

    void swap(vector& other) noexcept {
        std::swap(_blocks, other._blocks);
        std::swap(_capacity, other._capacity);
        std::swap(_write_ptr, other._write_ptr);
        std::swap(_block_start, other._block_start);
        std::swap(_block_end, other._block_end);
        std::swap(_write_block, other._write_block);
        std::swap(_full_blocks_size, other._full_blocks_size);
    }
};

} // namespace cv

#endif // CONSTANT_VECTOR_HPP
