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

#ifndef _CPARTY_H
#define _CPARTY_H

#include "../common/cbasetypes.h"

#include <vector>

class CBasicPacket;
class CBattleEntity;
class CCharEntity;
class CAlliance;

enum PARTYTYPE
{
    PARTY_PCS,
    PARTY_MOBS,
};

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

    CParty(CBattleEntity* PEntity);
	
    uint32 GetPartyID();                                // узнаем уникальный ID группы
    uint16 GetMemberFlags(CBattleEntity* PEntity);      // получаем список флагов персонажа
    uint8  MemberCount(uint8 ZoneID);                   // узнаем количество участников группы в указанной зоне

    CBattleEntity* GetLeader();                         // узнаем лидера группы
    CBattleEntity* GetSyncTarget();                     // узнаем цель синхронизации
    CBattleEntity* GetQuaterMaster();                   // узнаем владельца сокровищ

	void DisbandParty();								// распускаем группу
	void ReloadParty();                                 // перезагружаем карту группы для всех участников группы
	void ReloadPartyMembers(CCharEntity* PChar);        // oбновляем статусы участников группы для выбранного персонажа
	void ReloadTreasurePool(CCharEntity* PChar);

    void AddMember(CBattleEntity* PEntity);             // добавляем персонажа в группу
    void RemoveMember(CBattleEntity* PEntity);          // удаление персонажа из группы
    void RemoveMemberByName(int8* MemberName);			// удаление персонажа из группы по имени
    void AssignPartyRole(int8* MemberName, uint8 role);	// назначаем роли участникам группы

    void PushPacket(CCharEntity* PPartyMember, uint8 ZoneID, CBasicPacket* packet);		// отправляем пакет всем членам группы, за исключением PPartyMember
	
	CAlliance* m_PAlliance;
	//int32	m_AlliancePosition;


    // ВНИМАНИЕ: НЕ ИЗМЕНЯТЬ ЗНАЧЕНИЯ СПИСКА ВНЕ КЛАССА ГРУППЫ

    std::vector<CBattleEntity*> members;                // список участников группы

private:

	
    uint32    m_PartyID;                                // уникальный ID группы
    PARTYTYPE m_PartyType;                              // тип существ, составляющих группу
	
	CBattleEntity* m_PLeader;                           // лидер группы
	CBattleEntity* m_PSyncTarget;                       // цель синхронизации уровней
	CBattleEntity* m_PQuaterMaster;                     // владелец сокровищ


	void SetLeader(CBattleEntity* PEntity);             // устанавливаем лидера группы
	void SetSyncTarget(CBattleEntity* PEntity);         // устанавливаем цель синхронизации уровней
	void SetQuaterMaster(CBattleEntity* PEntity);       // устанавливаем владельца сокровищ

	void RemovePartyLeader(CBattleEntity* PEntity);     // лидер покидает группу
};

#endif