/*
===========================================================================

  Copyright (c) 2010-2011 Darkstar Dev Teams

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

#ifndef _MOBENTITY_H
#define _MOBENTITY_H

#include "battleentity.h"
#include "enmity_container.h"


enum SPAWNTYPE
{
	SPAWNTYPE_NORMAL		= 0x00,
	SPAWNTYPE_ATNIGHT		= 0x01,
	SPAWNTYPE_ATEVENING		= 0x02,
	SPAWNTYPE_WEATHER		= 0x04,
	SPAWNTYPE_FOG			= 0x08,
	SPAWNTYPE_MOONPHASE		= 0x10,
	SPAWNTYPE_LOTTERY		= 0x20,
	SPAWNTYPE_WINDOWED		= 0x40,	// неизвестное для меня значение, взял из pxi
	SPAWNTYPE_SCRIPTED		= 0x80
};

enum MOBTYPE
{
	MOBTYPE_NORMAL			= 0x00,		
	MOBTYPE_NOTORIOUS		= 0x02,
	MOBTYPE_FISHED			= 0x04,
	MOBTYPE_CALLED			= 0x08,
	MOBTYPE_BATTLEFIELD		= 0x10,
	MOBTYPE_EVENT			= 0x20
};

enum BEHAVIOUR
{
	BEHAVIOUR_NONE				= 0x00,
	BEHAVIOUR_AGGRO_SIGHT		= 0x01,
	BEHAVIOUR_AGGRO_HEARING		= 0x02,
	BEHAVIOUR_AGGRO_LOWHP		= 0x04,
	BEHAVIOUR_AGGRO_TRUEHEARING	= 0x08,
	BEHAVIOUR_AGGRO_TRUESIGHT	= 0x10,
	BEHAVIOUR_AGGRO_MAGIC		= 0x20,
	BEHAVIOUR_AGGRO_WEAPONSKILL	= 0x40,
	BEHAVIOUR_AGGRO_JOBABILITY	= 0x80,
};



class CMobEntity : public CBattleEntity 
{
public:

	uint32		m_RespawnTime;	// отрезок времени, через который монстр возрождается после смерти

	uint32		m_DropID;		// номер группы оставляемых монстром предметов после смерти

	uint8		m_minLevel;		// минимально-возможный  уровень монстра
	uint8		m_maxLevel;		// максимально-возможный уровень монстра

	uint8		m_Type;			// тип монстра
	uint16		m_Behaviour;	// поведение монстра в различных ситуациях
	SPAWNTYPE	m_SpawnType;	// условие появления монстра 

	uint8		m_CallForHelp;	// в перспективе желательно объединить эту переменную с CNpc->unknown 

	position_t	m_SpawnPoint;	// точка возрождения монстра

	CEnmityContainer* PEnmityContainer;	// система ненависти монстров

	 CMobEntity();				// конструктор
	~CMobEntity();				// деструктор

private:

};

#endif