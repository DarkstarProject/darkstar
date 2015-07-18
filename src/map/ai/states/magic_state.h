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

#ifndef _CMAGIC_STATE_H
#define _CMAGIC_STATE_H

#include "state.h"

class CSpell;

enum MAGICFLAGS {
  MAGICFLAGS_NONE = 0,
  MAGICFLAGS_IGNORE_MP = 1,
  MAGICFLAGS_IGNORE_TOOLS = 2
};

class CMagicState : public CState
{
public:
    CMagicState(CBattleEntity* PEntity, CTargetFind& PTargetFind);
    virtual STATESTATUS Update(time_point tick) override;
    virtual void Clear() override;
    virtual bool CanChangeState() override;

    int16 GetErrorMsg();
    CSpell* GetSpell();
    void Interrupt();

    //start spellcast on target
    STATESTATUS CastSpell(uint16 spellid, uint16 targetid, uint8 flags = 0);
protected:
    //check spell requirements vs. caster ("you cannot cast this spell")
    bool CanCastSpell();

    bool HasCost();

    bool HasMoved();

    uint16 m_errorMsg;
    CSpell* m_PSpell;
    duration m_castTime;
    position_t m_startPos;
    uint8 m_flags;
};

#endif