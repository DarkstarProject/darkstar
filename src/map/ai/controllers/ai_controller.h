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

#ifndef _AI_CONTROLLER_H
#define _AI_CONTROLLER_H

#include "controller.h"
#include "../../entities/mobentity.h"

// mobs will deaggro if player is out of range for this long
#define MOB_DEAGGRO_TIME 25000

// time a mob is neutral after disengaging
#define MOB_NEUTRAL_TIME 10000

class CAIController : public CController
{
public:
    CAIController(CMobEntity* PMob);

    virtual void Tick(time_point tick) override;
    virtual void Disengage() override;
    virtual void Despawn() override;
    virtual void MobSkill(uint16 targid, uint16 wsid);

    bool IsAutoAttackEnabled();
    void SetAutoAttackEnabled(bool);
    bool IsWeaponSkillEnabled();
    void SetWeaponSkillEnabled(bool);

protected:
    bool TryDeaggro();
    void TryLink();
    bool CanDetectTarget(CBattleEntity* PTarget, bool forceSight = false);
    bool CanSeePoint(position_t pos);
    bool MobSkill(int list = 0);
    bool TrySpecialSkill();
    bool TryCastSpell();
    bool CanCastSpells();
    void CastSpell(uint16 spellid);

    void DoCombatTick(time_point tick);
    void DoRoamTick(time_point tick);
    void Wait(duration _duration);


private:
    CBattleEntity* PTarget;

    CMobEntity* const PMob;

    time_point m_LastActionTime;
    time_point m_LastMagicTime;
    time_point m_LastMobSkillTime;
    time_point m_LastSpecialTime;
    time_point m_NeutralTime;
    time_point m_WaitTime;

    bool m_firstSpell{ true };
    bool m_AutoAttackEnabled{ true };
    bool m_WeaponSkillEnabled{ true };
};

#endif // _AI_CONTROLLER_H