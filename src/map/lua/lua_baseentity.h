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

    static const char className[];
    static Lunar<CLuaBaseEntity>::Register_t methods[];

    CLuaBaseEntity(lua_State*);
    CLuaBaseEntity(CBaseEntity*);

    CBaseEntity* GetBaseEntity()const
    {
        return m_PBaseEntity;
    }

    std::int32_t ChangeMusic(lua_State* L);        // Sets the specified music Track for specified music block.

    std::int32_t warp(lua_State*);                 // Returns Character to home point
    std::int32_t leavegame(lua_State*);            // Character leaving game
    std::int32_t bringPlayer(lua_State*);          // warps target to self
    std::int32_t gotoPlayer(lua_State*);           // warps self to target player
    std::int32_t getID(lua_State *L);              // Gets Entity Id
    std::int32_t getShortID(lua_State *L);
    std::int32_t getCursorTarget(lua_State *L);    // Returns the ID any object under players in game cursor.
    std::int32_t getPool(lua_State *L);            // Returns a mobs pool ID. If entity is not a mob, returns nil.
    std::int32_t getName(lua_State *L);            // Gets Entity Name
    std::int32_t getModelSize(lua_State *L);       // Gets model size

    std::int32_t getHPP(lua_State*);               // Returns Entity Health %
    std::int32_t getHP(lua_State*);                // Returns Entity Health
    std::int32_t getGender(lua_State*);            // Returns the player character's gender
    std::int32_t getBaseHP(lua_State*);            // Returns Entity base Health before modifiers
    std::int32_t addHP(lua_State*);                // Modify hp of Entity +/-
    std::int32_t restoreHP(lua_State*);            // Modify hp of Entity, but check if alive first
    std::int32_t delHP(lua_State*);                // Subtract hp of Entity
    std::int32_t setHP(lua_State*);                // Set hp of Entity to value
    std::int32_t getMP(lua_State*);                // Gets MP of Entity
    std::int32_t getBaseMP(lua_State*);            // Gets base MP before modifiers of Entity
    std::int32_t addMP(lua_State*);                // Modify mp of Entity +/-
    std::int32_t restoreMP(lua_State*);            // Modify mp of Entity, but check if alive first
    std::int32_t delMP(lua_State*);                // Subtract mp of Entity
    std::int32_t setMP(lua_State*);                // Set mp of Entity to value
    std::int32_t getTP(lua_State*);                // Get tp of Entity
    std::int32_t addTP(lua_State*);                // Modify tp of Entity +/-
    std::int32_t delTP(lua_State*);                // Subtract tp of Entity
    std::int32_t setTP(lua_State*);                // Set tp of Entity to value
    std::int32_t getRangedDmg(lua_State*);         // Get ranged weapon DMG rating
    std::int32_t getRangedDmgForRank(lua_State*);  // Get ranged weapond DMG rating used for calculating rank
    std::int32_t getAmmoDmg(lua_State*);           // Get ammo DMG rating
    std::int32_t getRATT(lua_State*);              // Get total r.attack
    std::int32_t getRACC(lua_State*);              // Get total r.acc
    std::int32_t getACC(lua_State*);               // Get total ACC
    std::int32_t getEVA(lua_State*);               // Get total EVA
    std::int32_t capSkill(lua_State*);             // Caps the given skill id for the job you're on (GM COMMAND)
    std::int32_t capAllSkills(lua_State*);         // Caps All skills, GM command

    std::int32_t getMaxHP(lua_State*);             // Get max hp of entity
    std::int32_t getMaxMP(lua_State*);             // Get max mp of entity

    std::int32_t getStat(lua_State*);              // STR,DEX,VIT,AGI,INT,MND,CHR,ATT,DEF

    std::int32_t getXPos(lua_State*);              // Get Entity X position
    std::int32_t getYPos(lua_State*);              // Get Entity Y position
    std::int32_t getZPos(lua_State*);              // Get Entity Z position
    std::int32_t getRotPos(lua_State*);            // Get Entity Rot position
    std::int32_t setPos(lua_State*);               // Set Entity position (x,y,z,rot) or (x,y,z,rot,zone)
    std::int32_t teleport(lua_State*);             // Set Entity position (without entity despawn/spawn packets)
    std::int32_t getPos(lua_State*);               // Get Entity position (x,y,z)
    std::int32_t getSpawnPos(lua_State*);          // Get Mob spawn position (x,y,z)
    std::int32_t getZone(lua_State*);              // Get Entity zone
    std::int32_t getZoneID(lua_State*);            // Get Entity zone ID
    std::int32_t getZoneName(lua_State*);          // Get Entity zone name
    std::int32_t isInMogHouse(lua_State*);         // Check if entity inside a mog house
    std::int32_t getCurrentRegion(lua_State*);     // Get Entity conquest region
    std::int32_t getPreviousZone(lua_State*);      // Get Entity previous zone
    std::int32_t getContinentID(lua_State*);       // узнаем континент, на котором находится сущность
    std::int32_t isZoneVisited(lua_State*);        // true если указанная зона посещалась персонажем ранее
    std::int32_t getWeather(lua_State*);           // Get Weather condition
    std::int32_t setWeather(lua_State*);           // Set Weather condition (GM COMMAND)

    std::int32_t speed(lua_State*);                // скорость передвижения сущности
    std::int32_t getAnimation(lua_State*);         // Get Entity Animation
    std::int32_t setAnimation(lua_State*);         // Set Entity Animation
    std::int32_t AnimationSub(lua_State*);         // get or set animationsub
    std::int32_t costume(lua_State*);              // get or set user costume
    std::int32_t costume2(lua_State*);             // set monstrosity costume
    std::int32_t canUseCostume(lua_State*);        // check to see if character can use costume, 0 if so
    std::int32_t canUseChocobo(lua_State *L);      // check to see if character can use chocobo, 0 if so
    std::int32_t canUsePet(lua_State *L);          // check to see if character can call pet, 0 if so

    std::int32_t addTreasure(lua_State*);          // Add item to directly to treasure pool
    std::int32_t addItem(lua_State*);              // Add item to Entity inventory (additem(itemNumber,quantity))
    std::int32_t hasItem(lua_State*);              // Check to see if Entity has item in inventory (hasItem(itemNumber))
    std::int32_t addUsedItem(lua_State*);          // Add charged item with timer already on full cooldown
    std::int32_t addTempItem(lua_State*);          // Add temp item to Entity Temp inventory
    std::int32_t delItem(lua_State*);
    std::int32_t getFreeSlotsCount(lua_State*);    // Gets value of free slots in Entity inventory
    std::int32_t createWornItem(lua_State*);       // Update this item in worn item (player:createWornItem(itemid))
    std::int32_t hasWornItem(lua_State*);          // Check if the item is already worn (player:hasWornItem(itemid))
    std::int32_t getStorageItem(lua_State*);       // returns item object player:getStorageItem(containerid, slotid, equipslotid)
    std::int32_t getRace(lua_State*);              // Gets Race of Entity
    std::int32_t getNation(lua_State*);            // Gets Nation of Entity
    std::int32_t setNation(lua_State*);            // Sets Nation of Entity
    std::int32_t getCampaignAllegiance(lua_State*); // Gets Campaign Allegiance of Entity
    std::int32_t setCampaignAllegiance(lua_State*); // Sets Campaign Allegiance of Entity

    std::int32_t addQuest(lua_State*);             // Add Quest to Entity Quest Log
    std::int32_t delQuest(lua_State*);             // Remove quest from quest log (should be used for debugging only)
    std::int32_t getQuestStatus(lua_State*);       // Get Quest Status
    std::int32_t hasCompleteQuest(lua_State*);     // Checks if quest has been completed
    std::int32_t completeQuest(lua_State*);        // Set a quest status to complete

    std::int32_t addMission(lua_State*);           // Add Mission
    std::int32_t delMission(lua_State*);           // Delete Mission from Mission Log
    std::int32_t hasCompletedMission(lua_State*);  // Checks if mission has been completed
    std::int32_t getCurrentMission(lua_State*);    // Gets the current mission
    std::int32_t completeMission(lua_State*);      // Complete Mission

    std::int32_t addAssault(lua_State*);           // Add Mission
    std::int32_t delAssault(lua_State*);           // Delete Mission from Mission Log
    std::int32_t hasCompletedAssault(lua_State*);  // Checks if mission has been completed
    std::int32_t getCurrentAssault(lua_State*);    // Gets the current mission
    std::int32_t completeAssault(lua_State*);      // Complete Mission

    std::int32_t getRank(lua_State*);              // Get Current Rank
    std::int32_t setRank(lua_State*);              // Set Rank

    std::int32_t getRankPoints(lua_State*);        // Get Current Rank points
    std::int32_t setRankPoints(lua_State*);        // Set Current Rank points
    std::int32_t addRankPoints(lua_State*);        // Add rank points to existing rank point total

    std::int32_t addKeyItem(lua_State*);           // Add key item to Entity Key Item collection
    std::int32_t seenKeyItem(lua_State*);          // If Key Item is viewed, add it to the seen key item collection
    std::int32_t unseenKeyItem(lua_State*);        // Attempt to remove the keyitem from the seen key item collection, only works on logout
    std::int32_t hasKeyItem(lua_State*);           // Checks Entity key item collection to see if Entity has the key item
    std::int32_t delKeyItem(lua_State*);           // Removes key item from Entity key item collection

    std::int32_t getSkillLevel(lua_State*);        // Get Current Skill Level
    std::int32_t setSkillLevel(lua_State*);        // Set Current Skill Level
    std::int32_t getMaxSkillLevel(lua_State*);     // Get Skill Cap for skill and rank
    std::int32_t getSkillRank(lua_State*);         // Get your current skill craft Rank
    std::int32_t setSkillRank(lua_State*);         // Set new skill craft rank
    std::int32_t getCharSkillLevel(lua_State*);    // Get char skill level
    std::int32_t getWeaponSkillLevel(lua_State*);  // Get Skill for equipped weapon
    std::int32_t addSpell(lua_State*);             // Add spell to Entity spell list
    std::int32_t hasSpell(lua_State*);             // Check to see if character has item in spell list
    std::int32_t canLearnSpell(lua_State*);        // Check to see if character can learn spell, 0 if so
    std::int32_t delSpell(lua_State*);             // Remove spell from Entity spell list

    std::int32_t addLearnedAbility(lua_State*);    // Add spell to Entity spell list
    std::int32_t hasLearnedAbility(lua_State*);    // Check to see if character has item in spell list
    std::int32_t canLearnAbility(lua_State*);      // Check to see if character can learn spell, 0 if so
    std::int32_t delLearnedAbility(lua_State*);    // Remove spell from Entity spell list

    std::int32_t addLearnedWeaponskill(lua_State*);
    std::int32_t hasLearnedWeaponskill(lua_State*);
    std::int32_t delLearnedWeaponskill(lua_State*);

    std::int32_t getMainJob(lua_State*);           // Returns Entity Main Job
    std::int32_t getMainLvl(lua_State*);           // Gets Entity Main Job Level
    std::int32_t getSubJob(lua_State*);            // Get Entity Sub Job
    std::int32_t getSubLvl(lua_State*);            // Get Entity Sub Job Level
    std::int32_t unlockJob(lua_State*);            // Unlocks a job for the entity, sets job level to 1
    std::int32_t levelCap(lua_State*);             // genkai
    std::int32_t levelRestriction(lua_State*);     // Establish/return current level restriction
    std::int32_t sjRestriction(lua_State*);        // Establish/return subjob restriction

    std::int32_t showText(lua_State*);             // Displays Dialog for npc
    std::int32_t messageSpecial(lua_State*);       // Sends Special Message
    std::int32_t messageSystem(lua_State*);        // Sends System Message
    std::int32_t messageBasic(lua_State*);         // Sends Basic Message
    std::int32_t messagePublic(lua_State*);        // Sends a public Basic Message
    std::int32_t clearTargID(lua_State*);          // clears target of entity

    std::int32_t release(lua_State*);              // Stops event
    std::int32_t startEvent(lua_State*);           // Begins Event
    std::int32_t startEventString(lua_State*);     // Begins Event with string param (0x33 packet)
    std::int32_t updateEvent(lua_State*);          // Updates event
    std::int32_t updateEventString(lua_State*);    // (string, string, string, string, std::uint32_t, ...)

    std::int32_t getEventTarget(lua_State*);       //
    std::int32_t openSendBox(lua_State*);          // Opens send box (to deliver items)

    std::int32_t sendMenu(lua_State*);             // Displays a menu (AH,Raise,Tractor,MH etc)
    std::int32_t sendGuild(lua_State*);            // Sends guild shop menu
    std::int32_t getCurrentGPItem(lua_State*);     // Gets current GP item id and max points
    std::int32_t addGuildPoints(lua_State*);       // add guild points

    std::int32_t bcnmRegister(lua_State*);                  //Attempts to register a bcnm battlefield (used by Dynamis and BCNM)
    std::int32_t bcnmEnter(lua_State*);                     //Enter a bcnm battlefield (used by Dynamis and BCNM)
    std::int32_t bcnmLeave(lua_State*);                     //Leave a bcnm battlefield
    std::int32_t isInBcnm(lua_State*);                      //true if you're INSIDE the bc (not just the status)
    std::int32_t isBcnmsFull(lua_State*);                   //true if all 3 battlefield are full
    std::int32_t isSpecialBattlefieldEmpty(lua_State*);     // 1 if this battlefield is full
    std::int32_t getSpecialBattlefieldLeftTime(lua_State*); // return left time of the specific instance
    std::int32_t addTimeToSpecialBattlefield(lua_State*);   // add time of the specific instance
    std::int32_t BCNMSetLoot(lua_State*);                   // set a lootlist for a special inctance
    std::int32_t RestoreAndHealOnBattlefield(lua_State*);   // restore ability , PM and PV on the specific instance
    std::int32_t getBattlefieldID(lua_State*);              //returns 1 2 or 3 if the player can enter a bcnm with the instance assigned
    std::int32_t getBCNMloot(lua_State*);                   //triggers if the player opens the chest inside bcnm
    std::int32_t addPlayerToSpecialBattlefield(lua_State*); //for limbus

    std::int32_t isSpawned(lua_State*);
    std::int32_t setSpawn(lua_State*);                // Sets spawn point
    std::int32_t setRespawnTime(lua_State*);          // set respawn time
    std::int32_t getRespawnTime(lua_State*);
    std::int32_t getDynamisUniqueID(lua_State*);      //Get unique Dynamis ID
    std::int32_t addPlayerToDynamis(lua_State*);      //Add player to the Dynamis
    std::int32_t addTimeToDynamis(lua_State*);        //Add time to the Dynamis
    std::int32_t launchDynamisSecondPart(lua_State*); //Spawn Mob part 2 when mega boss is defeated
    std::int32_t isInDynamis(lua_State*);             //If player is in Dynamis return true else false
    std::int32_t getStatPoppedMobs(lua_State*);       // True if dyna statue has popped mobs
    std::int32_t setStatPoppedMobs(lua_State*);       // Set to 1 for true, 0 for false

    std::int32_t isInBattlefieldList(lua_State*);  // Return true is the mob is in battlefield list
    std::int32_t addInBattlefieldList(lua_State*); // Add the mob to the battlefield list

    std::int32_t getVar(lua_State*);               // Returns a character variable
    std::int32_t setVar(lua_State*);               // Sets a character variable
    std::int32_t addVar(lua_State*);               // Increments/decriments/sets a character variable

    std::int32_t clearGearSetMods(lua_State*);     // Clears a characters gear set mods
    std::int32_t addGearSetMod(lua_State*);        // Sets the characters gear set mod
    std::int32_t hasGearSetMod(lua_State*);        // Checks if character already has a gear set mod

    std::int32_t setPetName(lua_State*);
    std::int32_t getAutomatonName(lua_State*);

    std::int32_t setMaskBit(lua_State*);           // Sets a single bit in a character variable
    std::int32_t getMaskBit(lua_State*);           // Retrieves a single bit in a character variable
    std::int32_t countMaskBits(lua_State*);        // Retrieves number of true bits in a character variable
    std::int32_t isMaskFull(lua_State*);           // Checks if a bitmask stored in a character varable of a specified size contains all set bits

    std::int32_t setHomePoint(lua_State*);         // Sets character's homepoint
    std::int32_t tradeComplete(lua_State*);        // Complete trade with an npc
    std::int32_t confirmTrade(lua_State*);         // Complete trade with an npc, only removing confirmed items

    std::int32_t hasTitle(lua_State*);
    std::int32_t getTitle(lua_State*);             // Gets character's title
    std::int32_t addTitle(lua_State*);
    std::int32_t delTitle(lua_State*);
    std::int32_t setTitle(lua_State*);             // Sets character's title

    std::int32_t getGil(lua_State*);               // Gets character's gil amount
    std::int32_t addGil(lua_State*);               // adds gil to character
    std::int32_t delGil(lua_State*);               // removes gil from character
    std::int32_t setGil(lua_State*);               // sets gil to value

    std::int32_t equipItem(lua_State*);
    std::int32_t getEquipID(lua_State*);           // Gets the Item Id of the item in specified slot
    std::int32_t getShieldSize(lua_State*);        // Gets shield size of character
    std::int32_t lockEquipSlot(lua_State*);        // блокируем ячейку экипировки
    std::int32_t unlockEquipSlot(lua_State*);      // снимаем блокировку с ячейки экипировки
    std::int32_t canEquipItem(lua_State*);         // returns true if the player is able to equip the item

    std::int32_t createShop(lua_State*);           // Prepare the container for work of shop ??
    std::int32_t addShopItem(lua_State*);          // Adds item to shop container (16 max)

    std::int32_t getFame(lua_State*);              // Gets Fame
    std::int32_t setFame(lua_State*);              // Sets Fame
    std::int32_t addFame(lua_State*);              // Adds Fame
    std::int32_t getFameLevel(lua_State*);         // Gets Fame Level for specified nation

    std::int32_t setStatus(lua_State*);            // Sets Character's Status
    std::int32_t getStatus(lua_State*);

    std::int32_t sendRaise(lua_State*);            // send raise request to char
    std::int32_t sendReraise(lua_State*);          // send raise request to char
    std::int32_t sendTractor(lua_State*);          // send tractor request to char
    std::int32_t SendRevision(lua_State*);         // send Git revision to char

    std::int32_t updateEnmity(lua_State*);           // Adds Enmity to player for specified mob
    std::int32_t updateClaim(lua_State*);           // Adds Enmity to player for specified mob and claims
    std::int32_t updateEnmityFromDamage(lua_State*); // Adds Enmity to player for specified mob for the damage specified
    std::int32_t updateEnmityFromCure(lua_State*);
    std::int32_t addEnmity(lua_State*);            // Add specified amount of enmity (target, CE, VE)
    std::int32_t resetEnmity(lua_State*);          //resets enmity to player for specificed mob
    std::int32_t lowerEnmity(lua_State*);          //lower enmity to player for specificed mob
    std::int32_t transferEnmity(lua_State*);
    std::int32_t getCE(lua_State*);                //gets current CE the mob has towards the player
    std::int32_t getVE(lua_State*);                //gets current VE the mob has towards the player
    std::int32_t setCE(lua_State*);                //sets current CE the mob has towards the player
    std::int32_t setVE(lua_State*);                //sets current VE the mob has towards the player

    std::int32_t hasImmunity(lua_State*);          // Check if the mob has immunity for a type of spell (list at mobentity.h)
    std::int32_t getBattleTime(lua_State*);        // Get the time in second of the battle
    std::int32_t rageMode(lua_State*);             // Add rage mode
    std::int32_t isUndead(lua_State*);             // True if mob is undead
    std::int32_t isMobType(lua_State*);            // True if mob is of type passed to function
    std::int32_t getSystem(lua_State*);
    std::int32_t getFamily(lua_State*);

    std::int32_t addStatusEffect(lua_State*);        // Adds status effect to character
    std::int32_t addStatusEffectEx(lua_State*);      // Adds status effect to character
    std::int32_t hasStatusEffect(lua_State*);        // Checks to see if character has specified effect
    std::int32_t hasStatusEffectByFlag(lua_State*);  // Checks to see if a character has an effect with the specified flag
    std::int32_t countEffect(lua_State*);            // Gets the number of effects of a specific type on the player
    std::int32_t hasBustEffect(lua_State*);          // Checks to see if a character has a specified busted corsair roll
    std::int32_t numBustEffects(lua_State*);         // Gets the number of bust effects on the player
    std::int32_t canGainStatusEffect(lua_State*);    // Returns true if the effect can be added
    std::int32_t getStatusEffect(lua_State*);        //
    std::int32_t getStatusEffects(lua_State*);
    std::int32_t delStatusEffect(lua_State*);        // Removes Status Effect
    std::int32_t delStatusEffectsByFlag(lua_State*); // Removes Status Effects by Flag
    std::int32_t delStatusEffectSilent(lua_State*);  // Removes Status Effect, suppresses message
    std::int32_t eraseStatusEffect(lua_State*);      // Used with "Erase" spell
    std::int32_t healingWaltz(lua_State*);           // Used with "Healing Waltz" ability
    std::int32_t dispelStatusEffect(lua_State*);     // Used with "Dispel" spell
    std::int32_t stealStatusEffect(lua_State*);      // Used in mob skills to steal effects
    std::int32_t dispelAllStatusEffect(lua_State*);  // Dispels all effects and returns number erased
    std::int32_t eraseAllStatusEffect(lua_State*);   // Erases all effects and returns number erased
    std::int32_t getStatusEffectElement(lua_State*); // returns the element of the status effect
    std::int32_t getPartyMember(lua_State* L);       // Get a character entity from another entity's party or alliance
    std::int32_t getPartySize(lua_State* L);         // Get the size of a party in an entity's alliance
    std::int32_t getAllianceSize(lua_State* L);      // Get the size of an entity's alliance
    std::int32_t addPartyEffect(lua_State*);         // Adds Effect to all party members
    std::int32_t removePartyEffect(lua_State*);      // Removes Effect from all party members
    std::int32_t hasPartyEffect(lua_State*);         // Has Effect from all party members
    std::int32_t addCorsairRoll(lua_State*);         // Adds corsair roll effect
    std::int32_t doWildCard(lua_State*);
    std::int32_t addBardSong(lua_State*);            // Adds bard song effect
    std::int32_t hasPartyJob(lua_State*);
    std::int32_t fold(lua_State*);
    std::int32_t hasCorsairEffect(lua_State*);

    std::int32_t addMod(lua_State*);                // Adds Modifier Value
    std::int32_t getMod(lua_State*);                // Retrieves Modifier Value
    std::int32_t delMod(lua_State*);                // Subtracts Modifier Value
    std::int32_t setMod(lua_State*);                // Sets Modifier Value

    std::int32_t addPetMod(lua_State*);
    std::int32_t delPetMod(lua_State*);
    std::int32_t setPetMod(lua_State*);

    std::int32_t getMobMod(lua_State*);
    std::int32_t setMobMod(lua_State*);
    std::int32_t addMobMod(lua_State*);
    std::int32_t delMobMod(lua_State*);

    std::int32_t hasTrait(lua_State*);

    std::int32_t addExp(lua_State*);                // Add to Character Experience
    std::int32_t delExp(lua_State*);                // Subtracts from Character Experience

    std::int32_t getPetElement(lua_State*);
    std::int32_t getPetName(lua_State*);
    std::int32_t charmPet(lua_State*);              // Charms Pet (Beastmaster ability only)
    std::int32_t charm(lua_State*);                 // applies charm on target
    std::int32_t uncharm(lua_State*);               // removes charm on target
    std::int32_t spawnPet(lua_State*);              // Calls Pet
    std::int32_t despawnPet(lua_State*);            // Despawns Pet
    std::int32_t petAttack(lua_State*);             // Despawns Pet
    std::int32_t petRetreat(lua_State*);
    std::int32_t petAbility(lua_State*);
    std::int32_t hasPet(lua_State*);                // returns true if the player has a pet
    std::int32_t getPet(lua_State*);                // Creates an LUA reference to a pet entity
    std::int32_t getPetID(lua_State*);              // If the entity has a pet, returns the PetID to identify pet type.
    std::int32_t isJugPet(lua_State*);              // If the entity has a pet, test if it is a jug pet.
    std::int32_t getCharmChance(lua_State*);        // Gets the chance the entity has to charm its target.
    std::int32_t familiar(lua_State*);              // familiar on pet

    std::int32_t wakeUp(lua_State*);                //wakes target if necessary
    std::int32_t needToZone(lua_State*);            // Check if player has zoned since the flag has been raised

    std::int32_t setFlag(lua_State*);
    std::int32_t moghouseFlag(lua_State*);
    std::int32_t showPosition(lua_State*);          // Display current position of character
    std::int32_t injectPacket(lua_State*);          // Send the character a packet kept in a file

    std::int32_t getContainerSize(lua_State*);      // Gets the current capacity of a container
    std::int32_t changeContainerSize(lua_State*);   // Increase/Decreases container size
    std::int32_t resetPlayer(lua_State*);           // if player is stuck, GM command @resetPlayer name
    std::int32_t setLevel(lua_State*);              // sets the character's level
    std::int32_t setsLevel(lua_State*);             // sets the character's level
    std::int32_t changeJob(lua_State*);             // changes the job of a char (testing only!)
    std::int32_t setMerits(lua_State*);             // set merits (testing only!)
    std::int32_t getMerit(lua_State*);
    std::int32_t getMeritCount(lua_State*);         // Gets a players current merit count.
    std::int32_t getPlaytime(lua_State*);
    std::int32_t changesJob(lua_State*);            // changes the sub job of a char (testing only!)
    std::int32_t getWeaponDmg(lua_State*);          // gets the current equipped weapons' DMG rating
    std::int32_t getOffhandDmg(lua_State*);         // gets the current equipped offhand's DMG rating (used in WS calcs)
    std::int32_t getWeaponDmgRank(lua_State*);      // gets the current equipped weapons' DMG rating for Rank calc
    std::int32_t getOffhandDmgRank(lua_State*);     // gets the current equipped offhand's DMG rating for Rank calc
    std::int32_t isWeaponTwoHanded(lua_State*);
    std::int32_t getMeleeHitDamage(lua_State*);     // gets the damage of a single hit vs the specified mob
    std::int32_t getWeaponSkillType(lua_State*);    // gets the type of weapon equipped
    std::int32_t getWeaponSubSkillType(lua_State*); // gets the subskill of weapon equipped
    std::int32_t getWSSkillchainProp(lua_State* L); // returns weapon skill's skillchain properties (up to 3)

    std::int32_t isBehind(lua_State*);               // true if you're behind the input target
    std::int32_t isFacing(lua_State*);               // true if you are facing the target
    std::int32_t getAngle(lua_State* L);             // return angle (rot) between two points (vector from a to b)
    std::int32_t getTrickAttackChar(lua_State*); //true if TA target is available
    std::int32_t getStealItem(lua_State*);           // gets ItemID of droplist steal item from mob
    std::int32_t itemStolen(lua_State*);             // sets mob's ItemStolen var = true

    std::int32_t openDoor(lua_State*);             // открываем дверь
    std::int32_t closeDoor(lua_State*);            // npc.closeDoor(timeToStayClosed)
    std::int32_t showNPC(lua_State*);              // Show an NPC
    std::int32_t hideNPC(lua_State*);              // hide an NPC
    std::int32_t updateNPCHideTime(lua_State*);    // Updates the length of time a NPC remains hidden, if shorter than the original hide time.

    std::int32_t addRecast(lua_State*);
    std::int32_t resetRecasts(lua_State*);         // Reset recasts for the caller
    std::int32_t resetRecast(lua_State*);          // Reset one recast ID

    std::int32_t getCurrency(lua_State*);          // Get Currency
    std::int32_t setCurrency(lua_State*);          // Set Currency
    std::int32_t addCurrency(lua_State*);          // Add Currency
    std::int32_t delCurrency(lua_State*);          // Delete Currency

    std::int32_t getCP(lua_State*);                // Get CP
    std::int32_t addCP(lua_State*);                // Add CP
    std::int32_t delCP(lua_State*);                // Delete CP

    std::int32_t getSeals(lua_State*);             // Get Seals (beastman seals, etc)
    std::int32_t addSeals(lua_State*);             // Add Seals
    std::int32_t delSeals(lua_State*);             // Delete Seals

    std::int32_t getAssaultPoint(lua_State*);      // Get points for an assault area
    std::int32_t addAssaultPoint(lua_State*);      // Add points for an assault area
    std::int32_t delAssaultPoint(lua_State*);      // Delete points for an assault area

    std::int32_t isJailed(lua_State *L);           // Is the player jailed
    std::int32_t jail(lua_State* L);

    std::int32_t addNationTeleport(lua_State*);     // Add new teleport: addNationTeleport(nation,number)
    std::int32_t getNationTeleport(lua_State*);     // Get teleport you can use by nation: getNationTeleport(nation)

    std::int32_t checkDistance(lua_State*);           // Check Distacnce and returns distance number
    std::int32_t checkValorCredit(lua_State*);
    std::int32_t checkSoloPartyAlliance(lua_State*);  // Check if Player is in Party or Alliance 0=Solo 1=Party 2=Alliance
    std::int32_t checkFovAllianceAllowed(lua_State*); // checks the map config, 1 if alliance is allowed to farm Fov pages

    std::int32_t getObjType(lua_State*);

    std::int32_t isPC(lua_State*);
    std::int32_t isNPC(lua_State*);
    std::int32_t isMob(lua_State*);
    std::int32_t isPet(lua_State*);
    std::int32_t isAlly(lua_State*);

    std::int32_t injectActionPacket(lua_State*);   // ONLY FOR DEBUGGING. Injects an action packet with the specified params.
    std::int32_t setMobFlags(lua_State*);          // Used to manipulate the mob's flags for testing.

    std::int32_t setDelay(lua_State*);             // sets a mobs weapon delay
    std::int32_t setDamage(lua_State*);            // sets a mobs weapon damage
    std::int32_t castSpell(lua_State*);            // forces a mob to cast a spell (parameter = spell ID, otherwise picks a spell from its list)
    std::int32_t useMobAbility(lua_State*);        // forces a mob to use a mobability (parameter = skill ID)
    std::int32_t useJobAbility(lua_State*);        // forces a job ability use (players/pets only)
    std::int32_t actionQueueEmpty(lua_State*);     // returns whether the action queue is empty or not
    std::int32_t actionQueueAbility(lua_State*);   // returns whether the action is from the action queue or not

    std::int32_t SetAutoAttackEnabled(lua_State*);   // halts/resumes auto attack of entity
    std::int32_t SetMagicCastingEnabled(lua_State*); // halt/resumes casting magic
    std::int32_t SetMobAbilityEnabled(lua_State*);   // halt/resumes mob skills
    std::int32_t SetMobSkillAttack(lua_State*);      // enable/disable using mobskills as regular attacks
    std::int32_t updateTarget(lua_State*);           // Force mob to update target from enmity container (ie after updateEnmity)

    std::int32_t getLocalVar(lua_State*);
    std::int32_t setLocalVar(lua_State*);
    std::int32_t resetLocalVars(lua_State*);

    std::int32_t setSpellList(lua_State*);
    std::int32_t hasSpellList(lua_State*);
    std::int32_t hasPreventActionEffect(lua_State*);

    std::int32_t hasValidJugPetItem(lua_State*);
    std::int32_t getTarget(lua_State*);
    std::int32_t hasTPMoves(lua_State*);
    std::int32_t getMaster(lua_State*);

    std::int32_t recalculateAbilitiesTable(lua_State*);
    std::int32_t recalculateSkillsTable(lua_State*);
    std::int32_t isSpellAoE(lua_State* L);

    std::int32_t checkNameFlags(lua_State* L);   // this is check and not get because it tests for a flag, it doesn't return all flags
    std::int32_t getGMLevel(lua_State* L);
    std::int32_t setGMLevel(lua_State* L);
    std::int32_t getGMHidden(lua_State* L);
    std::int32_t setGMHidden(lua_State* L);
    std::int32_t PrintToPlayer(lua_State* L);    // for sending debugging messages/command confirmations to the player's client
    // == Pathfind Methods ==
    std::int32_t pathThrough(lua_State* L);      // walk at normal speed through the given points
    // std::int32_t WarpTo(lua_State* L);        // warp to the given point
    // std::int32_t RoamAround(lua_State* L);    // pick a random point to walk to
    // std::int32_t LimitDistance(lua_State* L); // limits the current path distance to given max distance

    std::int32_t atPoint(lua_State* L);          // is at given point
    std::int32_t lookAt(lua_State* L);           // look at given position
    std::int32_t isFollowingPath(lua_State* L);  // checks if the entity is following a path
    std::int32_t clearPath(lua_State* L);        // removes current pathfind and stops moving
    std::int32_t wait(lua_State* L);             // make the npc wait a number of ms and then back into roam
    std::int32_t pathTo(lua_State* L);           // set new path to point without changing action

    std::int32_t unlockAttachment(lua_State* L);
    std::int32_t hasAttachment(lua_State* L);
    std::int32_t disableLevelSync(lua_State* L);
    std::int32_t updateHealth(lua_State* L);

    std::int32_t initNpcAi(lua_State* L);
    std::int32_t isNM(lua_State* L);
    std::int32_t setUnkillable(lua_State* L);
    std::int32_t getBattlefield(lua_State* L);

    std::int32_t getNewPlayer(lua_State* L);
    std::int32_t setNewPlayer(lua_State* L);

    std::int32_t getMentor(lua_State* L);
    std::int32_t setMentor(lua_State* L);

    std::int32_t hideName(lua_State* L);
    std::int32_t untargetable(lua_State* L);
    std::int32_t hideHP(lua_State* L);
    std::int32_t hideModel(lua_State* L);
    std::int32_t breathDmgTaken(lua_State* L);
    std::int32_t magicDmgTaken(lua_State* L);
    std::int32_t physicalDmgTaken(lua_State* L);
    std::int32_t rangedDmgTaken(lua_State* L);

    std::int32_t entityVisualPacket(lua_State* L);
    std::int32_t entityAnimationPacket(lua_State* L);
    std::int32_t getPartyLeader(lua_State* L);
    std::int32_t getParty(lua_State* L);
    std::int32_t getAlliance(lua_State* L);
    std::int32_t messageText(lua_State* L);
    std::int32_t instanceEntry(lua_State* L);
    std::int32_t getInstance(lua_State* L);
    std::int32_t setInstance(lua_State* L);
    std::int32_t createInstance(lua_State* L);
    std::int32_t getEnmityList(lua_State* L);
    std::int32_t spawn(lua_State* L);
    std::int32_t getCurrentAction(lua_State* L);
    std::int32_t getAllegiance(lua_State* L);
    std::int32_t setAllegiance(lua_State* L);
    std::int32_t stun(lua_State* L);
    std::int32_t weaknessTrigger(lua_State* L);
    std::int32_t setBehaviour(lua_State* L);
    std::int32_t getBehaviour(lua_State* L);
    std::int32_t reloadParty(lua_State* L);
    std::int32_t getModelId(lua_State* L);
    std::int32_t setModelId(lua_State* L);
    std::int32_t setTrueDetection(lua_State* L);
    std::int32_t setAggressive(lua_State* L);
    std::int32_t instantiateMob(lua_State* L);

    std::int32_t getActiveManeuvers(lua_State*);
    std::int32_t removeOldestManeuver(lua_State*);
    std::int32_t removeAllManeuvers(lua_State*);
    std::int32_t addBurden(lua_State* L);

    std::int32_t setElevator(lua_State* L);

    std::int32_t storeWithPorterMoogle(lua_State* L);
    std::int32_t getRetrievableItemsForSlip(lua_State *L);
    std::int32_t retrieveItemFromSlip(lua_State *L);

    std::int32_t getILvlMacc(lua_State *L);

    std::int32_t getConfrontationEffect(lua_State* L);
    std::int32_t copyConfrontationEffect(lua_State* L);    // copy confrontation effect, param = targetEntity:getShortID()

    std::int32_t queue(lua_State* L);
    std::int32_t timer(lua_State* L); //execute lua closure after some time

    std::int32_t addListener(lua_State* L);
    std::int32_t removeListener(lua_State* L);
    std::int32_t triggerListener(lua_State* L);

    std::int32_t removeAmmo(lua_State* L);
    std::int32_t takeWeaponskillDamage(lua_State* L);
    std::int32_t handleAfflatusMiseryDamage(lua_State* L);

    std::int32_t setEquipBlock(lua_State* L);
    std::int32_t setStatDebilitation(lua_State* L);
    std::int32_t unequipItem(lua_State* L);
    std::int32_t recalculateStats(lua_State* L);
    std::int32_t checkImbuedItems(lua_State* L);

    std::int32_t getNearbyEntities(lua_State* L);
    std::int32_t getAutomatonFrame(lua_State* L);
    std::int32_t getAutomatonHead(lua_State* L);

    std::int32_t getDropID(lua_State* L);
    std::int32_t setDropID(lua_State* L);

    std::int32_t resetAI(lua_State* L);
    std::int32_t getEntity(lua_State* L);

    std::int32_t canChangeState(lua_State* L);

    std::int32_t isAlive(lua_State* L);
    std::int32_t isDead(lua_State* L);

    std::int32_t engage(lua_State* L);
    std::int32_t disengage(lua_State* L);
    std::int32_t isEngaged(lua_State* L);
};

#endif
