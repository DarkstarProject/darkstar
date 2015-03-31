/*
===========================================================================

Copyright © 2010-2015 Darkstar Dev Teams

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

#ifndef _BASICPACKET_H
#define _BASICPACKET_H

#include "../../common/cbasetypes.h"

#include <stdio.h>
#include <string.h>

enum ENTITYUPDATE
{
    ENTITY_SPAWN,
    ENTITY_SHOW,
    ENTITY_UPDATE,
    ENTITY_HIDE,
    ENTITY_DESPAWN,
};

/** Base class for all packets
*
* Contains a 0x100 byte sized buffer
* Access the raw data with ref<T>(index)
*
*/
class CBasicPacket
{
protected:

    uint8 data[0x100];
    uint8& type;
    uint8& size;
    uint16& code;

public:

    CBasicPacket()
        : type(ref<uint8>(0)), size(ref<uint8>(1)), code(ref<uint16>(2))
    {
        std::fill_n(data, sizeof data, 0);
    }

    /* Getters for the header */

    uint16 id()
    {
        return ref<uint16>(0) & 0x1FF;
    }
    std::size_t length()
    {
        return 2 * (ref<uint8>(1) & ~1);
    }
    unsigned short sequence()
    {
        return ref<uint16>(2);
    }

    /* Setters for the header */

    // Set the first 9 bits to the ID. The highest bit overflows into the second byte.
    void id(unsigned int new_id)
    {
        ref<uint16>(0) &= ~0x1FF;
        ref<uint16>(0) |= new_id & 0x1FF;
    }

    // The length "byte" is actually just the highest 7 bits.
    // Need to preserve the lowest bit for the ID.
    void length(std::size_t new_size)
    {
        ref<uint8>(1) &= 1;
        ref<uint8>(1) |= ((new_size + 3) & ~3) / 2;
    }

    void sequence(unsigned short new_sequence)
    {
        ref<uint16>(2) = new_sequence;
    }

    /* Indexer for the data buffer */

    template<typename T>
    T& ref(std::size_t index)
    {
        return *reinterpret_cast<T*>(data + index);
    }

    operator uint8*()
    {
        return data;
    }
};

#endif
