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

#include <string.h>

#include "petentity.h"
#include "../mob_spell_container.h"
#include "../mob_spell_list.h"
#include "../packets/entity_update.h"
#include "../packets/pet_sync.h"


CPetEntity::CPetEntity(PETTYPE petType)
{
	objtype = TYPE_PET;
	m_PetType = petType;
	m_EcoSystem = SYSTEM_UNCLASSIFIED;
	allegiance = ALLEGIANCE_PLAYER;
        m_MobSkillList = 0;
}

CPetEntity::~CPetEntity()
{

}

PETTYPE CPetEntity::getPetType(){
  return m_PetType;
}

bool CPetEntity::isBstPet()
{
  return getPetType()==PETTYPE_JUG_PET || objtype == TYPE_MOB;
}

WYVERNTYPE CPetEntity::getWyvernType()
{
  DSP_DEBUG_BREAK_IF(PMaster == nullptr);

  switch(PMaster->GetSJob())
  {
    case JOB_BLM:
    case JOB_BLU:
    case JOB_SMN:
    case JOB_WHM:
    case JOB_RDM:
    case JOB_SCH:
    case JOB_GEO:
      return WYVERNTYPE_DEFENSIVE;
    case JOB_DRK:
    case JOB_PLD:
    case JOB_NIN:
    case JOB_BRD:
    case JOB_RUN:
      return WYVERNTYPE_MULTIPURPOSE;
    case JOB_WAR:
    case JOB_SAM:
    case JOB_THF:
    case JOB_BST:
    case JOB_RNG:
    case JOB_COR:
    case JOB_DNC:
      return WYVERNTYPE_OFFENSIVE;

    default:
      return WYVERNTYPE_OFFENSIVE;
  };
}

void CPetEntity::UpdateEntity()
{
    if (loc.zone && updatemask && status != STATUS_DISAPPEAR)
    {
        if (PMaster && PMaster->PPet == this)
        {
            ((CCharEntity*)PMaster)->pushPacket(new CPetSyncPacket((CCharEntity*)PMaster));
        }
        loc.zone->PushPacket(this, CHAR_INRANGE, new CEntityUpdatePacket(this, ENTITY_UPDATE, updatemask));
        updatemask = 0;
    }
}
