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

#include "targetfind.h"

#include "../../entities/charentity.h"
#include "../../entities/mobentity.h"
#include "../../packets/action.h"
#include "../../alliance.h"
#include <math.h>
#include "../../../common/mmo.h"
#include "../../utils/zoneutils.h"
#include "../../enmity_container.h"

#include "../../packets/action.h"

CTargetFind::CTargetFind(CBattleEntity* PBattleEntity)
{
    m_PBattleEntity = PBattleEntity;

    reset();
}

void CTargetFind::reset()
{
    m_findType = FIND_NONE;
    m_targets.clear();
    m_conal = false;
    m_radius = 0.0f;
    m_zone = 0;
    m_findFlags = FINDFLAGS_NONE;

    m_APoint = nullptr;
    m_PRadiusAround = nullptr;
    m_PTarget = nullptr;
    m_PMasterTarget = nullptr;
}

void CTargetFind::findSingleTarget(CBattleEntity* PTarget, uint8 flags)
{
    m_findFlags = flags;
    m_zone = m_PBattleEntity->getZone();
    m_PTarget = nullptr;
    m_PRadiusAround = &PTarget->loc.p;

    addEntity(PTarget, false);
}

void CTargetFind::findWithinArea(CBattleEntity* PTarget, AOERADIUS radiusType, float radius, uint8 flags)
{
    m_findFlags = flags;
    m_radius = radius;
    m_zone = m_PBattleEntity->getZone();

    if (radiusType == AOERADIUS_ATTACKER){
        m_PRadiusAround = &m_PBattleEntity->loc.p;
    }
    else {
        // radius around target
        m_PRadiusAround = &PTarget->loc.p;
    }

    // get master to properly handle loops
    m_PMasterTarget = findMaster(PTarget);

    // no not include pets if this AoE is a buff spell
    // this is a buff because i'm targetting my self
    bool withPet = PETS_CAN_AOE_BUFF || (m_findFlags & FINDFLAGS_PET) || (m_PMasterTarget->objtype != m_PBattleEntity->objtype);

    // always add original target first
    addEntity(PTarget, false); // pet will be added later

    m_PTarget = PTarget;
    isPlayer = checkIsPlayer(m_PBattleEntity);

    if (isPlayer){
        // handle this as a player

        if (m_PMasterTarget->objtype == TYPE_PC)
        {

            // players will never need to add whole alliance
            m_findType = FIND_PLAYER_PLAYER;

            if (m_PMasterTarget->PParty != nullptr)
            {
                // player -ra spells should never hit whole alliance
                if ((m_findFlags & FINDFLAGS_ALLIANCE) && m_PMasterTarget->PParty->m_PAlliance != nullptr)
                {
                    addAllInAlliance(m_PMasterTarget, withPet);
                }
                else
                {
                    // add party members
                    addAllInParty(m_PMasterTarget, withPet);
                }
            }
            else {
                // just add myself
                addEntity(m_PMasterTarget, withPet);
            }

        }
        else {
            m_findType = FIND_PLAYER_MONSTER;
            // special case to add all mobs in range
            addAllInMobList(m_PMasterTarget, false);
        }

    }
    else {
        // handle this as a mob

        if (m_PMasterTarget->objtype == TYPE_PC || m_PBattleEntity->allegiance == ALLEGIANCE_PLAYER){
            m_findType = FIND_MONSTER_PLAYER;
        }
        else {
            m_findType = FIND_MONSTER_MONSTER;
        }

        // do not include pets in monster AoE buffs
        if (m_findType == FIND_MONSTER_MONSTER && m_PTarget->PMaster == nullptr)
        {
            withPet = PETS_CAN_AOE_BUFF;
        }

        if (m_findFlags & FINDFLAGS_HIT_ALL)
        {
            addAllInZone(m_PMasterTarget, withPet);
        }
        else
        {
            addAllInAlliance(m_PMasterTarget, withPet);

            // Is the monster casting on a player..
			if (m_findType == FIND_MONSTER_PLAYER)
			{
				if (m_PBattleEntity->allegiance == ALLEGIANCE_PLAYER)
					addAllInZone(m_PMasterTarget, withPet);
				else
					addAllInEnmityList();
			}
        }
    }
}

void CTargetFind::findWithinCone(CBattleEntity* PTarget, float distance, float angle, uint8 flags)
{
    m_findFlags = flags;
    m_conal = true;

    // TODO: a point should be based on targets position
    m_APoint = &m_PBattleEntity->loc.p;

    float halfAngle = (angle * (256.0f / 360.0f)) / 2.0f;

    float rightAngle = rotationToRadian(m_APoint->rotation + halfAngle);
    float leftAngle = rotationToRadian(m_APoint->rotation - halfAngle);

    // calculate end points for triangle
    m_BPoint.x = cosf((2 * M_PI) - rightAngle) * distance + m_APoint->x;
    m_BPoint.z = sinf((2 * M_PI) - rightAngle) * distance + m_APoint->z;

    m_CPoint.x = cosf((2 * M_PI) - leftAngle) * distance + m_APoint->x;
    m_CPoint.z = sinf((2 * M_PI) - leftAngle) * distance + m_APoint->z;

    // ShowDebug("angle %f, rotation %f, distance %f, A (%f, %f) B (%f, %f) C (%f, %f)\n", angle, rightAngle, distance, m_APoint->x, m_APoint->z, m_BPoint.x, m_BPoint.z, m_CPoint.x, m_CPoint.z);
    // ShowDebug("Target: (%f, %f)\n", PTarget->loc.p.x, PTarget->loc.p.z);

    // precompute for next stage
    m_BPoint.x = m_BPoint.x - m_APoint->x;
    m_BPoint.z = m_BPoint.z - m_APoint->z;

    m_CPoint.x = m_CPoint.x - m_APoint->x;
    m_CPoint.z = m_CPoint.z - m_APoint->z;

    // calculate scalar
    m_scalar = (m_BPoint.x * m_CPoint.z) - (m_BPoint.z * m_CPoint.x);

    findWithinArea(PTarget, AOERADIUS_ATTACKER, distance);
}

void CTargetFind::addAllInMobList(CBattleEntity* PTarget, bool withPet)
{
    CCharEntity* PChar = (CCharEntity*)findMaster(m_PBattleEntity);
    CBattleEntity* PBattleTarget = nullptr;

    for (SpawnIDList_t::const_iterator it = PChar->SpawnMOBList.begin(); it != PChar->SpawnMOBList.end(); ++it)
    {

        PBattleTarget = (CBattleEntity*)it->second;

        if (PBattleTarget && isMobOwner(PBattleTarget)){
            addEntity(PBattleTarget, withPet);
        }

    }
}

void CTargetFind::addAllInZone(CBattleEntity* PTarget, bool withPet)
{
	zoneutils::GetZone(PTarget->getZone())->ForEachCharInstance(PTarget, [&](CCharEntity* PChar){
		if (PChar){
			addEntity(PChar, withPet);
		}
	});
	zoneutils::GetZone(PTarget->getZone())->ForEachMobInstance(PTarget, [&](CMobEntity* PMob){
		if (PMob){
			addEntity(PMob, withPet);
		}
	});
}

void CTargetFind::addAllInAlliance(CBattleEntity* PTarget, bool withPet)
{
    CParty* party = nullptr;

    PTarget->ForAlliance([this, withPet](CBattleEntity* PMember)
    {
        addEntity(PMember, withPet);
    });
}

void CTargetFind::addAllInParty(CBattleEntity* PTarget, bool withPet)
{

    PTarget->ForParty([this, withPet](CBattleEntity* PMember)
    {
        addEntity(PMember, withPet);
    });

}

void CTargetFind::addAllInEnmityList()
{
    if (m_PBattleEntity->objtype == TYPE_MOB)
    {
        CMobEntity* mob = (CMobEntity*)m_PBattleEntity;
        EnmityList_t* enmityList = mob->PEnmityContainer->GetEnmityList();

        for (EnmityList_t::iterator it = enmityList->begin(); it != enmityList->end(); ++it)
        {
            EnmityObject_t* PEnmityObject = it->second;
			addEntity(PEnmityObject->PEnmityOwner, false);
        }
    }
}

void CTargetFind::addEntity(CBattleEntity* PTarget, bool withPet)
{
    if (validEntity(PTarget)){
        m_targets.push_back(PTarget);
    }

    // add my pet too, if its allowed
    if (withPet && PTarget->PPet != nullptr && validEntity(PTarget->PPet))
    {
        m_targets.push_back(PTarget->PPet);
    }

}

CBattleEntity* CTargetFind::findMaster(CBattleEntity* PTarget)
{
    if (PTarget->PMaster != nullptr){
        return PTarget->PMaster;
    }
    return PTarget;
}

bool CTargetFind::isMobOwner(CBattleEntity* PTarget)
{
    if (m_PBattleEntity->objtype != TYPE_PC || PTarget->objtype == TYPE_PC)
    {
        // always true for mobs, npcs, pets
        return true;
    }

    if (PTarget->m_OwnerID.id == 0 || PTarget->m_OwnerID.id == m_PBattleEntity->id)
    {
        return true;
    }

    bool found = false;

    m_PBattleEntity->ForAlliance([&found, &PTarget](CBattleEntity* PMember){
        if (PMember->id == PTarget->m_OwnerID.id)
        {
            found = true;
        }
    });

    return found;
}

/*
validEntity will check if the given entity can be targeted in the AoE.

*/
bool CTargetFind::validEntity(CBattleEntity* PTarget)
{
    if (std::find(m_targets.begin(), m_targets.end(), PTarget) != m_targets.end()) {
        return false;
    }
    if (!(m_findFlags & FINDFLAGS_DEAD) && PTarget->isDead())
    {
        return false;
    }

    if (m_PBattleEntity->StatusEffectContainer->GetConfrontationEffect() != PTarget->StatusEffectContainer->GetConfrontationEffect())
    {
        return false;
    }

    if (m_PTarget == PTarget || PTarget->getZone() != m_zone || PTarget->IsNameHidden())
    {
        return false;
    }

    // this is first target, always add him first
    if (m_PTarget == nullptr)
    {
        return true;
    }

	if (m_PTarget->allegiance != PTarget->allegiance)
	{
		return false;
	}

    // shouldn't add if target is charmed by the enemy
    if (PTarget->PMaster != nullptr)
    {
        if (m_findType == FIND_MONSTER_PLAYER){

            if (PTarget->PMaster->objtype == TYPE_MOB){
                return false;
            }

        }
        else if (m_findType == FIND_PLAYER_MONSTER){

            if (PTarget->PMaster->objtype == TYPE_PC){
                return false;
            }

        }
        else if (m_findType == FIND_MONSTER_MONSTER || m_findType == FIND_PLAYER_PLAYER){
            return false;
        }
    }

    // check placement
    // force first target to be added
    // this will be removed when conal targetting is polished
    if (m_conal)
    {
        if (isWithinCone(&PTarget->loc.p))
        {
            return true;
        }
    }
    else
    {
        if ((m_findFlags & FINDFLAGS_UNLIMITED) || isWithinArea(&PTarget->loc.p))
        {
            return true;
        }
    }

    return false;
}

bool CTargetFind::checkIsPlayer(CBattleEntity* PTarget)
{
    if (PTarget == nullptr) return false;
    if (PTarget->objtype == TYPE_PC) return true;

    // check if i'm owned by a pc
    return PTarget->PMaster != nullptr && PTarget->PMaster->objtype == TYPE_PC;
}

bool CTargetFind::isWithinArea(position_t* pos)
{
    return distance(*m_PRadiusAround, *pos) <= m_radius;
}

bool CTargetFind::isWithinCone(position_t* pos)
{
    position_t PPoint;

    // holds final weight
    position_t WPoint;

    // move origin to one vertex
    PPoint.x = pos->x - m_APoint->x;
    PPoint.z = pos->z - m_APoint->z;

    WPoint.x = (PPoint.x * (m_BPoint.z - m_CPoint.z) + PPoint.z * (m_CPoint.x - m_BPoint.x) + m_BPoint.x * m_CPoint.z - m_CPoint.x * m_BPoint.z) / m_scalar;

    WPoint.y = (PPoint.x * m_CPoint.z - PPoint.z * m_CPoint.x) / m_scalar;
    WPoint.z = (PPoint.z * m_BPoint.x - PPoint.x * m_BPoint.z) / m_scalar;

    // ShowDebug("A %f, B %f, C %f\n", WPoint.x, WPoint.y, WPoint.z);

    if (WPoint.x < 0 || WPoint.x > 1)
    {
        return false;
    }

    if (WPoint.y < 0 || WPoint.y > 1)
    {
        return false;
    }

    if (WPoint.z < 0 || WPoint.z > 1)
    {
        return false;
    }

    return true;
}

bool CTargetFind::isWithinRange(position_t* pos, float range)
{
    return distance(m_PBattleEntity->loc.p, *pos) <= range;
}

CBattleEntity* CTargetFind::getValidTarget(uint16 actionTargetID, uint8 validTargetFlags)
{

    DSP_DEBUG_BREAK_IF(actionTargetID == 0);

    CBattleEntity* PTarget = (CBattleEntity*)m_PBattleEntity->GetEntity(actionTargetID, TYPE_MOB | TYPE_PC | TYPE_PET);

    if (PTarget == nullptr)
    {
        return nullptr;
    }

    if (m_PBattleEntity->StatusEffectContainer->GetConfrontationEffect() != PTarget->StatusEffectContainer->GetConfrontationEffect())
    {
        return nullptr;
    }

    if (PTarget->objtype == TYPE_PC)
    {
        if ((validTargetFlags & TARGET_SELF) && PTarget->targid == m_PBattleEntity->targid)
        {
            return PTarget;
        }
        if (validTargetFlags & TARGET_PLAYER)
        {
            return PTarget;
        }
        if ((validTargetFlags & TARGET_PLAYER_PARTY) && (m_PBattleEntity->PParty != nullptr && m_PBattleEntity->PParty == PTarget->PParty))
        {
            return PTarget;
        }
        if ((validTargetFlags & TARGET_PLAYER_PARTY_PIANISSIMO) && (m_PBattleEntity->StatusEffectContainer->HasStatusEffect(EFFECT_PIANISSIMO)) &&
            (m_PBattleEntity->PParty != nullptr && m_PBattleEntity->PParty == PTarget->PParty))
        {
            return PTarget;
        }
        if ((validTargetFlags & TARGET_PLAYER_DEAD) && PTarget->isDead())
        {
            return PTarget;
        }
        return nullptr;
    }

	if (PTarget->objtype == TYPE_MOB)
	{
		if (validTargetFlags & TARGET_PLAYER_DEAD && ((CMobEntity*)PTarget)->m_Behaviour & BEHAVIOUR_RAISABLE
			&& PTarget->isDead())
		{
			return PTarget;
		}

        if (validTargetFlags & TARGET_NPC)
        {
            if (PTarget->allegiance == m_PBattleEntity->allegiance && (PTarget == m_PBattleEntity ||
                !(((CMobEntity*)PTarget)->m_Behaviour & BEHAVIOUR_NOHELP)))
            {
                return PTarget;
            }
        }
	}

    if (validTargetFlags & TARGET_ENEMY)
    {
        if (!PTarget->isDead())
        {
            if (PTarget->allegiance == (m_PBattleEntity->allegiance % 2 == 0 ? m_PBattleEntity->allegiance + 1 : m_PBattleEntity->allegiance - 1))
            {
                return PTarget;
            }
        }
    }

    return nullptr;
}
