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

#ifndef _PET_CONTROLLER_H
#define _PET_CONTROLLER_H

#include "ai_controller.h"

// mobs will deaggro if player is out of range for this long
#define MOB_DEAGGRO_TIME 25000

// time a mob is neutral after disengaging
#define MOB_NEUTRAL_TIME 10000

class CPetEntity;
class CPetController : public CAIController
{
public:
    CPetController(CPetEntity* PPet);

    static constexpr float PetRoamDistance {2.1f};
    virtual void DoRoamTick(time_point tick) override;
protected:
    bool PetIsHealing();

    virtual void HandleEnmity() override {}
    virtual bool TryDeaggro() override;
    virtual void TryLink() override {}

private:

    CPetEntity* const PPet;

};

#endif // _AI_CONTROLLER_H