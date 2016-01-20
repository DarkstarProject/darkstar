/*
===========================================================================

Copyright (c) 2010-2015 Darkstar Dev Teams

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

#ifndef _CPARTYLISTPACKET_H_
#define _CPARTYLISTPACKET_H_

#include "../../common/cbasetypes.h"
#include <string.h>

class CPartyListPacket
{
public:

    CPartyListPacket(uint32 partyid, uint32 Total);
    ~CPartyListPacket();

    void AddPlayer(SearchEntity* PPlayer);

    uint8* GetData();
    uint16 GetSize();

private:

    uint32 m_partyid;
    uint32 m_offset;

    uint8 m_data[1024];
};

#endif
