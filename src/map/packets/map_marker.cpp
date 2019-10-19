/*
===========================================================================

Copyright (c) 2010-2018 Darkstar Dev Teams

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

#include "map_marker.h"

#include "../entities/charentity.h"
#include "../utils/charutils.h"

CMapMarkerPacket::CMapMarkerPacket(CCharEntity* PChar)
{
    this->id(0x063);
    this->length(0x48);

    ref<uint8>(0x04) = 0x06;

    // Homepoint teleport masks
    ref<uint16>(0x08) = charutils::GetCharVar(PChar, "HpTeleportMask1b");
    ref<uint16>(0x0A) = charutils::GetCharVar(PChar, "HpTeleportMask1a");
    ref<uint16>(0x0C) = charutils::GetCharVar(PChar, "HpTeleportMask2b");
    ref<uint16>(0x0E) = charutils::GetCharVar(PChar, "HpTeleportMask2a");
    ref<uint16>(0x10) = charutils::GetCharVar(PChar, "HpTeleportMask3b");
    ref<uint16>(0x12) = charutils::GetCharVar(PChar, "HpTeleportMask3a");
    ref<uint16>(0x14) = charutils::GetCharVar(PChar, "HpTeleportMask4b");
    ref<uint16>(0x16) = charutils::GetCharVar(PChar, "HpTeleportMask4a");

    // TODO: Cavernous Maws, Abyssea Maws, Survival Guides
}