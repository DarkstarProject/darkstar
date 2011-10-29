/*
===========================================================================

  Copyright (c) 2010-2011 Darkstar Dev Teams

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

CEnmityContainer::CEnmityContainer()
{

}

CEnmityContainer::~CEnmityContainer()
{
	Clear();
}

/************************************************************************
*																		*
*  Если параметр функции не равен нулю, то пытаемся удалить из списка	*
*  сущность с этим ID, иначе отчищаем весь список ненависти				*
*																		*
************************************************************************/

void CEnmityContainer::Clear(uint32 EntityID)
{
	if (EntityID == 0)
	{
		m_EnmityList.clear();
		return; 
	}
	
	for (EnmityList_t::iterator it = m_EnmityList.begin(); it != m_EnmityList.end(); ++it)
	{
		if (it->second->PEnmityOwner->id = EntityID)
		{
			delete it->second;
		}
	}
}

void CEnmityContainer::AddBaseEnmity(CBattleEntity* PChar)
{
	EnmityObject_t* enmity = new EnmityObject_t;
	enmity->CE = 1;
	enmity->VE = 1;
	enmity->PEnmityOwner = PChar;
	UpdateEnmity(enmity);
}

/************************************************************************
*																		*
*  Обновление или добавление ненависти к сущности						*
*																		*
************************************************************************/

void CEnmityContainer::UpdateEnmity(EnmityObject_t* PEnmityObject)
{
	// получилось не очень удачно с передачей указателя на объект
	// может лучше хранить структуру, а не указатель ?

	EnmityList_t::iterator PEnmity = m_EnmityList.lower_bound(PEnmityObject->PEnmityOwner->id);

	if( PEnmity != m_EnmityList.end() &&
	   !m_EnmityList.key_comp()(PEnmityObject->PEnmityOwner->id, PEnmity->first))
	{
		// не забыть про ограничение в 10.000 единиц
		
		if (0 > (int16)(PEnmity->second->CE + PEnmityObject->CE))
		{
			PEnmity->second->CE = 1;
		}
		else
		{
			PEnmity->second->CE += PEnmityObject->CE;
		}
		
		PEnmity->second->VE += PEnmityObject->VE;

		PEnmity->second->CE = (PEnmity->second->CE > 10000 ? 10000 : PEnmity->second->CE);
		PEnmity->second->VE = (PEnmity->second->VE > 10000 ? 10000 : PEnmity->second->VE);
				
		delete PEnmityObject;
	}else {
		m_EnmityList.insert(PEnmity, EnmityList_t::value_type(PEnmityObject->PEnmityOwner->id, PEnmityObject));
	}
}

void CEnmityContainer::UpdateEnmity(CBattleEntity* PChar,uint16 CE, uint16 VE)
{
	EnmityObject_t* enmity = new EnmityObject_t;
	enmity->CE = CE;
	enmity->VE = VE;
	enmity->PEnmityOwner = PChar; 
	UpdateEnmity(enmity);
}


void CEnmityContainer::UpdateEnmityFromCure(CBattleEntity* PChar, uint16 level, uint16 CureAmount)
{
	uint16 mod = battleutils::GetEnmityMod(level - 1, 1);
	uint16 ce = 40 / mod * CureAmount;
	uint16 ve = 240 / mod * CureAmount;
	UpdateEnmity(PChar,ce,ve); 

}

void CEnmityContainer::UpdateEnmityFromDamage(CBattleEntity* PChar, uint16 Damage)
{
	uint16 mod = battleutils::GetEnmityMod(PChar->GetMLevel() - 1, 2);
	uint16 ce = 80 / mod * Damage;
	uint16 ve = 240 / mod * Damage;
	UpdateEnmity(PChar,ce,ve); 

}

void CEnmityContainer::UpdateEnmityFromAttack(CBattleEntity* PChar, uint16 Damage)
{
	UpdateEnmity(PChar, -(1800 * Damage / PChar->health.maxhp), 0);
}

/************************************************************************
*																		*
*  Здесь мы обновляем VE всех сущностей и находим самую опасную цель	*
*																		*
************************************************************************/

CBattleEntity* CEnmityContainer::GetHighestEnmity()
{
	uint32 HighestEnmity = 0;
	//uint32 CE = 0;
	//uint32 VE = 0;

	CBattleEntity* PEntity = NULL;
	//ShowDebug(CL_BLUE"Getting highest enmity \n"CL_RESET);
	for (EnmityList_t::iterator it = m_EnmityList.begin(); it != m_EnmityList.end(); ++it)
	{
		EnmityObject_t* PEnmityObject = it->second;

		PEnmityObject->VE -= PEnmityObject->VE > 30 ? 30 : PEnmityObject->VE;

		uint32 Enmity = PEnmityObject->CE + PEnmityObject->VE;

		if (Enmity > HighestEnmity)
		{
			HighestEnmity = Enmity;
			PEntity = PEnmityObject->PEnmityOwner;
			//CE = PEnmityObject->CE; 
			//VE = PEnmityObject->VE; 
		}
	}
	//if (PEntity != NULL)
	//{
	//	ShowDebug(CL_GREEN"Highest Enmity: %s, CE: %u, VE: %u \n"CL_RESET,PEntity->GetName(),CE,VE);
	//}
	return PEntity;
}