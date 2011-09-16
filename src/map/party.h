/*
===========================================================================

  Copyright (c) 2010-2011 Darkstar Dev Teams

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

#ifndef _CPARTY_H
#define _CPARTY_H

#include "../common/cbasetypes.h"

#include <vector>

class CAlliance;
class CBasicPacket;
class CCharEntity;

enum PARTYFLAG
{
	PARTY_SECOND	= 0x0001,
	PARTY_THIRD		= 0x0002,
	PARTY_LEADER	= 0x0004,
	ALLIANCE_LEADER = 0x0008,
	PARTY_QM		= 0x0010,
	PARTY_SYNC		= 0x0100
};

/************************************************************************
*																		*
*  Класс группы	персонажей												*
*																		*
************************************************************************/

class CParty 
{
public:

	CParty(CCharEntity* PChar);
	
	uint32 GetPartyID();								// узнаем уникальный ID группы
	uint8  MemberCount(uint8 ZoneID);					// узнаем количество участников группы в указанной зоне

	CCharEntity* GetLeader();							// узнаем лидера группы
	CCharEntity* GetSyncTarget();						// узнаем цель синхронизации
	CCharEntity* GetQuaterMaster();						// узнаем владельца сокровищ

	void DisbandParty();								// распускаем группу
	void ReloadParty(CCharEntity* PChar);				// перезагружаем карту группы для всех участников группы
	int8 ReloadPartyMembers(CCharEntity* PChar);		// oбновляем статусы участников группы для выбранного персонажа
	void ReloadTreasurePool(CCharEntity* PChar);

	void AddMember(CCharEntity* PChar);					// добавляем персонажа в группу
	void RemoveMember(CCharEntity* PChar);				// удаление персонажа из группы
	void RemoveMemberByName(int8* MemberName);			// удаление персонажа из группы по имени
	void AssignPartyRole(int8* MemberName, uint8 role);	// назначаем роли участникам группы

	void PushPacket(CCharEntity* PPartyMember, uint8 ZoneID, CBasicPacket* packet);		// отправляем пакет всем членам группы, за исключением PPartyMember

	// ВНИМАНИЕ: НЕ ИЗМЕНЯТЬ ЗНАЧЕНИЯ СПИСКА ВНЕ КЛАССА ГРУППЫ

	std::vector<CCharEntity*> members;					// список участников группы


	// Returns the alliance the party belongs to (if it does) WILL RETURN NULL IF PARTY DOES NOT BELONG TO AN ALLIANCE
	CAlliance*	 getAlliance();			

	//If the party is in an alliance, this will be the parties index number (+1) in the alliance
	unsigned int inAlliance;

	//Sets the Alliance the party belongs to (NULL MEANS NOT USED / REMOVED)
	int setAlliance(CAlliance * alliance);

private:

	uint32 m_PartyID;									// уникальный ID группы

	CAlliance*	 alliance;								// if in an alliance, reference it for ease of access
	
	CCharEntity* m_PLeader;								// лидер группы
	CCharEntity* m_PSyncTarget;							// цель синхронизации уровней
	CCharEntity* m_PQuaterMaster;						// владелец сокровищ

	void SetLeader(CCharEntity* PChar);					// устанавливаем лидера группы
	void SetSyncTarget(CCharEntity* PChar);				// устанавливаем цель синхронизации уровней
	void SetQuaterMaster(CCharEntity* PChar);			// устанавливаем владельца сокровищ

	void RemovePartyLeader(CCharEntity* PChar);			// лидер покидает группу
};

#endif