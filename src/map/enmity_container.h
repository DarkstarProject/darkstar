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

#ifndef _CENMITYCONTAINER_H
#define _CENMITYCONTAINER_H




#include "../common/cbasetypes.h"

#include <map>


// PEntity, EntityID, CE (Cumulative Enmity), VE (Volatile Enmity)

// TE = CE + VE

// Max CE = 10000
// Max VE = 10000

// VE Decays -60VE/second

// сортировать список ненависти безсмысленно,
// достаточно два раза в секунду пробегаться по списку, уменьшая VE,
// и одновременно искать сущность с максимальным количеством TE.

// наверное хорошо бы иметь указатель на структуру с самой высокой TE, 
// чтобы избежать повторного перебора списка с целью уменьшения TE, когда монст атакует цель

struct EnmityObject_t
{
	CBattleEntity* PEnmityOwner;	// Enmity Target
	int16 CE;						// Cumulative Enmity
	uint16 VE;						// Volatile Enmity
};

typedef std::map<uint32,EnmityObject_t*> EnmityList_t;

#define MAX_ENMITY_LEVEL 95

#define MAX_ENMITY_TYPE 2

class CBattleEntity;

class CEnmityContainer
{
public:

	void	Clear(uint32 EntityID = 0);			// Removes Entries from list
	void	UpdateEnmity(EnmityObject_t*);		// Updates hate in list
	void	UpdateEnmity(CBattleEntity* PChar,uint16 CE, uint16 VE);
	void	AddBaseEnmity(CBattleEntity*);
	void	UpdateEnmityFromDamage(CBattleEntity* PChar,uint16 Damage);
	void	UpdateEnmityFromCure(CBattleEntity* PChar, uint16 level, uint16 CureAmount);
	void	UpdateEnmityFromAttack(CBattleEntity* PChar,uint16 Damage);

	CBattleEntity*	GetHighestEnmity();			// Decays VE and gets target with highest enmity
	
	CEnmityContainer();
   ~CEnmityContainer();
	
private:

	EnmityList_t	m_EnmityList;

};

#endif