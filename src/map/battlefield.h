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

enum BATTLEFIELD_RETURN_CODE : std::uint8_t
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
    std::uint8_t partySize;
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
    CMobEntity* MobEntity;	// BCNM Target
    bool killed;			// whether it has died or not
} MobVictoryCondition_t;


class CBattlefield
{
public:

    CBattlefield(CBattlefieldHandler* hand, std::uint16_t bcnmid, BATTLEFIELDTYPE type);

    //bcnm related functions
    std::uint16_t		getID();
    duration		getTimeLimit();
    BATTLEFIELDTYPE		getType();
    const std::int8_t* getBcnmName();
    std::uint16_t		getZoneId();
    std::uint8_t       getBattlefieldNumber();
    std::uint8_t       getMaxParticipants();
    std::uint8_t		getMaxPlayerInBCNM();
    std::uint8_t		getLevelCap();
    std::uint16_t		getLootId();
    time_point		getStartTime();
    time_point		getWinTime();
    time_point		getDeadTime();
    std::uint8_t		getEntrance();
    const BattlefieldRecord& getRecord() const;

    void		setTimeLimit(duration time);
    void		setBcnmName(std::int8_t* name);
    void		setZoneId(std::uint16_t zone);
    void		setBattlefieldNumber(std::uint8_t battlefield);
    void		setMaxParticipants(std::uint8_t max);
    void		setLevelCap(std::uint8_t cap);
    void		setLootId(std::uint16_t id);
    void		setDeadTime(time_point time);
    void		setEntrance(std::uint8_t entrance);
    void        setRecord(const std::string& name, std::uint8_t partySize, duration clearTime);

    //player related functions
    bool		isValidPlayerForBcnm(CCharEntity* PChar);
    bool		isPlayerInBcnm(CCharEntity* PChar);
    bool		enterBcnm(CCharEntity* PChar);
    bool		addPlayerToBcnm(CCharEntity* PChar);					// true if added
    bool		delPlayerFromBcnm(CCharEntity* PChar);					// true if deleted
    bool		allPlayersDead();										// true if all players in the bcnm are dead.
    std::uint8_t		getPlayerMainJob();										// used for Maat fights
    std::uint8_t		getPlayerMainLevel();									// used for Maat fights
    void		capPlayerToBCNM();										// adjust player's level to the appropriate cap and remove buffs
    void		disableSubJob();										// disable all players subjobs
    void		enableSubJob();											// enable all players subjobs
    void		pushMessageToAllInBcnm(std::uint16_t msg, std::uint32_t param);

    //spawning chests + loot
    void		addNpc(CBaseEntity* PNpc);
    bool		spawnTreasureChest();
    bool		treasureChestSpawned;
    void		OpenChestinBcnm();

    //mob related functions
    //bool		spawnAllEnemies();
    //bool		resetAllEnemySpawnPositions();
    void		addEnemy(CMobEntity* PMob, std::uint8_t condition);
    bool		allEnemiesDefeated();
    bool		isEnemyBelowHPP(std::uint8_t hpp);
    void		addMonsterInList(CMobEntity* PMob);						// add monster to the list
    bool		isMonsterInList(CMobEntity* PMob);						// check if monster is in the list

    //handler functions (time/multiple rounds/etc)
    void		lockBcnm();												// removes valid players if they arent inside the BCNM. Called when fighting.
    void		init();													// prepares new BCNM
    void 		beforeCleanup();										// called before players are removed
    void		cleanup();												// cleans up the existing active BCNM
    void        removePlayers();
    bool		isPlayersFighting();									// true if mob has aggression, used for locking the BCNM
    bool		winBcnm();
    bool		loseBcnm();
    bool		isReserved();											// true if someone has a valid entry for this bcnm

    //Dynamis functions
    void		setDynaUniqueID();										// set unique ID in dynamis battlefield
    std::uint16_t		getDynaUniqueID();										// get unique ID in dynamis battlefield
    bool		addPlayerToDynamis(CCharEntity* PChar);					// add player to the dynamis
    void		addTimeLimit(duration time);								// add time in dynamis
    bool		finishDynamis();										// finish dynamis
    void		cleanupDynamis();										// cleanup all mobs in dynamis
    bool		delPlayerFromDynamis(CCharEntity* PChar);				// delete player in m_PlayerList
    void		clearPlayerEnmity(CCharEntity* PChar); 					// erase chars enmity

    std::uint16_t		m_RuleMask;
    bool		locked;
    string_t	m_FastestName;
    std::uint32_t		m_FastestTime;
    time_point		lastTick;
    time_point      fightTick;

    bool		lost();
    bool		won();
    void		lose();
    void		win(time_point tick);
    bool        cleared();

    std::vector<CCharEntity*> m_PlayerList;
    std::vector<CBaseEntity*> m_NpcList;
    std::vector<CMobEntity*> m_MobList;
    std::vector<CMobEntity*> m_EnemyList;
    std::vector<CMobEntity*> m_AllyList;

private:
    CBattlefieldHandler* m_Handler;
    std::uint16_t			m_BcnmID;
    string_t		m_name;
    std::uint16_t			m_ZoneID;
    BATTLEFIELDTYPE m_Type;
    std::uint8_t			m_BattlefieldNumber;
    time_point			m_StartTime;
    time_point 			m_WinTime;
    time_point			m_AllDeadTime;											// time when every pt member has fallen
    duration			m_TimeLimit;
    std::uint32_t			m_LootId;
    std::uint8_t			m_LevelCap;
    std::uint8_t			m_MaxParticipants;										// 1,3,6,12,18,zone
    std::uint16_t			m_DynaUniqueID;											// unique ID for dynamis battlefield
    std::uint8_t			m_entrance;
    CCharEntity*	m_CurrentBattlefieldLeader;
    bool			m_lost;
    bool			m_won;
    bool            m_cleared {false}; // set when the BCNM has ended and the players have started the end cutscene

    BattlefieldRecord m_record;
    std::vector<MobVictoryCondition_t> m_EnemyVictoryList;
};

#endif