/*
===========================================================================

Copyright (c) 2018 Darkstar Dev Teams

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

#include "trust_controller.h"

#include "../ai_container.h"
#include "../../status_effect_container.h"
#include "../../enmity_container.h"
#include "../../ai/states/despawn_state.h"
#include "../../entities/charentity.h"
#include "../../entities/trustentity.h"
#include "../../packets/char.h"
#include "../../../common/utils.h"
#include "../../lua/lua_baseentity.h"

CTrustController::CTrustController(CCharEntity* PChar, CTrustEntity* PTrust) : CController(PTrust)
{
    POwner->PAI->PathFind = std::make_unique<CPathFind>(PTrust);
}

CTrustController::~CTrustController()
{
    if (POwner->PAI->IsEngaged())
    {
        POwner->PAI->Internal_Disengage();
    }
    POwner->PAI->PathFind.reset();
    POwner->allegiance = ALLEGIANCE_PLAYER;
}

void CTrustController::Despawn()
{
    if (POwner->PMaster)
    {
        POwner->PMaster = nullptr;
        POwner->PAI->Internal_Despawn();
    }
    //CController::Despawn();
}

void CTrustController::Tick(time_point tick)
{
    m_Tick = tick;

    if (!POwner->PMaster)
        return;

    if (POwner->PAI->IsEngaged())
    {
        auto PTarget{ POwner->GetBattleTarget() };

        if (PTarget)
        {
            auto PMob = static_cast<CMobEntity*>(PTarget);

            if (PMob->PEnmityContainer->GetHighestEnmity() != nullptr)
            {
                if (PMob->PEnmityContainer->HasID(POwner->PMaster->id))
                {
                    DoCombatTick(tick);
                }
                else if (!POwner->isDead())
                {
                    DoRoamTick(tick);
                }
            }
        }
    }
    else if (!POwner->isDead())
    {
        DoRoamTick(tick);
    }
}

void CTrustController::DoCombatTick(time_point tick)
{
    if (!POwner->PMaster->PAI->IsEngaged())
    {
        POwner->PAI->Internal_Disengage();
    }

    if (POwner->PMaster->GetBattleTargetID() != POwner->GetBattleTargetID())
    {
        POwner->PAI->Internal_ChangeTarget(POwner->PMaster->GetBattleTargetID());
    }

    auto PTarget{ POwner->GetBattleTarget() };

    if (PTarget)
    {
        if (POwner->PAI->CanFollowPath())
        {
            POwner->PAI->PathFind->LookAt(PTarget->loc.p);
            std::unique_ptr<CBasicPacket> err;
            if (!POwner->CanAttack(PTarget, err))
            {
                if (POwner->speed > 0)
                {
                    POwner->PAI->PathFind->PathAround(PTarget->loc.p, 2.0f, PATHFLAG_WALLHACK | PATHFLAG_RUN);
                    POwner->PAI->PathFind->FollowPath();
                }
            }
        }
    }
}

void CTrustController::DoRoamTick(time_point tick)
{
    if (POwner->PMaster->PAI->IsEngaged())
    {
        POwner->PAI->Internal_Engage(POwner->PMaster->GetBattleTargetID());
    }

    auto master = static_cast<CCharEntity*>(POwner->PMaster);
    auto PTrust = static_cast<CTrustEntity*>(POwner);
    uint8 currentPartyPos = master->TrustPartyPosition(PTrust);
    float currentDistance = 0;

    if (currentPartyPos == 0)
    {
        currentDistance = distance(POwner->loc.p, POwner->PMaster->loc.p);

        if (currentDistance > RoamDistance)
        {
            if (currentDistance < 35.0f && PTrust->PAI->PathFind->PathTo(POwner->PMaster->loc.p, PATHFLAG_RUN | PATHFLAG_WALLHACK))
            {
                PTrust->PAI->PathFind->FollowPath();
            }
            else if (POwner->GetSpeed() > 0)
            {
                PTrust->PAI->PathFind->WarpTo(POwner->PMaster->loc.p, RoamDistance);
            }
        }
    }
    else if(currentPartyPos > 0)
    {
        CBattleEntity* PFollow = (CBattleEntity*)master->PTrusts.at(currentPartyPos - 1);
        currentDistance = distance(PTrust->loc.p, PFollow->loc.p);

        if (currentDistance > 2.0f)
        {
            if (currentDistance < 35.0f && PTrust->PAI->PathFind->PathTo(PFollow->loc.p, PATHFLAG_RUN | PATHFLAG_WALLHACK))
            {
                PTrust->PAI->PathFind->FollowPath();
            }
            else if (POwner->GetSpeed() > 0)
            {
                PTrust->PAI->PathFind->WarpTo(PFollow->loc.p, RoamDistance);
            }
        }
    }
}
