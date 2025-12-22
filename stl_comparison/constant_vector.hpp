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
    size_type _size = 0;
    size_type _capacity = 0;
    size_type _block_index = 0;
    size_type _current_block_capacity = INITIAL_BLOCK_CAPACITY;
    long long _element_index = -1;
    
    [[no_unique_address]] Allocator _alloc;

    // Helper to get block and element index for random access
    [[gnu::always_inline]] inline void get_indices(size_type index, size_type& block, size_type& elem) const noexcept {
        const unsigned int adjusted = static_cast<unsigned int>(index) + INITIAL_BLOCK_CAPACITY;
        block = CLZ_OFFSET - static_cast<unsigned int>(__builtin_clz(adjusted));
        elem = adjusted ^ (INITIAL_BLOCK_CAPACITY << block);
    }

    // Sync _block_index, _element_index, _current_block_capacity from _size
    // Called before push_back if indices may be stale (after pop_back)
    [[gnu::always_inline]] inline void sync_indices() noexcept {
        if (_size == 0) {
            _block_index = 0;
            _element_index = -1;
            _current_block_capacity = INITIAL_BLOCK_CAPACITY;
        } else {
            size_type block, elem;
            get_indices(_size - 1, block, elem);
            _block_index = block;
            _element_index = static_cast<long long>(elem);
            _current_block_capacity = INITIAL_BLOCK_CAPACITY << block;
        }
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
                _ptr = *_block_ptr;
                _block_end = _ptr + ((_block_end - *(_block_ptr - 1)) << 1);
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
                _ptr = *_block_ptr;
                _block_end = _ptr + ((_block_end - *(_block_ptr - 1)) << 1);
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
        for (size_type i = 0; i < other._size; ++i) {
            push_back(other[i]);
        }
    }

    // Move constructor
    vector(vector&& other) noexcept 
        : _size(other._size), _capacity(other._capacity), 
          _block_index(other._block_index), _current_block_capacity(other._current_block_capacity),
          _element_index(other._element_index), _alloc(std::move(other._alloc)) {
        for (size_type i = 0; i < 64; ++i) {
            _blocks[i] = other._blocks[i];
            other._blocks[i] = nullptr;
        }
        other._size = 0;
        other._capacity = 0;
        other._block_index = 0;
        other._current_block_capacity = INITIAL_BLOCK_CAPACITY;
        other._element_index = -1;
    }

    // Destructor
    ~vector() {
        clear();
        for (size_type i = 0; i <= _block_index; ++i) {
            if (_blocks[i]) {
                _alloc.deallocate(_blocks[i], INITIAL_BLOCK_CAPACITY << i);
            }
        }
    }

    // === Assignment ===
    vector& operator=(const vector& other) {
        if (this != &other) {
            clear();
            for (size_type i = 0; i < other._size; ++i) {
                push_back(other[i]);
            }
        }
        return *this;
    }

    vector& operator=(vector&& other) noexcept {
        if (this != &other) {
            // Clean up current
            clear();
            for (size_type i = 0; i <= _block_index; ++i) {
                if (_blocks[i]) {
                    _alloc.deallocate(_blocks[i], INITIAL_BLOCK_CAPACITY << i);
                    _blocks[i] = nullptr;
                }
            }
            // Move from other
            _size = other._size;
            _capacity = other._capacity;
            _block_index = other._block_index;
            _current_block_capacity = other._current_block_capacity;
            _element_index = other._element_index;
            for (size_type i = 0; i < 64; ++i) {
                _blocks[i] = other._blocks[i];
                other._blocks[i] = nullptr;
            }
            other._size = 0;
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
        size_type block, elem;
        get_indices(_size - 1, block, elem);
        return iterator(_blocks[block] + elem + 1);
    }

    const_iterator begin() const noexcept {
        if (empty()) return end();
        const T* block_end = _blocks[0] + INITIAL_BLOCK_CAPACITY;
        return const_iterator(&_blocks[0], 0, block_end);
    }

    const_iterator end() const noexcept {
        if (empty()) return const_iterator(nullptr);
        size_type block, elem;
        get_indices(_size - 1, block, elem);
        return const_iterator(_blocks[block] + elem + 1);
    }

    const_iterator cbegin() const noexcept { return begin(); }
    const_iterator cend() const noexcept { return end(); }

    // === Capacity ===
    [[nodiscard]] bool empty() const noexcept { return _size == 0; }
    size_type size() const noexcept { return _size; }
    size_type capacity() const noexcept { return _capacity; }
    size_type max_size() const noexcept { return static_cast<size_type>(-1) / sizeof(T); }

    void reserve(size_type new_cap) {
        // No-op for ConstantVector - blocks are allocated on demand
        (void)new_cap;
    }

    void shrink_to_fit() {
        // Deallocate all empty blocks beyond current usage
        // Calculate which block the last element is in
        if (_size == 0) {
            // Deallocate all but the first block
            for (size_type i = 1; i <= _block_index; ++i) {
                if (_blocks[i]) {
                    _alloc.deallocate(_blocks[i], INITIAL_BLOCK_CAPACITY << i);
                    _capacity -= (INITIAL_BLOCK_CAPACITY << i);
                    _blocks[i] = nullptr;
                }
            }
            _block_index = 0;
            _current_block_capacity = INITIAL_BLOCK_CAPACITY;
            _element_index = -1;
        } else {
            // Find the block containing the last element
            size_type last_block, last_elem;
            get_indices(_size - 1, last_block, last_elem);
            
            // Deallocate blocks beyond last_block
            for (size_type i = last_block + 1; i <= _block_index; ++i) {
                if (_blocks[i]) {
                    _alloc.deallocate(_blocks[i], INITIAL_BLOCK_CAPACITY << i);
                    _capacity -= (INITIAL_BLOCK_CAPACITY << i);
                    _blocks[i] = nullptr;
                }
            }
            _block_index = last_block;
            _current_block_capacity = INITIAL_BLOCK_CAPACITY << last_block;
            _element_index = static_cast<long long>(last_elem);
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
        if (index >= _size) {
            throw std::out_of_range("cv::vector::at: index out of range");
        }
        return (*this)[index];
    }

    const_reference at(size_type index) const {
        if (index >= _size) {
            throw std::out_of_range("cv::vector::at: index out of range");
        }
        return (*this)[index];
    }

    reference front() { return _blocks[0][0]; }
    const_reference front() const { return _blocks[0][0]; }

    reference back() {
        size_type block, elem;
        get_indices(_size - 1, block, elem);
        return _blocks[block][elem];
    }
    const_reference back() const {
        size_type block, elem;
        get_indices(_size - 1, block, elem);
        return _blocks[block][elem];
    }

    // === Modifiers ===
    void push_back(const T& value) {
        // Compute where new element goes based on _size
        size_type block, elem;
        get_indices(_size, block, elem);
        
        // Allocate block if needed
        if (_blocks[block] == nullptr) {
            size_type block_cap = INITIAL_BLOCK_CAPACITY << block;
            _blocks[block] = _alloc.allocate(block_cap);
            _capacity += block_cap;
        }
        
        _blocks[block][elem] = value;
        ++_size;
    }

    void push_back(T&& value) {
        size_type block, elem;
        get_indices(_size, block, elem);
        
        if (_blocks[block] == nullptr) {
            size_type block_cap = INITIAL_BLOCK_CAPACITY << block;
            _blocks[block] = _alloc.allocate(block_cap);
            _capacity += block_cap;
        }
        
        _blocks[block][elem] = std::move(value);
        ++_size;
    }

    template <typename... Args>
    reference emplace_back(Args&&... args) {
        size_type block, elem;
        get_indices(_size, block, elem);
        
        if (_blocks[block] == nullptr) {
            size_type block_cap = INITIAL_BLOCK_CAPACITY << block;
            _blocks[block] = _alloc.allocate(block_cap);
            _capacity += block_cap;
        }
        
        std::allocator_traits<Allocator>::construct(_alloc, &_blocks[block][elem], std::forward<Args>(args)...);
        ++_size;
        return _blocks[block][elem];
    }

    // pop_back - just decrement size, like std::vector
    _LIBCPP_HIDE_FROM_ABI void pop_back() noexcept {
        --_size;
    }

    void clear() noexcept {
        _size = 0;
        _element_index = -1;
        // Keep blocks allocated for reuse
    }

    void resize(size_type count) {
        resize(count, T());
    }

    void resize(size_type count, const T& value) {
        while (_size > count) {
            pop_back();
        }
        while (_size < count) {
            push_back(value);
        }
    }

    void swap(vector& other) noexcept {
        std::swap(_blocks, other._blocks);
        std::swap(_size, other._size);
        std::swap(_capacity, other._capacity);
        std::swap(_block_index, other._block_index);
        std::swap(_current_block_capacity, other._current_block_capacity);
        std::swap(_element_index, other._element_index);
    }
};

} // namespace cv

#endif // CONSTANT_VECTOR_HPP
