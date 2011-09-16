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

#ifndef _CSPELL_H
#define _CSPELL_H

#include "../common/cbasetypes.h"
#include "../common/mmo.h"

#include "battleentity.h"

#define CANNOT_USE_SPELL	0
#define MAX_SPELL_ID		800

enum SPELLGROUP
{
	SPELLGROUP_NONE		 = 0,
	SPELLGROUP_SONG		 = 1,
	SPELLGROUP_BLACK	 = 2,
	SPELLGROUP_BLUE		 = 3,
	SPELLGROUP_NINJUTSU	 = 4,
	SPELLGROUP_SUMMONING = 5,
	SPELLGROUP_WHITE	 = 6
};

class CSpell
{
public:

	CSpell(uint16 id);

	uint16		getID();
	uint8		getJob(JOBTYPE JobID);					// мне не нравится название метода
	uint16		getMPCost();
	uint16		getCastTime();
	uint8		getRecastTime();
	uint8		getValidTarget();
	uint16		getAnimationID();
	SPELLGROUP	getSpellGroup();
	bool		isAOE();
	
	void		setID(uint16 id);
	void		setJob(int8* jobs);						// мне не нравится название метода
	void		setMPCost(uint16 MP);
	void		setCastTime(uint16 CastTime);
	void		setRecastTime(uint8 RecastTime);
	void		setValidTarget(uint8 ValidTarget);
	void		setAnimationID(uint16 AnimationID);
	void		setSpellGroup(SPELLGROUP SpellGropu);
	void		setAOE(uint8 AOE);

	const int8* getName();
	void		setName(int8* name);
	
private:

	uint16		m_ID;									// уникальный номер заклинания
	uint16		m_CastTime;								// время чтения заклинания
	uint8		m_RecastTime;							// (секунды)
	uint16		m_AnimationID;							// номер анимации заклинания
	uint16		m_MPCost;								// необходимое количество MP для чтения заклинания или NinToolID
	uint8		m_job[MAX_JOBTYPE];						// минимальные уровни профессий для чтения заклинания
	uint8		m_ValidTarget;							// тип цели заклинания
	SPELLGROUP  m_SpellGroup;							// группа/тип заклинания
	bool		m_isAOE;								// глобальный эффект

	string_t	m_name;
};

#endif