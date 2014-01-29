/*
===========================================================================

  Copyright (c) 2010-2014 Darkstar Dev Teams

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
#include "../common/timer.h"

#include <vector>
#include <string.h>
#include "alliance.h"
#include "entities/battleentity.h"
#include "utils/charutils.h"
#include "conquest_system.h"
#include "utils/battleutils.h"
#include "utils/blueutils.h"
#include "utils/jailutils.h"
#include "utils/petutils.h"
#include "map.h"
#include "party.h"
#include "treasure_pool.h"

#include "packets/char_sync.h"
#include "packets/char_update.h"
#include "packets/menu_config.h"
#include "packets/message_standard.h"
#include "packets/party_define.h"
#include "packets/party_member_update.h"


/************************************************************************
*																		*
*  Конструктор   														*
*																		*
************************************************************************/

CParty::CParty(CBattleEntity* PEntity)
{
	DSP_DEBUG_BREAK_IF(PEntity == NULL);
	DSP_DEBUG_BREAK_IF(PEntity->PParty != NULL);

    m_PartyID   = PEntity->id;
    m_PartyType = PEntity->objtype == TYPE_PC ? PARTY_PCS : PARTY_MOBS;

    m_PLeader       = NULL;
	m_PAlliance		= NULL;
	m_PSyncTarget 	= NULL;
	m_PQuaterMaster = NULL;


	AddMember(PEntity);
	SetLeader(PEntity);
}


/************************************************************************
*																		*
*  Распускаем группу													*
*																		*
************************************************************************/

void CParty::DisbandParty()
{
	DisableSync();
	SetQuaterMaster(NULL);

	m_PLeader = NULL;
	m_PAlliance	= NULL;

    if (m_PartyType == PARTY_PCS)
    {
        PushPacket(NULL, 0, new CPartyDefinePacket(NULL));

	    for (uint8 i = 0; i < members.size(); ++i)
	    {
		    CCharEntity* PChar = (CCharEntity*)members.at(i);

		    PChar->PParty = NULL;
			PChar->PLatentEffectContainer->CheckLatentsPartyJobs();
			PChar->PLatentEffectContainer->CheckLatentsPartyMembers(members.size());
			PChar->PLatentEffectContainer->CheckLatentsPartyAvatar();
		    PChar->pushPacket(new CPartyMemberUpdatePacket(PChar, 0, PChar->getZone()));

		    // TODO: TreasurePool должен оставаться у последнего персонажа, но сейчас это не критично

            if (PChar->PTreasurePool != NULL &&
                PChar->PTreasurePool->GetPoolType() != TREASUREPOOL_ZONE)
		    {
			    PChar->PTreasurePool->DelMember(PChar);
			    PChar->PTreasurePool = new CTreasurePool(TREASUREPOOL_SOLO);
			    PChar->PTreasurePool->AddMember(PChar);
                PChar->PTreasurePool->UpdatePool(PChar);
		    }
            CStatusEffect* sync = PChar->StatusEffectContainer->GetStatusEffect(EFFECT_LEVEL_SYNC);
            if (sync && sync->GetDuration() == 0)
            {
    			PChar->pushPacket(new CMessageBasicPacket(PChar, PChar, 0, 30, 553));
                sync->SetStartTime(gettick());
                sync->SetDuration(30000);
            }
	    }
        Sql_Query(SqlHandle,"UPDATE accounts_sessions SET partyid = %u WHERE partyid = %u", 0, m_PartyID);
    }
	delete this;
}

/************************************************************************
*                                                                       *
*  Назначаем роли участникам группы	(только для персонажей)             *
*                                                                       *
************************************************************************/

void CParty::AssignPartyRole(int8* MemberName, uint8 role)
{
    DSP_DEBUG_BREAK_IF (m_PartyType != PARTY_PCS);

	for (uint32 i = 0; i < members.size(); ++i)
	{
		CCharEntity* PChar = (CCharEntity*)members.at(i);

		if (strcmp(MemberName, PChar->GetName()) == 0)
		{
			switch(role)
			{
				case 0: SetLeader(PChar);		break;
				case 4: SetQuaterMaster(PChar); break;
				case 5: SetQuaterMaster(NULL);	break;
			    case 6: SetSyncTarget(PChar, 238);	break;
                case 7: SetSyncTarget(NULL, 553);    break;
			}
            ReloadParty();
		    return;
        }
    }
    ShowError(CL_RED"The character with name <%s> isn't found in party\n" CL_RESET, MemberName);
}

/************************************************************************
*																		*
*  Узнаем количество участников группы в указанной зоне					*
*																		*
************************************************************************/

uint8 CParty::MemberCount(uint8 ZoneID)
{
	uint8 count = 0;

	for (uint32 i = 0; i < members.size(); ++i)
	{
		if (members.at(i)->getZone() == ZoneID)
		{
			count++;
		}
	}
	return count;
}

/************************************************************************
*                                                                       *
*  Удаление персонажа из группы по имени (только для персонажей)        *
*                                                                       *
************************************************************************/

void CParty::RemoveMemberByName(int8* MemberName)
{
    DSP_DEBUG_BREAK_IF(m_PartyType != PARTY_PCS);

	for (uint32 i = 0; i < members.size(); ++i)
	{
		if (strcmp(MemberName, members.at(i)->GetName()) == 0)
		{
			RemoveMember(members.at(i));
			return;
		}
	}
	ShowError(CL_RED"The character with name <%s> isn't found in party\n" CL_RESET, MemberName);
}

/************************************************************************
*																		*
*  Удаляем персонажа из группы				  							*
*																		*
************************************************************************/

void CParty::RemoveMember(CBattleEntity* PEntity)
{
	DSP_DEBUG_BREAK_IF(PEntity == NULL);
	DSP_DEBUG_BREAK_IF(PEntity->PParty != this);

	if (m_PLeader == PEntity)
	{
		RemovePartyLeader(PEntity);
	}
	else
	{
		for (uint32 i = 0; i < members.size(); ++i)
		{
			if (PEntity == members.at(i))
			{
				members.erase(members.begin()+i);

                if (m_PartyType == PARTY_PCS)
                {
                    CCharEntity* PChar = (CCharEntity*)PEntity;

				    if (m_PQuaterMaster == PChar)
				    {
					    SetQuaterMaster(NULL);
				    }
				    if (m_PSyncTarget == PChar)
				    {
					    SetSyncTarget(NULL, 553);
                        CStatusEffect* sync = PChar->StatusEffectContainer->GetStatusEffect(EFFECT_LEVEL_SYNC);
                        if (sync && sync->GetDuration() == 0)
                        {
			                PChar->pushPacket(new CMessageBasicPacket(PChar, PChar, 0, 30, 553));
                            sync->SetStartTime(gettick());
                            sync->SetDuration(30000);
                        }
                        DisableSync();
				    }
                    if (m_PSyncTarget != NULL && m_PSyncTarget != PChar)
                    {
                        if (PChar->status != STATUS_DISAPPEAR &&
                             PChar->getZone() == m_PSyncTarget->getZone() )
		                {
                            CStatusEffect* sync = PChar->StatusEffectContainer->GetStatusEffect(EFFECT_LEVEL_SYNC);
                            if (sync && sync->GetDuration() == 0)
                            {
			                    PChar->pushPacket(new CMessageBasicPacket(PChar, PChar, 0, 30, 553));
                                sync->SetStartTime(gettick());
                                sync->SetDuration(30000);
                            }
		                }
                    }
                    PChar->PLatentEffectContainer->CheckLatentsPartyMembers(members.size());

				    PChar->pushPacket(new CPartyDefinePacket(NULL));
				    PChar->pushPacket(new CPartyMemberUpdatePacket(PChar, 0, PChar->getZone()));
				    PChar->pushPacket(new CCharUpdatePacket(PChar));
				    PChar->PParty = NULL;

				    ReloadParty();

				    if (PChar->PTreasurePool != NULL &&
					    PChar->PTreasurePool->GetPoolType() != TREASUREPOOL_ZONE)
				    {
					    PChar->PTreasurePool->DelMember(PChar);
					    PChar->PTreasurePool = new CTreasurePool(TREASUREPOOL_SOLO);
					    PChar->PTreasurePool->AddMember(PChar);
                        PChar->PTreasurePool->UpdatePool(PChar);
				    }
				    Sql_Query(SqlHandle,"UPDATE accounts_sessions SET partyid = 0 WHERE charid = %u", PChar->id);
                }
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

void CParty::RemovePartyLeader(CBattleEntity* PEntity)
{
	DSP_DEBUG_BREAK_IF(members.empty());
	DSP_DEBUG_BREAK_IF(m_PLeader != PEntity);
    DSP_DEBUG_BREAK_IF(PEntity->objtype != TYPE_PC);

	if (members.size() == 1)
	{
		DisbandParty();
	}
    else
    {
		for (uint32 i = 0; i < members.size(); ++i)
		{
			if (PEntity != members.at(i))
			{
				SetLeader(members.at(i));
				break;
			}
		}
        RemoveMember(PEntity);
	}
}

/************************************************************************
*																		*
*  Добавляем персонажа в группу											*
*																		*
************************************************************************/

void CParty::AddMember(CBattleEntity* PEntity)
{
	DSP_DEBUG_BREAK_IF(PEntity == NULL);
	DSP_DEBUG_BREAK_IF(PEntity->PParty != NULL);

	PEntity->PParty = this;
	members.push_back(PEntity);

    if (m_PartyType == PARTY_PCS)
    {
        DSP_DEBUG_BREAK_IF(PEntity->objtype != TYPE_PC);

        CCharEntity* PChar = (CCharEntity*)PEntity;

	    ReloadParty();
	    ReloadTreasurePool(PChar);

	    if (PChar->nameflags.flags & FLAG_INVITE)
	    {
            PChar->nameflags.flags ^= FLAG_INVITE;

            charutils::SaveCharStats(PChar);

		    PChar->status = STATUS_UPDATE;
		    PChar->pushPacket(new CMenuConfigPacket(PChar));
		    PChar->pushPacket(new CCharUpdatePacket(PChar));
		    PChar->pushPacket(new CCharSyncPacket(PChar));
	    }
	    PChar->PTreasurePool->UpdatePool(PChar);

        //Apply level sync if the party is level synced 
        if (m_PSyncTarget != NULL)
        {
            if (PChar->getZone() == m_PSyncTarget->getZone() )
		    {
			    PChar->pushPacket(new CMessageBasicPacket(PChar, PChar, 0, m_PSyncTarget->GetMLevel(), 540));
                PChar->StatusEffectContainer->AddStatusEffect(new CStatusEffect(
                    EFFECT_LEVEL_SYNC,
                    EFFECT_LEVEL_SYNC,
                    m_PSyncTarget->GetMLevel(),
                    0,
                    0), true);
                PChar->StatusEffectContainer->DelStatusEffectsByFlag(EFFECTFLAG_DEATH);
                PChar->loc.zone->PushPacket(PChar, CHAR_INRANGE, new CCharSyncPacket(PChar));
            }
        }

	    Sql_Query(SqlHandle,"UPDATE accounts_sessions SET partyid = %u WHERE charid = %u", m_PartyID, PChar->id);
    }
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

CBattleEntity* CParty::GetLeader()
{
	return m_PLeader;
}

/************************************************************************
*																		*
*  Получаем указатель на цель синхронизации уровней						*
*																		*
************************************************************************/

CBattleEntity* CParty::GetSyncTarget()
{
	return m_PSyncTarget;
}

/************************************************************************
*																		*
*  Получаем указатель на владельца сокровищ								*
*																		*
************************************************************************/

CBattleEntity* CParty::GetQuaterMaster()
{
	return m_PQuaterMaster;
}



/************************************************************************
*                                                                       *
*  Получаем список флагов персонажа                                     *
*                                                                       *
************************************************************************/

uint16 CParty::GetMemberFlags(CBattleEntity* PEntity)
{
    DSP_DEBUG_BREAK_IF(PEntity == NULL);
	DSP_DEBUG_BREAK_IF(PEntity->PParty != this);

    uint16 Flags = 0;

	if (PEntity->PParty->m_PAlliance != NULL)
	{
		if (PEntity == m_PLeader && PEntity->PParty->m_PAlliance->getMainParty() == PEntity->PParty)
			Flags |= ALLIANCE_LEADER;

		if (PEntity->PParty->m_PAlliance->partyList.size() > 1)
			if (PEntity->PParty->m_PAlliance->partyList.at(1) == PEntity->PParty)
				Flags += PARTY_SECOND;

		if (PEntity->PParty->m_PAlliance->partyList.size() > 2)
			if (PEntity->PParty->m_PAlliance->partyList.at(2) == PEntity->PParty)
				Flags += PARTY_THIRD;
	}

    if (PEntity == m_PLeader)       Flags |= PARTY_LEADER;
	if (PEntity == m_PQuaterMaster) Flags |= PARTY_QM;
    if (PEntity == m_PSyncTarget)   Flags |= PARTY_SYNC;

    return Flags;
}

/************************************************************************
*                                                                       *
*  Обновляем карту группы для всех членов группы                        *
*                                                                       *
************************************************************************/

void CParty::ReloadParty()
{

	//alliance
	if (this->m_PAlliance != NULL)
	{
		CAlliance* ourAlliance = this->m_PAlliance;

		for (uint8 a = 0; a < ourAlliance->partyList.size(); ++a)
		{
				for (uint8 i = 0; i < ourAlliance->partyList.at(a)->members.size(); ++i)
				{
					CCharEntity* PChar = (CCharEntity*)ourAlliance->partyList.at(a)->members.at(i);

					PChar->pushPacket(new CPartyDefinePacket(ourAlliance->partyList.at(a)));
						for (uint8 y = 0; y < ourAlliance->partyList.at(a)->members.size(); ++y)
						{
							PChar->pushPacket(new CPartyMemberUpdatePacket((CCharEntity*)ourAlliance->partyList.at(a)->members.at(y),y, PChar->getZone()));
						}
				}
		}
	return;
	}


	//regular party
	for (uint8 i = 0; i < members.size(); ++i)
	{
		CCharEntity* PChar = (CCharEntity*)members.at(i);

		PChar->PLatentEffectContainer->CheckLatentsPartyJobs();
		PChar->PLatentEffectContainer->CheckLatentsPartyMembers(members.size());
		PChar->PLatentEffectContainer->CheckLatentsPartyAvatar();
		PChar->pushPacket(new CPartyDefinePacket(this));
			for (uint8 y = 0; y < members.size(); ++y)
			{
				PChar->pushPacket(new CPartyMemberUpdatePacket((CCharEntity*)members.at(y), y, PChar->getZone()));
			}
	}

}


/************************************************************************
*																		*
*  Обновляем статусы членов группы для выбранного персонажа				*
*  Возвращаем номер персонажа в группе									*
*																		*
************************************************************************/

void CParty::ReloadPartyMembers(CCharEntity* PChar)
{

	if(PChar->PParty != NULL)
	{
		if(PChar->PParty->m_PAlliance != NULL)
		{
			CAlliance* ourAlliance = PChar->PParty->m_PAlliance;

			for (uint8 a = 0; a < ourAlliance->partyList.size(); ++a)
			{
				for (uint8 i = 0; i < ourAlliance->partyList.at(a)->members.size(); ++i)
				{
					PChar->pushPacket(new CPartyMemberUpdatePacket((CCharEntity*)ourAlliance->partyList.at(a)->members.at(i), i, PChar->getZone()));
				}
			}
			return;
		}
	}

	//normal party - no alliance
	DSP_DEBUG_BREAK_IF(PChar == NULL);
	DSP_DEBUG_BREAK_IF(PChar->PParty != this);

    for (uint8 i = 0; i < members.size(); ++i)
	{
		PChar->PLatentEffectContainer->CheckLatentsPartyJobs();
		PChar->PLatentEffectContainer->CheckLatentsPartyMembers(members.size());
		PChar->PLatentEffectContainer->CheckLatentsPartyAvatar();
        PChar->pushPacket(new CPartyMemberUpdatePacket((CCharEntity*)members.at(i), i, PChar->getZone()));
    }
}

/************************************************************************
*																		*
*  Обновляем TreasurePool для указанного персонажа						*
*																		*
************************************************************************/

void CParty::ReloadTreasurePool(CCharEntity* PChar)
{
	DSP_DEBUG_BREAK_IF(PChar == NULL);

	if (PChar->PTreasurePool != NULL && PChar->PTreasurePool->GetPoolType() == TREASUREPOOL_ZONE){
		return;
	}


	//alliance
	if(PChar->PParty != NULL)
	{
		if (PChar->PParty->m_PAlliance != NULL)
		{
			for (uint8 a = 0; a < PChar->PParty->m_PAlliance->partyList.size(); ++a)
			{
				for (uint8 i = 0; i < PChar->PParty->m_PAlliance->partyList.at(a)->members.size(); ++i)
				{
					CCharEntity* PPartyMember = (CCharEntity*)PChar->PParty->m_PAlliance->partyList.at(a)->members.at(i);

					if (PPartyMember != PChar && PPartyMember->PTreasurePool != NULL &&	PPartyMember->getZone() == PChar->getZone())
					{
						if (PChar->PTreasurePool != NULL)
						{
							PChar->PTreasurePool->DelMember(PChar);
						}
						PChar->PTreasurePool = PPartyMember->PTreasurePool;
						PChar->PTreasurePool->AddMember(PChar);
						return;
					}
				}

			}//regular party
		}else if (PChar->PParty->m_PAlliance == NULL){
					for (uint8 i = 0; i < members.size(); ++i){
						CCharEntity* PPartyMember = (CCharEntity*)members.at(i);

						if (PPartyMember != PChar &&
							PPartyMember->PTreasurePool != NULL &&
							PPartyMember->getZone() == PChar->getZone())
						{
							if (PChar->PTreasurePool != NULL)
							{
								PChar->PTreasurePool->DelMember(PChar);
							}
							PChar->PTreasurePool = PPartyMember->PTreasurePool;
							PChar->PTreasurePool->AddMember(PChar);
							return;
						}
					}
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

void CParty::SetLeader(CBattleEntity* PEntity)
{
	DSP_DEBUG_BREAK_IF(PEntity == NULL);
	DSP_DEBUG_BREAK_IF(PEntity->PParty != this);

    if (m_PartyType == PARTY_PCS)
    {
		Sql_Query(SqlHandle,"UPDATE accounts_sessions SET partyid = %u WHERE partyid = %u", PEntity->id,  m_PartyID);

	    m_PLeader = PEntity;
	    m_PartyID = PEntity->id;
    }
}

/************************************************************************
*																		*
*  Устанавливаем цель синхронизации уровней								*
*																		*
************************************************************************/

void CParty::SetSyncTarget(CBattleEntity* PEntity, uint16 message)
{
    if (map_config.level_sync_enable)
    {
        if (PEntity && PEntity->objtype == TYPE_PC)
        {
            CCharEntity* PChar = (CCharEntity*)PEntity;
            //enable level sync
            if (PChar->GetMLevel() < 10 )
            {
                ((CCharEntity*)GetLeader())->pushPacket(new CMessageBasicPacket((CCharEntity*)GetLeader(), (CCharEntity*)GetLeader(), 0, 10, 541));
                return;
            }
            else if (PChar->getZone() != GetLeader()->getZone())
            {
                ((CCharEntity*)GetLeader())->pushPacket(new CMessageBasicPacket((CCharEntity*)GetLeader(), (CCharEntity*)GetLeader(), 0, 0, 542));
                return;
            }
            else
            {
                for (uint32 i = 0; i < members.size(); ++i)
                {
                    if(members.at(i)->StatusEffectContainer->HasStatusEffect(EFFECT_LEVEL_RESTRICTION))
                    {
                        ((CCharEntity*)GetLeader())->pushPacket(new CMessageBasicPacket((CCharEntity*)GetLeader(), (CCharEntity*)GetLeader(), 0, 0, 543));
                        return;
                    }
                }
                m_PSyncTarget = PChar;
	            for (uint32 i = 0; i < members.size(); ++i)
	            {
		            if(members.at(i)->objtype != TYPE_PC) continue;

		            CCharEntity* member = (CCharEntity*)members.at(i);

                    if (member->status != STATUS_DISAPPEAR &&
                         member->getZone() == PChar->getZone() )
		            {
			            member->pushPacket(new CMessageStandardPacket(PChar->GetMLevel(), 0, 0, 0, message));
                        member->StatusEffectContainer->AddStatusEffect(new CStatusEffect(
                            EFFECT_LEVEL_SYNC,
                            EFFECT_LEVEL_SYNC,
                            PChar->GetMLevel(),
                            0,
                            0), true);
                        member->StatusEffectContainer->DelStatusEffectsByFlag(EFFECTFLAG_DISPELABLE);
                        member->loc.zone->PushPacket(member, CHAR_INRANGE, new CCharSyncPacket(member));
		            }
	            }
            }
        }
        else
        {
            if (m_PSyncTarget != NULL)
            {
                //disable level sync
                for (uint32 i = 0; i < members.size(); ++i)
	            {
		            if(members.at(i)->objtype != TYPE_PC) continue;

		            CCharEntity* member = (CCharEntity*)members.at(i);

                    if (member->status != STATUS_DISAPPEAR &&
                         member->getZone() == m_PSyncTarget->getZone() )
		            {
                        CStatusEffect* sync = member->StatusEffectContainer->GetStatusEffect(EFFECT_LEVEL_SYNC);
                        if (sync && sync->GetDuration() == 0)
                        {
			                member->pushPacket(new CMessageBasicPacket(member, member, 10, 30, message));
                            sync->SetStartTime(gettick());
                            sync->SetDuration(30000);
                        }
		            }
	            }
            }
        }
    }
}

/************************************************************************
*																		*
*  Усранавливаем владельца сокровищ										*
*																		*
************************************************************************/

void CParty::SetQuaterMaster(CBattleEntity* PEntity)
{
	m_PQuaterMaster = PEntity;
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
	for (uint32 i = 0; i < members.size(); ++i)
	{
		if(members.at(i)->objtype != TYPE_PC) continue;

		CCharEntity* member = (CCharEntity*)members.at(i);

        if (member != PPartyMember &&
            member->status != STATUS_DISAPPEAR &&
             !jailutils::InPrison(member) )
		{
			if (ZoneID == 0 || member->getZone() == ZoneID)
			{
				member->pushPacket(new CBasicPacket(*packet));
			}
		}
	}
	delete packet;
}

void CParty::DisableSync()
{
    m_PSyncTarget = NULL;
    ReloadParty();
}

void CParty::RefreshSync()
{
    CCharEntity* sync = (CCharEntity*)m_PSyncTarget;
    uint8 syncLevel = sync->jobs.job[sync->GetMJob()];
    if (syncLevel < 10)
    {
        SetSyncTarget(NULL, 554);
    }
    for (uint32 i = 0; i < members.size(); ++i)
	{
		if(members.at(i)->objtype != TYPE_PC) continue;

		CCharEntity* member = (CCharEntity*)members.at(i);

        uint8 NewMLevel = 0;

		if (syncLevel < member->jobs.job[member->GetMJob()])
		{
			NewMLevel = syncLevel;
		}else{
			NewMLevel = member->jobs.job[member->GetMJob()];
		}

		if (member->GetMLevel() != NewMLevel)
		{
            charutils::RemoveAllEquipMods(member);
			member->SetMLevel(NewMLevel);
			member->SetSLevel(member->jobs.job[member->GetSJob()]);
            charutils::ApplyAllEquipMods(member);

            blueutils::ValidateBlueSpells(member);
			charutils::BuildingCharSkillsTable(member);
			charutils::CalculateStats(member);
			charutils::BuildingCharTraitsTable(member);
			charutils::BuildingCharAbilityTable(member);
			charutils::CheckValidEquipment(member); // Handles rebuilding weapon skills as well.
		}
        member->pushPacket(new CMessageBasicPacket(member, member, 0, syncLevel, 540));
	}
    m_PSyncTarget = sync;
}