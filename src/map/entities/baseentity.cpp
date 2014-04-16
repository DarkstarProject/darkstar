/*
===========================================================================

  Copyright (c) 2010-2014 Darkstar Dev Teams

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
#include "../map.h"
#include "../zone.h"

CBaseEntity::CBaseEntity()
{
	m_TargID = 0;
	namevis = 1;
	hpvis = true;
	untargetable = false;

    PBattleAI = NULL;

	speed    = 40 + map_config.speed_mod;
	speedsub = 40 + map_config.speed_mod;

	animationsub = 0;
	animation    = ANIMATION_NONE;

	status = STATUS_DISAPPEAR;

	memset(&loc,  0, sizeof(loc));
	memset(&look, 0, sizeof(look));
}

CBaseEntity::~CBaseEntity()
{
	if(PBattleAI != NULL)
	{
	    delete PBattleAI;
	}
}

const int8* CBaseEntity::GetName()
{
	return name.c_str();
}

uint16 CBaseEntity::getZone()
{
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

uint8 CBaseEntity::GetRotPos()
{
	return loc.p.rotation;
}

void CBaseEntity::HideName(bool hide)
{
	if(hide)
	{
		// I totally guessed this number
		namevis = 0x08;
	}
	else
	{
		namevis = 1;
	}
}

bool CBaseEntity::IsNameHidden()
{
	return namevis == 0x08;
}