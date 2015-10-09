/*
===========================================================================

Copyright © 2015 Darkstar Dev Teams

This program is free software: you can redistribute it and/or modify
it under the terms of the GNU General Public License as published by
the Free Software Foundation, either version 3 of the License, or
(at your option) any later version.

This program is distributed in the hope that it will be useful,
but WITHOUT ANY WARRANTY; without even the implied warranty of
MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
GNU General Public License for more details.

You should have received a copy of the GNU General Public License
along with this program.  If not, see http://www.gnu.org/licenses/

This file is part of DarkStar-server source code.

===========================================================================
*/

#ifndef _MARSHAL_BITFIELD_H
#define _MARSHAL_BITFIELD_H

#include <array>

namespace marshal
{
    template<size_t _bits>
    class bitset
    {
        class bit
        {
            friend class bitset<_bits>;
        public:
            bit& operator=(bool _val) noexcept
            {
                _PBitset->set(_pos, _val);
                return *this;
            }
            operator bool() const noexcept
            {
                return _PBitset->test(_pos);
            }
        private:
            bit(bitset<_bits>& _bitset, size_t pos) noexcept :
                _PBitset(&_bitset), _pos(pos) {}

            bitset<_bits>* _PBitset {nullptr};
            size_t _pos {0};
        };
    public:
        bitset<_bits>& set(size_t pos, bool val)
        {
            if (val)
                _array[pos / 8] |= (uint8)1 << pos % 8;
            else
                _array[pos / 8] &= ~((uint8)1 << pos % 8);
            return *this;
        }

        bit operator[](size_t pos)
        {
            return bit(*this, pos);
        }

        uint8* data() noexcept
        {
            return _array.data();
        }

        const uint8* data() const noexcept
        {
            return _array.data();
        }

        constexpr bool operator[](size_t pos) const
        {
            return _subscript(pos);
        }

        bool test(size_t pos) const 
        {
            return _subscript(pos);
        }

        constexpr bitset() noexcept :
            _array() {}

        template<size_t S>
        constexpr bitset(const bitset<S>& other) :
            _array(other._array) {}

    private:
        constexpr bool _subscript(size_t pos) const
        {
            return (_array[pos / 8] & (uint8)1 << pos % 8) != 0;
        }
        std::array<uint8, (_bits / 8) + (_bits % 8 ? 0 : 1)> _array;
    };
}

#endif