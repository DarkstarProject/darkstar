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
	std::uint8_t		getJob(JOBTYPE JobID);
	std::uint16_t		getSkillLevel();
	std::uint8_t		getRange();
	std::uint8_t       getElement();
    bool        isElemental();

    bool        isAoE();
    bool        mainOnly(); // can only be used as main job
	std::uint8_t		getAoe();
	std::uint8_t		getAnimationId();
    duration    getAnimationTime();
	std::uint8_t       getType();
    std::uint8_t       getUnlockId();

	void		setID(std::uint16_t id);
	void		setJob(int8* jobs);
	void		setSkillLevel(std::uint16_t level);
	void		setRange(std::uint8_t range);
    void        setElement(std::uint8_t element);
	void		setPrimarySkillchain(std::uint8_t skillchain);
    void		setSecondarySkillchain(std::uint8_t skillchain);
    void		setTertiarySkillchain(std::uint8_t skillchain);
	void		setAoe(std::uint8_t aoe);
	void        setAnimationId(int8 animation);
    void        setAnimationTime(duration time);
	void		setType(std::uint8_t type);
    void        setMainOnly(std::uint8_t main);
    void        setUnlockId(std::uint8_t id);

    std::uint8_t       getPrimarySkillchain();
    std::uint8_t       getSecondarySkillchain();
    std::uint8_t       getTertiarySkillchain();

	const int8* getName();
	void		setName(int8* name);

private:

	std::uint16_t		m_ID;
	std::uint8_t       m_TypeID;
	std::uint8_t		m_Job[MAX_JOBTYPE];
	std::uint16_t		m_Skilllevel;
	std::uint8_t       m_AnimationId;
    duration    m_AnimationTime;
	std::uint8_t       m_Element;
    std::uint8_t       m_PrimarySkillchain;
    std::uint8_t       m_SecondarySkillchain;
    std::uint8_t       m_TertiarySkillchain;
	std::uint8_t		m_Range;
	std::uint8_t       m_AOE;
    std::uint8_t       m_mainOnly;
    std::uint8_t       m_unlockId;

	string_t	m_name;
};

#endif