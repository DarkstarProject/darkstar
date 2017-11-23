/*
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

#ifndef _CWEAPONSKILL_H
#define _CWEAPONSKILL_H

#include "../common/cbasetypes.h"
#include "../common/mmo.h"

#include "entities/battleentity.h"


#define MAX_WEAPONSKILL_ID	239

class CWeaponSkill
 {
public:

	CWeaponSkill(std::uint16_t id);

	std::uint16_t		getID();
	uint8		getJob(JOBTYPE JobID);
	std::uint16_t		getSkillLevel();
	uint8		getRange();
	uint8       getElement();
    bool        isElemental();

    bool        isAoE();
    bool        mainOnly(); // can only be used as main job
	uint8		getAoe();
	uint8		getAnimationId();
    duration    getAnimationTime();
	uint8       getType();
    uint8       getUnlockId();

	void		setID(std::uint16_t id);
	void		setJob(int8* jobs);
	void		setSkillLevel(std::uint16_t level);
	void		setRange(uint8 range);
    void        setElement(uint8 element);
	void		setPrimarySkillchain(uint8 skillchain);
    void		setSecondarySkillchain(uint8 skillchain);
    void		setTertiarySkillchain(uint8 skillchain);
	void		setAoe(uint8 aoe);
	void        setAnimationId(int8 animation);
    void        setAnimationTime(duration time);
	void		setType(uint8 type);
    void        setMainOnly(uint8 main);
    void        setUnlockId(uint8 id);

    uint8       getPrimarySkillchain();
    uint8       getSecondarySkillchain();
    uint8       getTertiarySkillchain();

	const int8* getName();
	void		setName(int8* name);

private:

	std::uint16_t		m_ID;
	uint8       m_TypeID;
	uint8		m_Job[MAX_JOBTYPE];
	std::uint16_t		m_Skilllevel;
	uint8       m_AnimationId;
    duration    m_AnimationTime;
	uint8       m_Element;
    uint8       m_PrimarySkillchain;
    uint8       m_SecondarySkillchain;
    uint8       m_TertiarySkillchain;
	uint8		m_Range;
	uint8       m_AOE;
    uint8       m_mainOnly;
    uint8       m_unlockId;

	string_t	m_name;
};

#endif