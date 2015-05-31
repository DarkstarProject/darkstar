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

#ifndef _CONQUESTSYSTEM_H
#define _CONQUESTSYSTEM_H

#include "../common/cbasetypes.h"

#include "zone.h"

#define SANDORIA            0x00
#define BASTOK              0x01
#define WINDURST            0x02
#define BEASTMEN            0x03
#define NEUTRAL             0xFF

#define MAX_INFLUENCE_POINTS 2000000000

#define MAX(a, b) ((a) > (b) ? (a) : (b))
#define MIN(a, b) ((a) < (b) ? (a) : (b))
#define BETWEEN(v, a, b) (MIN(MAX(v, a), b))

enum ConquestUpdate : uint8 {
  Conquest_Tally_Start = 0,
  Conquest_Tally_End = 1,
  Conquest_Update = 2
};

class CCharEntity;

namespace conquest {
  void UpdateConquestSystem(); // Update conquest information in the DB

  void influence(CCharEntity *ch, int gain, bool died);
  void LoseInfluencePoints(CCharEntity* PChar); // Lose influence for player's nation and gain for beastmen influence

  uint8 GetInfluenceGraphics(int32 san_inf, int32 bas_inf, int32 win_inf, int32 bst_inf); // Get number for graphics in conquest menu (arrows)
  uint8 GetInfluenceGraphics(REGIONTYPE RegionID); // Get number for graphics in conquest menu (arrows)
  uint8 GetInfluenceRanking(int32 san_inf, int32 bas_inf, int32 win_inf, int32 bst_inf);
  uint8 GetInfluenceRanking(int32 san_inf, int32 bas_inf, int32 win_inf);

  void UpdateConquestGM(ConquestUpdate type); // Update conquest system by GM (modify in the DB and use @updateconquest)
  void UpdateWeekConquest(); // Update conquest system every sunday

  uint8 GetBalance(uint8 sandoria, uint8 bastok, uint8 windurst, // Ranking for 3 nations
          uint8 sandoria_prev, uint8 bastok_prev, uint8 windurst_prev);
  uint8 GetBalance();
  uint8 GetAlliance(uint8 sandoria, uint8 bastok, uint8 windurst); // Determine if losing nations are allied
  uint8 GetAlliance(uint8 sandoria, uint8 bastok, uint8 windurst, // Determine if losing nations are allied
          uint8 sandoria_prev, uint8 bastok_prev, uint8 windurst_prev);
  bool IsAlliance(); // Determine if losing nations are allied
  uint8 GetNexTally(); // Next tally (weekly or every hour ?)
  uint8 GetRegionOwner(REGIONTYPE RegionID); // Get owner of the region

  uint32 AddConquestPoints(CCharEntity* PChar, uint32 exp); // Add conquest points
};

#endif