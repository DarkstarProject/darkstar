/*
===========================================================================

  Copyright (c) 2010-2012 Darkstar Dev Teams

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

#include "battleentity.h"
#include "charentity.h"
#include "packets/action.h"
#include "alliance.h"
#include <math.h>

#include "packets/action.h"

#include "targetfinder.h"

CTargetFinder::CTargetFinder(CBattleEntity* PBattleEntity)
{
  m_PBattleEntity = PBattleEntity;
  m_radius = 0.0f;
  m_zone = 0;
  m_PRadiusAround = NULL;
  m_PTarget = NULL;
  m_PMasterTarget = NULL;
  m_PAction = NULL;
}

void CTargetFinder::reset(apAction_t* PAction)
{
  m_PAction = PAction;
  m_PBattleEntity->m_ActionList.clear();
  m_radius = 0.0f;
  m_zone = 0;
  m_PRadiusAround = NULL;
  m_PTarget = NULL;
  m_PMasterTarget = NULL;
}

void CTargetFinder::findWithinArea(CBattleEntity* PTarget, AOERADIUS radiusType, float radius)
{
  m_radius = radius;
  m_zone = m_PBattleEntity->getZone();

  if(radiusType == AOERADIUS_ATTACKER){
    m_PRadiusAround = m_PBattleEntity->loc.p;
  } else {
    // radius around target
    m_PRadiusAround = PTarget->loc.p;
  }


  // get master to properly handle loops
  m_PMasterTarget = findMaster(PTarget);

  // no not include pets if this AoE is a buff spell
  // this is a buff because i'm targetting my self
  bool withPet = PETS_CAN_AOE_BUFF || (m_PMasterTarget->objtype != m_PBattleEntity->objtype);

  // always add original target first
  addEntity(PTarget, false); // pet will be added later

  m_PTarget = PTarget;

  if(isPlayer()){
    // handle this as a player

    if(m_PMasterTarget->objtype == TYPE_MOB)
    {
      // special case to add all mobs in range
      addAllInMobList(m_PMasterTarget, withPet);

    } else {

      // players will never need to add whole alliance

      if(m_PMasterTarget->PParty != NULL)
      {
        // add party members
        addAllInParty(m_PMasterTarget, withPet);
      } else {
        // just add myself
        addEntity(m_PMasterTarget, withPet);
      }
    }

  } else {

    // handle this as a mob
    if(m_PMasterTarget->PParty != NULL)
    {
      if(m_PMasterTarget->PParty->m_PAlliance != NULL)
      {
        addAllInAlliance(m_PMasterTarget, withPet);
      } else {
        // all party instead
        addAllInParty(m_PMasterTarget, withPet);
      }
    }

  }

}

void CTargetFinder::findWithinCone(CBattleEntity* PTarget, float radius)
{

}

void CTargetFinder::addAllInMobList(CBattleEntity* PTarget, bool withPet)
{
  CCharEntity* PChar = (CCharEntity*)m_PBattleEntity;

  for (SpawnIDList_t::const_iterator it = PChar->SpawnMOBList.begin();  it != PChar->SpawnMOBList.end(); ++it)
  {

    addEntity((CBattleEntity*)it->second, withPet);

  }
}

void CTargetFinder::addAllInAlliance(CBattleEntity* PTarget, bool withPet)
{
  uint8 parties = PTarget->PParty->m_PAlliance->partyList.size();
  uint8 partySize = 0;
  CParty* party = NULL;

  for(uint8 i = 0; i < parties; i++)
  {
    party = PTarget->PParty->m_PAlliance->partyList.at(i);

    partySize = party->members.size();

    for(uint8 p = 0; p < partySize; p++)
    {

      addEntity(party->members.at(p), withPet);

    }
  }
}

void CTargetFinder::addAllInParty(CBattleEntity* PTarget, bool withPet)
{

  CParty* party = PTarget->PParty;

  uint8 partySize = party->members.size();

  ShowDebug("Adding all in party size: %d\n", partySize);

  for(uint8 p = 0; p < partySize; p++)
  {

    addEntity(party->members.at(p), withPet);

  }

}

void CTargetFinder::addEntity(CBattleEntity* PTarget, bool withPet)
{
  if(validEntity(PTarget)){

    m_PAction->ActionTarget = PTarget;

    m_PBattleEntity->m_ActionList.push_back(*m_PAction);
  }

  // add my pet too, if its allowed
  if(withPet && PTarget->PPet != NULL && validEntity(PTarget->PPet))
  {
    m_PAction->ActionTarget = PTarget->PPet;
    m_PBattleEntity->m_ActionList.push_back(*m_PAction);
  }

}

CBattleEntity* CTargetFinder::findMaster(CBattleEntity* PTarget)
{
  if(PTarget->objtype == TYPE_PET || PTarget->objtype == TYPE_MOB)
  {
    if(PTarget->PMaster != NULL){
      return PTarget->PMaster;
    }
  }
  return PTarget;
}

bool CTargetFinder::validEntity(CBattleEntity* PTarget)
{
  // I was already added first
  if(PTarget == m_PTarget) return false;

  // make sure i'm not over limit
  if(m_PBattleEntity->m_ActionList.size() > MAX_AOE_TARGETS) return false;

  if (PTarget->isDead() || PTarget->getZone() != m_zone || distance(*m_PRadiusAround, PTarget->loc.p) > m_radius)
  {
    return false;
  }

  return true;
}

bool CTargetFinder::isPlayer()
{
  if(m_PBattleEntity->objtype == TYPE_PC) return true;

  // check if i'm owned by a pc
  return m_PBattleEntity->PMaster != NULL && m_PBattleEntity->PMaster->objtype;
}
