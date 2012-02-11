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
#include <string.h>

#include "baseentity.h"
#include "zone.h"

CBaseEntity::CBaseEntity() 
{
	m_TargID = 0;

	speed    = 40;
	speedsub = 40;
	
	animationsub = 0;
	animation    = ANIMATION_NONE;
	
	status = STATUS_DISAPPEAR;

	memset(&loc,  0, sizeof(loc));
	memset(&look, 0, sizeof(look));
}

CBaseEntity::~CBaseEntity()
{
}

const int8* CBaseEntity::GetName()
{
	return name.c_str();
}

uint8 CBaseEntity::getZone()
{
	DSP_DEBUG_BREAK_IF(loc.zone == NULL && status != STATUS_DISAPPEAR);

    return loc.zone != NULL ? loc.zone->GetID() : loc.destination;
}

float CBaseEntity::GetXPos()
{
	return loc.p.x;
}

float CBaseEntity::GetYPos()
{
	return loc.p.y;
}
	
float CBaseEntity::GetZPos()
{
	return loc.p.z;
}
