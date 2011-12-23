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
#include "charentity.h"
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
	int16 VE;						// Volatile Enmity
};

typedef std::map<uint32,EnmityObject_t*> EnmityList_t;


#define MAX_ENMITY_LEVEL 95

#define MAX_ENMITY_TYPE 2

class CBattleEntity;

class CEnmityContainer
{
public:

    CEnmityContainer();
   ~CEnmityContainer();

    CBattleEntity*	GetHighestEnmity();			// Decays VE and gets target with highest enmity

	void	Clear(uint32 EntityID = 0);			// Removes Entries from list
    void	AddBaseEnmity(CBattleEntity* PEntity);
	void	UpdateEnmity(CBattleEntity* PEntity, int16 CE, int16 VE);
	void	UpdateEnmityFromDamage(CBattleEntity* PEntity, uint16 Damage);
	void	UpdateEnmityFromCure(CBattleEntity* PEntity, uint16 level, uint16 CureAmount);
	void	UpdateEnmityFromAttack(CBattleEntity* PEntity,uint16 Damage);
	void	AddPartyEnmity(CCharEntity* PChar);

private:

	EnmityList_t	m_EnmityList;
};

#endif