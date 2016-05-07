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

#ifndef _CENMITYCONTAINER_H
#define _CENMITYCONTAINER_H

#include "../common/cbasetypes.h"
#include <map>

class CBattleEntity;
class CCharEntity;

struct EnmityObject_t
{
	CBattleEntity* PEnmityOwner;	// Enmity Target
	int16 CE;						// Cumulative Enmity
	int16 VE;						// Volatile Enmity
	uint8 maxTH;                    // Maximum Treasure Hunter level of this Enmity Owner
};

typedef std::map<uint32,EnmityObject_t*> EnmityList_t;

class CEnmityContainer
{
public:

    CEnmityContainer(CBattleEntity* holder);
   ~CEnmityContainer();

    CBattleEntity*	GetHighestEnmity();			// Decays VE and gets target with highest enmity

    float   CalculateEnmityBonus(CBattleEntity* PEntity);
    void    Clear(uint32 EntityID = 0);			// Removes Entries from list
    void    AddBaseEnmity(CBattleEntity* PEntity);
    void    UpdateEnmity(CBattleEntity* PEntity, int16 CE, int16 VE, bool withMaster = true);
    void    UpdateEnmityFromDamage(CBattleEntity* PEntity, uint16 Damage);
    void    UpdateEnmityFromCure(CBattleEntity* PEntity, uint16 level, uint16 CureAmount, bool isCureV);
    void    UpdateEnmityFromAttack(CBattleEntity* PEntity,uint16 Damage);
    bool    HasTargetID(uint32 TargetID); //true if ID is in the container with non-zero enmity level
    void    LowerEnmityByPercent(CBattleEntity* PEntity, uint8 percent, CBattleEntity* HateReceiver); // lower % of hate or transfer it
    uint16  GetCE(CBattleEntity* PEntity);
    uint16  GetVE(CBattleEntity* PEntity);
    void    DecayEnmity();
    bool    IsWithinEnmityRange(CBattleEntity* PEntity);
    uint8   GetHighestTH();
    EnmityList_t* GetEnmityList();

private:
	
    EnmityList_t    m_EnmityList;
    CBattleEntity*  m_EnmityHolder; //usually a monster
};

#endif
