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
		for (EnmityList_t::iterator it = m_EnmityList.begin(); it != m_EnmityList.end(); ++it)
		{
			delete it->second;
		}
		m_EnmityList.clear();
	}
}

/************************************************************************
*																		*
*  Обновление или добавление ненависти к сущности						*
*																		*
************************************************************************/

void CEnmityContainer::UpdaeteEnmity(EnmityObject_t* PEnmityObject)
{
	// получилось не очень удачно с передачей указателя на объект
	// может лучше хранить структуру, а не указатель ?

	EnmityList_t::iterator PEnmity = m_EnmityList.lower_bound(PEnmityObject->PEnmityOwner->id);

	if( PEnmity != m_EnmityList.end() &&
	   !m_EnmityList.key_comp()(PEnmityObject->PEnmityOwner->id, PEnmity->first))
	{
		// не забыть про ограничение в 10.000 единиц

		PEnmity->second->CE += PEnmityObject->CE;
		PEnmity->second->VE += PEnmityObject->VE;

		delete PEnmityObject;
	}else {
		m_EnmityList.insert(PEnmity, EnmityList_t::value_type(PEnmityObject->PEnmityOwner->id, PEnmityObject));
	}
}

/************************************************************************
*																		*
*  Здесь мы обновляем VE всех сущностей и находим самую опасную цель	*
*																		*
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