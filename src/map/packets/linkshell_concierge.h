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

#ifndef _CLINKSHELLCONCIERGEPACKET_H
#define _CLINKSHELLCONCIERGEPACKET_H

#include "../../common/cbasetypes.h"

#include "basic.h"

/************************************************************************
*                                                                       *
*  Packet used for building Linkshell Concierge responses               *
*                                                                       *
************************************************************************/

class CCharEntity;

class CLinkshellConciergePacket : public CBasicPacket
{
public:

	CLinkshellConciergePacket(CCharEntity* PChar, uint32 conciergeID, uint32 csid, uint32 option, uint8 conciergeShareSettings);
    uint8 linkshellEntriesListed = 0;
};

#endif
