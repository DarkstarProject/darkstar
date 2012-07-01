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
	RULES_SPAWN_TREASURE_ON_WIN = 0x08,
};

enum LEAVE_CODE{
	LEAVE_EXIT = 1,
	LEAVE_WIN = 2,
	LEAVE_WARPDC = 3,
	LEAVE_LOSE = 4
};

class CMobEntity;
class CCharEntity;
class CInstanceHandler;

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
	uint8		getLevelCap();
	uint16		getDropId();
	uint32		getStartTime();
	uint32		getDeadTime();

	void		setTimeLimit(uint32 time);
	void		setBcnmName(int8* name);
	void		setZoneId(uint8 zone);
	void		setInstanceNumber(uint8 instance);
	void		setMaxParticipants(uint8 max);
	void		setLevelCap(uint8 cap);
	void		setDropId(uint16 id);
	void		setDeadTime(uint32 time);
	
	//player related functions
	bool		isValidPlayerForBcnm(CCharEntity* PChar);
	bool		isPlayerInBcnm(CCharEntity* PChar);
	bool		enterBcnm(CCharEntity* PChar);
	bool		addPlayerToBcnm(CCharEntity* PChar); //true if added
	bool		delPlayerFromBcnm(CCharEntity* PChar); //true if deleted
	bool		allPlayersDead(); //true if all players in the bcnm are dead.
	uint8		getPlayerMainJob(); //used for Maat fights 
	void		pushMessageToAllInBcnm(uint16 msg, uint16 param);

	//mob related functions
	//bool		spawnAllEnemies();
	//bool		resetAllEnemySpawnPositions();
	void		addEnemy(CMobEntity* PMob);
	bool		allEnemiesDefeated();
	bool		isEnemyBelowHPP(uint8 hpp);

	
	//handler functions (time/multiple rounds/etc)
	void		lockBcnm(); //removes valid players if they arent inside the BCNM. Called when fighting.
	void		init(); //prepares new BCNM
	void		cleanup(); //cleans up the existing active BCNM
	bool		isPlayersFighting(); //true if mob has aggression, used for locking the BCNM
	bool		winBcnm();
	bool		loseBcnm();
	bool		isReserved(); //true if someone has a valid entry for this bcnm

	uint16		m_RuleMask;
	bool		locked;
	string_t	m_FastestName;
	uint32		m_FastestTime;
	uint32		lastTick;
private:
	CInstanceHandler* m_Handler;
	uint16		m_BcnmID;
	string_t	m_name;
	uint8       m_ZoneID;
	uint8		m_InstanceNumber;
	uint32		m_StartTime;
	uint32		m_AllDeadTime; //time when every pt member has fallen
	uint32		m_TimeLimit;
	uint32		m_DropId;
	uint8		m_LevelCap;
	uint8		m_MaxParticipants; //1,3,6,12,18,zone
	CCharEntity* m_CurrentInstanceLeader;
	std::vector<CMobEntity*> m_EnemyList;
	std::vector<CCharEntity*> m_PlayerList;

};

#endif;