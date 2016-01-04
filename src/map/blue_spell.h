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

    CBlueSpell(uint16 id);
    virtual std::unique_ptr<CSpell> clone() override;

    uint16		getMonsterSkillId();
    uint8       getSetPoints();
    uint8       getEcosystem();
    uint8       getTraitCategory();
    uint8       getTraitWeight();
    uint8       getPrimarySkillchain();
    uint8       getSecondarySkillchain();

	void		setMonsterSkillId(uint16 skillid);
    void        setSetPoints(uint8 setpoints);
    void        setEcosystem(uint8 ecosystem);
    void        setTraitCategory(uint8 category);
    void        setTraitWeight(uint8 weight);
    void        setPrimarySkillchain(uint8 sc);
    void        setSecondarySkillchain(uint8 sc);
    void		addModifier(CModifier* modifier);

	std::vector<CModifier*> modList;					// modifiers added when blue spell is equipped

private:

	uint16		m_monsterSkillId;						// matching skill for a blue spell
    uint8       m_setPoints;
    uint8       m_ecosystem;
    uint8       m_traitCategory;
    uint8       m_traitWeight;
    uint8       m_PrimarySkillchain;
    uint8       m_SecondarySkillchain;

};

#endif