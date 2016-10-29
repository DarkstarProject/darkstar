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

#ifndef _MOB_CONTROLLER_H
#define _MOB_CONTROLLER_H

#include "controller.h"
#include "../../entities/mobentity.h"

class CMobController : public CController
{
public:
    CMobController(CMobEntity* PMob);

    virtual void Tick(time_point tick) override;
    virtual void Disengage() override;
    virtual bool Engage(uint16 targid) override;
    virtual void Despawn() override;
    virtual void Reset() override;

    virtual bool MobSkill(uint16 targid, uint16 wsid);
    virtual void Ability(uint16 targid, uint16 abilityid) override {}
    bool MobSkill(int list = 0);
    bool TryCastSpell();
    bool TrySpecialSkill();

    bool CanAggroTarget(CBattleEntity*);
    void TapDeaggroTime();

protected:
    virtual bool TryDeaggro();


    virtual void TryLink();
    bool CanDetectTarget(CBattleEntity* PTarget, bool forceSight = false);
    bool CanPursueTarget(CBattleEntity* PTarget);
    bool CheckHide(CBattleEntity* PTarget);
    bool CheckDetection(CBattleEntity* PTarget);
    bool CanSeePoint(position_t pos);
    bool CanCastSpells();
    void CastSpell(uint16 spellid);
    void Move();

    virtual void DoCombatTick(time_point tick);

    virtual void HandleEnmity();

    virtual void DoRoamTick(time_point tick);
    void Wait(duration _duration);
    void FollowRoamPath();
    bool CanMoveForward(float currentDistance);
    bool IsSpecialSkillReady(float currentDistance);
    bool IsSpellReady(float currentDistance);

    CBattleEntity* PTarget {nullptr};
private:

    CMobEntity* const PMob;

    time_point m_LastActionTime;
    time_point m_LastMagicTime;
    time_point m_LastMobSkillTime;
    time_point m_LastSpecialTime;
    time_point m_DeaggroTime;
    time_point m_NeutralTime;
    time_point m_WaitTime;

    bool m_firstSpell{ true };
    time_point m_LastRoamScript {time_point::min()};
};

#endif // _AI_CONTROLLER_H
