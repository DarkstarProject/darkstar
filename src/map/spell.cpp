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

#include <string.h>

#include "map.h"
#include "spell.h"


CSpell::CSpell(uint16 id)
{
	m_ID = id;

	m_mpCost        = 0;
	m_castTime      = 0;
	m_recastTime    = 0;
	m_animation     = 0;
    m_animationTime = 0;
    m_skillType     = 0;
    m_zoneMisc      = 0;
    m_message       = 0;
    m_element       = 0;
	m_spellGroup    = SPELLGROUP_NONE;
	
	memset(m_job, 0, sizeof(m_job));
}
	
void CSpell::setID(uint16 id)
{
	m_ID = id;
}

uint16 CSpell::getID()
{
	return m_ID;
}

uint8 CSpell::getJob(JOBTYPE JobID)
{
	return (m_job[JobID] == CANNOT_USE_SPELL ? 255 : m_job[JobID]);
}

void CSpell::setJob(int8* jobs)
{
	memcpy(&m_job[1], jobs, 20);
}

uint32 CSpell::getCastTime()
{
	return m_castTime;
}

void CSpell::setCastTime(uint32 CastTime)
{
	m_castTime = CastTime;
}

uint32 CSpell::getRecastTime()
{
	return m_recastTime;
}

void CSpell::setRecastTime(uint32 RecastTime)
{
	m_recastTime = RecastTime;
}

const int8* CSpell::getName()
{
	return m_name.c_str();
}

void CSpell::setName(int8* name)
{
	m_name.clear();
	m_name.insert(0,name);
}

SPELLGROUP CSpell::getSpellGroup()
{
	return m_spellGroup;
}

void CSpell::setSpellGroup(SPELLGROUP SpellGroup)
{
	m_spellGroup = SpellGroup;
}

uint8 CSpell::getSkillType()
{
    return m_skillType;
}

void CSpell::setSkillType(uint8 SkillType)
{
    m_skillType = SkillType;
}

uint16 CSpell::getZoneMisc()
{
    return m_zoneMisc;
}

void CSpell::setZoneMisc(uint16 Misc)
{
    m_zoneMisc = Misc;
}

uint16 CSpell::getAnimationID()
{
	return m_animation;
}

void CSpell::setAnimationID(uint16 AnimationID)
{
	m_animation = AnimationID;
}

uint16 CSpell::getAnimationTime()
{
    return m_animationTime;
}

void CSpell::setAnimationTime(uint16 AnimationTime)
{
    m_animationTime = AnimationTime;
}

uint16 CSpell::getMPCost()
{
	return m_mpCost;
}

void CSpell::setMPCost(uint16 MP)
{
	m_mpCost = MP;
}

bool CSpell::isAOE()
{
	return m_isAOE;
}

void CSpell::setAOE(uint8 AOE)
{
	m_isAOE = (AOE != 0);
}

uint16 CSpell::getBase()
{
	return m_base;
}

void CSpell::setBase(uint16 base)
{
	m_base = base;
}

uint8 CSpell::getValidTarget()
{
	return m_ValidTarget;
}

void CSpell::setValidTarget(uint8 ValidTarget)
{
	m_ValidTarget = ValidTarget;
}

float CSpell::getMultiplier()
{
	return m_multiplier;
}

void CSpell::setMultiplier(float multiplier)
{
	m_multiplier = multiplier;
}

uint16 CSpell::getMessage()
{
    return m_message;
}

void CSpell::setMessage(uint16 message)
{
    m_message = message;
}

uint16 CSpell::getElement()
{
	return m_element;
}

void CSpell::setElement(uint16 element)
{
	m_element = element;
}

void CSpell::setCE(uint16 ce)
{
	m_CE = ce;
}

uint16 CSpell::getCE()
{
	return m_CE;
}

void CSpell::setVE(uint16 ve)
{
	m_VE = ve;
}

uint16 CSpell::getVE()
{
	return m_VE;
}

/************************************************************************
*                                                                       *
*  Реализация namespase для работы с заклинаниями                       *
*                                                                       *
************************************************************************/

namespace spell
{
    CSpell* PSpellList[MAX_SPELL_ID]; // список заклинаний

    /************************************************************************
    *                                                                       *
    *  Загружаем список заклинаний                                          *
    *                                                                       *
    ************************************************************************/

    void LoadSpellList()
    {
	    memset(PSpellList, 0, sizeof(PSpellList));

	    const int8* Query = "SELECT spellid, name, jobs, `group`, validTargets, skill, castTime, recastTime, animation, animationTime, mpCost, \
					         isAOE, base, element, zonemisc, multiplier, message, CE, VE \
							 FROM spell_list \
							 WHERE spellid < %u;";

	    int32 ret = Sql_Query(SqlHandle, Query, MAX_SPELL_ID);

	    if( ret != SQL_ERROR && Sql_NumRows(SqlHandle) != 0)
	    {
		    while(Sql_NextRow(SqlHandle) == SQL_SUCCESS) 
		    {
			    CSpell* PSpell = new CSpell(Sql_GetIntData(SqlHandle,0));

			    PSpell->setName(Sql_GetData(SqlHandle,1));
			    PSpell->setJob(Sql_GetData(SqlHandle,2));
			    PSpell->setSpellGroup((SPELLGROUP)Sql_GetIntData(SqlHandle,3));
			    PSpell->setValidTarget(Sql_GetIntData(SqlHandle,4));
                PSpell->setSkillType(Sql_GetIntData(SqlHandle,5));
			    PSpell->setCastTime(Sql_GetIntData(SqlHandle,6));
			    PSpell->setRecastTime(Sql_GetIntData(SqlHandle,7));
			    PSpell->setAnimationID(Sql_GetIntData(SqlHandle,8));
                PSpell->setAnimationTime(Sql_GetIntData(SqlHandle,9));
			    PSpell->setMPCost(Sql_GetIntData(SqlHandle,10));
			    PSpell->setAOE(Sql_GetIntData(SqlHandle,11));
			    PSpell->setBase(Sql_GetIntData(SqlHandle,12)); 
			    PSpell->setElement(Sql_GetIntData(SqlHandle,13));
                PSpell->setZoneMisc(Sql_GetIntData(SqlHandle,14));
			    PSpell->setMultiplier(Sql_GetIntData(SqlHandle,15)); 
                PSpell->setMessage(Sql_GetIntData(SqlHandle,16)); 
			    PSpell->setCE(Sql_GetIntData(SqlHandle,17));
			    PSpell->setVE(Sql_GetIntData(SqlHandle,18));

			    PSpellList[PSpell->getID()] = PSpell;
		    }
	    }
    }

    /************************************************************************
    *                                                                       *
    *  Get Spell By ID                                                      *
    *                                                                       *
    ************************************************************************/

    CSpell* GetSpell(uint16 SpellID)
    {
	    if (SpellID < MAX_SPELL_ID)
	    {
		    return PSpellList[SpellID];
	    }
	    ShowFatalError(CL_RED"SpellID <%u> out of range\n"CL_RESET, SpellID);
	    return NULL;
    }

    /************************************************************************
    *                                                                       *
    *  Check If user can cast spell                                         *
    *                                                                       *
    ************************************************************************/

    bool CanUseSpell(CBattleEntity* PCaster, uint16 SpellID)
    {
	    if (GetSpell(SpellID) != NULL)
	    {
		    uint8 JobMLVL = PSpellList[SpellID]->getJob(PCaster->GetMJob());
		    uint8 JobSLVL = PSpellList[SpellID]->getJob(PCaster->GetSJob());

		    return (PCaster->GetMLevel() >= JobMLVL || PCaster->GetSLevel() >= JobSLVL);
	    }
	    return false;
    }
};
