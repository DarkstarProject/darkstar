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

#include "controller.h"

#ifndef _PLAYERCONTROLLER_H
#define _PLAYERCONTROLLER_H

class CCharEntity;

class CPlayerController : public CController
{
public:
    CPlayerController(CCharEntity*);
    virtual ~CPlayerController() {}

    virtual void Tick(time_point) override;

    virtual void Cast(uint16 targid, uint16 spellid) override;
    virtual bool Engage(uint16 targid) override;
    virtual void ChangeTarget(uint16 targid) override;
    virtual void Disengage() override;
    virtual void WeaponSkill(uint16 targid, uint16 wsid) override;

    virtual void Ability(uint16 targid, uint16 abilityid) override;
    virtual void RangedAttack(uint16 targid);
    virtual void UseItem(uint16 targid, uint8 loc, uint8 slotid);

    void setLastAttackTime(time_point);
    void setNextRangedTime(time_point);
    void setLastErrMsgTime(time_point);
    time_point getLastErrMsgTime();

protected:
    time_point m_LastAttackTime {server_clock::now()};
    time_point m_NextRangedTime {server_clock::now()};
    time_point m_errMsgTime {server_clock::now()};
};

#endif // _PLAYERCONTROLLER