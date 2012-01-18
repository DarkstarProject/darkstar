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

#ifndef _CMOBSKILL_H
#define _CMOBSKILL_H

#include "../common/cbasetypes.h"
#include "../common/mmo.h"

#define MAX_MOBSKILL_ID	2048

//skilltype flag
//1	physical
//2	ranged
//4	magical
//8	aoe cone
//16	aoe linear
//32	aoe radius
//64	healing
//128	enhancing
//256	enfeebling
//512	dispel
//1024	special

class CMobSkill
{
public:

	CMobSkill(uint16 id);
    
	uint16		getID();
	uint16		getfamilyID();
	uint8		getSkillType();
	uint8		getElement();
	uint8		getAoe();
	uint8       getNumHits();
	float		getDistance();
	uint8		getFlag();
    uint16      getAnimationTime();
    uint16      getActivationTime();

	void		setID(uint16 id);
	void		setfamilyID(uint16 familyID);
	void		setSkillType(uint8 skillType);
	void		setElement(uint8 element);
	void		setAoe(uint8 aoe);
	void        setNumHits(uint8 numhits); 
	void		setDistance(float distance);
	void		setFlag(uint8 flag);
    void        setAnimationTime(uint16 AnimationTime);
    void        setActivationTime(uint16 ActivationTime);
	
	const int8* getName();
	void		setName(int8* name);
	
private:

	uint16		m_ID;
	uint16      m_FamilyID;
	uint8		m_SkillType;        // не используется
	uint8		m_Element;          // не используется
	uint8       m_Aoe;              // не используется
	float		m_Distance;         // не используется
	uint8       m_NumHits;          // не используется
	uint8		m_Flag;             // не используется
    uint8       m_ValidTarget;
    uint16      m_AnimationTime;
    uint16      m_ActivationTime;

	string_t	m_name;
};

#endif;