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

#ifndef _CINSTANCE_H
#define _CINSTANCE_H

#include "../common/cbasetypes.h"
#include "../common/mmo.h"
#include <vector>
#include "instanceutils.h"

enum BCRULES{
	RULES_ALLOW_SUBJOBS = 0x01,
	RULES_LOSE_EXP = 0x02,
	RULES_REMOVE_3MIN = 0x04,
	RULES_SPAWN_TREASURE_ON_WIN = 0x08
};

enum BCMOBCONDITIONS{
	CONDITION_SPAWNED_AT_START = 0x01,
	CONDITION_WIN_REQUIREMENT = 0x02
};

enum LEAVE_CODE{
	LEAVE_EXIT = 1,
	LEAVE_WIN = 2,
	LEAVE_WARPDC = 3,
	LEAVE_LOSE = 4
};

class CMobEntity;
class CCharEntity;
class CBaseEntity;
class CInstanceHandler;

typedef struct
{
	CMobEntity* MobEntity;	// BCNM Target
	bool killed;			// whether it has died or not
} MobVictoryCondition_t;


class CInstance
{
public:

	CInstance(CInstanceHandler* hand, uint16 bcnmid);

	//bcnm related functions
	uint16		getID();
	uint32		getTimeLimit();
	const int8* getBcnmName();
	uint8		getZoneId();
	uint8       getInstanceNumber();
	uint8       getMaxParticipants();
	uint8		getMaxPlayerInBCNM();
	uint8		getLevelCap();
	uint8		m_THLvl;
	uint16		getLootId();
	uint32		getStartTime();
	uint32		getDeadTime();

	void		setTimeLimit(uint32 time);
	void		setBcnmName(int8* name);
	void		setZoneId(uint8 zone);
	void		setInstanceNumber(uint8 instance);
	void		setMaxParticipants(uint8 max);
	void		setLevelCap(uint8 cap);
	void		setLootId(uint16 id);
	void		setDeadTime(uint32 time);

	//player related functions
	bool		isValidPlayerForBcnm(CCharEntity* PChar);
	bool		isPlayerInBcnm(CCharEntity* PChar);
	bool		enterBcnm(CCharEntity* PChar);
	bool		addPlayerToBcnm(CCharEntity* PChar); //true if added
	bool		delPlayerFromBcnm(CCharEntity* PChar); //true if deleted
	bool		allPlayersDead(); //true if all players in the bcnm are dead.
	uint8		getPlayerMainJob(); //used for Maat fights
	uint8		getPlayerMainLevel(); //used for Maat fights
	void		capPlayerToBCNM(); //adjust player's level to the appropriate cap and remove buffs
	void		disableSubJob(); // disable all players subjobs
	void		enableSubJob(); // enable all players subjobs
	void		pushMessageToAllInBcnm(uint16 msg, uint16 param);

	//spawning chests + loot
	void		addNpc(CBaseEntity* PNpc);
	bool		spawnTreasureChest();
	bool		treasureChestSpawned;
	void		getHighestTHforBcnm();
	void		OpenChestinBcnm();

	//mob related functions
	//bool		spawnAllEnemies();
	//bool		resetAllEnemySpawnPositions();
	void		addEnemy(CMobEntity* PMob, uint8 condition);
	bool		allEnemiesDefeated();
	bool		isEnemyBelowHPP(uint8 hpp);


	//handler functions (time/multiple rounds/etc)
	void		lockBcnm(); //removes valid players if they arent inside the BCNM. Called when fighting.
	void		init(); //prepares new BCNM
	void 		beforeCleanup(); // called before players are removed
	void		cleanup(); //cleans up the existing active BCNM
	bool		isPlayersFighting(); //true if mob has aggression, used for locking the BCNM
	bool		winBcnm();
	bool		loseBcnm();
	bool		isReserved(); //true if someone has a valid entry for this bcnm

	//Dynamis functions
	void		setDynaUniqueID();
	uint16		getDynaUniqueID();
	bool		addPlayerToDynamis(CCharEntity* PChar);
	void		addTimeLimit(uint32 time);
	bool		finishDynamis();
	void		cleanupDynamis();
	bool		delPlayerFromDynamis(CCharEntity* PChar);

	uint16		m_RuleMask;
	bool		locked;
	string_t	m_FastestName;
	uint32		m_FastestTime;
	uint32		lastTick;

	std::vector<CCharEntity*> m_PlayerList;
	std::vector<CBaseEntity*> m_NpcList;

private:
	CInstanceHandler* m_Handler;
	uint16		m_BcnmID;
	string_t	m_name;
	uint8       m_ZoneID;
	uint8		m_InstanceNumber;
	uint32		m_StartTime;
	uint32		m_AllDeadTime; //time when every pt member has fallen
	uint32		m_TimeLimit;
	uint32		m_LootId;
	uint8		m_LevelCap;
	uint8		m_MaxParticipants; //1,3,6,12,18,zone
	uint16		m_DynaUniqueID; // create unique ID for dynamis
	CCharEntity* m_CurrentInstanceLeader;
	std::vector<CMobEntity*> m_EnemyList;
	std::vector<MobVictoryCondition_t> m_EnemyVictoryList;

	// std::vector<CCharEntity*> m_PlayerList;

};

#endif