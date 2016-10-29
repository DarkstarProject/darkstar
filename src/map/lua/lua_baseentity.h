﻿/*
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

#ifndef _CLUABASEENTITY_H
#define _CLUABASEENTITY_H

#include "../../common/cbasetypes.h"
#include "../../common/lua/lunar.h"

class CBaseEntity;
class CCharEntity;

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

    int32 ChangeMusic(lua_State* L);        // Sets the specified music Track for specified music block.

    int32 warp(lua_State*);                 // Returns Character to home point
    int32 leavegame(lua_State*);            // Character leaving game

    int32 getID(lua_State *L);              // Gets Entity Id
    int32 getShortID(lua_State *L);
    int32 getCursorTarget(lua_State *L);    // Returns the ID any object under players in game cursor.
    int32 getPool(lua_State *L);            // Returns a mobs pool ID. If entity is not a mob, returns nil.
    int32 getName(lua_State *L);            // Gets Entity Name

    int32 getHPP(lua_State*);               // Returns Entity Health %
    int32 getHP(lua_State*);                // Returns Entity Health
    int32 getGender(lua_State*);			// Returns the player character's gender
    int32 getBaseHP(lua_State*);            // Returns Entity base Health before modifiers
    int32 addHP(lua_State*);                // Modify hp of Entity +/-
    int32 restoreHP(lua_State*);            // Modify hp of Entity, but check if alive first
    int32 delHP(lua_State*);                // Subtract hp of Entity
    int32 setHP(lua_State*);                // Set hp of Entity to value
    int32 getMP(lua_State*);                // Gets MP of Entity
    int32 getBaseMP(lua_State*);            // Gets base MP before modifiers of Entity
    int32 addMP(lua_State*);                // Modify mp of Entity +/-
    int32 restoreMP(lua_State*);            // Modify mp of Entity, but check if alive first
    int32 delMP(lua_State*);                // Subtract mp of Entity
    int32 setMP(lua_State*);                // Set mp of Entity to value
    int32 getTP(lua_State*);                // Get tp of Entity
    int32 addTP(lua_State*);                // Modify tp of Entity +/-
    int32 delTP(lua_State*);                // Subtract tp of Entity
    int32 setTP(lua_State*);                // Set tp of Entity to value
    int32 getRangedDmg(lua_State*);         // Get ranged weapon DMG rating
    int32 getRangedDmgForRank(lua_State*);  // Get ranged weapond DMG rating used for calculating rank
    int32 getAmmoDmg(lua_State*);           // Get ammo DMG rating
    int32 getRATT(lua_State*);              // Get total r.attack
    int32 getRACC(lua_State*);              // Get total r.acc
    int32 getACC(lua_State*);               // Get total ACC
    int32 getEVA(lua_State*);               // Get total EVA
    int32 capSkill(lua_State*);             // Caps the given skill id for the job you're on (GM COMMAND)
    int32 capAllSkills(lua_State*);         // Caps All skills, GM command

    int32 getMaxHP(lua_State*);             // Get max hp of entity
    int32 getMaxMP(lua_State*);             // Get max mp of entity

    int32 getStat(lua_State*);              // STR,DEX,VIT,AGI,INT,MND,CHR,ATT,DEF

    int32 getXPos(lua_State*);              // Get Entity X position
    int32 getYPos(lua_State*);              // Get Entity Y position
    int32 getZPos(lua_State*);              // Get Entity Z position
    int32 getRotPos(lua_State*);            // Get Entity Rot position
    int32 setPos(lua_State*);               // Set Entity position (x,y,z,rot) or (x,y,z,rot,zone)
    int32 teleport(lua_State*);             // Set Entity position (without entity despawn/spawn packets)
    int32 getPos(lua_State*);               // Get Entity position (x,y,z)
    int32 getSpawnPos(lua_State*);          // Get Mob spawn position (x,y,z)
    int32 getZone(lua_State*);              // Get Entity zone
    int32 getZoneID(lua_State*);            // Get Entity zone ID
    int32 getZoneName(lua_State*);          // Get Entity zone name
    int32 isInMogHouse(lua_State*);         // Check if entity inside a mog house
    int32 getCurrentRegion(lua_State*);     // Get Entity conquest region
    int32 getPreviousZone(lua_State*);      // Get Entity previous zone
    int32 getContinentID(lua_State*);       // узнаем континент, на котором находится сущность
    int32 isZoneVisited(lua_State*);        // true если указанная зона посещалась персонажем ранее
    int32 getWeather(lua_State*);           // Get Weather condition
    int32 setWeather(lua_State*);           // Set Weather condition (GM COMMAND)

    int32 speed(lua_State*);                // скорость передвижения сущности
    int32 getAnimation(lua_State*);         // Get Entity Animation
    int32 setAnimation(lua_State*);         // Set Entity Animation
    int32 AnimationSub(lua_State*);         // get or set animationsub
    int32 costume(lua_State*);              // get or set user costume
    int32 costume2(lua_State*);				// set monstrosity costume
    int32 canUseCostume(lua_State*);        // check to see if character can use costume, 0 if so
    int32 canUseChocobo(lua_State *L);      // check to see if character can use chocobo, 0 if so
    int32 canUsePet(lua_State *L);          // check to see if character can call pet, 0 if so

    int32 addItem(lua_State*);              // Add item to Entity inventory (additem(itemNumber,quantity))
    int32 hasItem(lua_State*);              // Check to see if Entity has item in inventory (hasItem(itemNumber))
    int32 addTempItem(lua_State*);          // Add temp item to Entity Temp inventory
    int32 delItem(lua_State*);
    int32 getFreeSlotsCount(lua_State*);    // Gets value of free slots in Entity inventory
    int32 createWornItem(lua_State*);       // Update this item in worn item (player:createWornItem(itemid))
    int32 hasWornItem(lua_State*);          // Check if the item is already worn (player:hasWornItem(itemid))
    int32 getStorageItem(lua_State*);       // returns item object player:getStorageItem(containerid, slotid, equipslotid)
    int32 getRace(lua_State*);              // Gets Race of Entity
    int32 getNation(lua_State*);            // Gets Nation of Entity
    int32 setNation(lua_State*);            // Sets Nation of Entity
    int32 getCampaignAllegiance(lua_State*); // Gets Campaign Allegiance of Entity
    int32 setCampaignAllegiance(lua_State*); // Sets Campaign Allegiance of Entity

    int32 addQuest(lua_State*);             // Add Quest to Entity Quest Log
    int32 delQuest(lua_State*);             // Remove quest from quest log (should be used for debugging only)
    int32 getQuestStatus(lua_State*);       // Get Quest Status
    int32 hasCompleteQuest(lua_State*);     // Checks if quest has been completed
    int32 completeQuest(lua_State*);        // Set a quest status to complete

    int32 addMission(lua_State*);           // Add Mission
    int32 delMission(lua_State*);           // Delete Mission from Mission Log
    int32 hasCompletedMission(lua_State*);  // Checks if mission has been completed
    int32 getCurrentMission(lua_State*);    // Gets the current mission
    int32 completeMission(lua_State*);      // Complete Mission

    int32 addAssault(lua_State*);           // Add Mission
    int32 delAssault(lua_State*);           // Delete Mission from Mission Log
    int32 hasCompletedAssault(lua_State*);  // Checks if mission has been completed
    int32 getCurrentAssault(lua_State*);    // Gets the current mission
    int32 completeAssault(lua_State*);      // Complete Mission

    int32 getRank(lua_State*);              // Get Current Rank
    int32 setRank(lua_State*);              // Set Rank

    int32 getRankPoints(lua_State*);        // Get Current Rank points
    int32 setRankPoints(lua_State*);        // Set Current Rank points
    int32 addRankPoints(lua_State*);        // Add rank points to existing rank point total

    int32 addKeyItem(lua_State*);           // Add key item to Entity Key Item collection
    int32 seenKeyItem(lua_State*);          // If Key Item is viewed, add it to the seen key item collection
    int32 unseenKeyItem(lua_State*);        // Attempt to remove the keyitem from the seen key item collection, only works on logout
    int32 hasKeyItem(lua_State*);           // Checks Entity key item collection to see if Entity has the key item
    int32 delKeyItem(lua_State*);           // Removes key item from Entity key item collection

    int32 getSkillLevel(lua_State*);        // Get Current Skill Level
    int32 setSkillLevel(lua_State*);        // Set Current Skill Level
    int32 getMaxSkillLevel(lua_State*);     // Get Skill Cap for skill and rank
    int32 getSkillRank(lua_State*);         // Get your current skill craft Rank
    int32 setSkillRank(lua_State*);         // Set new skill craft rank
    int32 getWeaponSkillLevel(lua_State*);  // Get Skill for equipped weapon
    int32 addSpell(lua_State*);             // Add spell to Entity spell list
    int32 hasSpell(lua_State*);             // Check to see if character has item in spell list
    int32 canLearnSpell(lua_State*);        // Check to see if character can learn spell, 0 if so
    int32 delSpell(lua_State*);             // Remove spell from Entity spell list

    int32 addLearnedAbility(lua_State*);    // Add spell to Entity spell list
    int32 hasLearnedAbility(lua_State*);    // Check to see if character has item in spell list
    int32 canLearnAbility(lua_State*);      // Check to see if character can learn spell, 0 if so
    int32 delLearnedAbility(lua_State*);    // Remove spell from Entity spell list

    int32 addWeaponSkill(lua_State*);       //
    int32 delWeaponSkill(lua_State*);       //

    int32 getMainJob(lua_State*);           // Returns Entity Main Job
    int32 getMainLvl(lua_State*);           // Gets Entity Main Job Level
    int32 getSubJob(lua_State*);            // Get Entity Sub Job
    int32 getSubLvl(lua_State*);            // Get Entity Sub Job Level
    int32 unlockJob(lua_State*);            // Unlocks a job for the entity, sets job level to 1
    int32 levelCap(lua_State*);             // genkai
    int32 levelRestriction(lua_State*);     // Establish/return current level restriction
    int32 sjRestriction(lua_State*);        // Establish/return subjob restriction

    int32 showText(lua_State*);             // Displays Dialog for npc
    int32 messageSpecial(lua_State*);       // Sends Special Message
    int32 messageSystem(lua_State*);        // Sends System Message
    int32 messageBasic(lua_State*);         // Sends Basic Message
    int32 messagePublic(lua_State*);        // Sends a public Basic Message
    int32 clearTargID(lua_State*);          // clears target of entity

    int32 release(lua_State*);              // Stops event
    int32 startEvent(lua_State*);           // Begins Event
    int32 startEventString(lua_State*);     // Begins Event with string param (0x33 packet)
    int32 updateEvent(lua_State*);          // Updates event
    int32 getEventTarget(lua_State*);       //
    int32 openSendBox(lua_State*);          // Opens send box (to deliver items)

    int32 sendMenu(lua_State*);             // Displays a menu (AH,Raise,Tractor,MH etc)
    int32 sendGuild(lua_State*);            // Sends guild shop menu
    int32 getCurrentGPItem(lua_State*);     // Gets current GP item id and max points
    int32 addGuildPoints(lua_State*);       // add guild points

    int32 bcnmRegister(lua_State*);                  //Attempts to register a bcnm battlefield (used by Dynamis and BCNM)
    int32 bcnmEnter(lua_State*);                     //Enter a bcnm battlefield (used by Dynamis and BCNM)
    int32 bcnmLeave(lua_State*);                     //Leave a bcnm battlefield
    int32 isInBcnm(lua_State*);                      //true if you're INSIDE the bc (not just the status)
    int32 isBcnmsFull(lua_State*);                   //true if all 3 battlefield are full
    int32 isSpecialBattlefieldEmpty(lua_State*);     // 1 if this battlefield is full
    int32 getSpecialBattlefieldLeftTime(lua_State*); // return left time of the specific instance
    int32 addTimeToSpecialBattlefield(lua_State*);   // add time of the specific instance
    int32 BCNMSetLoot(lua_State*);                   // set a lootlist for a special inctance
    int32 RestoreAndHealOnBattlefield(lua_State*);   // restore ability , PM and PV on the specific instance
    int32 getBattlefieldID(lua_State*);              //returns 1 2 or 3 if the player can enter a bcnm with the instance assigned
    int32 getBCNMloot(lua_State*);                   //triggers if the player opens the chest inside bcnm
    int32 addPlayerToSpecialBattlefield(lua_State*); //for limbus

    int32 setSpawn(lua_State*);                // Sets spawn point
    int32 setRespawnTime(lua_State*);          // set respawn time
    int32 getDynamisUniqueID(lua_State*);      //Get unique Dynamis ID
    int32 addPlayerToDynamis(lua_State*);      //Add player to the Dynamis
    int32 addTimeToDynamis(lua_State*);        //Add time to the Dynamis
    int32 launchDynamisSecondPart(lua_State*); //Spawn Mob part 2 when mega boss is defeated
    int32 isInDynamis(lua_State*);             //If player is in Dynamis return true else false
    int32 getStatPoppedMobs(lua_State*);       // True if dyna statue has popped mobs
    int32 setStatPoppedMobs(lua_State*);       // Set to 1 for true, 0 for false

    int32 isInBattlefieldList(lua_State*);  // Return true is the mob is in battlefield list
    int32 addInBattlefieldList(lua_State*); // Add the mob to the battlefield list

    int32 getVar(lua_State*);               // Returns a character variable
    int32 setVar(lua_State*);               // Sets a character variable
    int32 addVar(lua_State*);               // Increments/decriments/sets a character variable

    int32 clearGearSetMods(lua_State*);     // Clears a characters gear set mods
    int32 addGearSetMod(lua_State*);        // Sets the characters gear set mod
    int32 hasGearSetMod(lua_State*);        // Checks if character already has a gear set mod

    int32 setPetName(lua_State*);
    int32 getAutomatonName(lua_State*);

    int32 setMaskBit(lua_State*);           // Sets a single bit in a character variable
    int32 getMaskBit(lua_State*);           // Retrieves a single bit in a character variable
    int32 countMaskBits(lua_State*);        // Retrieves number of true bits in a character variable
    int32 isMaskFull(lua_State*);           // Checks if a bitmask stored in a character varable of a specified size contains all set bits

    int32 setHomePoint(lua_State*);         // Sets character's homepoint
    int32 tradeComplete(lua_State*);        // Complete trade with an npc
    int32 confirmTrade(lua_State*);         // Complete trade with an npc, only removing confirmed items

    int32 hasTitle(lua_State*);
    int32 getTitle(lua_State*);             // Gets character's title
    int32 addTitle(lua_State*);
    int32 delTitle(lua_State*);
    int32 setTitle(lua_State*);             // Sets character's title

    int32 getGil(lua_State*);               // Gets character's gil amount
    int32 addGil(lua_State*);               // adds gil to character
    int32 delGil(lua_State*);               // removes gil from character
    int32 setGil(lua_State*);               // sets gil to value

    int32 equipItem(lua_State*);
    int32 getEquipID(lua_State*);           // Gets the Item Id of the item in specified slot
    int32 getShieldSize(lua_State*);        // Gets shield size of character
    int32 lockEquipSlot(lua_State*);        // блокируем ячейку экипировки
    int32 unlockEquipSlot(lua_State*);      // снимаем блокировку с ячейки экипировки
    int32 canEquipItem(lua_State*);         // returns true if the player is able to equip the item

    int32 createShop(lua_State*);           // Prepare the container for work of shop ??
    int32 addShopItem(lua_State*);          // Adds item to shop container (16 max)

    int32 getFame(lua_State*);              // Gets Fame
    int32 setFame(lua_State*);              // Sets Fame
    int32 addFame(lua_State*);              // Adds Fame
    int32 getFameLevel(lua_State*);         // Gets Fame Level for specified nation

    int32 setStatus(lua_State*);            // Sets Character's Status
    int32 getStatus(lua_State*);

    int32 sendRaise(lua_State*);            // send raise request to char
    int32 sendReraise(lua_State*);          // send raise request to char
    int32 sendTractor(lua_State*);          // send tractor request to char
    int32 SendRevision(lua_State*);         // send Git revision to char

    int32 updateEnmity(lua_State*);           // Adds Enmity to player for specified mob
    int32 updateClaim(lua_State*);           // Adds Enmity to player for specified mob and claims
    int32 updateEnmityFromDamage(lua_State*); // Adds Enmity to player for specified mob for the damage specified
    int32 updateEnmityFromCure(lua_State*);
    int32 addEnmity(lua_State*);            // Add specified amount of enmity (target, CE, VE)
    int32 resetEnmity(lua_State*);          //resets enmity to player for specificed mob
    int32 lowerEnmity(lua_State*);          //lower enmity to player for specificed mob
    int32 transferEnmity(lua_State*);
    int32 getCE(lua_State*);                //gets current CE the mob has towards the player
    int32 getVE(lua_State*);                //gets current VE the mob has towards the player

    int32 hasImmunity(lua_State*);          // Check if the mob has immunity for a type of spell (list at mobentity.h)
    int32 getBattleTime(lua_State*);        // Get the time in second of the battle
    int32 rageMode(lua_State*);             // Add rage mode
    int32 isUndead(lua_State*);             // True if mob is undead
    int32 isMobType(lua_State*);            // True if mob is of type passed to function
    int32 getSystem(lua_State*);
    int32 getFamily(lua_State*);

    int32 addStatusEffect(lua_State*);        // Adds status effect to character
    int32 addStatusEffectEx(lua_State*);      // Adds status effect to character
    int32 hasStatusEffect(lua_State*);        // Checks to see if character has specified effect
    int32 hasStatusEffectByFlag(lua_State*);  // Checks to see if a character has an effect with the specified flag
    int32 hasBustEffect(lua_State*);          // Checks to see if a character has a specified busted corsair roll
    int32 canGainStatusEffect(lua_State*);    // Returns true if the effect can be added
    int32 getStatusEffect(lua_State*);        //
    int32 getStatusEffects(lua_State*);
    int32 delStatusEffect(lua_State*);        // Removes Status Effect
    int32 delStatusEffectsByFlag(lua_State*); // Removes Status Effects by Flag
    int32 delStatusEffectSilent(lua_State*);  // Removes Status Effect, suppresses message
    int32 eraseStatusEffect(lua_State*);      // Used with "Erase" spell
    int32 healingWaltz(lua_State*);           // Used with "Healing Waltz" ability
    int32 dispelStatusEffect(lua_State*);     // Used with "Dispel" spell
    int32 stealStatusEffect(lua_State*);      // Used in mob skills to steal effects
    int32 dispelAllStatusEffect(lua_State*);  // Dispels all effects and returns number erased
    int32 eraseAllStatusEffect(lua_State*);   // Erases all effects and returns number erased
    int32 getStatusEffectElement(lua_State*); // returns the element of the status effect
    int32 getPartyMember(lua_State* L);       // Get a character entity from another entity's party or alliance
    int32 getPartySize(lua_State* L);         // Get the size of a party in an entity's alliance
    int32 getAllianceSize(lua_State* L);      // Get the size of an entity's alliance
    int32 addPartyEffect(lua_State*);         // Adds Effect to all party members
    int32 removePartyEffect(lua_State*);      // Removes Effect from all party members
    int32 hasPartyEffect(lua_State*);         // Has Effect from all party members
    int32 addCorsairRoll(lua_State*);         // Adds corsair roll effect
    int32 doWildCard(lua_State*);
    int32 addBardSong(lua_State*);            // Adds bard song effect
    int32 hasPartyJob(lua_State*);
    int32 fold(lua_State*);
    int32 hasCorsairEffect(lua_State*);

    int32 addMod(lua_State*);                // Adds Modifier Value
    int32 getMod(lua_State*);                // Retrieves Modifier Value
    int32 delMod(lua_State*);                // Subtracts Modifier Value
    int32 setMod(lua_State*);                // Sets Modifier Value

    int32 addPetMod(lua_State*);
    int32 delPetMod(lua_State*);
    int32 setPetMod(lua_State*);

    int32 getMobMod(lua_State*);
    int32 setMobMod(lua_State*);
    int32 addMobMod(lua_State*);
    int32 delMobMod(lua_State*);

    int32 hasTrait(lua_State*);

    int32 addExp(lua_State*);                // Add to Character Experience
    int32 delExp(lua_State*);                // Subtracts from Character Experience

    int32 getPetElement(lua_State*);
    int32 getPetName(lua_State*);
    int32 charmPet(lua_State*);              // Charms Pet (Beastmaster ability only)
    int32 charm(lua_State*);                 // applies charm on target
    int32 uncharm(lua_State*);               // removes charm on target
    int32 spawnPet(lua_State*);              // Calls Pet
    int32 despawnPet(lua_State*);            // Despawns Pet
    int32 petAttack(lua_State*);             // Despawns Pet
    int32 petRetreat(lua_State*);
    int32 petAbility(lua_State*);
    int32 hasPet(lua_State*);                // returns true if the player has a pet
    int32 getPet(lua_State*);                // Creates an LUA reference to a pet entity
    int32 getPetID(lua_State*);              // If the entity has a pet, returns the PetID to identify pet type.
    int32 isJugPet(lua_State*);              // If the entity has a pet, test if it is a jug pet.
    int32 familiar(lua_State*);              // familiar on pet

    int32 wakeUp(lua_State*);                //wakes target if necessary
    int32 needToZone(lua_State*);            // Check if player has zoned since the flag has been raised

    int32 setFlag(lua_State*);
    int32 moghouseFlag(lua_State*);
    int32 showPosition(lua_State*);          // Display current position of character
    int32 injectPacket(lua_State*);          // Send the character a packet kept in a file

    int32 getContainerSize(lua_State*);      // Gets the current capacity of a container
    int32 changeContainerSize(lua_State*);   // Increase/Decreases container size
    int32 resetPlayer(lua_State*);           // if player is stuck, GM command @resetPlayer name
    int32 setLevel(lua_State*);              // sets the character's level
    int32 setsLevel(lua_State*);             // sets the character's level
    int32 changeJob(lua_State*);             // changes the job of a char (testing only!)
    int32 setMerits(lua_State*);             // set merits (testing only!)
    int32 getMerit(lua_State*);
    int32 getMeritCount(lua_State*);         // Gets a players current merit count.
    int32 getPlaytime(lua_State*);
    int32 changesJob(lua_State*);            // changes the sub job of a char (testing only!)
    int32 getWeaponDmg(lua_State*);          // gets the current equipped weapons' DMG rating
    int32 getOffhandDmg(lua_State*);         // gets the current equipped offhand's DMG rating (used in WS calcs)
    int32 getWeaponDmgRank(lua_State*);      // gets the current equipped weapons' DMG rating for Rank calc
    int32 getOffhandDmgRank(lua_State*);     // gets the current equipped offhand's DMG rating for Rank calc
    int32 isWeaponTwoHanded(lua_State*);
    int32 getMeleeHitDamage(lua_State*);     // gets the damage of a single hit vs the specified mob
    int32 getWeaponSkillType(lua_State*);    // gets the type of weapon equipped
    int32 getWeaponSubSkillType(lua_State*); // gets the subskill of weapon equipped
    int32 getWSSkillchainProp(lua_State* L); // returns weapon skill's skillchain properties (up to 3)

    int32 isBehind(lua_State*);               // true if you're behind the input target
    int32 isFacing(lua_State*);               // true if you are facing the target
    int32 getAngle(lua_State* L);             // return angle (rot) between two points (vector from a to b)
    int32 getTrickAttackChar(lua_State*); //true if TA target is available
    int32 getStealItem(lua_State*);           // gets ItemID of droplist steal item from mob
    int32 itemStolen(lua_State*);             // sets mob's ItemStolen var = true

    int32 openDoor(lua_State*);             // открываем дверь
    int32 closeDoor(lua_State*);            // npc.closeDoor(timeToStayClosed)
    int32 showNPC(lua_State*);              // Show an NPC
    int32 hideNPC(lua_State*);              // hide an NPC
    int32 updateNPCHideTime(lua_State*);    // Updates the length of time a NPC remains hidden, if shorter than the original hide time.

    int32 addRecast(lua_State*);
    int32 resetRecasts(lua_State*);         // Reset recasts for the caller
    int32 resetRecast(lua_State*);          // Reset one recast ID

    int32 getCurrency(lua_State*);          // Get Currency
    int32 setCurrency(lua_State*);          // Set Currency
    int32 addCurrency(lua_State*);          // Add Currency
    int32 delCurrency(lua_State*);          // Delete Currency

    int32 getCP(lua_State*);                // Get CP
    int32 addCP(lua_State*);                // Add CP
    int32 delCP(lua_State*);                // Delete CP

    int32 getSeals(lua_State*);             // Get Seals (beastman seals, etc)
    int32 addSeals(lua_State*);             // Add Seals
    int32 delSeals(lua_State*);             // Delete Seals

    int32 getAssaultPoint(lua_State*);      // Get points for an assault area
    int32 addAssaultPoint(lua_State*);      // Add points for an assault area
    int32 delAssaultPoint(lua_State*);      // Delete points for an assault area

    int32 isJailed(lua_State *L);           // Is the player jailed

    int32 addNationTeleport(lua_State*);     // Add new teleport: addNationTeleport(nation,number)
    int32 getNationTeleport(lua_State*);     // Get teleport you can use by nation: getNationTeleport(nation)

    int32 checkDistance(lua_State*);           // Check Distacnce and returns distance number
    int32 getBaseExp(lua_State*);
    int32 checkSoloPartyAlliance(lua_State*);  // Check if Player is in Party or Alliance 0=Solo 1=Party 2=Alliance
    int32 checkExpPoints(lua_State*);          // Exp points penalty for Player vs Max High Player Gap in party
    int32 checkFovAllianceAllowed(lua_State*); // checks the map config, 1 if alliance is allowed to farm Fov pages
    int32 checkFovDistancePenalty(lua_State*); // Checks whether FoV distance from mob penalty applies.

    int32 getObjType(lua_State*);

    int32 isPC(lua_State*);
    int32 isNPC(lua_State*);
    int32 isMob(lua_State*);
    int32 isPet(lua_State*);

    int32 injectActionPacket(lua_State*);   // ONLY FOR DEBUGGING. Injects an action packet with the specified params.
    int32 setMobFlags(lua_State*);          // Used to manipulate the mob's flags for testing.

    int32 setDelay(lua_State*);             // sets a mobs weapon delay
    int32 setDamage(lua_State*);            // sets a mobs weapon damage
    int32 castSpell(lua_State*);            // forces a mob to cast a spell (parameter = spell ID, otherwise picks a spell from its list)
    int32 useMobAbility(lua_State*);        // forces a mob to use a mobability (parameter = skill ID)
    int32 useJobAbility(lua_State*);        // forces a job ability use (players/pets only)
    int32 actionQueueEmpty(lua_State*);     // returns whether the action queue is empty or not
    int32 actionQueueAbility(lua_State*);   // returns whether the action is from the action queue or not

    int32 SetAutoAttackEnabled(lua_State*);   // halts/resumes auto attack of entity
    int32 SetMagicCastingEnabled(lua_State*); // halt/resumes casting magic
    int32 SetMobAbilityEnabled(lua_State*);   // halt/resumes mob skills
    int32 SetMobSkillAttack(lua_State*);      // enable/disable using mobskills as regular attacks
    int32 updateTarget(lua_State*);           // Force mob to update target from enmity container (ie after updateEnmity)

    int32 getLocalVar(lua_State*);
    int32 setLocalVar(lua_State*);
    int32 resetLocalVars(lua_State*);

    int32 setSpellList(lua_State*);
    int32 hasSpellList(lua_State*);
    int32 hasPreventActionEffect(lua_State*);

    int32 hasValidJugPetItem(lua_State*);
    int32 getTarget(lua_State*);
    int32 hasTPMoves(lua_State*);
    int32 getMaster(lua_State*);

    int32 recalculateAbilitiesTable(lua_State*);
    int32 recalculateSkillsTable(lua_State*);
    int32 isSpellAoE(lua_State* L);

    int32 checkNameFlags(lua_State* L);   // this is check and not get because it tests for a flag, it doesn't return all flags
    int32 getGMLevel(lua_State* L);
    int32 setGMLevel(lua_State* L);
    int32 getGMHidden(lua_State* L);
    int32 setGMHidden(lua_State* L);
    int32 PrintToPlayer(lua_State* L);    // for sending debugging messages/command confirmations to the player's client
    // == Pathfind Methods ==
    int32 pathThrough(lua_State* L);      // walk at normal speed through the given points
    // int32 WarpTo(lua_State* L);        // warp to the given point
    // int32 RoamAround(lua_State* L);    // pick a random point to walk to
    // int32 LimitDistance(lua_State* L); // limits the current path distance to given max distance

    int32 atPoint(lua_State* L);          // is at given point
    int32 lookAt(lua_State* L);           // look at given position
    int32 isFollowingPath(lua_State* L);  // checks if the entity is following a path
    int32 clearPath(lua_State* L);        // removes current pathfind and stops moving
    int32 wait(lua_State* L);             // make the npc wait a number of ms and then back into roam
    int32 pathTo(lua_State* L);           // set new path to point without changing action

    int32 unlockAttachment(lua_State* L);
    int32 hasAttachment(lua_State* L);
    int32 disableLevelSync(lua_State* L);
    int32 updateHealth(lua_State* L);

    int32 initNpcAi(lua_State* L);
    int32 isNM(lua_State* L);
    int32 setUnkillable(lua_State* L);
    int32 getBattlefield(lua_State* L);

    int32 getNewPlayer(lua_State* L);
    int32 setNewPlayer(lua_State* L);

    int32 getMentor(lua_State* L);
    int32 setMentor(lua_State* L);

    int32 hideName(lua_State* L);
    int32 untargetable(lua_State* L);
    int32 hideHP(lua_State* L);
    int32 hideModel(lua_State* L);
    int32 breathDmgTaken(lua_State* L);
    int32 magicDmgTaken(lua_State* L);
    int32 physicalDmgTaken(lua_State* L);
    int32 rangedDmgTaken(lua_State* L);

    int32 entityVisualPacket(lua_State* L);
    int32 entityAnimationPacket(lua_State* L);
    int32 getPartyLeader(lua_State* L);
    int32 getParty(lua_State* L);
    int32 getAlliance(lua_State* L);
    int32 messageText(lua_State* L);
    int32 instanceEntry(lua_State* L);
    int32 getInstance(lua_State* L);
    int32 setInstance(lua_State* L);
    int32 createInstance(lua_State* L);
    int32 getEnmityList(lua_State* L);
    int32 spawn(lua_State* L);
    int32 getCurrentAction(lua_State* L);
    int32 getAllegiance(lua_State* L);
    int32 setAllegiance(lua_State* L);
    int32 stun(lua_State* L);
    int32 weaknessTrigger(lua_State* L);
    int32 setBehaviour(lua_State* L);
    int32 getBehaviour(lua_State* L);
    int32 reloadParty(lua_State* L);
    int32 getModelId(lua_State* L);
    int32 setModelId(lua_State* L);
    int32 setTrueDetection(lua_State* L);
    int32 instantiateMob(lua_State* L);

    int32 getActiveManeuvers(lua_State*);
    int32 removeOldestManeuver(lua_State*);
    int32 removeAllManeuvers(lua_State*);
    int32 addBurden(lua_State* L);

    int32 setElevator(lua_State* L);

    int32 storeWithPorterMoogle(lua_State* L);
    int32 getRetrievableItemsForSlip(lua_State *L);
    int32 retrieveItemFromSlip(lua_State *L);

    int32 getILvlMacc(lua_State *L);

    int32 getConfrontationEffect(lua_State* L);
    int32 copyConfrontationEffect(lua_State* L);    // copy confrontation effect, param = targetEntity:getShortID()

    int32 queue(lua_State* L);
    int32 timer(lua_State* L); //execute lua closure after some time

    int32 addListener(lua_State* L);
    int32 removeListener(lua_State* L);
    int32 triggerListener(lua_State* L);

    int32 removeAmmo(lua_State* L);
    int32 takeWeaponskillDamage(lua_State* L);

    int32 setEquipBlock(lua_State* L);
    int32 setStatDebilitation(lua_State* L);
    int32 unequipItem(lua_State* L);
    int32 recalculateStats(lua_State* L);
    int32 checkImbuedItems(lua_State* L);

    int32 getNearbyEntities(lua_State* L);
    int32 getAutomatonFrame(lua_State* L);
    int32 getAutomatonHead(lua_State* L);
};

#endif
