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

#ifndef _CITEMWEAPON_H
#define _CITEMWEAPON_H

#include "../../common/cbasetypes.h"

#include "item_armor.h"


class CItemWeapon : public CItemArmor
{
public:

	CItemWeapon(std::uint16_t);
	virtual ~CItemWeapon();

	uint8	getSkillType();
	uint8	getSubSkillType();
    std::uint16_t  getILvlSkill();
    std::uint16_t  getILvlParry();
    std::uint16_t  getILvlMacc();
	std::int16_t	getDelay();
	std::int16_t	getBaseDelay();
	std::uint16_t	getDamage();
	std::uint16_t	getDmgType();
    uint8   getAdditionalEffect();
    uint8   getHitCount();
	std::uint16_t  getUnlockPoints();
    std::uint16_t  getCurrentUnlockPoints();
    void    resetDelay();
    bool    addWsPoints(std::uint16_t points);

    bool    isRanged();
    bool    isThrowing();
    bool    isTwoHanded();
	bool    isUnlockable();
    bool    isUnlocked();

	void	setSkillType(uint8 skillType);
	void	setSubSkillType(uint8 subSkillType);
    void    setILvlSkill(std::uint16_t skill);
    void    setILvlParry(std::uint16_t parry);
    void    setILvlMacc(std::uint16_t macc);
	void	setDelay(std::uint16_t delay);
	void	setBaseDelay(std::uint16_t delay); //should ONLY be set by zoneutils!
	void	setDamage(std::uint16_t damage);
	void	setDmgType(std::uint16_t dmgType);
    void    setAdditionalEffect(uint8 effect);
    void    setMaxHit(uint8 hit);
	void    setUnlockablePoints(std::uint16_t points);
    void    setCurrentUnlockPoints(std::uint16_t points);

private:

	uint8	m_skillType;
	uint8	m_subSkillType; //gun vs crossbow, any other exclusives
    std::uint16_t  m_iLvlSkill;
    std::uint16_t  m_iLvlParry;
    std::uint16_t  m_iLvlMacc;
	std::uint16_t	m_damage;
	std::int16_t	m_delay;    //can be -ve e.g. ammo/ranged weapons
	std::int16_t	m_baseDelay;
	std::uint16_t	m_dmgType;
    uint8   m_effect;
    uint8   m_maxHit;

    std::uint16_t  m_wsunlockpoints;

    bool    m_ranged;
    bool    m_twoHanded;
};

#endif