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

#ifndef _CMOBSKILL_H
#define _CMOBSKILL_H

#include "../common/cbasetypes.h"
#include "../common/mmo.h"

#define MAX_MOBSKILL_ID	4096

// TODO: implement this
enum SKILLFLAG
{
	SKILLFLAG_NONE = 0,
	SKILLFLAG_WS = 1,
	SKILLFLAG_TWO_HOUR = 2,
    SKILLFLAG_SPECIAL = 4,
    SKILLFLAG_HIT_ALL = 8,
    SKILLFLAG_REPLACE_ATTACK = 16
};

class CMobSkill
{
public:

	CMobSkill(uint16 id);

    bool        hasMissMsg();
    bool        isAoE();
    bool        isConal();
    bool        isSingle();
    bool        isTwoHour();

	uint16		getID();
	uint16		getAnimationID();
	uint16		getfamilyID();
	uint8		getAoe();
	float		getDistance();
	uint8		getFlag();
    uint16      getAnimationTime();
    uint16      getActivationTime();
	uint16		getMsg();
    uint16      getAoEMsg();
	uint16		getValidTargets();
	float		getTP();
    uint16      getTotalTargets();
    uint16      getMsgForAction();
    float       getRadius();
    int16		getParam();
    uint8       getKnockback();
    uint8       getSkillchain();

    bool        isDamageMsg();

	void		setID(uint16 id);
	void		setAnimationID(uint16 aid);
	void		setfamilyID(uint16 familyID);
	void		setAoe(uint8 aoe);
	void		setDistance(float distance);
	void		setFlag(uint8 flag);
    void        setAnimationTime(uint16 AnimationTime);
    void        setActivationTime(uint16 ActivationTime);
    void        resetMsg();
	void		setMsg(uint16 msg);
	void		setValidTargets(uint16 targ);
	void		setTP(float tp);
    void        setTotalTargets(uint16 targets);
    void 		setParam(int16 value);
    void        setKnockback(uint8 knockback);
    void        setSkillchain(uint8 skillchain);

	const int8* getName();
	void		setName(int8* name);

private:

	uint16		m_ID;
    uint16      m_TotalTargets;
	uint16      m_FamilyID;
	int16		m_Param;
	uint16		m_AnimID;			//animation id
	uint8       m_Aoe;              // не используется
	float		m_Distance;         // не используется
	uint8		m_Flag;             // не используется
    uint8       m_ValidTarget;		//same as
    uint16      m_AnimationTime;	//how long the tp animation lasts for in ms
    uint16      m_ActivationTime;	//how long the mob prepares the tp move for
	uint16		m_Message;			//message param, scripters can edit this depending on self/resist/etc.
	float		m_TP;				//the tp at the time of finish readying (for scripts)
    uint8       m_knockback;        //knockback value (0-7)
    uint8       m_skillchain;       //weaponskill ID of skillchain properties

	string_t	m_name;
};

#endif
