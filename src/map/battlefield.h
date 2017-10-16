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

#ifndef _CBATTLEFIELD_H
#define _CBATTLEFIELD_H

#include "../common/cbasetypes.h"
#include "../common/mmo.h"
#include <vector>
#include "status_effect.h"
#include "utils/battlefieldutils.h"

enum BCRULES {
    RULES_ALLOW_SUBJOBS = 0x01,
    RULES_LOSE_EXP = 0x02,
    RULES_REMOVE_3MIN = 0x04,
    RULES_SPAWN_TREASURE_ON_WIN = 0x08,
    RULES_MAAT = 0x10
};

enum BCMOBCONDITIONS {
    CONDITION_SPAWNED_AT_START = 0x01,
    CONDITION_WIN_REQUIREMENT = 0x02
};

enum LEAVE_CODE {
    LEAVE_EXIT = 1,
    LEAVE_WIN = 2,
    LEAVE_WARPDC = 3,
    LEAVE_LOSE = 4
};

enum BATTLEFIELD_RETURN_CODE : uint8
{
    BATTLEFIELD_RETURN_CODE_WAIT              = 1,
    BATTLEFIELD_RETURN_CODE_CUTSCENE          = 2,
    BATTLEFIELD_RETURN_CODE_INCREMENT_REQUEST = 3,
    BATTLEFIELD_RETURN_CODE_LOCKED            = 4,
    BATTLEFIELD_RETURN_CODE_REQS_NOT_MET      = 5,
    BATTLEFIELD_RETURN_CODE_BATTLEFIELD_FULL  = 6
};

class CMobEntity;
class CCharEntity;
class CBaseEntity;
class CBattlefieldHandler;

struct BattlefieldRecord
{
    std::string name;
    uint8 partySize;
    duration clearTime;
    BattlefieldRecord()
    {
        name = "Not Set!";
        partySize = 69;
        clearTime = 240s;
    }
};

typedef struct
{
    CMobEntity* MobEntity;  // BCNM Target
    bool killed;            // whether it has died or not
} MobVictoryCondition_t;


class CBattlefield
{
public:

    CBattlefield(CBattlefieldHandler* hand, uint16 bcnmid, BATTLEFIELDTYPE type);

    //bcnm related functions
    uint16          getID();
    duration        getTimeLimit();
    BATTLEFIELDTYPE getType();
    EFFECT          getEffect();
    const int8*     getBcnmName();
    uint16          getZoneId();
    uint8           getBattlefieldNumber();
    uint8           getMaxParticipants();
    uint8           getMaxPlayerInBCNM();
    uint8           getLevelCap();
    uint16          getLootId();
    time_point      getStartTime();
    time_point      getWinTime();
    time_point      getDeadTime();
    uint8           getEntrance();
    const BattlefieldRecord& getRecord() const;

    void        setTimeLimit(duration time);
    void        setBcnmName(int8* name);
    void        setZoneId(uint16 zone);
    void        setBattlefieldNumber(uint8 battlefield);
    void        setMaxParticipants(uint8 max);
    void        setLevelCap(uint8 cap);
    void        setLootId(uint16 id);
    void        setDeadTime(time_point time);
    void        setEntrance(uint8 entrance);
    void        setRecord(const std::string& name, uint8 partySize, duration clearTime);
    void        addTimeLimit(duration time);

    //player related functions
    bool        isValidPlayerForBcnm(CCharEntity* PChar);
    bool        isPlayerInBcnm(CCharEntity* PChar);
    bool        enterBcnm(CCharEntity* PChar);
    bool        addPlayer(CCharEntity* PChar);                          // add player to m_Playerlist
    bool        delPlayer(CCharEntity* PChar);                          // delete player from m_Playerlist
    bool        allPlayersDead();                                       // true if all players in the bcnm are dead.
    uint8       getPlayerMainJob();                                     // used for Maat fights
    uint8       getPlayerMainLevel();                                   // used for Maat fights
    void        capPlayerToBCNM();                                      // adjust player's level to the appropriate cap and remove buffs
    void        disableSubJob();                                        // disable all players subjobs
    void        enableSubJob();                                         // enable all players subjobs
    void        pushMessageToAllInBcnm(uint16 msg, uint16 param);
    void        clearPlayerEnmity(CCharEntity* PChar);                  // erase chars enmity

    //spawning chests + loot
    void        addNpc(CBaseEntity* PNpc);
    void        spawnChest();
    void        openChest();
    bool        m_chestSpawned;

    //mob related functions
    //bool      spawnAllEnemies();
    //bool      resetAllEnemySpawnPositions();
    void        addEnemy(CMobEntity* PMob, uint8 condition);
    bool        allEnemiesDefeated();
    bool        isEnemyBelowHPP(uint8 hpp);
    bool        isEnemyInList(CMobEntity* PMob);

    //handler functions (time/multiple rounds/etc)
    void        init();                                                 // prepares new BCNM
    void        lock();                                                 // happens when enemy is engaged. prevents allies from entering the arena.
    bool        isLocked();
    void        beforeCleanup();                                        // called before players are removed
    void        cleanup();                                              // remove players, mobs, npcs. update record. wipe from handler.
    void        removePlayers();
    bool        isPlayersFighting();                                    // true if mob has aggression, used for locking the BCNM
    bool        winBcnm();
    bool        loseBcnm();
    bool        isReserved();                                           // true if someone has a valid entry for this bcnm

    uint16      m_RuleMask;
    time_point  lastTick;
    time_point  fightTick;

    bool        lost();
    bool        won();
    void        lose();
    void        win(time_point tick);
    bool        cleared();

    std::vector<CCharEntity*> m_PlayerList;
    std::vector<CBaseEntity*> m_NpcList;
    std::vector<CMobEntity*> m_MobList;
    std::vector<CMobEntity*> m_EnemyList;
    std::vector<CMobEntity*> m_AllyList;

private:
    CBattlefieldHandler* m_Handler;
    uint16          m_BcnmID;
    string_t        m_name;
    uint16          m_ZoneID;
    BATTLEFIELDTYPE m_Type;
    EFFECT          m_Effect;
    uint8           m_BattlefieldNumber;
    time_point      m_StartTime;
    time_point      m_WinTime;
    time_point      m_AllDeadTime;                                          // time when every pt member has fallen
    duration        m_TimeLimit;
    uint32          m_LootId;
    uint8           m_LevelCap;
    uint8           m_MaxParticipants;                                      // 1,3,6,12,18,zone
    uint16          m_DynaUniqueID;                                         // unique ID for dynamis battlefield
    uint8           m_entrance;
    CCharEntity*    m_CurrentBattlefieldLeader;
    bool            m_lost;
    bool            m_won;
    bool            m_locked;
    bool            m_cleared {false}; // set when the BCNM has ended and the players have started the end cutscene

    BattlefieldRecord m_record;
    std::vector<MobVictoryCondition_t> m_EnemyVictoryList;
};

#endif