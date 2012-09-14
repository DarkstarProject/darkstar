/*
===========================================================================

  Copyright (c) 2010-2012 Darkstar Dev Teams

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

#ifndef _CONQUESTSYSTEM_H
#define _CONQUESTSYSTEM_H

#include "../common/cbasetypes.h"

#include "zone.h"

#define SANDORIA            0x00
#define BASTOK              0x01
#define WINDURST            0x02  
#define BEASTMEN            0x03
#define NEUTRAL             0xFF

/************************************************************************
*                                                                       *
*                                                                       *
*                                                                       *
************************************************************************/

class CCharEntity;

namespace conquest
{
	uint8  GetBalance();
	uint8  GetNexTally();
    uint8  GetRegionOwner(REGIONTYPE RegionID);

    uint32 AddConquestPoints(CCharEntity* PChar, uint32 exp);
};

#endif