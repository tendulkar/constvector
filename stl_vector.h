#include <iostream>

#ifndef _CLASS_STL_VECTOR
#define _CLASS_STL_VECTOR

#ifndef m_assert
#define m_assert(expr, msg) assert(((void)(msg), (expr)))
#endif

#define __STLV_INITIAL_CAPACITY__ 8

template <class T, class _Allocator = std::allocator<T>>
class STLVector
{
    typedef _Allocator allocator_type;

private:
    T *_array;
    int _size;
    int _capacity;
    allocator_type _alloc;

public:
    class iterator
    {
    private:
        T* _current_ptr;  // Cached pointer for single dereference

    public:
        iterator(T* ptr)
            : _current_ptr(ptr)
        {
        }

        inline STLVector<T>::iterator &operator++() noexcept
        {
            ++_current_ptr;
            return *this;
        }

        inline const T &operator*() const noexcept
        {
            return *_current_ptr;  // Single dereference - same as ConstantVector
        }

        inline const bool operator==(const STLVector<T>::iterator &other) const noexcept
        {
            return _current_ptr == other._current_ptr;
        }

        inline const bool operator!=(const STLVector<T>::iterator &other) const noexcept
        {
            return _current_ptr != other._current_ptr;
        }
    };

    STLVector() : _size(0), _capacity(__STLV_INITIAL_CAPACITY__)
    {
        _array = _alloc.allocate(__STLV_INITIAL_CAPACITY__);
    }


    ~STLVector()
    {
        if (_array)
        {
            _alloc.deallocate(_array, _capacity);
        }
    }

    void push_back(const T &value)
    {
        if (__builtin_expect(_size == _capacity, 0))
        {
            _capacity *= 2;
            T *_new_array = _alloc.allocate(_capacity);
            for (int i = 0; i < _size; i++)
            {
                _new_array[i] = _array[i];
            }
            _alloc.deallocate(_array, _size);
            _array = _new_array;
        }
        _array[_size++] = value;
    }

    void pop_back()
    {
        m_assert(_size, "STLVector is empty, but pop_back() called!");
        --_size;
        if (__builtin_expect(_size <= _capacity / 2, 0))
        {
            _capacity /= 2;
            T *_new_array = _alloc.allocate(_capacity);
            for (int i = 0; i < _size; i++)
            {
                _new_array[i] = _array[i];
            }
            _alloc.deallocate(_array, 2 * _capacity);
            _array = _new_array;
        }
    }

    inline T &operator[](size_t index) noexcept
    {
        m_assert(index < _size, "STLVector index out of bounds at operator[]!");
        return _array[index];
    }

    inline const T &at(size_t index)
    {
        return (*this)[index];
    }

    /**
     * Returns the capacity of the array, in a way, it gives the memory usage of the container
     *
     * @return the capacity of the object
     */
    inline const size_t capacity() const noexcept
    {
        return _capacity;
    }

    /**
     * Returns the size of the array, the number of elements in the container
     */
    inline const size_t size() const noexcept
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
        m_assert(_size, "STLVector is empty, but pop_back() called!");
        return _array[0];
    }

    /**
     * Returns the last element of the container, checks the container is not empty
     * @return the constant reference to the last element of the container
     */
    inline const T &back() const
    {
        // std::cout << "Back() called: metaIndex: " << metaIndex << " lastArrayIndex: " << lastArrayIndex << std::endl;
        m_assert(_size, "Vector is empty, but back() called!");
        return _array[_size - 1];
    }

    inline iterator begin()
    {
        return iterator(_array);
    }

    inline iterator end()
    {
        return iterator(_array + _size);
    }
};


#endif
