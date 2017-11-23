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

#ifndef _CPARTY_H
#define _CPARTY_H

#include "map.h"
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
	CParty(uint32 id);

    uint32 GetPartyID();                                // узнаем уникальный ID группы
    std::uint16_t GetMemberFlags(CBattleEntity* PEntity);      // получаем список флагов персонажа
    std::uint8_t  MemberCount(std::uint16_t ZoneID);                   // узнаем количество участников группы в указанной зоне

    CBattleEntity* GetLeader();                         // узнаем лидера группы
    CBattleEntity* GetSyncTarget();                     // узнаем цель синхронизации
    CBattleEntity* GetQuaterMaster();                   // узнаем владельца сокровищ
    CBattleEntity* GetMemberByName(const std::int8_t* MemberName);   // Returns entity pointer for member name string

	void DisbandParty(bool playerInitiated = true);		// распускаем группу
	void ReloadParty();                                 // перезагружаем карту группы для всех участников группы
	void ReloadPartyMembers(CCharEntity* PChar);        // oбновляем статусы участников группы для выбранного персонажа
	void ReloadTreasurePool(CCharEntity* PChar);

    void AddMember(CBattleEntity* PEntity); // добавляем персонажа в группу
	void AddMember(uint32 id);	// Add party member from outside this server's scope
    void RemoveMember(CBattleEntity* PEntity);          // удаление персонажа из группы
	void DelMember(CBattleEntity* PEntity);				// remove a member without invoking chat/db
    void PopMember(CBattleEntity* PEntity);             // remove a member from memberlist (zoned to different server)
    void PushMember(CBattleEntity* PEntity);            // add a member without invoking chat/db
    void SetPartyID(uint32 id);                         // set new party ID
    void AssignPartyRole(std::int8_t* MemberName, std::uint8_t role);	// назначаем роли участникам группы
    void DisableSync();
    void SetSyncTarget(std::int8_t* MemberName, std::uint16_t message);         // устанавливаем цель синхронизации уровней3
    void RefreshSync();
    void SetPartyNumber(std::uint8_t number);

    void PushPacket(uint32 senderID, std::uint16_t ZoneID, CBasicPacket* packet);		// отправляем пакет всем членам группы, за исключением PPartyMember
    void PushEffectsPacket();
    void EffectsChanged();
	CAlliance* m_PAlliance;

    // ВНИМАНИЕ: НЕ ИЗМЕНЯТЬ ЗНАЧЕНИЯ СПИСКА ВНЕ КЛАССА ГРУППЫ

    std::vector<CBattleEntity*> members;                // список участников группы

private:

    struct partyInfo_t;
    uint32    m_PartyID;                                // уникальный ID группы
    PARTYTYPE m_PartyType;                              // тип существ, составляющих группу
    std::uint8_t     m_PartyNumber;                            // party number in alliance

	CBattleEntity* m_PLeader;                           // лидер группы
	CBattleEntity* m_PSyncTarget;                       // цель синхронизации уровней
	CBattleEntity* m_PQuaterMaster;                     // владелец сокровищ

    bool m_EffectsChanged;

	void SetLeader(const char* MemberName);                   // устанавливаем лидера группы
    void SetQuarterMaster(const char* MemberName);            // устанавливаем владельца сокровищ
	void RemovePartyLeader(CBattleEntity* PEntity);     // лидер покидает группу
    std::vector<partyInfo_t> GetPartyInfo();
    void RefreshFlags(std::vector<partyInfo_t>&);
};

#endif