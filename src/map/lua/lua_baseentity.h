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

#ifndef _CLUABASEENTITY_H
#define _CLUABASEENTITY_H

#include "../../common/cbasetypes.h"
#include "../../common/lua/lunar.h"
#include "../charentity.h"

class CBaseEntity;

class CLuaBaseEntity
{
	CBaseEntity* m_PBaseEntity;
public:

	static const int8 className[];
	static Lunar<CLuaBaseEntity>::Register_t methods[];

	CLuaBaseEntity(lua_State*);
	CLuaBaseEntity(CBaseEntity*);

	CBaseEntity* GetBaseEntity()const
	{
		return m_PBaseEntity;
	}

	int32 warp(lua_State*);					// Returns Character to home point
	int32 leavegame(lua_State*);			// Character leaving game

	int32 getID(lua_State *L);				// Gets Entity Id

	int32 getHP(lua_State*);				// Returns Entity Health
	int32 addHP(lua_State*);				// Modify hp of Entity +/-
	int32 delHP(lua_State*);				// Subtract hp of Entity
	int32 setHP(lua_State*);				// Set hp of Entity to value
	int32 getMP(lua_State*);				// Gets MP of Entity
	int32 addMP(lua_State*);				// Modify mp of Entity +/-
	int32 delMP(lua_State*);				// Subtract mp of Entity
	int32 setMP(lua_State*);				// Set mp of Entity to value
	int32 getTP(lua_State*);				// Get tp of Entity
	int32 addTP(lua_State*);				// Modify tp of Entity +/-
	int32 delTP(lua_State*);				// Subtract tp of Entity
	int32 setTP(lua_State*);				// Set tp of Entity to value

	int32 getMaxHP(lua_State*);				// Get max hp of entity
	int32 getMaxMP(lua_State*);				// Get max mp of entity
	
	int32 getXPos(lua_State*);				// Get Entity X position
	int32 getYPos(lua_State*);				// Get Entity Y position
	int32 getZPos(lua_State*);				// Get Entity Z position
    int32 setPos(lua_State*);				// Set Entity position (zone,x,y,z)
	int32 getZone(lua_State*);				// Get Entity zone
    int32 getPreviousZone(lua_State*);      // Get Entity previous zone

    int32 takeMagicDamage(lua_State*);      //

	int32 getAnimation(lua_State*);			// Get Entity Animation
	int32 setAnimation(lua_State*);			// Set Entity Animation
    int32 AnimationSub(lua_State*);         // get or set animationsub
    int32 costume(lua_State*);              // get or set user costume
    int32 canUseCostume(lua_State*);		// check to see if character can use costume, 0 if so

	int32 addItem(lua_State*);				// Add item to Entity inventory (additem(itemNumber,quantity))
	int32 hasItem(lua_State*);				// Check to see if Entity has item in inventory (hasItem(itemNumber))
	int32 getFreeSlotsCount(lua_State*);	// Gets value of free slots in Entity inventory
	int32 getRace(lua_State*);				// Gets Race of Entity
	int32 getNation(lua_State*);			// Gets Nation of Entity

	int32 addQuest(lua_State*);				// Add Quest to Entity Quest Log
	int32 delQuest(lua_State*);				// Remove quest from quest log (should be used for debugging only)
	int32 getQuestStatus(lua_State*);		// Get Quest Status
	int32 completeQuest(lua_State*);		// Set a quest status to complete

	int32 addMission(lua_State*);			// Add Mission
	int32 delMission(lua_State*);			// Delete Mission from Mission Log
	int32 hasCompletedMission(lua_State*);	// Checks if mission has been completed
	int32 getCurrentMission(lua_State*);	// Gets the current mission
	int32 completeMission(lua_State*);		// Complete Mission

	int32 getRank(lua_State*);				// Get Current Rank
	int32 setRank(lua_State*);				// Set Rank
	
	int32 getRankPoints(lua_State*);		// Get Current Rank points	
	int32 setRankPoints(lua_State*);		// Set Current Rank points
	int32 addRankPoints(lua_State*);		// Add rank points to existing rank point total

	int32 addKeyItem(lua_State*);			// Add key item to Entity Key Item collection 
	int32 seenKeyItem(lua_State*);			// If Key Item is viewed, add it to the seen key item collection
	int32 unseenKeyItem(lua_State*);		// Attempt to remove the keyitem from the seen key item collection, only works on logout
	int32 hasKeyItem(lua_State*);			// Checks Entity key item collection to see if Entity has the key item
	int32 delKeyItem(lua_State*);			// Removes key item from Entity key item collection

	int32 getSkillLevel(lua_State*);		// Get Current Skill Level
	int32 addSpell(lua_State*);				// Add spell to Entity spell list
    int32 hasSpell(lua_State*);				// Check to see if character has item in spell list
	int32 canLearnSpell(lua_State*);		// Check to see if character can learn spell, 0 if so
	int32 delSpell(lua_State*);				// Remove spell from Entity spell list (debug purposes only?)

	int32 getMainJob(lua_State*);			// Returns Entity Main Job
	int32 getMainLvl(lua_State*);			// Gets Entity Main Job Level
	int32 getSubJob(lua_State*);			// Get Entity Sub Job 
	int32 getSubLvl(lua_State*);			// Get Entity Sub Job Level
	int32 unlockJob(lua_State*);			// Unlocks a job for the entity, sets job level to 1
    int32 levelCap(lua_State*);             // genkai
	int32 levelRestriction(lua_State*);		// Establish/return current level restriction

	int32 showText(lua_State*);				// Displays Dialog for npc
	int32 messageSpecial(lua_State*);		// Sends Special Message
	int32 messageSystem(lua_State*);		// Sends System Message
    int32 messageBasic(lua_State*);         // Sends Basic Message

	int32 release(lua_State*);				// Stops event
	int32 startEvent(lua_State*);			// Begins Event
	int32 updateEvent(lua_State*);			// Updates event 
    int32 getEventTarget(lua_State*);       //

	int32 sendMenu(lua_State*);				// Displays a menu (AH,Raise,Tractor,MH etc)
	int32 sendGuild(lua_State*);			// Sends guild shop menu

	int32 getVar(lua_State*);				// Returns a character variable
	int32 setVar(lua_State*);				// Sets a character variable

	int32 setHomePoint(lua_State*);			// Sets character's homepoint  
	int32 tradeComplete(lua_State*);		// Complete trade with an npc

	int32 getTitle(lua_State*);				// Gets character's title
	int32 setTitle(lua_State*);				// Sets character's title

	int32 getGil(lua_State*);				// Gets character's gil amount
	int32 addGil(lua_State*);				// adds gil to character
	int32 delGil(lua_State*);				// removes gil from character
	int32 setGil(lua_State*);				// sets gil to value

	int32 getEquipID(lua_State*);			// Gets the Item Id of the item in specified slot

	int32 createShop(lua_State*);			// Prepare the container for work of shop ??
	int32 addShopItem(lua_State*);			// Adds item to shop container (16 max)

	int32 getFame(lua_State*);				// Gets Fame
	int32 setFame(lua_State*);				// Sets Fame
	int32 addFame(lua_State*);				// Adds Fame
	int32 getFameLevel(lua_State*);			// Gets Fame Level for specified nation

	int32 setStatus(lua_State*);			// Sets Character's Status

	int32 sendRaise(lua_State*);			// send raise request to char
	int32 sendTractor(lua_State*);			// send tractor request to char

	int32 updateEnmity(lua_State*);			// Adds Enmity to player for specified mob

	int32 addStatusEffect(lua_State*);		// Adds status effect to character
    int32 addStatusEffectEx(lua_State*);	// Adds status effect to character
	int32 hasStatusEffect(lua_State*);		// Checks to see if character has specified effect
    int32 getStatusEffect(lua_State*);		// 
	int32 delStatusEffect(lua_State*);		// Removes Status Effect 
	int32 eraseStatusEffect(lua_State*);	// Used with "Erase" spell 
	int32 dispelStatusEffect(lua_State*);	// Used with "Dispel" spell
	int32 addPartyEffect(lua_State*);		// Adds Effect to all party members
	int32 removePartyEffect(lua_State*);	// Removes Effect from all party members

	int32 addMod(lua_State*);				// Adds Modifier Value
	int32 getMod(lua_State*);				// Retrieves Modifier Value
	int32 delMod(lua_State*);				// Subtracts Modifier Value
	int32 setMod(lua_State*);				// Sets Modifier Value

	int32 addExp(lua_State*);				// Add to Character Experience

	int32 spawnPet(lua_State*);				// Calls Pet
	int32 despawnPet(lua_State*);			// Despawns Pet

	int32 needToZone(lua_State*);			// Check if player has zoned since the flag has been raised

    int32 setFlag(lua_State*);
    int32 moghouseFlag(lua_State*);
	int32 showPosition(lua_State*);			// Display current position of character
	int32 injectPacket(lua_State*);			// Send the character a packet kept in a file 
	
	int32 getContainerSize(lua_State*);			// Gets the current capacity of a container
	int32 increaseContainerSize(lua_State*);	// Increase container size
	int32 decreaseContainerSize(lua_State*);	// Decreases a containers size -- Should be used for testing only

	void UpdateHealth(CCharEntity* PChar, CZone* PZone); // Sends health packet update to character 
};

#endif