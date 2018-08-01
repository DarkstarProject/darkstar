/*
===========================================================================

Copyright (c) 2010-2018 Darkstar Dev Teams

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

#include <string.h>

#include "../ai/ai_container.h"
#include "../ai/controllers/fellow_controller.h"
#include "../ai/helpers/pathfind.h"
#include "../ai/helpers/targetfind.h"
#include "../packets/char_health.h"
#include "../packets/entity_update.h"
#include "../packets/fellow_sync.h"
#include "../utils/battleutils.h"
#include "fellowentity.h"

CFellowEntity::CFellowEntity() : CPetEntity(PETTYPE_ADVENTURING_FELLOW)
{
    m_EcoSystem = SYSTEM_HUMANOID;
    allegiance = ALLEGIANCE_PLAYER;
    m_MobSkillList = 0;
    PAI = std::make_unique<CAIContainer>(this, std::make_unique<CPathFind>(this), std::make_unique<CFellowController>(this), std::make_unique<CTargetFind>(this));
}

void CFellowEntity::PostTick()
{
    CBattleEntity::PostTick();
    if (loc.zone && updatemask && status != STATUS_DISAPPEAR)
    {
        loc.zone->PushPacket(this, CHAR_INRANGE, new CEntityUpdatePacket(this, ENTITY_UPDATE, updatemask));
        if (auto PChar = dynamic_cast<CCharEntity*>(PMaster); PChar && PChar->PFellow == this)
        {
            PChar->pushPacket(new CFellowSyncPacket(PChar));
        }
        updatemask = 0;
    }
}

void CFellowEntity::Die()
{
    PAI->ClearStateStack();
    PAI->Internal_Die(0s);
    luautils::OnMobDeath(this, nullptr);
    CBattleEntity::Die();
    if (auto PChar = dynamic_cast<CCharEntity*>(PMaster); PChar && PChar->PFellow == this)
    {
        PChar->RemoveFellow();
    }
}
