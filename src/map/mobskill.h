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

#define MAX_MOBSKILL_ID	4096

  enum SKILLBEHAVIOUR
{
	SKILLBEHAVIOUR_NONE				= 0x00,
	SKILLBEHAVIOUR_USE_ONCE		= 0x01,
	SKILLBEHAVIOUR_BELOW_PCT		= 0x02,
	SKILLBEHAVIOUR_ABOVE_PCT		= 0x04,
	SKILLBEHAVIOUR_USE_ALWAYS	= 0x08,
	SKILLBEHAVIOUR_USE_ON_RECEIVE_MAGIC	= 0x10,
	SKILLBEHAVIOUR_USE_ON_RECEIVE_PHYSICAL		= 0x20,
	SKILLBEHAVIOUR_USE_BEFORE_DEATH	= 0x40,
	SKILLBEHAVIOUR_USE_AT_FULL_HP	= 0x80,
};

class CMobSkill
{
public:

	CMobSkill(uint16 id);
    
	uint16		getID();
	uint16		getAnimationID();
	uint16		getfamilyID();
	uint8		getAoe();
	float		getDistance();
	uint8		getFlag();
    uint16      getAnimationTime();
    uint16      getActivationTime();
	uint16		getMsg();
	uint16		getValidTargets();
	uint16		getTP();

	void		setID(uint16 id);
	void		setAnimationID(uint16 aid);
	void		setfamilyID(uint16 familyID);
	void		setAoe(uint8 aoe);
	void		setDistance(float distance);
	void		setFlag(uint8 flag);
    void        setAnimationTime(uint16 AnimationTime);
    void        setActivationTime(uint16 ActivationTime);
	void		setMsg(uint16 msg);
	void		setValidTargets(uint16 targ);
	void		setTP(uint16 tp);
	
	const int8* getName();
	void		setName(int8* name);

	uint16		m_SkillCondition;		//the condition of the skill, used for special tp moves, e.g. used sub 50% HP
	uint16		m_SkillConditionValue;	//the condition value, e.g. SkillCondition=BELOW_PCT SkillConditionValue=50
										//					so TP move can only be used below 50% HP
private:

	uint16		m_ID;
	uint16      m_FamilyID;
	uint16		m_AnimID;			//animation id
	uint8       m_Aoe;              // не используется 
	float		m_Distance;         // не используется
	uint8		m_Flag;             // не используется
    uint8       m_ValidTarget;		//same as 
    uint16      m_AnimationTime;	//how long the tp animation lasts for in ms
    uint16      m_ActivationTime;	//how long the mob prepares the tp move for
	uint16		m_Message;			//message param, scripters can edit this depending on self/resist/etc.
	uint16		m_TP;				//the tp at the time of finish readying (for scripts)

	string_t	m_name;
};

#endif;