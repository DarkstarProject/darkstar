/*
===========================================================================

Copyright (c) 2018 Darkstar Dev Teams

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

#ifndef _TRUST_CONTROLLER_H
#define _TRUST_CONTROLLER_H

#include "controller.h"
#include "../../entities/trustentity.h"
#include "../../ability.h"
#include "../../weapon_skill.h"
#include "mob_controller.h"

class CTrustEntity;
class CTrustController : public CMobController
{
public:
    CTrustController(CTrustEntity*);
    virtual ~CTrustController();

    virtual void Tick(time_point) override;
    virtual bool Engage(uint16 targid) override;
    virtual bool Disengage() override;
    virtual void Despawn() override;

    //virtual void Reset() override;

    //virtual bool WeaponSkill(uint16 targid, uint16 wsid) override;
    virtual bool TrustSkill(uint16 targid, uint16 wsid);
    virtual bool Ability(uint16 targid, uint16 abilityid);
    virtual bool Cast(uint16 targid, SpellID spellid) override;

    bool TryCastSpell();
    bool TryWeaponSkill();
    bool TryAbilitySkill();

    //bool TrustSkill(int list = 0);
    CBattleEntity * TTarget{ nullptr };


protected:

    virtual bool CanCastSpells();
    void CastSpell(SpellID spellid);

    bool CanUseWeaponskill(CTrustEntity* PTrust, CWeaponSkill* PSkill);
    virtual void Move();

    virtual void DoCombatTick(time_point tick);
    virtual void DoRoamTick(time_point tick);
    void FaceTarget(uint16 targid = 0);

    bool CanMoveForward(float currentDistance);
    bool IsWeaponSkillReady(float currentDistance);
    bool IsSpellReady(float currentDistance);
    bool IsAbilityReady(float currentDistance);
    void Wait(duration _duration);

private:
    CTrustEntity * const PTrust;

    time_point m_LastWeaponSkillTime;
    time_point m_LastSpecialTime;
    time_point m_LastActionTime;
    time_point m_LastAbilityTime;
    time_point m_LastMagicTime;
    time_point m_WaitTime;

    CBattleEntity* PActionTarget;

    static constexpr float RoamDistance{ 5.0f };

    bool m_firstSpell{ true };
    int healTick = 1;
};

#endif // _TRUSTCONTROLLER