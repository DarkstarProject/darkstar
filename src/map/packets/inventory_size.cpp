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

#include "../../common/socket.h"

#include "../utils/charutils.h"
#include "inventory_size.h"
#include "../entities/charentity.h"

/************************************************************************
*																		*
*  Отсутствие значения в 0x1C управляет доступом к MOGLOCKER.			*
*  По сюжету он заблокирован до выполнения соответствующей задачи		*
*																		*
************************************************************************/

CInventorySizePacket::CInventorySizePacket(CCharEntity* PChar)
{
    this->type = 0x1C;
    this->size = 0x1A;

    WBUFB(data, (0x04)) = 1 + PChar->getStorage(LOC_INVENTORY)->GetSize();
    WBUFB(data, (0x05)) = 1 + PChar->getStorage(LOC_MOGSAFE)->GetSize();
    WBUFB(data, (0x06)) = 1 + PChar->getStorage(LOC_STORAGE)->GetSize();
    WBUFB(data, (0x07)) = 1 + PChar->getStorage(LOC_TEMPITEMS)->GetSize();
    WBUFB(data, (0x08)) = 1 + PChar->getStorage(LOC_MOGLOCKER)->GetSize();
    WBUFB(data, (0x09)) = 1 + PChar->getStorage(LOC_MOGSATCHEL)->GetSize();
    WBUFB(data, (0x0A)) = 1 + PChar->getStorage(LOC_MOGSACK)->GetSize();
    WBUFB(data, (0x0B)) = 1 + PChar->getStorage(LOC_MOGCASE)->GetSize();
    WBUFB(data, (0x0C)) = 1 + PChar->getStorage(LOC_WARDROBE)->GetSize();
    WBUFB(data, (0x0D)) = 1 + PChar->getStorage(LOC_MOGSAFE2)->GetSize();

    WBUFW(data, (0x14)) = 1 + PChar->getStorage(LOC_INVENTORY)->GetBuff();
    WBUFW(data, (0x16)) = 1 + PChar->getStorage(LOC_MOGSAFE)->GetBuff();
    WBUFW(data, (0x18)) = 1 + PChar->getStorage(LOC_STORAGE)->GetBuff();
    WBUFW(data, (0x1A)) = 1 + PChar->getStorage(LOC_TEMPITEMS)->GetBuff();
    if (charutils::hasMogLockerAccess(PChar))
        WBUFW(data, (0x1C)) = 1 + PChar->getStorage(LOC_MOGLOCKER)->GetBuff();
    else
        WBUFW(data, (0x1C)) = 0x00;

    WBUFW(data, (0x1E)) = 1 + PChar->getStorage(LOC_MOGSATCHEL)->GetBuff();
    WBUFW(data, (0x20)) = 1 + PChar->getStorage(LOC_MOGSACK)->GetBuff();
    WBUFW(data, (0x22)) = 1 + PChar->getStorage(LOC_MOGCASE)->GetBuff();
    WBUFW(data, (0x24)) = 1 + PChar->getStorage(LOC_WARDROBE)->GetBuff();
    WBUFW(data, (0x26)) = 1 + PChar->getStorage(LOC_MOGSAFE2)->GetBuff();
}
