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

#include "fellowentity.h"
#include "../mob_spell_container.h"
#include "../mob_spell_list.h"
#include "../packets/char_health.h"
#include "../packets/entity_update.h"
#include "../packets/fellow_sync.h"
#include "../ai/ai_container.h"
#include "../ai/controllers/fellow_controller.h"
#include "../ai/helpers/pathfind.h"
#include "../ai/helpers/targetfind.h"
#include "../ai/states/ability_state.h"
#include "../utils/battleutils.h"
#include "../utils/petutils.h"
#include "../utils/mobutils.h"
#include "../../common/utils.h"
#include "../mob_modifier.h"

CFellowEntity::CFellowEntity(CCharEntity* PChar)
{
    objtype = TYPE_FELLOW;
    m_EcoSystem = SYSTEM_HUMANOID;
    allegiance = ALLEGIANCE_PLAYER;
    m_MobSkillList = 0;
    PMaster = PChar;
    PAI = std::make_unique<CAIContainer>(this, std::make_unique<CPathFind>(this), std::make_unique<CFellowController>(PChar, this),
        std::make_unique<CTargetFind>(this));
}

CFellowEntity::~CFellowEntity()
{
}

void CFellowEntity::PostTick()
{
    CBattleEntity::PostTick();
    if (loc.zone && updatemask && status != STATUS_DISAPPEAR)
    {
        loc.zone->PushPacket(this, CHAR_INRANGE, new CEntityUpdatePacket(this, ENTITY_UPDATE, updatemask));
/*        if (PMaster && PMaster->PFellow == this)
        {
            ((CCharEntity*)PMaster)->pushPacket(new CFellowSyncPacket((CCharEntity*)PMaster, this));
        }
*/
        updatemask = 0;
    }
}

void CFellowEntity::FadeOut()
{
    CMobEntity::FadeOut();
    loc.zone->PushPacket(this, CHAR_INRANGE, new CEntityUpdatePacket(this, ENTITY_DESPAWN, UPDATE_NONE));
}

void CFellowEntity::Die()
{
    PAI->ClearStateStack();
    PAI->Internal_Die(0s);
    luautils::OnMobDeath(this, nullptr);
    CBattleEntity::Die();
    if (PMaster->objtype == TYPE_PC)
    {
        CCharEntity* PChar = (CCharEntity*)PMaster;
        PChar->RemoveFellow(this);
    }
}

void CFellowEntity::Spawn()
{
    //we need to skip CMobEntity's spawn because it calculates stats (and our stats are already calculated)

    CBattleEntity::Spawn();
    ((CCharEntity*)PMaster)->pushPacket(new CFellowSyncPacket((CCharEntity*)PMaster, this));
    luautils::OnMobSpawn(this);
}

bool CFellowEntity::ValidTarget(CBattleEntity* PInitiator, uint16 targetFlags)
{
    if (targetFlags & TARGET_PLAYER && PInitiator->allegiance == allegiance)
    {
        return false;
    }
    return CMobEntity::ValidTarget(PInitiator, targetFlags);
}