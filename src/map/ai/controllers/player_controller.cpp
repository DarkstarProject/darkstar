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
    CController(_PChar),
    m_LastActionTime(server_clock::now())
{

}

void CPlayerController::Cast(uint16 targid, uint16 spellid)
{
    auto PChar = static_cast<CCharEntity*>(POwner);
    if (m_LastActionTime + g_GCD < server_clock::now())
    {
        CController::Cast(targid, spellid);
        m_LastActionTime = server_clock::now();

        if (POwner)
        {
            auto state = POwner->PAIBattle()->GetCurrentState();

            if (state && state->HasErrorMsg())
            {
                static_cast<CCharEntity*>(POwner)->pushPacket(state->GetErrorMsg());
            }
        }
    }
    else
    {
        PChar->pushPacket(new CMessageBasicPacket(PChar, PChar, 0, 0, MSGBASIC_WAIT_LONGER));
    }
}

void CPlayerController::Engage(uint16 targid)
{
    //#TODO: check gcd/engage delay
    //#TODO: pet engage/disengage
    std::unique_ptr<CMessageBasicPacket> errMsg;
    auto PChar = static_cast<CCharEntity*>(POwner);
    auto PTarget = PChar->PAIBattle()->IsValidTarget(targid, TARGET_ENEMY, errMsg);

    if (PTarget)
    {
        if (distance(PChar->loc.p, PTarget->loc.p) < 30)
        {
            CController::Engage(targid);
        }
        else
        {
            errMsg = std::make_unique<CMessageBasicPacket>(PChar, PTarget, 0, 0, MSGBASIC_TOO_FAR_AWAY);
        }
    }
    if (errMsg)
    {
        PChar->pushPacket(errMsg.release());
    }
}

void CPlayerController::ChangeTarget(uint16 targid)
{
    CController::ChangeTarget(targid);
}

void CPlayerController::Disengage()
{
    CController::Disengage();


}
