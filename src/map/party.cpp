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

#include "../common/showmsg.h"

#include <string.h>

#include "alliance.h"
#include "charutils.h"
#include "map.h"
#include "party.h"
#include "treasure_pool.h"

#include "packets/char_sync.h"
#include "packets/char_update.h"
#include "packets/menu_config.h"
#include "packets/party_define.h"
#include "packets/party_member_update.h"


#define PARTYCOUNT		6

/************************************************************************
*																		*
*  Конструктор   														*
*																		*
************************************************************************/

CParty::CParty(CCharEntity* PChar)
{
	DSP_DEBUG_BREAK_IF(PChar == NULL);
	DSP_DEBUG_BREAK_IF(PChar->PParty != NULL);

	m_PSyncTarget 	= NULL;
	m_PQuaterMaster = NULL;

	alliance = NULL;
	inAlliance = 0;

	AddMember(PChar);
	SetLeader(PChar);

	members.reserve(PARTYCOUNT);
}

/************************************************************************
*																		*
*  Распускаем группу													*
*																		*
************************************************************************/

void CParty::DisbandParty() 
{
	PushPacket(NULL, 0, new CPartyDefinePacket(NULL));

	SetSyncTarget(NULL);
	SetQuaterMaster(NULL);

	m_PLeader = NULL;

	for (int32 i = 0; i < members.size(); ++i) 
	{
		CCharEntity* PChar = members.at(i);

		PChar->PParty = NULL;
		PChar->pushPacket(new CPartyMemberUpdatePacket(PChar, 0, PChar->getZone()));

		// TODO: TreasurePool должен оставаться у последнего персонажа, но сейчас это не критично

		if (PChar->PTreasurePool->GetPoolType() != TREASUREPOOL_ZONE)
		{
			PChar->PTreasurePool->DelMember(PChar);
			PChar->PTreasurePool = new CTreasurePool(TREASUREPOOL_SOLO);
			PChar->PTreasurePool->AddMember(PChar);
		}
		Sql_Query(SqlHandle,"UPDATE accounts_sessions SET partyid = %u WHERE charid = %u", 0, PChar->id);
	}
	delete this;
}

/************************************************************************
*																		*
*  Назначаем роли участникам группы										*
*																		*
************************************************************************/

void CParty::AssignPartyRole(int8* MemberName, uint8 role)
{		
	DSP_DEBUG_BREAK_IF(m_PLeader == NULL);
	DSP_DEBUG_BREAK_IF(MemberName == NULL);

	for (int32 i = 0; i < members.size(); ++i) 
	{
		CCharEntity* PChar = members.at(i);

		if (strcmp(MemberName, PChar->GetName()) == 0)
		{
			switch(role) 
			{
				case 0: SetLeader(PChar);		break;
				case 4: SetQuaterMaster(PChar); break;
				case 5: SetQuaterMaster(NULL);	break;
				case 6: SetSyncTarget(PChar);	break;
			}
			PushPacket(NULL, 0, new CPartyDefinePacket(this));
			
			for (int32 i = 0; i < members.size(); ++i) 
			{
				if (PChar->getZone() == members.at(i)->getZone())
				{
					PushPacket(NULL, PChar->getZone(), new CPartyMemberUpdatePacket(members.at(i), i, PChar->getZone()));
				}
			}
			return;
		} 
	}
	DSP_DEBUG_BREAK_IF(true);
	ShowError(CL_RED"The character with name <%s> isn't found in party\n"CL_RESET, MemberName);
}

/************************************************************************
*																		*
*  Узнаем количество участников группы в указанной зоне					*
*																		*
************************************************************************/

uint8 CParty::MemberCount(uint8 ZoneID) 
{	
	uint8 count = 0;

	for (int32 i = 0; i < members.size(); ++i) 
	{
		if (members.at(i)->getZone() == ZoneID)
		{
			count++;
		}
	}
	return count;
}

/************************************************************************
*																		*
*  Удаление персонажа из группы по имени	  							*
*																		*
************************************************************************/

void CParty::RemoveMemberByName(int8* MemberName)
{
	DSP_DEBUG_BREAK_IF(MemberName == NULL);

	for (int32 i = 0; i < members.size(); ++i) 
	{
		if (strcmp(MemberName, members.at(i)->GetName()) == 0)
		{
			RemoveMember(members.at(i));
			return;
		} 
	}
	DSP_DEBUG_BREAK_IF(true);
	ShowError(CL_RED"The character with name <%s> isn't found in party\n"CL_RESET, MemberName);
}

/************************************************************************
*																		*
*  Удаляем персонажа из группы				  							*
*																		*
************************************************************************/

void CParty::RemoveMember(CCharEntity* PChar) 
{
	DSP_DEBUG_BREAK_IF(PChar == NULL);
	DSP_DEBUG_BREAK_IF(PChar->PParty != this);

	if (m_PLeader == PChar) 
	{
		RemovePartyLeader(PChar);
	}
	else
	{
		for (int32 i = 0; i < members.size(); ++i) 
		{
			if (PChar == members.at(i)) 
			{
				members.erase(members.begin()+i);
					
				if (m_PQuaterMaster == PChar) 
				{
					SetQuaterMaster(NULL);
				}
				if (m_PSyncTarget == PChar) 
				{
					SetSyncTarget(NULL);
				}

				PChar->pushPacket(new CPartyDefinePacket(NULL));
				PChar->pushPacket(new CPartyMemberUpdatePacket(PChar, 0, PChar->getZone()));
				PChar->pushPacket(new CCharUpdatePacket(PChar));
				PChar->pushPacket(new CCharSyncPacket(PChar));
				PChar->PParty = NULL;

				PushPacket(NULL, 0, new CPartyDefinePacket(this));

				if (PChar->status != STATUS_SHUTDOWN &&
					PChar->PTreasurePool->GetPoolType() != TREASUREPOOL_ZONE)
				{
					PChar->PTreasurePool->DelMember(PChar);
					PChar->PTreasurePool = new CTreasurePool(TREASUREPOOL_SOLO);
					PChar->PTreasurePool->AddMember(PChar);
				}
				Sql_Query(SqlHandle,"UPDATE accounts_sessions SET partyid = 0 WHERE charid = %u", PChar->id);
				break;
			}
		}
	} 
}

/************************************************************************
*																		*
*  Лидер покидает группу												*
*																		*
************************************************************************/

void CParty::RemovePartyLeader(CCharEntity* PChar) 
{
	DSP_DEBUG_BREAK_IF(members.empty());
	DSP_DEBUG_BREAK_IF(m_PLeader != PChar);

	if (members.size() == 1) 
	{
		DisbandParty();
		return;
	} 
	else
	{
		for (int32 i = 0; i < members.size(); ++i) 
		{
			CCharEntity* PPartyMember = members.at(i);

			if (PPartyMember != PChar) 
			{
				SetLeader(PPartyMember);
				break;
			}
		}
	}
	RemoveMember(PChar);
}

/************************************************************************
*																		*
*  Добавляем персонажа в группу											*
*																		*
************************************************************************/

void CParty::AddMember(CCharEntity* PChar) 
{
	DSP_DEBUG_BREAK_IF(PChar == NULL);
	DSP_DEBUG_BREAK_IF(PChar->PParty != NULL);

	// TODO: количество членов группы не должно быть больше шести, но при этом можно приглашать лидера другой группы вступить в альянс

	PChar->PParty = this;
	members.push_back(PChar);

	ReloadParty(PChar);
	ReloadTreasurePool(PChar);

	if (PChar->nameflags.flags & FLAG_INVITE) 				
	{
		PChar->status = STATUS_UPDATE;
		PChar->nameflags.flags ^= FLAG_INVITE;
		PChar->pushPacket(new CMenuConfigPacket(PChar));
		PChar->pushPacket(new CCharUpdatePacket(PChar));
		PChar->pushPacket(new CCharSyncPacket(PChar));
	}
	PChar->PTreasurePool->UpdatePool(PChar);

	Sql_Query(SqlHandle,"UPDATE accounts_sessions SET partyid = %u WHERE charid = %u", m_PartyID, PChar->id);
}

/************************************************************************
*																		*
*  Получаем уникальный ID группы										*
*																		*
************************************************************************/

uint32 CParty::GetPartyID() 
{
	return m_PartyID;
}

/************************************************************************
*																		*
*  Получаем указатель на лидера группы									*
*																		*
************************************************************************/

CCharEntity* CParty::GetLeader() 
{
	DSP_DEBUG_BREAK_IF(m_PLeader == NULL);

	return m_PLeader;
}

/************************************************************************
*																		*
*  Получаем указатель на цель синхронизации уровней						*
*																		*
************************************************************************/

CCharEntity* CParty::GetSyncTarget() 
{
	return m_PSyncTarget;
}

/************************************************************************
*																		*
*  Получаем указатель на владельца сокровищ								*
*																		*
************************************************************************/

CCharEntity* CParty::GetQuaterMaster() 
{
	return m_PQuaterMaster;
}

/************************************************************************
*																		*
*				  														*
*																		*
************************************************************************/

//Returns a pointer to the alliance this party belongs to
CAlliance* CParty::getAlliance() 
{
	return this->alliance;
}

/************************************************************************
*																		*
*  Обновляем карту группы для всех членов. Обновляем всех статусы всех	*
*  членов группы для указанного персонажа. Обновляем статус указанного	*
*  персонажа для всех членов группы, находящихся с ним в одной зоне		*
*																		*
************************************************************************/

void CParty::ReloadParty(CCharEntity* PChar) 
{
	DSP_DEBUG_BREAK_IF(PChar == NULL);
	DSP_DEBUG_BREAK_IF(PChar->PParty != this);

	PushPacket(NULL, 0, new CPartyDefinePacket(this));
	PushPacket(PChar, PChar->getZone(), new CPartyMemberUpdatePacket(PChar, ReloadPartyMembers(PChar), PChar->getZone()));
}

/************************************************************************
*																		*
*  Обновляем статусы членов группы для выбранного персонажа				*
*  Возвращаем номер персонажа в группе									*
*																		*
************************************************************************/

int8 CParty::ReloadPartyMembers(CCharEntity* PChar) 
{
	DSP_DEBUG_BREAK_IF(PChar == NULL);
	DSP_DEBUG_BREAK_IF(PChar->PParty != this);

	int8 MemberNumber = -1;

	for (int32 i = 0; i < members.size(); ++i) 
	{
		if (PChar == members.at(i))
		{
			MemberNumber = i;
		}
		PChar->pushPacket(new CPartyMemberUpdatePacket(members.at(i), i, PChar->getZone()));
	}
	return MemberNumber;
}

/************************************************************************
*																		*
*  Обновляем TreasurePool для указанного персонажа						*
*																		*
************************************************************************/

void CParty::ReloadTreasurePool(CCharEntity* PChar)
{
	DSP_DEBUG_BREAK_IF(PChar == NULL);
	DSP_DEBUG_BREAK_IF(PChar->PParty != this);

	if (PChar->PTreasurePool != NULL &&
		PChar->PTreasurePool->GetPoolType() == TREASUREPOOL_ZONE)
		return;

	for (uint8 i = 0; i < members.size(); ++i) 
	{
		if (PChar != members.at(i) &&
			PChar->getZone() == members.at(i)->getZone())
		{			
			if (PChar->PTreasurePool != NULL)
			{
				PChar->PTreasurePool->DelMember(PChar);
			}
			PChar->PTreasurePool = members.at(i)->PTreasurePool;
			PChar->PTreasurePool->AddMember(PChar);
			return;
		}
	}
	if (PChar->PTreasurePool == NULL)
	{
		PChar->PTreasurePool = new CTreasurePool(TREASUREPOOL_SOLO);
		PChar->PTreasurePool->AddMember(PChar);
	}
}

/************************************************************************
*																		*
*  Устанавливаем лидера группы											*
*																		*
************************************************************************/

void CParty::SetLeader(CCharEntity* PChar) 
{
	DSP_DEBUG_BREAK_IF(PChar == NULL);
	DSP_DEBUG_BREAK_IF(PChar->PParty != this);

	m_PLeader = PChar;
	m_PartyID = PChar->id;

	for (int32 i = 0; i < members.size(); ++i)
	{
		Sql_Query(SqlHandle,"UPDATE accounts_sessions SET partyid = %u WHERE charid = %u", m_PartyID, members.at(i)->id);
	}
}

/************************************************************************
*																		*
*  Устанавливаем цель синхронизации уровней								*
*																		*
************************************************************************/

void CParty::SetSyncTarget(CCharEntity* PChar) 
{
	DSP_DEBUG_BREAK_IF(m_PLeader == NULL);

	/*
	// TODO: установка LevelSync невозможна, если на персонажах уже есть ограничение уровня

	if (m_PLeader->getZone() == PChar->getZone()) 
	{
		m_PSyncTarget = PChar;

		// TODO: реализация LevelSync

		return;
	}

	// Error message, can't level sync if not in same zone
	*/
}

/************************************************************************
*																		*
*  Усранавливаем владельца сокровищ										*
*																		*
************************************************************************/

void CParty::SetQuaterMaster(CCharEntity* PChar) 
{
	m_PQuaterMaster = PChar;
}

/************************************************************************
*																		*
*				  														*
*																		*
************************************************************************/

//Assigns the party to an alliance, or removes the party from an alliance
int CParty::setAlliance(CAlliance * alliance) 
{
	if (alliance == NULL) {
		//If we are setting the value to null, chances are we are no longer in an alliance
		this->inAlliance = 0;
	}
	//Regardless of the result above; we will set the alliance
	this->alliance = alliance;
	return 0;
}

/************************************************************************
*																		*
*  Отправляем пакет всем членам группы, если зона указана как 0 или		*
*  членам группы в указанной зоне.										*
*  Пакет для PPartyMember не отправляется в обоих случаях.				*
*																		*
************************************************************************/

void CParty::PushPacket(CCharEntity* PPartyMember, uint8 ZoneID, CBasicPacket* packet)
{
	for (int32 i = 0; i < members.size(); ++i)
	{
		if (PPartyMember != members.at(i))
		{
			if (ZoneID == 0 || members.at(i)->getZone() == ZoneID)
			{
				members.at(i)->pushPacket(new CBasicPacket(*packet));
			}
		}
	}
	delete packet;
}