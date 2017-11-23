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

enum ConquestUpdate : std::uint8_t
{
    Conquest_Tally_Start = 0,
    Conquest_Tally_End = 1,
    Conquest_Update = 2
};

/************************************************************************
*                                                                       *
*                                                                       *
*                                                                       *
************************************************************************/

class CCharEntity;

namespace conquest
{
	void	UpdateConquestSystem();										// Update conquest information in the DB

    void    UpdateInfluencePoints(int points, unsigned int nation, unsigned int region);
	void	GainInfluencePoints(CCharEntity* PChar, std::uint32_t points);		// Gain influence for player's nation (+1)
	void	LoseInfluencePoints(CCharEntity* PChar);					// Lose influence for player's nation and gain for beastmen influence
	
    std::uint8_t	GetInfluenceGraphics(std::int32_t san_inf, std::int32_t bas_inf, std::int32_t win_inf, std::int32_t bst_inf);	// Get number for graphics in conquest menu (arrows)
    std::uint8_t	GetInfluenceGraphics(REGIONTYPE RegionID);	                // Get number for graphics in conquest menu (arrows)
    std::uint8_t   GetInfluenceRanking(std::int32_t san_inf, std::int32_t bas_inf, std::int32_t win_inf, std::int32_t bst_inf);
    std::uint8_t   GetInfluenceRanking(std::int32_t san_inf, std::int32_t bas_inf, std::int32_t win_inf);

    void	UpdateConquestGM(ConquestUpdate type);						// Update conquest system by GM (modify in the DB and use @updateconquest)
	void	UpdateWeekConquest();										// Update conquest system every sunday

    std::uint8_t	GetBalance(std::uint8_t sandoria, std::uint8_t bastok, std::uint8_t windurst,	// Ranking for 3 nations
                       std::uint8_t sandoria_prev, std::uint8_t bastok_prev, std::uint8_t windurst_prev);
    std::uint8_t   GetBalance();
    std::uint8_t   GetAlliance(std::uint8_t sandoria, std::uint8_t bastok, std::uint8_t windurst);  // Determine if losing nations are allied
    std::uint8_t	GetAlliance(std::uint8_t sandoria, std::uint8_t bastok, std::uint8_t windurst,	// Determine if losing nations are allied
        std::uint8_t sandoria_prev, std::uint8_t bastok_prev, std::uint8_t windurst_prev);
    bool    IsAlliance();                                               // Determine if losing nations are allied
	std::uint8_t	GetNexTally();												// Next tally (weekly or every hour ?)
    std::uint8_t	GetRegionOwner(REGIONTYPE RegionID);						// Get owner of the region

    std::uint32_t	AddConquestPoints(CCharEntity* PChar, std::uint32_t exp);			// Add conquest points
};

#endif