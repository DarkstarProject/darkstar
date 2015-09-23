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

#ifndef _AIBATTLE_H
#define _AIBATTLE_H

#include "ai_base.h"
#include "helpers/targetfind.h"
#include "controllers/controller.h"
#include "states/state.h"
#include "../packets/message_basic.h"

class CBattleEntity;
class CWeaponSkillState;
class CMagicState;
class CSpell;
struct action_t;

class CAIBattle : public CAIBase
{
public:
    CAIBattle(CBattleEntity*, std::unique_ptr<CPathFind>&&, std::unique_ptr<CController>&&);

    virtual void Cast(uint16 targid, uint16 spellid);
    virtual void Engage(uint16 targid);
    virtual void ChangeTarget(uint16 targid);
    virtual void Disengage();

    /* Internal Controller functions */
    virtual bool Internal_Engage(uint16 targetid);
    virtual bool Internal_Cast(uint16 targetid, uint16 spellid);
    virtual void Internal_ChangeTarget(uint16 targetid);
    virtual void Internal_Disengage();

    virtual void OnChangeTarget(CBattleEntity* PTarget);
    virtual void TryHitInterrupt(CBattleEntity* PAttacker);

    /* State finish functions */
    /* Auto attack */
    virtual bool Attack(action_t&);
    /* Returns whether to call Attack or not (which includes error messages) */
    virtual bool CanAttack(CBattleEntity* PTarget, std::unique_ptr<CMessageBasicPacket>& errMsg);
    virtual CBattleEntity* IsValidTarget(uint16 targid, uint8 validTargetFlags, std::unique_ptr<CMessageBasicPacket>& errMsg);
    virtual void OnDisengage();
    /* Casting */
    virtual void OnCastFinished(CMagicState&, action_t&);
    virtual void OnCastInterrupted(CMagicState&, action_t&, MSGBASIC_ID msg);
    /* Weaponskill */
    virtual void OnWeaponSkillFinished(CWeaponSkillState&, action_t&);

    uint16 GetBattleTargetID();

protected:

    CTargetFind targetFind;
    uint16 m_battleTarget;
};

#endif
