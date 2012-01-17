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
	uint8		getJob(JOBTYPE JobID);					
	uint16		getMPCost();
	uint32		getCastTime();
	uint32		getRecastTime();
	uint8		getValidTarget();
	uint16		getAnimationID();
	SPELLGROUP	getSpellGroup();
	bool		isAOE();
	uint16		getBase();
	uint16		getElement();
	float		getMultiplier();
    uint16      getMessage();
	uint16		getCE();
	uint16		getVE();


	void		setID(uint16 id);
	void		setJob(int8* jobs);						
	void		setMPCost(uint16 MP);
	void		setCastTime(uint32 CastTime);
	void		setRecastTime(uint32 RecastTime);
	void		setValidTarget(uint8 ValidTarget);
	void		setAnimationID(uint16 AnimationID);
	void		setSpellGroup(SPELLGROUP SpellGroup);
	void		setAOE(uint8 AOE);
	void		setBase(uint16 base);
	void		setElement(uint16 element); 
	void		setMultiplier(float multiplier);
    void        setMessage(uint16 message);
	void		setCE(uint16 ce);
	void		setVE(uint16 ve);

	const int8* getName();
	void		setName(int8* name);
	
private:

	uint16		m_ID;									// spell id
	uint32		m_castTime;								// time to cast spell
	uint32		m_recastTime;							// recast time
	uint16		m_animation;							// animation for spell
	uint16		m_mpCost;								// mpCost/itemId for ninjitsu tool
	uint8		m_job[MAX_JOBTYPE];						// job
	uint8		m_ValidTarget;							// target pc/npc/both
	SPELLGROUP  m_spellGroup;							// spellgroup 
	bool		m_isAOE;								// aoe or single target spell
	uint16		m_base;									// spell base damage
	float		m_multiplier;							// multiplier for upper tier spells
	uint16		m_element;								// element of spell
    uint16      m_message;                              // default message id
	uint16		m_CE;									// cumulative enmity of spell
	uint16		m_VE;									// volatile enmity of spell
	string_t	m_name;									// spell name
};

#endif