/*
===========================================================================

Copyright (c) 2014-2015 GamerzProjectXI Dev Teams

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

This file is part of GamerzProjectXI-server source code.

===========================================================================
*/

#ifndef _DIGGINGUTILS_H
#define _DIGGINGUTILS_H

#include <vector>

#include "../../common/cbasetypes.h"

/************************************************************************
*																		*
*	Enumerators Digging Requirements									*
*																		*
************************************************************************/

enum REQUIREMENTS
{
	NONE = 0,
	BURROW = 1,
	BORE = 2,
	EGG_HELM = 3,
	NIGHT = 4
};

/************************************************************************
*																		*
*	Enumerators Digging Item Quality									*
*																		*
************************************************************************/

enum QUALITY
{
	COMMON = 0,
	UNCOMMON = 1,
	RARE = 2,
	VERY_RARE = 3
};

/************************************************************************
*																		*
*	All of the techniques required to implement digging					*
*																		*
************************************************************************/

class CCharEntity;

namespace diggingutils
{
	void	LoadDiggingMessages();						// Load Digging Messages from Text IDs
	void	Dig(CCharEntity* PChar);					// Main Action
	int8	GetPlayerDigCount(CCharEntity* PChar);		// Return the player's dig counter
	int8	GetZoneItemsDug(CCharEntity* PChar);		// Return the # of items already dug up in a zone
	void	UpdatePlayerDigCount(CCharEntity* PChar);	// Increment the player's dig counter
	void	UpdateZoneItemsDug(CCharEntity* PChar);		// Increment the # of items already dug up in a zone
	void	DeletePlayersDigCounts();					// Delete all players dig counters
	bool	CanPlayerDig(CCharEntity* PChar);			// Check if a player can dig
	bool	CanPlayerBurrow(CCharEntity* PChar);		// Check if the player's chocobo can Burrow
	bool	CanPlayerBore(CCharEntity* PChar);			// Check if the player's chocobo can Bore
	bool	EggHelm(CCharEntity* PChar);				// Check if the player is wearing the Egg Helm
	bool	NightDigging();								// Check if it's night time
	int32	SetLastDig(CCharEntity* PChar);				// Set the time of the last dig attempt
	int32	GetLastDig(CCharEntity* PChar);				// Return the time of the last dig attempt
	void	UpdateDigDelay(CCharEntity* PChar);			// Update the delay between digs
	int8	ReturnDigDelay(CCharEntity* PChar);			// Return the dig delay for a character
	int8	ReturnAreaDigDelay(CCharEntity* PChar);		// Return the dig delay for an Area
	int32	CalculateSkillUp(CCharEntity* PChar);		// Attempt to skill up from a dig attempt
};

#endif