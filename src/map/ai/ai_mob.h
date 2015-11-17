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

#ifndef _CAIMOB_H
#define _CAIMOB_H

#include "ai_battle.h"

class CAIMob : public CAIBattle
{
public:
    CAIMob(CBattleEntity*, std::unique_ptr<CPathFind>&&, std::unique_ptr<CController>&&);

    virtual void Internal_Disengage() override;
    virtual bool Internal_WeaponSkill(uint16 targid, uint16 wsid) override;
    virtual void Die() override;

    virtual void OnWeaponSkillFinished(CWeaponSkillState&, action_t&) override;
    virtual void OnDisengage() override;
    virtual void OnDeathTimer() override;

    bool IsAutoAttackEnabled();
    void SetAutoAttackEnabled(bool);
    bool IsWeaponSkillEnabled();
    void SetWeaponSkillEnabled(bool);

protected:
    void DropItems();

private:
    bool m_AutoAttackEnabled{ true };
    bool m_WeaponSkillEnabled{ true };
};

#endif