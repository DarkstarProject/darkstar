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

#include "player_controller.h"

#include "../../entities/charentity.h"
#include "../../packets/char_update.h"

CPlayerController::CPlayerController(CCharEntity* _PChar) :
    CController(_PChar)
{

}

void CPlayerController::Cast(uint16 targid, uint16 spellid)
{
    //#TODO: check gcd here
    CController::Cast(targid, spellid);

    if (POwner)
    {
        auto state = POwner->PAIBattle()->GetCurrentState();

        if (state && state->HasErrorMsg())
        {
            static_cast<CCharEntity*>(POwner)->pushPacket(state->GetErrorMsg());
        }
    }
}

void CPlayerController::Engage(uint16 targid)
{
    CController::Engage(targid);
}

void CPlayerController::ChangeTarget(uint16 targid)
{
    CController::ChangeTarget(targid);
}

void CPlayerController::Disengage()
{
    CController::Disengage();


}
