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

#ifndef _AUTOMATONCONTROLLER_H
#define _AUTOMATONCONTROLLER_H

#include "pet_controller.h"

class CAutomatonEntity;

class CAutomatonController : public CPetController
{
public:
    CAutomatonController(CAutomatonEntity* PPet);

private:
    bool TrySpellcast();
    bool TryTPMove();
    bool TryRangedAttack();

    CAutomatonEntity* PAutomaton;

    time_point m_magicRecast;
    time_point m_magicEnfeebleRecast;
    time_point m_magicElementalRecast;
    time_point m_magicHealRecast;
    time_point m_magicEnhanceRecast;
    time_point m_magicStatusRecast;
    time_point m_LastRangedTime;

    duration m_rangedCooldown {duration::zero()};
    static constexpr int m_RangedAbility {1949};
protected:
    virtual void DoCombatTick(time_point tick) override;

};

#endif