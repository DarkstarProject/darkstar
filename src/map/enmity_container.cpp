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

#include "../common/showmsg.h"
#include "../common/utils.h"

#include "battleentity.h"
#include "enmity_container.h"
#include "battleutils.h" 
#include "charentity.h"


/************************************************************************
*                                                                       *
*                                                                       *
*                                                                       *
************************************************************************/

CEnmityContainer::CEnmityContainer()
{

}

CEnmityContainer::~CEnmityContainer()
{
    Clear();
}

/************************************************************************
*                                                                       *
*  Clear Enmity List                                                    *
*                                                                       *
************************************************************************/

void CEnmityContainer::Clear(uint32 EntityID)
{
	if (EntityID == 0)
	{
        for (EnmityList_t::iterator it = m_EnmityList.begin(); it != m_EnmityList.end(); ++it)
	    {
            delete it->second;
	    }
		m_EnmityList.clear();
		return; 
	}
    else
    {
	    for (EnmityList_t::iterator it = m_EnmityList.begin(); it != m_EnmityList.end(); ++it)
	    {
		    if (it->second->PEnmityOwner->id == EntityID)
		    {
                delete it->second;
                m_EnmityList.erase(it);
                return;
		    }
	    }
    }
}

/************************************************************************
*                                                                       *
*  Минимальное (базовое) значение ненависти                             *
*                                                                       *
************************************************************************/

void CEnmityContainer::AddBaseEnmity(CBattleEntity* PChar)
{
    UpdateEnmity(PChar, 1, 1);
}

/************************************************************************
*                                                                       *
*  Add entity to hate list                                              *
*                                                                       *
************************************************************************/

void CEnmityContainer::UpdateEnmity(CBattleEntity* PEntity, int16 CE, int16 VE)
{
    EnmityList_t::iterator PEnmity = m_EnmityList.lower_bound(PEntity->id);

    if( PEnmity != m_EnmityList.end() && 
       !m_EnmityList.key_comp()(PEntity->id, PEnmity->first))
	{
        PEnmity->second->CE += CE; 
        PEnmity->second->VE += VE;

        //Check for cap limit 
        PEnmity->second->CE = cap_value(PEnmity->second->CE, 1, 10000);
        PEnmity->second->VE = cap_value(PEnmity->second->VE, 1, 10000);
    }
    else 
    {
        EnmityObject_t* PEnmityObject = new EnmityObject_t;

        PEnmityObject->CE = CE;
        PEnmityObject->VE = VE;
        PEnmityObject->PEnmityOwner = PEntity;

        m_EnmityList.insert(PEnmity, EnmityList_t::value_type(PEntity->id, PEnmityObject));
    }
}

/************************************************************************
*                                                                       *
*                                                                       *
*                                                                       *
************************************************************************/

void CEnmityContainer::AddPartyEnmity(CCharEntity* PChar)
{
    // TODO: добавляемые персонажи уже могут быть в списке enmity, я не уверен, что добавление базового значения здесь актуально

	if (PChar->PParty != NULL)
	{
		for (uint8 i = 0; i < PChar->PParty->members.size(); ++i)
        {
            CBattleEntity* PTarget = (CBattleEntity*)PChar->PParty->members[i];
            if (distance(PChar->loc.p, PTarget->loc.p) <= 40)
            {
                AddBaseEnmity(PTarget);
            }
        }
	}
}

/************************************************************************
*                                                                       *
*                                                                       *
*                                                                       *
************************************************************************/

void CEnmityContainer::UpdateEnmityFromCure(CBattleEntity* PEntity, uint16 level, uint16 CureAmount)
{
	CureAmount = (CureAmount < 1 ? 1 : CureAmount);

	uint16 mod = battleutils::GetEnmityMod(level, 0);

	uint16 CE =  40 / mod * CureAmount;
	uint16 VE = 240 / mod * CureAmount;

	UpdateEnmity(PEntity, CE, VE);
}

/************************************************************************
*                                                                       *
*                                                                       *
*                                                                       *
************************************************************************/

void CEnmityContainer::UpdateEnmityFromDamage(CBattleEntity* PEntity, uint16 Damage)
{
	Damage = (Damage < 1 ? 1 : Damage);

	uint16 mod = battleutils::GetEnmityMod(PEntity->GetMLevel(), 1);

	uint16 CE =  80 / mod * Damage;
	uint16 VE = 240 / mod * Damage;

	UpdateEnmity(PEntity, CE, VE); 
}

/************************************************************************
*                                                                       *
*                                                                       *
*                                                                       *
************************************************************************/

void CEnmityContainer::UpdateEnmityFromAttack(CBattleEntity* PEntity, uint16 Damage)
{
    UpdateEnmity(PEntity, -(1800 * Damage / PEntity->GetMaxHP()), 0);
}

/************************************************************************
*                                                                       *
*  Decay Enmity, Get Entity with the highest enmity                     *
*                                                                       *
************************************************************************/

CBattleEntity* CEnmityContainer::GetHighestEnmity()
{
	uint32 HighestEnmity = 0;
	
	CBattleEntity* PEntity = NULL;

	for (EnmityList_t::iterator it = m_EnmityList.begin(); it != m_EnmityList.end(); ++it)
	{
		EnmityObject_t* PEnmityObject = it->second;

		PEnmityObject->VE -= PEnmityObject->VE > 30 ? 30 : PEnmityObject->VE;

		uint32 Enmity = PEnmityObject->CE + PEnmityObject->VE;

		if (Enmity > HighestEnmity)
		{
			HighestEnmity = Enmity;
			PEntity = PEnmityObject->PEnmityOwner;
		}
	}
    return PEntity;
}
