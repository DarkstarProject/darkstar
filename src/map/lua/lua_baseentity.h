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
	int32 getName(lua_State *L);			// Gets Entity Name

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
	int32 getRangedDmg(lua_State*);				// Get ranged weapon DMG rating
	int32 getAmmoDmg(lua_State*);				// Get ammo DMG rating
	int32 getRATT(lua_State*);				// Get total r.attack
	int32 getRACC(lua_State*);				// Get total r.acc
	int32 capSkill(lua_State*);				// Caps the given skill id for the job you're on (GM COMMAND)

	int32 getMaxHP(lua_State*);				// Get max hp of entity
	int32 getMaxMP(lua_State*);				// Get max mp of entity

    int32 getStat(lua_State*);				// STR,DEX,VIT,AGI,INT,MND,CHR,ATT,DEF
	
	int32 getXPos(lua_State*);				// Get Entity X position
	int32 getYPos(lua_State*);				// Get Entity Y position
	int32 getZPos(lua_State*);				// Get Entity Z position
    int32 setPos(lua_State*);				// Set Entity position (zone,x,y,z)
	int32 getZone(lua_State*);				// Get Entity zone	
    int32 getPreviousZone(lua_State*);      // Get Entity previous zone
    int32 getContinentID(lua_State*);       // узнаем континент, на котором находится сущность
    int32 isZoneVisited(lua_State*);        // true если указанная зона посещалась персонажем ранее
	int32 getWeather(lua_State*);			// Get Weather condition
	int32 setWeather(lua_State*);			// Set Weather condition (GM COMMAND)

    int32 takeMagicDamage(lua_State*);      //

    int32 speed(lua_State*);                // скорость передвижения сущности
	int32 getAnimation(lua_State*);			// Get Entity Animation
	int32 setAnimation(lua_State*);			// Set Entity Animation
    int32 AnimationSub(lua_State*);         // get or set animationsub
    int32 costume(lua_State*);              // get or set user costume
    int32 canUseCostume(lua_State*);		// check to see if character can use costume, 0 if so
    int32 canUseChocobo(lua_State *L);      // check to see if character can use chocobo, 0 if so

	int32 addItem(lua_State*);				// Add item to Entity inventory (additem(itemNumber,quantity))
	int32 hasItem(lua_State*);				// Check to see if Entity has item in inventory (hasItem(itemNumber))
	int32 getFreeSlotsCount(lua_State*);	// Gets value of free slots in Entity inventory
	int32 getRace(lua_State*);				// Gets Race of Entity
	int32 getNation(lua_State*);			// Gets Nation of Entity
	int32 setNation(lua_State*);			// Sets Nation of Entity

	int32 addQuest(lua_State*);				// Add Quest to Entity Quest Log
	int32 delQuest(lua_State*);				// Remove quest from quest log (should be used for debugging only)
	int32 getQuestStatus(lua_State*);		// Get Quest Status
    int32 hasCompleteQuest(lua_State*);     // Checks if quest has been completed
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
	int32 delSpell(lua_State*);				// Remove spell from Entity spell list

    int32 addWeaponSkill(lua_State*);       // 
    int32 delWeaponSkill(lua_State*);       //

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

	int32 bcnmRegister(lua_State*);			//Attempts to register a bcnm instance (used by Dynamis and BCNM)
	int32 bcnmEnter(lua_State*);			//Enter a bcnm instance (used by Dynamis and BCNM)
	int32 bcnmLeave(lua_State*);			//Leave a bcnm instance
	int32 isInBcnm(lua_State*);				//true if you're INSIDE the bc (not just the status)
	int32 isBcnmsFull(lua_State*);			//true if all 3 instances are full
	int32 getInstanceID(lua_State*);		//returns 1 2 or 3 if the player can enter a bcnm with the instance assigned
	int32 getBCNMloot(lua_State*);			//triggers if the player opens the chest inside bcnm

	int32 getDynamisUniqueID(lua_State*);	//Get unique Dynamis ID
	int32 addPlayerToDynamis(lua_State*);	//Add player to the Dynamis
	int32 addTimeToDynamis(lua_State*);		//Add time to the Dynamis
	int32 launchDynamisSecondPart(lua_State*);//Spawn Mob part 2 when mega boss is defeated
	int32 isInDynamis(lua_State*);			//If player is in Dynamis return true else false

	int32 getVar(lua_State*);				// Returns a character variable
	int32 setVar(lua_State*);				// Sets a character variable
    int32 addVar(lua_State*);               // Increments/decriments/sets a character variable
	
	int32 setMaskBit(lua_State*);			// Sets a single bit in a character variable
	int32 getMaskBit(lua_State*);			// Retrieves a single bit in a character variable
	int32 countMaskBits(lua_State*);		// Retrieves number of true bits in a character variable
	int32 isMaskFull(lua_State*);			// Checks if a bitmask stored in a character varable of a specified size contains all set bits

	int32 setHomePoint(lua_State*);			// Sets character's homepoint  
	int32 tradeComplete(lua_State*);		// Complete trade with an npc

    int32 hasTitle(lua_State*);
	int32 getTitle(lua_State*);				// Gets character's title
    int32 addTitle(lua_State*);
    int32 delTitle(lua_State*);
	int32 setTitle(lua_State*);				// Sets character's title

	int32 getGil(lua_State*);				// Gets character's gil amount
	int32 addGil(lua_State*);				// adds gil to character
	int32 delGil(lua_State*);				// removes gil from character
	int32 setGil(lua_State*);				// sets gil to value

	int32 getEquipID(lua_State*);			// Gets the Item Id of the item in specified slot
    int32 lockEquipSlot(lua_State*);        // блокируем ячейку экипировки
    int32 unlockEquipSlot(lua_State*);      // снимаем блокировку с ячейки экипировки

	int32 createShop(lua_State*);			// Prepare the container for work of shop ??
	int32 addShopItem(lua_State*);			// Adds item to shop container (16 max)

	int32 getFame(lua_State*);				// Gets Fame
	int32 setFame(lua_State*);				// Sets Fame
	int32 addFame(lua_State*);				// Adds Fame
	int32 getFameLevel(lua_State*);			// Gets Fame Level for specified nation

	int32 setStatus(lua_State*);			// Sets Character's Status
    int32 setPVPFlag(lua_State*);           // Allow to attack this player

	int32 sendRaise(lua_State*);			// send raise request to char
	int32 sendTractor(lua_State*);			// send tractor request to char

	int32 updateEnmity(lua_State*);			// Adds Enmity to player for specified mob
	int32 updateEnmityFromDamage(lua_State*);// Adds Enmity to player for specified mob for the damage specified
	int32 updateEnmityFromCure(lua_State*);

	int32 hasImmunity(lua_State*);			// Check if the mob has immunity for a type of spell (list at mobentity.h)
	int32 getBattleTime(lua_State*);		// Get the time in second of the battle
	int32 rageMode(lua_State*);				// Add rage mode

	int32 addStatusEffect(lua_State*);		// Adds status effect to character
    int32 addStatusEffectEx(lua_State*);	// Adds status effect to character
	int32 hasStatusEffect(lua_State*);		// Checks to see if character has specified effect
    int32 getStatusEffect(lua_State*);		// 
	int32 delStatusEffect(lua_State*);		// Removes Status Effect 
	int32 eraseStatusEffect(lua_State*);	// Used with "Erase" spell 
	int32 dispelStatusEffect(lua_State*);	// Used with "Dispel" spell
	int32 addPartyEffect(lua_State*);		// Adds Effect to all party members
	int32 removePartyEffect(lua_State*);	// Removes Effect from all party members
	int32 hasPartyEffect(lua_State*);		// Has Effect from all party members

	int32 addMod(lua_State*);				// Adds Modifier Value
	int32 getMod(lua_State*);				// Retrieves Modifier Value
	int32 delMod(lua_State*);				// Subtracts Modifier Value
	int32 setMod(lua_State*);				// Sets Modifier Value

	int32 addExp(lua_State*);				// Add to Character Experience

	int32 getPetElement(lua_State*);
	int32 getPetName(lua_State*);
	int32 spawnPet(lua_State*);				// Calls Pet
	int32 despawnPet(lua_State*);			// Despawns Pet
	int32 petAttack(lua_State*);			// Despawns Pet
	int32 petRetreat(lua_State*);
	int32 petStay(lua_State*);
	int32 petAbility(lua_State*);
	int32 getPet(lua_State*);				// Creates an LUA reference to a pet entity

	int32 wakeUp(lua_State*);				//wakes target if necessary
	int32 needToZone(lua_State*);			// Check if player has zoned since the flag has been raised

    int32 setFlag(lua_State*);
    int32 moghouseFlag(lua_State*);
	int32 showPosition(lua_State*);			// Display current position of character
	int32 injectPacket(lua_State*);			// Send the character a packet kept in a file 
	
	int32 getContainerSize(lua_State*);	    // Gets the current capacity of a container
	int32 changeContainerSize(lua_State*);  // Increase/Decreases container size
	int32 setLevel(lua_State*);				// sets the character's level
	int32 setsLevel(lua_State*);				// sets the character's level
	int32 changeJob(lua_State*);			// changes the job of a char (testing only!)
	int32 changesJob(lua_State*);			// changes the sub job of a char (testing only!)
	int32 getWeaponDmg(lua_State*);			// gets the current equipped weapons' DMG rating
	int32 getOffhandDmg(lua_State*);		// gets the current equipped offhand's DMG rating (used in WS calcs)
	int32 isWeaponTwoHanded(lua_State*);
	int32 getMeleeHitDamage(lua_State*);    // gets the damage of a single hit vs the specified mob
	int32 getWeaponSkillType(lua_State*);   // gets the type of weapon equipped
	int32 isBehind(lua_State*);				// true if you're behind the input target
	int32 getStealItem(lua_State*);			// gets ItemID of droplist steal item from mob

    int32 openDoor(lua_State*);             // открываем дверь
	int32 hideNPC(lua_State*);              // hide an NPC
	int32 resetRecasts(lua_State*);         // Reset recasts for the caller

	int32 addCP(lua_State*);				// Add CP
	int32 getCP(lua_State*);				// Get CP
	int32 delCP(lua_State*);				// Delete CP

	int32 addNationTeleport(lua_State*);	// Add new teleport: addNationTeleport(nation,number)
	int32 getNationTeleport(lua_State*);	// Get teleport you can use by nation: getNationTeleport(nation)

	int32 checkDistance(lua_State*);		// Check Distacnce and returns distance number
	int32 checkBaseExp(lua_State*);			// Check if Monster gives base expirence
	int32 checkSoloPartyAlliance(lua_State*);	// Check if Player is in Party or Alliance 0=Solo 1=Party 2=Alliance
	int32 checkExpPoints(lua_State*);		// Exp points penalty for Player vs Max High Player Gap in party
};

#endif