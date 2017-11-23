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

#ifndef _CTREASUREPOOL_H
#define _CTREASUREPOOL_H

#include "../common/cbasetypes.h"

#include <vector>

enum TREASUREPOOLTYPE
{
    TREASUREPOOL_SOLO = 1,
    TREASUREPOOL_PARTY = 6,
    TREASUREPOOL_ALLIANCE = 18,
    TREASUREPOOL_ZONE = 128
};

#define TREASUREPOOL_SIZE	10

/************************************************************************
*																		*
*  Для совместимости с кластерной системой, персонаж получает новый		*
*  TreasurePool при переходе между зонами								*
*																		*
************************************************************************/

class CCharEntity;
class CMobEntity;

struct LotInfo
{
    std::uint16_t lot;
    CCharEntity* member;
};

struct TreasurePoolItem
{
    std::uint16_t ID;
    std::uint8_t  SlotID;
    time_point TimeStamp;

    std::vector<LotInfo> Lotters;
};

class CTreasurePool
{
public:

    CTreasurePool(TREASUREPOOLTYPE PoolType);

    TREASUREPOOLTYPE GetPoolType();

    std::uint8_t AddItem(std::uint16_t ItemID, CBaseEntity*);

    void LotItem(std::uint8_t SlotID, std::uint16_t Lot);
    void LotItem(CCharEntity* PChar, std::uint8_t SlotID, std::uint16_t Lot);
    void PassItem(CCharEntity* PChar, std::uint8_t SlotID);
    bool HasLottedItem(CCharEntity* PChar, std::uint8_t SlotID);
    bool HasPassedItem(CCharEntity* PChar, std::uint8_t SlotID);
    void AddMember(CCharEntity* PChar);
    void DelMember(CCharEntity* PChar);
    void UpdatePool(CCharEntity* PChar);

    void CheckItems(time_point);

    void TreasureWon(CCharEntity* winner, std::uint8_t SlotID);
    void TreasureError(CCharEntity* winner, std::uint8_t SlotID);
    void TreasureLost(std::uint8_t SlotID);

    bool CanAddSeal();

private:

    time_point m_Tick;
    std::uint8_t  m_count;

    TREASUREPOOLTYPE m_TreasurePoolType;

    void CheckTreasureItem(time_point tick, std::uint8_t SlotID);

    TreasurePoolItem m_PoolItems[TREASUREPOOL_SIZE];

    std::vector<CCharEntity*> members;
};

#endif
