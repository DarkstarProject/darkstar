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
#include "states/state.h"
#include "../packets/message_basic.h"

class CBattleEntity;
class CSpell;
struct action_t;

class CAIBattle : public CAIBase
{
public:
    CAIBattle(CBattleEntity*, std::unique_ptr<CPathFind>&&);

    virtual bool Engage(uint16 targetid);
    virtual bool Cast(uint16 targetid, uint16 spellid);
    virtual void TryHitInterrupt(CBattleEntity* PAttacker);

    /* State finish functions */
    /* Auto attack */
    virtual void Attack(action_t&);
    /* Casting */
    virtual void CastFinished(action_t&);
    virtual void CastInterrupted(action_t&, MSGBASIC_ID msg);

protected:

    CTargetFind targetFind;
    CBattleEntity* PBattleTarget;

    //global cooldown
    time_point m_LastActionTime;
};

#endif
