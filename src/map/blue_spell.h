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

#ifndef _CBLUESPELL_H
#define _CBLUESPELL_H

#include "spell.h"

class CBlueSpell : public CSpell
{
public:

    CBlueSpell(SpellID id);
    virtual std::unique_ptr<CSpell> clone() override;

    std::uint16_t		getMonsterSkillId();
    std::uint8_t       getSetPoints();
    std::uint8_t       getEcosystem();
    std::uint8_t       getTraitCategory();
    std::uint8_t       getTraitWeight();
    std::uint8_t       getPrimarySkillchain();
    std::uint8_t       getSecondarySkillchain();

	void		setMonsterSkillId(std::uint16_t skillid);
    void        setSetPoints(std::uint8_t setpoints);
    void        setEcosystem(std::uint8_t ecosystem);
    void        setTraitCategory(std::uint8_t category);
    void        setTraitWeight(std::uint8_t weight);
    void        setPrimarySkillchain(std::uint8_t sc);
    void        setSecondarySkillchain(std::uint8_t sc);
    void		addModifier(CModifier modifier);

	std::vector<CModifier> modList;					// modifiers added when blue spell is equipped

private:

	std::uint16_t		m_monsterSkillId {};						// matching skill for a blue spell
    std::uint8_t       m_setPoints {};
    std::uint8_t       m_ecosystem {};
    std::uint8_t       m_traitCategory {};
    std::uint8_t       m_traitWeight {};
    std::uint8_t       m_PrimarySkillchain {};
    std::uint8_t       m_SecondarySkillchain {};

};

#endif