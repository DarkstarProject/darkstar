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

#ifndef _CONQUESTSYSTEM_H
#define _CONQUESTSYSTEM_H

#include "../common/cbasetypes.h"

#include "zone.h"

#define SANDORIA            0x00
#define BASTOK              0x01
#define WINDURST            0x02  
#define BEASTMEN            0x03
#define NEUTRAL             0xFF

/************************************************************************
*                                                                       *
*                                                                       *
*                                                                       *
************************************************************************/

class CCharEntity;

namespace conquest
{
	void	LoadConquestSystem();										// Load conquest information with the DB
	void	UpdateConquestSystem();										// Update conquest information in the DB

	void	GainInfluencePoints(CCharEntity* PChar);					// Gain influence for player's nation (+1)
	void	LoseInfluencePoints(CCharEntity* PChar);					// Lose influence for player's nation and gain for beastmen influence
	
	uint32	GetInfluencePoints(REGIONTYPE RegionID, uint8 nation);

	uint8	CreateInfluenceGraphics(uint8 RegionID);					// Create number for graphic with the arrows in the conquest menu
	uint8	GetInfluenceGraphics(REGIONTYPE RegionID);					// Get number for graphics in conquest menu (arrows)

	void	UpdateConquestGM();											// Upate conquest system by GM (modify in the DB and use @updateconquest)
	void	UpdateWeekConquest();										// Update conquest system every sunday

	uint8	GetBalance();												// Ranking for 3 nations
	uint8	GetNexTally();												// Next tally (weekly or every hour ?)
    uint8	GetRegionOwner(REGIONTYPE RegionID);						// Get owner of the region

    uint32	AddConquestPoints(CCharEntity* PChar, uint32 exp);			// Add conquest points
};

#endif