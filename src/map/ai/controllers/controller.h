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

class CBattleEntity;

class CController
{
public:
    CController(CBattleEntity* _POwner);
    virtual ~CController() {}
    virtual void Tick(time_point tick) = 0;
    virtual void Despawn();
    virtual void Reset();
    virtual void Cast(uint16 targid, uint16 spellid);
    virtual bool Engage(uint16 targid);
    virtual void ChangeTarget(uint16 targid);
    virtual void Disengage();
    virtual void WeaponSkill(uint16 targid, uint16 wsid);
    virtual void Ability(uint16 targid, uint16 abilityid) {}

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
