#include <iostream>
#include <algorithm>

#ifndef _CLASS_CONSTANT_VECTOR
#define _CLASS_CONSTANT_VECTOR

constexpr size_t __SV_INITIAL_CAPACITY__ = 256;
constexpr size_t __SV_INITIAL_CAPACITY_BITS__ = 8;
// 32 - 1 - 8 = 23 for 32-bit CLZ
constexpr size_t __SV_MSB_BITS__ = 23;

#ifndef m_assert
#define m_assert(expr, msg) assert(((void)(msg), (expr)))
#endif

template <class T, class _Allocator = std::allocator<T>, class _MetaAllocator = std::allocator<T *>>
class ConstantVector
{
    typedef _Allocator allocator_type;
    typedef _MetaAllocator meta_allocator_type;
    typedef size_t size_type;

private:
    T **_meta_array;
    size_type _size;
    size_type _capacity;
    size_type _meta_index;
    size_type _current_block_capacity;  // Cached: __SV_INITIAL_CAPACITY__ << _meta_index
    long long _last_array_index;
    size_type _first_array_start;
    size_type _zeroed_capacity;
    size_type _meta_start_offset;

    allocator_type _alloc;
    meta_allocator_type _meta_alloc;

public:
    class iterator
    {
    private:
        T* _current_ptr;           // Direct pointer to current element
        T* _block_end;             // Pointer to end of current block  
        T* _end_ptr;               // Pointer to absolute end (for comparison)
        int _iter_meta_index;      // Current block index
        ConstantVector<T> *_sv;

    public:
        // Constructor for begin()
        iterator(ConstantVector<T> *__sv, int __iter_meta_index, int __iter_array_index, T* __end_ptr)
            : _sv(__sv), _iter_meta_index(__iter_meta_index), _end_ptr(__end_ptr)
        {
            if (__sv && __end_ptr) {
                _current_ptr = __sv->_meta_array[__iter_meta_index] + __iter_array_index;
                _block_end = __sv->_meta_array[__iter_meta_index] + (__SV_INITIAL_CAPACITY__ << __iter_meta_index);
            } else {
                _current_ptr = nullptr;
                _block_end = nullptr;
            }
        }
        
        // Constructor for end() - simple sentinel
        iterator(T* end_sentinel)
            : _current_ptr(end_sentinel), _block_end(nullptr), _end_ptr(end_sentinel), 
              _iter_meta_index(-1), _sv(nullptr)
        {
        }

        inline ConstantVector<T>::iterator &operator++() noexcept
        {
            ++_current_ptr;
            // Unlikely: crossed block boundary
            if (__builtin_expect(_current_ptr == _block_end, 0)) {
                ++_iter_meta_index;
                if (_current_ptr != _end_ptr) {
                    _current_ptr = _sv->_meta_array[_iter_meta_index];
                    _block_end = _current_ptr + (__SV_INITIAL_CAPACITY__ << _iter_meta_index);
                }
            }
            return *this;
        }

        inline const T &operator*() const noexcept
        {
            return *_current_ptr;  // Single dereference
        }

        inline const bool operator==(const ConstantVector<T>::iterator &other) const noexcept
        {
            return _current_ptr == other._current_ptr;
        }

        inline const bool operator!=(const ConstantVector<T>::iterator &other) const noexcept
        {
            return _current_ptr != other._current_ptr;
        }
    };

    /**
     * Constructor for ConstantVector class.
     * Builds an empty ConstantVector, with a capacity of __SV_INITIAL_CAPACITY__
     *
     * @param None
     *
     * @return None
     *
     * @throws None
     */
    ConstantVector() : _size(0), _meta_index(0), _current_block_capacity(__SV_INITIAL_CAPACITY__), _last_array_index(-1), _capacity(__SV_INITIAL_CAPACITY__), _zeroed_capacity(__SV_INITIAL_CAPACITY__), _meta_start_offset(0), _first_array_start(0)
    {
        _meta_array = _meta_alloc.allocate(64);
        // Zero all pointers to ensure nullptr checks work correctly
        std::fill(_meta_array, _meta_array + 64, nullptr);
        _meta_array[0] = _alloc.allocate(__SV_INITIAL_CAPACITY__);
    }

    /**
     * Constructor for moving the content of a ConstantVector to another one.
     *
     * @param right The ConstantVector to move from
     *
     * @return None
     *
     * @throws None
     */
    // ConstantVector(ConstantVector &&right) : _size(right._size), _meta_index(right._meta_index), _last_array_index(right._last_array_index), _capacity(right._capacity)
    // {
    //     _meta_array = right._meta_array;
    //     right._meta_array = nullptr;
    //     right._size = 0;
    //     right._capacity = __SV_INITIAL_CAPACITY__;
    //     right._meta_index = 0;
    //     right._last_array_index = 0;
    // }

    /**
     * Destructor for the ConstantVector class.
     */
    ~ConstantVector()
    {
        for (size_t i = _meta_start_offset; i <= _meta_index; i++)
        {
            if(_meta_array[i]) {
                _alloc.deallocate(_meta_array[i], __SV_INITIAL_CAPACITY__ << i);
            }
        }
        _meta_alloc.deallocate(_meta_array, 64);
    }

    /**
     * A function to add a new element to the end of the stellar vector.
     *
     * @param value the value to be added to the stellar vector
     *
     * @return void
     *
     * @throws None
     */
    void push_back(const T &value)
    {
        ++_last_array_index;
        if (__builtin_expect(static_cast<size_type>(_last_array_index) == _current_block_capacity, 0))
        {
            // Current block is full, allocate new block (no copy needed for O(1) worst case)
            _last_array_index = 0;
            ++_meta_index;
            _current_block_capacity <<= 1;  // Double the block capacity
            if (_meta_array[_meta_index] == nullptr) {
                _meta_array[_meta_index] = _alloc.allocate(_current_block_capacity);
                _capacity += _current_block_capacity;
            }
        }
        _meta_array[_meta_index][_last_array_index] = value;
        ++_size;
    }

    /**
     * A function to remove the last element from the ConstantVector.
     * Deallocates array blocks when they become empty to maintain O(N) space.
     */
    void pop_back()
    {
        m_assert(_size, "ConstantVector is empty, but pop_back() called!");
        --_size;
        if (__builtin_expect(--_last_array_index < 0, 0))
        {
            if (_meta_index > 0)
            {
                // Free the empty array block - reduces fragmentation
                _capacity -= _current_block_capacity;
                _alloc.deallocate(_meta_array[_meta_index], _current_block_capacity);
                _meta_array[_meta_index] = nullptr;
                --_meta_index;
                _current_block_capacity >>= 1;  // Halve the block capacity
                _last_array_index = static_cast<long long>(_current_block_capacity) - 1;
            }
        }
    }

    inline void pop_front()
    {
        m_assert(_size, "ConstantVector is empty, but pop_front() called!");
        // std::cout << "STELLAR_VECTOR:::POP_FRONT: _meta_start_offset: " << _meta_start_offset << ", _first_array_start: " << _first_array_start 
        // std::cout << ", _zeroed_capacity: " << _zeroed_capacity << ", _size: " << _size << std::endl;
        _size--;
        _first_array_start++;
        _zeroed_capacity++;
        if (_first_array_start == (__SV_INITIAL_CAPACITY__ << _meta_start_offset)) {
            _alloc.deallocate(_meta_array[_meta_start_offset], _first_array_start);
            _meta_start_offset = (_meta_start_offset + 1) % 64;
            _first_array_start = 0;
        }
    }

    inline T& operator[](size_type index) 
    {
        m_assert(index < _size, "ConstantVector index out of bounds at operator[]!");
        // Fast path for first block (indices 0 to __SV_INITIAL_CAPACITY__-1)
        if (__builtin_expect(index < __SV_INITIAL_CAPACITY__, 1)) {
            return _meta_array[0][index];
        }
        // General case: compute block index (j) and offset within block (k)
        // j = floor(log2(adjusted)) - 3, k = adjusted - (8 << j)
        const unsigned int adjusted = static_cast<unsigned int>(index + __SV_INITIAL_CAPACITY__);
        const unsigned int j = __SV_MSB_BITS__ - __builtin_clz(adjusted);
        const unsigned int k = adjusted - (__SV_INITIAL_CAPACITY__ << j);
        return _meta_array[j][k];
    }


    inline const T &at(size_type index)
    {
        return (*this)[index];
    }

    /**
     * Returns the capacity of the array, in a way, it gives the memory usage of the container
     *
     * @return the capacity of the object
     */
    inline const size_type capacity() const noexcept
    {
        return _capacity;
    }

    /**
     * Returns the size of the array, the number of elements in the container
     */
    inline const size_type size() const noexcept
    {
        return _size;
    }

    /**
     * Check if the container is empty.
     *
     * @return true if the container is empty, false otherwise
     */
    inline const bool empty() const noexcept
    {
        return _size == 0;
    }

    /**
     * Returns the first element of the container, checks the container is not empty
     * @return the constant reference to the first element of the container
     */
    inline const T &front() const
    {
        m_assert(_size, "ConstantVector is empty, but pop_back() called!");
        return _meta_array[_meta_start_offset][_first_array_start];
    }

    /**
     * Returns the last element of the container, checks the container is not empty
     * @return the constant reference to the last element of the container
     */
    inline const T &back() const
    {
        // std::cout << "Back() called: _meta_index: " << _meta_index << " _last_array_index: " << _last_array_index << std::endl;
        m_assert(_size, "ConstantVector is empty, but back() called!");
        return _meta_array[_meta_index][_last_array_index];
    }

    inline iterator begin()
    {
        if (empty())
            return end();
        // Pass end pointer for boundary comparison
        T* end_ptr = _meta_array[_meta_index] + _last_array_index + 1;
        return iterator(this, _meta_start_offset, _first_array_start, end_ptr);
    }

    inline iterator end()
    {
        // End sentinel - just the pointer
        T* end_ptr = empty() ? nullptr : (_meta_array[_meta_index] + _last_array_index + 1);
        return iterator(end_ptr);
    }
};

#endif