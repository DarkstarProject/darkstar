﻿/*
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

#ifndef _CRELEASEPACKET_H
#define _CRELEASEPACKET_H

#include "../../common/cbasetypes.h"

#include "basic.h"

enum RELEASE_TYPE
{
	RELEASE_STANDARD	= 0,
	RELEASE_EVENT		= 1,
	RELEASE_SKIPPING	= 2,
	RELEASE_UNKNOWN     = 3, /* Used by Event Update (String Update) - Packet 0x060  */
	RELEASE_FISHING		= 4
};

/************************************************************************
*																		*
*  																		*
*																		*
************************************************************************/

class CCharEntity;

class CReleasePacket : public CBasicPacket
{
public:

	CReleasePacket(CCharEntity* PChar, RELEASE_TYPE releaseType = RELEASE_STANDARD);
};

#endif