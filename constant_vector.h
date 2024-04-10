#include <iostream>

#ifndef _CLASS_CONSTANT_VECTOR
#define _CLASS_CONSTANT_VECTOR

#define __SV_INITIAL_CAPACITY__ 8
#define __SV_INITIAL_CAPACITY_BITS__ 3
// 32 -1 -3
#define __SV_MSB_BITS__ 28

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
        int _iter_meta_index;
        int _iter_last_array_index;
        int _iter_index;
        ConstantVector<T> *_sv;

    public:
        iterator(ConstantVector<T> *__sv, int __iter_meta_index = 0, int __iter_last_array_index = 0, int __iter_index = 0)
            : _sv(__sv), _iter_meta_index(__iter_meta_index), _iter_last_array_index(__iter_last_array_index), _iter_index(__iter_index)
        {
        }

        inline ConstantVector<T>::iterator &operator++() noexcept
        {
            // std::cout <<  "Operator++ is called " << "idx: " << _iter_index << " meta: " << _iter_meta_index << " last: " << _iter_last_array_index << std::endl;
            if (_iter_index == _sv->_size)
            {
                // handle iterator at the end
                return *this;
            }
            _iter_last_array_index++;
            if (_iter_last_array_index == (1 << (_iter_meta_index + __SV_INITIAL_CAPACITY_BITS__)))
            {
                // case of at the end of existing array, so need to iterate on the next array
                _iter_last_array_index = 0;
                _iter_meta_index++;
            }
            _iter_index++;
            return *this;
        }

        inline const T &operator*() const noexcept
        {
            // std::cout <<  "Operator* is called " << "idx: " << _iter_index << " meta: " << _iter_meta_index << " last: " << _iter_last_array_index << std::endl;
            return _sv->_meta_array[_iter_meta_index][_iter_last_array_index];
        }

        inline const bool operator==(const ConstantVector<T>::iterator &other) const noexcept
        {
            // std::cout <<  "Operator== is called " << "idx: " << _iter_index << " meta: " << _iter_meta_index << " last: " << _iter_last_array_index << std::endl;
            return _iter_index == other._iter_index;
        }

        inline const bool operator!=(const ConstantVector<T>::iterator &other) const noexcept
        {
            // std::cout <<  "Operator != is called " << "idx: " << _iter_index << " meta: " << _iter_meta_index << " last: " << _iter_last_array_index << std::endl;
            return _iter_index != other._iter_index;
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
    ConstantVector() : _size(0), _meta_index(0), _last_array_index(-1), _capacity(__SV_INITIAL_CAPACITY__), _zeroed_capacity(__SV_INITIAL_CAPACITY__), _meta_start_offset(0), _first_array_start(0)
    {
        _meta_array = _meta_alloc.allocate(64);
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
        if (_last_array_index == (__SV_INITIAL_CAPACITY__ << _meta_index))
        {
            // case of all arrays got full, need to allocate new array and don't do any copy, to support worst case of O(1)
            _last_array_index = 0;
            _meta_index = (_meta_index + 1) % 64;
            if(_meta_array[_meta_index] == nullptr) {
                _meta_array[_meta_index] = _alloc.allocate(__SV_INITIAL_CAPACITY__ << _meta_index);
                _capacity += (__SV_INITIAL_CAPACITY__ << _meta_index);
            }
        }
        _meta_array[_meta_index][_last_array_index] = value;
        _size++;
    }

    /**
     * A function to remove the last element from the ConstantVector.
     * Checks for vector has any elements or not
     */
    void pop_back()
    {
        // std::cout << "Pop back called, _meta_index: " << _meta_index << ", _last_array_index: " << _last_array_index << std::endl;
        m_assert(_size, "ConstantVector is empty, but pop_back() called!");
        _last_array_index--;
        _size--;
        if (_last_array_index < 0)
        {
            // the last array is empty, free the whole array, and the freed memory part is avaialble for operating system to allocate
            // since we're returning large array to the operating system, it should create less fragmentation
            _capacity -= (__SV_INITIAL_CAPACITY__ << _meta_index);
            // std::cout << "Stellar vector Pop back called, _meta_index: " << _meta_index << ", _last_array_index: " << _last_array_index << ", capacity" << _capacity << ", size: "<< _size << std::endl;

            _alloc.deallocate(_meta_array[_meta_index], __SV_INITIAL_CAPACITY__ << _meta_index);
            _meta_array[_meta_index] = nullptr;
            _meta_index = (_meta_index + 64 - 1)% 64;
            _last_array_index = (__SV_INITIAL_CAPACITY__ << _meta_index) - 1;
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
        // The expression `(31 - 3) - __builtin_clz(index + 8)` is optimal representation of `floor(log2(index+8)) - 3`
        int j = (__SV_MSB_BITS__ - __builtin_clz(index + __SV_INITIAL_CAPACITY__));
        int k = (index + __SV_INITIAL_CAPACITY__) - (__SV_INITIAL_CAPACITY__ << j);
        return _meta_array[j][k];
    }


    inline const T &at(size_type index)
    {
        return this[index];
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
        return iterator(this, _meta_start_offset, _first_array_start, 0);
    }

    inline iterator end()
    {
        return iterator(this, -1, -1, _size);
    }
};

#endif