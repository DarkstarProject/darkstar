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

#ifndef _LUAUTILS_H
#define _LUAUTILS_H

#include <optional>
#include "../../common/cbasetypes.h"
#include "../../common/lua/lunar.h"
#include "../../common/taskmgr.h"
#include "../spell.h"
#include "lua_ability.h"
#include "lua_baseentity.h"
#include "lua_mobskill.h"
#include "lua_action.h"
#include "lua_battlefield.h"
#include "lua_instance.h"
#include "lua_mobskill.h"
#include "lua_region.h"
#include "lua_spell.h"
#include "lua_statuseffect.h"
#include "lua_trade_container.h"
#include "lua_zone.h"
#include "lua_item.h"

/************************************************************************
*                                                                       *
*                                                                       *
*                                                                       *
************************************************************************/

class CAbility;
class CSpell;
class CBaseEntity;
class CBattleEntity;
class CAutomatonEntity;
class CCharEntity;
class CBattlefield;
class CItem;
class CMobSkill;
class CRegion;
class CStatusEffect;
class CTradeContainer;
class CItemPuppet;
class CItemWeapon;
class CInstance;
class CWeaponSkill;
class CZone;
struct action_t;
struct actionList_t;
struct actionTarget_t;

enum ConquestUpdate : uint8;

namespace luautils
{
    extern struct lua_State* LuaHandle;

    std::int32_t init();
    std::int32_t free();
    std::int32_t garbageCollect(); // performs a full garbage collecting cycle
    int register_fp(int index);
    void unregister_fp(int);
    std::int32_t print(lua_State*);
    std::int32_t prepFile(int8*, const char*);

    template<class T, class L>
    void pushLuaType(T* obj) { Lunar<L>::push(LuaHandle, new L(obj), true); }

    //TODO: if the classes themselves held the lua method declarations, this voodoo to get the wrappers wouldn't be needed!
    template<class T>
    typename std::enable_if_t<std::is_pointer<T>::value> pushArg(CBaseEntity* arg) { pushLuaType<CBaseEntity, CLuaBaseEntity>(arg); }
    template<class T>
    typename std::enable_if_t<std::is_pointer<T>::value> pushArg(CAbility* arg) { pushLuaType<CAbility, CLuaAbility>(arg); }
    template<class T>
    typename std::enable_if_t<std::is_pointer<T>::value> pushArg(CMobSkill* arg) { pushLuaType<CMobSkill, CLuaMobSkill>(arg); }
    template<class T>
    typename std::enable_if_t<std::is_pointer<T>::value> pushArg(action_t* arg) { pushLuaType<action_t, CLuaAction>(arg); }
    template<class T>
    typename std::enable_if_t<std::is_pointer<T>::value> pushArg(CBattlefield* arg) { pushLuaType<CBattlefield, CLuaBattlefield>(arg); }
    template<class T>
    typename std::enable_if_t<std::is_pointer<T>::value> pushArg(CInstance* arg) { pushLuaType<CInstance, CLuaInstance>(arg); }
    template<class T>
    typename std::enable_if_t<std::is_pointer<T>::value> pushArg(CRegion* arg) { pushLuaType<CRegion, CLuaRegion>(arg); }
    template<class T>
    typename std::enable_if_t<std::is_pointer<T>::value> pushArg(CSpell* arg) { pushLuaType<CSpell, CLuaSpell>(arg); }
    template<class T>
    typename std::enable_if_t<std::is_pointer<T>::value> pushArg(CStatusEffect* arg) { pushLuaType<CStatusEffect, CLuaStatusEffect>(arg); }
    template<class T>
    typename std::enable_if_t<std::is_pointer<T>::value> pushArg(CTradeContainer* arg) { pushLuaType<CTradeContainer, CLuaTradeContainer>(arg); }
    template<class T>
    typename std::enable_if_t<std::is_pointer<T>::value> pushArg(CZone* arg) { pushLuaType<CZone, CLuaZone>(arg); }
    template<class T>
    typename std::enable_if_t<std::is_pointer<T>::value> pushArg(CItem* arg) { pushLuaType<CItem, CLuaItem>(arg); }
    template<class T>
    typename std::enable_if_t<std::is_integral<T>::value> pushArg(T arg) { lua_pushinteger(LuaHandle, arg); }
    template<class T>
    typename std::enable_if_t<std::is_floating_point<T>::value> pushArg(T arg) { lua_pushnumber(LuaHandle, arg); }
    template<class T>
    typename std::enable_if_t<std::is_same<bool, T>::value> pushArg(T arg) { lua_pushboolean(LuaHandle, arg); }
    template<class T>
    typename std::enable_if_t<std::is_same<nullptr_t, T>::value> pushArg(T arg) { lua_pushnil(LuaHandle); }

    void pushFunc(int lua_func, int index = 0);
    void callFunc(int nargs);

    std::int32_t random(lua_State*);

    std::int32_t SendEntityVisualPacket(lua_State*);                                    // временное решение для работы гейзеров в Dangruf_Wadi
    std::int32_t GetNPCByID(lua_State*);                                               // Returns NPC By Id
    std::int32_t GetMobByID(lua_State*);                                               // Returns Mob By Id
    std::int32_t GetMobIDByJob(lua_State*);                                            // Return mobid by job
    std::int32_t WeekUpdateConquest(lua_State*);
    std::int32_t GetRegionOwner(lua_State*);                                           // узнаем страну, владеющую текущим регионом
    std::int32_t GetRegionInfluence(lua_State*);                                       // Return influence graphics
    std::int32_t getNationRank(lua_State* L);
    std::int32_t getConquestBalance(lua_State* L);
    std::int32_t isConquestAlliance(lua_State* L);
    std::int32_t SetRegionalConquestOverseers(uint8 regionID);                         // Update NPC Conquest Guard
    std::int32_t setMobPos(lua_State*);                                                // set a mobs position (only if mob is not in combat)

    std::int32_t getAbility(lua_State*);
    std::int32_t getSpell(lua_State*);

    std::int32_t SpawnMob(lua_State*);                                                 // Spawn Mob By Mob Id - NMs, BCNM...
    std::int32_t DespawnMob(lua_State*);                                               // Despawn (Fade Out) Mob By Id
    std::int32_t GetPlayerByName(lua_State*);                                          // Gets Player ref from a name supplied
    std::int32_t GetPlayerByID(lua_State*);                                            // Gets Player ref from an Id supplied
    std::int32_t GetMobAction(lua_State*);                                             // Get Mobs current action
    std::int32_t VanadielTime(lua_State*);                                             // Gets the current Vanadiel Time in timestamp format (SE epoch in earth seconds)
    std::int32_t VanadielTOTD(lua_State*);                                             // текущее игровое время суток
    std::int32_t VanadielHour(lua_State*);                                             // текущие Vanadiel часы
    std::int32_t VanadielMinute(lua_State*);                                           // текущие Vanadiel минуты
    std::int32_t VanadielDayOfTheYear(lua_State*);                                     // Gets Integer Value for Day of the Year (Jan 01 = Day 1)
    std::int32_t VanadielDayOfTheMonth(lua_State*);                                    // Gets day of the month (Feb 6 = Day 6)
    std::int32_t VanadielYear(lua_State*);                                             // Gets the current Vanadiel Year
    std::int32_t VanadielMonth(lua_State*);                                            // Gets the current Vanadiel Month
    std::int32_t VanadielDayElement(lua_State*);                                       // Gets element of the day (0: fire, ...)
    std::int32_t VanadielMoonPhase(lua_State*);                                        // Gets the current Vanadiel Moon Phase
    std::int32_t VanadielMoonDirection(lua_State* L);                                  // Gets the current Vanadiel Moon Phasing direction (waxing, waning, neither)
    std::int32_t VanadielRSERace(lua_State* L);                                        // Gets the current Race for RSE gear quest
    std::int32_t VanadielRSELocation(lua_State* L);                                    // Gets the current Location for RSE gear quest
    std::int32_t SetVanadielTimeOffset(lua_State* L);
    std::int32_t IsMoonNew(lua_State* L);                                              // Returns true if the moon is new
    std::int32_t IsMoonFull(lua_State* L);                                             // Returns true if the moon is full
    std::int32_t StartElevator(lua_State*);
    std::int32_t GetServerVariable(lua_State*);
    std::int32_t SetServerVariable(lua_State *);
    std::int32_t clearVarFromAll(lua_State *);                                         // Deletes a specific player variable from all players
    std::int32_t terminate(lua_State*);                                                // Logs off all characters and terminates the server

    std::int32_t GetTextIDVariable(uint16 ZoneID, const char* variable);               // загружаем значение переменной TextID указанной зоны
    uint8 GetSettingsVariable(const char* variable);                            // Gets a Variable Value from Settings.lua
    bool IsContentEnabled(const char* content);                                 // Check if the content is enabled in settings.lua

    std::int32_t OnGameDay(CZone* PZone);                                              // Automatic action of NPC every game day
    std::int32_t OnGameHour(CZone* PZone);                                             // Automatic action of NPC every game hour
    std::int32_t OnZoneWeatherChange(uint16 ZoneID, uint8 weather);
    std::int32_t OnTOTDChange(uint16 ZoneID, uint8 TOTD);

    std::int32_t OnGameIn(CCharEntity* PChar, bool zoning);                            //
    std::int32_t OnZoneIn(CCharEntity* PChar);                                         // triggers when a player zones into a zone
    void AfterZoneIn(CBaseEntity* PChar);                                      // triggers after a player has finished zoning in
    std::int32_t OnZoneInitialise(uint16 ZoneID);                                      // triggers when zone is loaded
    std::int32_t OnRegionEnter(CCharEntity* PChar, CRegion* PRegion);                  // when player enters a region of a zone
    std::int32_t OnRegionLeave(CCharEntity* PChar, CRegion* Pregion);                  // when player leaves a region of a zone
    std::int32_t OnTransportEvent(CCharEntity* PChar, uint32 TransportID);
    std::int32_t OnConquestUpdate(CZone* PZone, ConquestUpdate type);                  // hourly conquest update

    std::int32_t OnTrigger(CCharEntity* PChar, CBaseEntity* PNpc);                     // triggered when user targets npc and clicks action button
    std::int32_t OnEventUpdate(CCharEntity* PChar, uint16 eventID, uint32 result);     // triggered when game triggers event update during cutscene
    std::int32_t OnEventUpdate(CCharEntity* PChar, int8* string);                      // triggered when game triggers event update during cutscene
    std::int32_t OnEventFinish(CCharEntity* PChar, uint16 eventID, uint32 result);     // triggered when cutscene/event is completed
    std::int32_t OnTrade(CCharEntity* PChar, CBaseEntity* PNpc);                       // triggers when a trade completes with an npc

    std::int32_t OnNpcSpawn(CBaseEntity* PNpc);                                        // triggers when a patrol npc spawns

    std::int32_t OnEffectGain(CBattleEntity* PEntity, CStatusEffect* StatusEffect);    // triggers when an effect is applied to pc/npc
    std::int32_t OnEffectTick(CBattleEntity* PEntity, CStatusEffect* StatusEffect);    // triggers when effect tick timer has been reached
    std::int32_t OnEffectLose(CBattleEntity* PEntity, CStatusEffect* StatusEffect);    // triggers when effect has been lost

    std::int32_t OnAttachmentEquip(CBattleEntity* PEntity, CItemPuppet* attachment);
    std::int32_t OnAttachmentUnequip(CBattleEntity* PEntity, CItemPuppet* attachment);
    std::int32_t OnManeuverGain(CBattleEntity* PEntity, CItemPuppet* attachment, uint8 maneuvers);
    std::int32_t OnManeuverLose(CBattleEntity* PEntity, CItemPuppet* attachment, uint8 maneuvers);

    std::int32_t OnItemUse(CBaseEntity* PTarget, CItem* PItem);                        // triggers when item is used
    std::int32_t OnItemCheck(CBaseEntity* PTarget, CItem* PItem, uint32 param = 0);    // check to see if item can be used
    std::int32_t CheckForGearSet(CBaseEntity* PTarget);                                // check for gear sets

    std::int32_t OnMagicCastingCheck(CBaseEntity* PChar, CBaseEntity* PTarget, CSpell* PSpell);    // triggers when a player attempts to cast a spell
    std::int32_t OnSpellCast(CBattleEntity* PCaster, CBattleEntity* PTarget, CSpell* PSpell);      // triggered when casting a spell
    std::int32_t OnSpellPrecast(CBattleEntity* PCaster, CSpell* PSpell);                           // triggered just before casting a spell
    std::optional<SpellID> OnMonsterMagicPrepare(CBattleEntity* PCaster, CBattleEntity* PTarget);            // triggered when monster wants to use a spell on target
    std::int32_t OnMagicHit(CBattleEntity* PCaster, CBattleEntity* PTarget, CSpell* PSpell);       // triggered when spell cast on monster
    std::int32_t OnWeaponskillHit(CBattleEntity* PMob, CBaseEntity* PAttacker, uint16 PWeaponskill); // Triggered when Weaponskill strikes monster

    std::int32_t OnMobInitialize(CBaseEntity* PMob);                                     // Used for passive trait
    std::int32_t ApplyMixins(CBaseEntity* PMob);
    std::int32_t OnMobSpawn(CBaseEntity* PMob);                                          // triggers on mob spawn
    std::int32_t OnMobRoamAction(CBaseEntity* PMob);                                     // triggers when event mob is ready for a custom roam action
    std::int32_t OnMobRoam(CBaseEntity* PMob);
    std::int32_t OnMobEngaged(CBaseEntity* PMob, CBaseEntity* PTarget);                  // triggers on mob engaging a target
    std::int32_t OnMobDisengage(CBaseEntity* PMob);                                      // triggers on mob disengaging (no more targets)
    std::int32_t OnMobDrawIn(CBaseEntity* PMob, CBaseEntity* PTarget);
    std::int32_t OnMobFight(CBaseEntity* PMob, CBaseEntity* PTarget);                    // Сalled every 3 sec when a player fight monster
    std::int32_t OnCriticalHit(CBattleEntity* PTarget);
    std::int32_t OnMobDeath(CBaseEntity* PMob, CBaseEntity* PKiller);                    // triggers on mob death
    std::int32_t OnMobDespawn(CBaseEntity* PMob);                                        // triggers on mob despawn (death not assured)

    std::int32_t OnPath(CBaseEntity* PEntity);                                           // triggers when a patrol npc finishes its pathfind

    std::int32_t OnBcnmEnter(CCharEntity* PChar, CBattlefield* PInstance);                 //triggers when enter a bcnm
    std::int32_t OnBcnmLeave(CCharEntity* PChar, CBattlefield* PInstance, uint8 LeaveCode);    //triggers when leaving a bcnm
                                                                                    //Code 1=via Circle 2=warp/dc 3=win 4=lose
    std::int32_t OnBcnmRegister(CCharEntity* PChar, CBattlefield* PBattlefield);                   //triggers when successfully registered a bcnm
    std::int32_t OnBcnmDestroy(CBattlefield* PBattlefield);                            // triggers when BCNM is destroyed

    std::int32_t OnMobWeaponSkill(CBaseEntity* PChar, CBaseEntity* PMob, CMobSkill* PMobSkill, action_t* action);                            // triggers when mob weapon skill is used
    std::int32_t OnMobSkillCheck(CBaseEntity* PChar, CBaseEntity* PMob, CMobSkill* PMobSkill);                             // triggers before mob weapon skill is used, returns 0 if the move is valid
    std::int32_t OnMobAutomatonSkillCheck(CBaseEntity* PChar, CAutomatonEntity* PAutomaton, CMobSkill* PMobSkill);

    std::int32_t OnAbilityCheck(CBaseEntity* PChar, CBaseEntity* PTarget, CAbility* PAbility, CBaseEntity** PMsgTarget);   // triggers when a player attempts to use a job ability or roll
    std::int32_t OnPetAbility(CBaseEntity* PPet, CBaseEntity* PMob, CMobSkill* PMobSkill, CBaseEntity* PPetMaster, action_t* action);      // triggers when pet uses an ability
    std::tuple<std::int32_t, uint8, uint8> OnUseWeaponSkill(CCharEntity* PChar, CBaseEntity* PMob, CWeaponSkill* wskill, uint16 tp, bool primary, action_t& action, CBattleEntity* taChar);// returns: damage, tphits landed, extra hits landed
    std::int32_t OnUseAbility(CBattleEntity* PUser, CBattleEntity* PTarget, CAbility* PAbility, action_t* action);         // triggers when job ability is used

    std::int32_t OnInstanceZoneIn(CCharEntity* PChar, CInstance* PInstance);           // triggered on zone in to instance
    void AfterInstanceRegister(CBaseEntity* PChar);                             // triggers after a character is registered and zoned into an instance (the first time)
    std::int32_t OnInstanceLoadFailed(CZone* PZone);                                   // triggers when an instance load is failed (ie. instance no longer exists)
    std::int32_t OnInstanceTimeUpdate(CZone* PZone, CInstance* PInstance, uint32 time);// triggers every second for an instance
    std::int32_t OnInstanceFailure(CInstance* PInstance);                              // triggers when an instance is failed
    std::int32_t OnInstanceCreated(CCharEntity* PChar, CInstance* PInstance);          // triggers when an instance is created (per character - waiting outside for entry)
    std::int32_t OnInstanceCreated(CInstance* PInstance);                              // triggers when an instance is created (instance setup)
    std::int32_t OnInstanceProgressUpdate(CInstance* PInstance);                       // triggers when progress is updated in an instance
    std::int32_t OnInstanceStageChange(CInstance* PInstance);                          // triggers when stage is changed in an instance
    std::int32_t OnInstanceComplete(CInstance* PInstance);                             // triggers when an instance is completed

    std::int32_t GetMobRespawnTime(lua_State* L);                                      // get the respawn time of a mob
    std::int32_t DisallowRespawn(lua_State* L);                                               // Allow or prevent a mob from spawning
    std::int32_t UpdateNMSpawnPoint(lua_State* L);                                     // Update the spawn point of an NM
    std::int32_t SetDropRate(lua_State*);                                              // Set drop rate of a mob setDropRate(dropid,itemid,newrate)
    std::int32_t UpdateTreasureSpawnPoint(lua_State* L);                               // Update the spawn point of an Treasure
    std::int32_t UpdateServerMessage(lua_State*);                                      // update server message, first modify in conf and update

    std::int32_t OnAdditionalEffect(CBattleEntity* PAttacker, CBattleEntity* PDefender, CItemWeapon* PItem, actionTarget_t* Action, uint32 damage); // for items with additional effects
    std::int32_t OnSpikesDamage(CBattleEntity* PDefender, CBattleEntity* PAttacker, actionTarget_t* Action, uint32 damage);                         // for mobs with spikes

    std::int32_t nearLocation(lua_State*);

    std::int32_t OnPlayerLevelUp(CCharEntity* PChar);
    std::int32_t OnPlayerLevelDown(CCharEntity* PChar);

    bool OnChocoboDig(CCharEntity* PChar, bool pre);                           // chocobo digging, pre = check
    bool LoadEventScript(CCharEntity* PChar, const char* functionName);    // Utility method: checks for and loads a lua function for events
};

#endif //- _LUAUTILS_H -
