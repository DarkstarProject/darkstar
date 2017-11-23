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

#ifndef _CONTROLLER_H
#define _CONTROLLER_H

#include "../../../common/cbasetypes.h"
#include "../../../common/mmo.h"
#include "../../spell.h"

class CBattleEntity;

class CController
{
public:
    CController(CBattleEntity* _POwner);
    virtual ~CController() {}
    virtual void Tick(time_point tick) = 0;
    virtual void Despawn();
    virtual void Reset();
    virtual bool Cast(std::uint16_t targid, SpellID spellid);
    virtual bool Engage(std::uint16_t targid);
    virtual bool ChangeTarget(std::uint16_t targid);
    virtual bool Disengage();
    virtual bool WeaponSkill(std::uint16_t targid, std::uint16_t wsid);
    virtual bool Ability(std::uint16_t targid, std::uint16_t abilityid) { return false; }

    bool IsAutoAttackEnabled();
    void SetAutoAttackEnabled(bool);
    bool IsWeaponSkillEnabled();
    void SetWeaponSkillEnabled(bool);
    bool IsMagicCastingEnabled();
    void SetMagicCastingEnabled(bool);

    bool canUpdate {true};

protected:
    time_point m_Tick;
    CBattleEntity* POwner;
    bool m_AutoAttackEnabled {true};
    bool m_WeaponSkillEnabled {true};
    bool m_MagicCastingEnabled {true};
};

#endif
