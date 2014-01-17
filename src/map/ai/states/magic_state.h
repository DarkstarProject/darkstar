/*
===========================================================================

  Copyright (c) 2010-2014 Darkstar Dev Teams

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

#ifndef _CMAGIC_STATE_H
#define _CMAGIC_STATE_H

#include "state.h"

class CSpell;
struct apAction_t;

enum MAGICFLAGS {
  MAGICFLAGS_NONE = 0,
  MAGICFLAGS_IGNORE_MP = 1,
  MAGICFLAGS_IGNORE_TOOLS = 2
};

class CMagicState : public CState
{
  public:
    CMagicState(CBattleEntity* PEntity, CTargetFind* PTargetFind, float maxStartDistance = 26.8f, float maxFinishDistance = 28.5f);

    // can cast any magic
    // TODO:
    bool CanCast();

    bool CanCastSpell(CSpell* PSpell, CBattleEntity* PTarget, uint8 flags = MAGICFLAGS_NONE);

    STATESTATUS CastSpell(CSpell* PSpell, CBattleEntity* PTarget, uint8 flags = MAGICFLAGS_NONE);

    void InterruptSpell();
    void FinishSpell();

    virtual STATESTATUS Update(uint32 tick);
    virtual void Clear();

    // force spell interrupt
    void ForceInterrupt();
    bool IsInterrupted();
    CSpell* GetSpell();

    bool TryHitInterrupt(CBattleEntity* PAttacker);
    bool IsCasting();

    uint32 CalculateCastTime(CSpell* PSpell);
    int16 CalculateMPCost(CSpell* PSpell);
    uint32 CalculateRecastTime(CSpell* PSpell);

    bool m_enableCasting;
    float m_maxStartDistance;
    float m_maxFinishDistance;

    void SpendCost(CSpell* PSpell);
    void SetRecast(CSpell* PSpell);
    int16 ConserveMP(int16 cost);

  private:
    CSpell* m_PSpell;
    uint32 m_startTime;
    uint32 m_castTime;

    void ErrorMessage(MSGBASIC_ID msgID);

    bool m_interruptSpell;

    // handle char stuff after casting magic
    void CharOnTarget(apAction_t* action, int16 ce, int16 ve);
    void CharAfterFinish();

    bool CheckInterrupt();
    bool ValidCast(CSpell* PSpell, CBattleEntity* PTarget);
    bool ValidCharCast(CSpell* PSpell);
};

#endif