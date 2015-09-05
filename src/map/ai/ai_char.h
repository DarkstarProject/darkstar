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

#ifndef _AICHAR_H
#define _AICHAR_H

#include "ai_battle.h"

class CAIChar : public CAIBattle
{
public:
    CAIChar(CBattleEntity*);

    virtual bool Cast(uint16 targetid, uint16 spellid) override;

protected:

    /* Attacking functions */
    virtual bool Engage(uint16 targid) override;
    virtual void Disengage() override;
    virtual bool Attack(action_t&) override;
    virtual void ChangeTarget(bool changed, CBattleEntity* PNewTarget) override;

    /* Casting functions */
    virtual void CastFinished(action_t&) override;
    virtual void CastInterrupted(action_t&, MSGBASIC_ID) override;

    time_point m_errMsgTime;
};

#endif