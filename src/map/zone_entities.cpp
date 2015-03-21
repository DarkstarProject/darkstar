﻿/*
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

#include "zone_entities.h"

#include "ai/ai_mob_dummy.h"

#include "entities/mobentity.h"
#include "entities/npcentity.h"

#include "packets/char.h"
#include "packets/char_sync.h"
#include "packets/entity_update.h"
#include "packets/entity_visual.h"
#include "packets/wide_scan.h"

#include "lua/luautils.h"

#include "utils/battlefieldutils.h"
#include "utils/charutils.h"
#include "utils/petutils.h"
#include "utils/zoneutils.h"

CZoneEntities::CZoneEntities(CZone* zone)
{
	m_zone = zone;
	m_Transport = nullptr;
}

CZoneEntities::~CZoneEntities()
{

}

void CZoneEntities::HealAllMobs()
{
	for (EntityList_t::const_iterator it = m_mobList.begin(); it != m_mobList.end(); ++it)
	{
		CMobEntity* PCurrentMob = (CMobEntity*)it->second;

		// keep resting until i'm full
		PCurrentMob->Rest(1);
	}
}

void CZoneEntities::InsertPC(CCharEntity* PChar)
{
	m_charList[PChar->targid] = PChar;
	ShowDebug(CL_CYAN"CZone:: %s IncreaseZoneCounter <%u> %s \n" CL_RESET, m_zone->GetName(), m_charList.size(), PChar->GetName());
}

void CZoneEntities::InsertMOB(CBaseEntity* PMob)
{
	if ((PMob != nullptr) && (PMob->objtype == TYPE_MOB))
	{
		PMob->loc.zone = m_zone;

		FindPartyForMob(PMob);
		m_mobList[PMob->targid] = PMob;
	}
}

void CZoneEntities::InsertNPC(CBaseEntity* PNpc)
{
	if ((PNpc != nullptr) && (PNpc->objtype == TYPE_NPC))
	{
		PNpc->loc.zone = m_zone;

		if (PNpc->look.size == MODEL_SHIP)
		{
			m_Transport = PNpc;
			return;
		}
		m_npcList[PNpc->targid] = PNpc;
	}
}

void CZoneEntities::DeletePET(CBaseEntity* PPet)
{
	if (PPet != nullptr)
	{
		m_petList.erase(PPet->targid);
	}
}

void CZoneEntities::InsertPET(CBaseEntity* PPet)
{
	if (PPet != nullptr)
	{
		uint16 targid = 0x700;

		for (EntityList_t::const_iterator it = m_petList.begin(); it != m_petList.end(); ++it)
		{
			if (targid != it->first)
			{
				break;
			}
			targid++;
		}
		if (targid >= 0x800)
		{
			ShowError(CL_RED"CZone::InsertPET : targid is high (03hX)\n" CL_RESET, targid);
			return;
		}
		PPet->id = 0x1000000 + (m_zone->GetID() << 12) + targid;
		PPet->targid = targid;
		PPet->loc.zone = m_zone;
		m_petList[PPet->targid] = PPet;

		for (EntityList_t::const_iterator it = m_charList.begin(); it != m_charList.end(); ++it)
		{
			CCharEntity* PCurrentChar = (CCharEntity*)it->second;

			if (distance(PPet->loc.p, PCurrentChar->loc.p) < 50)
			{
				PCurrentChar->SpawnPETList[PPet->id] = PPet;
                PCurrentChar->pushPacket(new CEntityUpdatePacket(PPet, ENTITY_SPAWN, UPDATE_ALL_MOB));
			}
		}
		return;
	}
	ShowError(CL_RED"CZone::InsertPET : entity is null\n" CL_RESET);
}

void CZoneEntities::FindPartyForMob(CBaseEntity* PEntity)
{
	DSP_DEBUG_BREAK_IF(PEntity == nullptr);
	DSP_DEBUG_BREAK_IF(PEntity->objtype != TYPE_MOB);

	CMobEntity* PMob = (CMobEntity*)PEntity;

	// force all mobs in a burning circle to link
	ZONETYPE zonetype = m_zone->GetType();
	bool forceLink = zonetype == ZONETYPE_BATTLEFIELD || zonetype == ZONETYPE_DYNAMIS || PMob->getMobMod(MOBMOD_SUPERLINK);

	if ((forceLink || PMob->m_Link) && PMob->PParty == nullptr)
	{
		for (EntityList_t::const_iterator it = m_mobList.begin(); it != m_mobList.end(); ++it)
		{
			CMobEntity* PCurrentMob = (CMobEntity*)it->second;

			if (!forceLink && !PCurrentMob->m_Link) continue;

			int16 sublink = PMob->getMobMod(MOBMOD_SUBLINK);

			if (PCurrentMob->allegiance == PMob->allegiance &&
				(forceLink ||
				PCurrentMob->m_Family == PMob->m_Family ||
				sublink && sublink == PCurrentMob->getMobMod(MOBMOD_SUBLINK)))
			{

				if (PCurrentMob->PMaster == nullptr || PCurrentMob->PMaster->objtype == TYPE_MOB)
				{
					PCurrentMob->PParty->AddMember(PMob);
					return;
				}
			}
		}
		PMob->PParty = new CParty(PMob);
	}
}

void CZoneEntities::TransportDepart(uint16 boundary, uint16 zone)
{
	for (EntityList_t::const_iterator it = m_charList.begin(); it != m_charList.end(); ++it)
	{
		CCharEntity* PCurrentChar = (CCharEntity*)it->second;

		if (PCurrentChar->loc.boundary == boundary)
		{
			luautils::OnTransportEvent(PCurrentChar, zone);
		}
	}
}

void CZoneEntities::WeatherChange(WEATHER weather)
{
	for (EntityList_t::const_iterator it = m_mobList.begin(); it != m_mobList.end(); ++it)
	{
		CMobEntity* PCurrentMob = (CMobEntity*)it->second;

		PCurrentMob->PBattleAI->WeatherChange(weather, zoneutils::GetWeatherElement(weather));
	}

	for (EntityList_t::const_iterator it = m_charList.begin(); it != m_charList.end(); ++it)
	{
		CCharEntity* PChar = (CCharEntity*)it->second;

		PChar->PLatentEffectContainer->CheckLatentsZone();
	}
}

void CZoneEntities::DecreaseZoneCounter(CCharEntity* PChar)
{
	DSP_DEBUG_BREAK_IF(PChar == nullptr);
	DSP_DEBUG_BREAK_IF(PChar->loc.zone != m_zone);

	//remove pets
	if (PChar->PPet != nullptr)
	{
		charutils::BuildingCharPetAbilityTable(PChar, (CPetEntity*)PChar->PPet, 0);//blank the pet commands
		if (PChar->PPet->isCharmed) {
			petutils::DespawnPet(PChar);
		}
		else {
			PChar->PPet->status = STATUS_DISAPPEAR;
			if (((CPetEntity*)(PChar->PPet))->getPetType() == PETTYPE_AVATAR)
				PChar->setModifier(MOD_AVATAR_PERPETUATION, 0);
		}
		// It may have been nullptred by DespawnPet
		if (PChar->PPet != nullptr) {
			PChar->PPet->PBattleAI->SetCurrentAction(ACTION_NONE);
			DeletePET(PChar->PPet);//remove the TID for this pet

			for (EntityList_t::const_iterator it = m_charList.begin(); it != m_charList.end(); ++it)
			{
				//inform other players of the pets removal
				CCharEntity* PCurrentChar = (CCharEntity*)it->second;
				SpawnIDList_t::iterator PET = PCurrentChar->SpawnPETList.find(PChar->PPet->id);

				if (PET != PCurrentChar->SpawnPETList.end())
				{
					PCurrentChar->SpawnPETList.erase(PET);
					PCurrentChar->pushPacket(new CEntityUpdatePacket(PChar->PPet, ENTITY_DESPAWN, UPDATE_NONE));
				}
			}
			PChar->PPet = nullptr;
		}
	}

	//remove bcnm status
	if (m_zone->m_BattlefieldHandler != nullptr && PChar->StatusEffectContainer->HasStatusEffect(EFFECT_BATTLEFIELD))
	{
		if (m_zone->m_BattlefieldHandler->disconnectFromBcnm(PChar)){
			ShowDebug("Removed %s from the BCNM they were in as they have left the zone.\n", PChar->GetName());
		}

		if (PChar->loc.destination == 0){ //this player is disconnecting/logged out, so move them to the entrance
			//move depending on zone
			int pos[4] = { 0, 0, 0, 0 };
			battlefieldutils::getStartPosition(m_zone->GetID(), pos);
			if (pos != nullptr){
				PChar->loc.p.x = pos[0];
				PChar->loc.p.y = pos[1];
				PChar->loc.p.z = pos[2];
				PChar->loc.p.rotation = pos[3];
                PChar->updatemask |= UPDATE_POS;
				charutils::SaveCharPosition(PChar);
			}
			else{
				ShowWarning("%s has disconnected from the BCNM but cannot move them to the lobby as the lobby position is unknown!\n", PChar->GetName());
			}
		}
	}
	else if (m_zone->m_BattlefieldHandler != nullptr && PChar->StatusEffectContainer->HasStatusEffect(EFFECT_DYNAMIS, 0))
	{
		if (m_zone->m_BattlefieldHandler->disconnectFromDynamis(PChar)){
			ShowDebug("Removed %s from the BCNM they were in as they have left the zone.\n", PChar->GetName());
		}

		if (PChar->loc.destination == 0){ //this player is disconnecting/logged out, so move them to the entrance
			//move depending on zone
			int pos[4] = { 0, 0, 0, 0 };
			battlefieldutils::getStartPosition(m_zone->GetID(), pos);
            if (!(pos[0] == 0 && pos[1] == 0 && pos[2] == 0 && pos[3] == 0)){
				PChar->loc.p.x = pos[0];
				PChar->loc.p.y = pos[1];
				PChar->loc.p.z = pos[2];
				PChar->loc.p.rotation = pos[3];
                PChar->updatemask |= UPDATE_POS;
				charutils::SaveCharPosition(PChar);
			}
			else{
				ShowWarning("%s has disconnected from the BCNM but cannot move them to the lobby as the lobby position is unknown!\n", PChar->GetName());
			}
		}
	}

    for (auto PCharIt : m_charList)
    {
        CCharEntity* PCurrentChar = (CCharEntity*)PCharIt.second;
        if (PCurrentChar->PBattleAI->m_PMagicState->GetTarget() == PChar)
        {
            PCurrentChar->PBattleAI->m_PMagicState->ClearTarget();
        }
    }

	for (auto PMobIt : m_mobList)
	{
        CMobEntity* PCurrentMob = (CMobEntity*)PMobIt.second;
		PCurrentMob->PEnmityContainer->Clear(PChar->id);
		if (PCurrentMob->m_OwnerID.id == PChar->id)
        {
			PCurrentMob->m_OwnerID.clean();
            PCurrentMob->updatemask |= UPDATE_STATUS;
		}
        if (PCurrentMob->PBattleAI->m_PMagicState->GetTarget() == PChar)
        {
            PCurrentMob->PBattleAI->m_PMagicState->ClearTarget();
        }
        if (PCurrentMob->PBattleAI->GetBattleSubTarget() == PChar)
        {
            PCurrentMob->PBattleAI->SetBattleSubTarget(nullptr);
        }
	}
    for (auto PPetIt : m_petList)
    {
        CPetEntity* PCurrentPet = (CPetEntity*)PPetIt.second;
        if (PCurrentPet->PBattleAI->m_PMagicState->GetTarget() == PChar)
        {
            PCurrentPet->PBattleAI->m_PMagicState->ClearTarget();
        }
        if (PCurrentPet->PBattleAI->GetBattleSubTarget() == PChar)
        {
            PCurrentPet->PBattleAI->SetBattleSubTarget(nullptr);
        }
    }

	// TODO: могут возникать проблемы с переходом между одной и той же зоной (zone == prevzone)

	m_charList.erase(PChar->targid);

	ShowDebug(CL_CYAN"CZone:: %s DecreaseZoneCounter <%u> %s\n" CL_RESET, m_zone->GetName(), m_charList.size(), PChar->GetName());
}

uint16 CZoneEntities::GetNewTargID()
{
	uint16 targid = 0x400;
	for (EntityList_t::const_iterator it = m_charList.begin(); it != m_charList.end(); ++it)
	{
		if (targid != it->first)
		{
			break;
		}
		targid++;
	}
	return targid;
}

bool CZoneEntities::CharListEmpty()
{
	return m_charList.empty();
}

void CZoneEntities::DespawnPC(CCharEntity* PChar)
{
	for (EntityList_t::const_iterator it = m_charList.begin(); it != m_charList.end(); ++it)
	{
		CCharEntity* PCurrentChar = (CCharEntity*)it->second;
		SpawnIDList_t::iterator PC = PCurrentChar->SpawnPCList.find(PChar->id);

		if (PC != PCurrentChar->SpawnPCList.end())
		{
			PCurrentChar->SpawnPCList.erase(PC);
			PCurrentChar->pushPacket(new CCharPacket(PChar, ENTITY_DESPAWN, 0));
		}
	}
}

void CZoneEntities::SpawnMOBs(CCharEntity* PChar)
{
	for (EntityList_t::const_iterator it = m_mobList.begin(); it != m_mobList.end(); ++it)
	{
		CMobEntity* PCurrentMob = (CMobEntity*)it->second;
		SpawnIDList_t::iterator MOB = PChar->SpawnMOBList.lower_bound(PCurrentMob->id);

		float CurrentDistance = distance(PChar->loc.p, PCurrentMob->loc.p);

		if (PCurrentMob->status == STATUS_MOB &&
			CurrentDistance < 50)
		{
			if (MOB == PChar->SpawnMOBList.end() ||
				PChar->SpawnMOBList.key_comp()(PCurrentMob->id, MOB->first))
			{
				PChar->SpawnMOBList.insert(MOB, SpawnIDList_t::value_type(PCurrentMob->id, PCurrentMob));
                PChar->pushPacket(new CEntityUpdatePacket(PCurrentMob, ENTITY_SPAWN, UPDATE_ALL_MOB));
			}

			if (PChar->isDead() || PChar->nameflags.flags & FLAG_GM || PCurrentMob->PMaster != nullptr)
				continue;

			// проверка ночного/дневного сна монстров уже учтена в проверке CurrentAction, т.к. во сне монстры не ходят ^^

			uint16 expGain = (uint16)charutils::GetRealExp(PChar->GetMLevel(), PCurrentMob->GetMLevel());

			CAIMobDummy* PAIMob = (CAIMobDummy*)PCurrentMob->PBattleAI;

			bool validAggro = expGain > 50 || PChar->animation == ANIMATION_HEALING || PCurrentMob->getMobMod(MOBMOD_ALWAYS_AGGRO);

			if (validAggro && PAIMob->CanAggroTarget(PChar))
			{
				PCurrentMob->PEnmityContainer->AddBaseEnmity(PChar);
			}
		}
		else
		{
			if (MOB != PChar->SpawnMOBList.end() &&
				!(PChar->SpawnMOBList.key_comp()(PCurrentMob->id, MOB->first)))
			{
				PChar->SpawnMOBList.erase(MOB);
				PChar->pushPacket(new CEntityUpdatePacket(PCurrentMob, ENTITY_DESPAWN, UPDATE_NONE));
			}
		}
	}
}

void CZoneEntities::SpawnPETs(CCharEntity* PChar)
{
	for (EntityList_t::const_iterator it = m_petList.begin(); it != m_petList.end(); ++it)
	{
		CPetEntity* PCurrentPet = (CPetEntity*)it->second;
		SpawnIDList_t::iterator PET = PChar->SpawnPETList.lower_bound(PCurrentPet->id);

		if ((PCurrentPet->status == STATUS_NORMAL || PCurrentPet->status == STATUS_MOB) &&
			distance(PChar->loc.p, PCurrentPet->loc.p) < 50)
		{
			if (PET == PChar->SpawnPETList.end() ||
				PChar->SpawnPETList.key_comp()(PCurrentPet->id, PET->first))
			{
				PChar->SpawnPETList.insert(PET, SpawnIDList_t::value_type(PCurrentPet->id, PCurrentPet));
                PChar->pushPacket(new CEntityUpdatePacket(PCurrentPet, ENTITY_SPAWN, UPDATE_ALL_MOB));
			}
		}
		else{
			if (PET != PChar->SpawnPETList.end() &&
				!(PChar->SpawnPETList.key_comp()(PCurrentPet->id, PET->first)))
			{
				PChar->SpawnPETList.erase(PET);
				PChar->pushPacket(new CEntityUpdatePacket(PCurrentPet, ENTITY_DESPAWN, UPDATE_NONE));
			}
		}
	}
}

void CZoneEntities::SpawnNPCs(CCharEntity* PChar)
{
    if (!PChar->m_moghouseID)
    {
        for (EntityList_t::const_iterator it = m_npcList.begin(); it != m_npcList.end(); ++it)
        {
            CNpcEntity* PCurrentNpc = (CNpcEntity*)it->second;
            SpawnIDList_t::iterator NPC = PChar->SpawnNPCList.lower_bound(PCurrentNpc->id);

            if (PCurrentNpc->status == STATUS_NORMAL || PCurrentNpc->status == STATUS_MOB)
            {
                if (distance(PChar->loc.p, PCurrentNpc->loc.p) < 50)
                {
                    if (NPC == PChar->SpawnNPCList.end() ||
                        PChar->SpawnNPCList.key_comp()(PCurrentNpc->id, NPC->first))
                    {
                        PChar->SpawnNPCList.insert(NPC, SpawnIDList_t::value_type(PCurrentNpc->id, PCurrentNpc));
                        PChar->pushPacket(new CEntityUpdatePacket(PCurrentNpc, ENTITY_SPAWN, UPDATE_ALL_MOB));
                    }
                }
                else{
                    if (NPC != PChar->SpawnNPCList.end() &&
                        !(PChar->SpawnNPCList.key_comp()(PCurrentNpc->id, NPC->first)))
                    {
                        PChar->SpawnNPCList.erase(NPC);
                        PChar->pushPacket(new CEntityUpdatePacket(PCurrentNpc, ENTITY_DESPAWN, UPDATE_NONE));
                    }
                }
            }
        }
    }
}

void CZoneEntities::SpawnPCs(CCharEntity* PChar)
{
	for (EntityList_t::const_iterator it = m_charList.begin(); it != m_charList.end(); ++it)
	{
		CCharEntity* PCurrentChar = (CCharEntity*)it->second;
		SpawnIDList_t::iterator PC = PChar->SpawnPCList.find(PCurrentChar->id);

		if (PChar != PCurrentChar)
		{
			if (distance(PChar->loc.p, PCurrentChar->loc.p) < 50 && PChar->m_moghouseID == PCurrentChar->m_moghouseID)
			{
				if (PC == PChar->SpawnPCList.end())
				{
					if (PCurrentChar->m_isGMHidden == false)
					{
						PChar->SpawnPCList[PCurrentChar->id] = PCurrentChar;
						PChar->pushPacket(new CCharPacket(PCurrentChar, ENTITY_SPAWN, UPDATE_ALL_CHAR));
						PChar->pushPacket(new CCharSyncPacket(PCurrentChar));
					}

                    if (PChar->m_isGMHidden == false)
                    {
                        PCurrentChar->SpawnPCList[PChar->id] = PChar;
                        PCurrentChar->pushPacket(new CCharPacket(PChar, ENTITY_SPAWN, UPDATE_ALL_CHAR));
                        PCurrentChar->pushPacket(new CCharSyncPacket(PChar));
                    }
				}
                else
                {
                    if (PCurrentChar->m_isGMHidden == true)
                    {
                        PChar->SpawnPCList.erase(PC);
                    }
                    // TODO: figure out a way to push these packets in response to 0x015s while preserving the mask
                    //  every operation on the mask should persist for 400ms (0x015 frequency)
                    /*else if (PChar->updatemask != 0)
                    {
                        PCurrentChar->pushPacket(new CCharPacket(PChar, ENTITY_UPDATE, PChar->updatemask));
                    }*/
                }
			}
			else
			{
				if (PC != PChar->SpawnPCList.end())
				{
					PChar->SpawnPCList.erase(PC);
					PChar->pushPacket(new CCharPacket(PCurrentChar, ENTITY_DESPAWN,0));

					PCurrentChar->SpawnPCList.erase(PChar->id);
					PCurrentChar->pushPacket(new CCharPacket(PChar, ENTITY_DESPAWN,0));
				}
			}
		}
	}
}

void CZoneEntities::SpawnMoogle(CCharEntity* PChar)
{
	for (EntityList_t::const_iterator it = m_npcList.begin(); it != m_npcList.end(); ++it)
	{
		CNpcEntity* PCurrentNpc = (CNpcEntity*)it->second;

		if (PCurrentNpc->loc.p.z == 1.5 &&
			PCurrentNpc->look.face == 0x52)
		{
			PCurrentNpc->status = STATUS_NORMAL;
			PChar->pushPacket(new CEntityUpdatePacket(PCurrentNpc, ENTITY_SPAWN, UPDATE_ALL_MOB));
			PCurrentNpc->status = STATUS_DISAPPEAR;
			return;
		}
	}
}

void CZoneEntities::SpawnTransport(CCharEntity* PChar)
{
	if (m_Transport != nullptr)
	{
        PChar->pushPacket(new CEntityUpdatePacket(m_Transport, ENTITY_SPAWN, UPDATE_ALL_MOB));
		return;
	}
}

CBaseEntity* CZoneEntities::GetEntity(uint16 targid, uint8 filter)
{
	if (targid < 0x400)
	{
		if (filter & TYPE_MOB)
		{
			EntityList_t::const_iterator it = m_mobList.find(targid);
			if (it != m_mobList.end())
			{
				return it->second;
			}
		}
		if (filter & TYPE_NPC)
		{
			EntityList_t::const_iterator it = m_npcList.find(targid);
			if (it != m_npcList.end())
			{
                return it->second;
			}
		}
		if (filter & TYPE_SHIP)
		{
			if (m_Transport != nullptr && m_Transport->targid == targid)
			{
                return m_Transport;
			}
		}
	}
	else if (targid < 0x700)
	{
		if (filter & TYPE_PC)
		{
			EntityList_t::const_iterator it = m_charList.find(targid);
			if (it != m_charList.end())
			{
                return it->second;
			}
		}
	}
	else if (targid < 0x800)
	{
		if (filter & TYPE_PET)
		{
			EntityList_t::const_iterator it = m_petList.find(targid);
			if (it != m_petList.end())
			{
                return it->second;
			}
		}
	}
	return nullptr;
}

void CZoneEntities::TOTDChange(TIMETYPE TOTD)
{
	SCRIPTTYPE ScriptType = SCRIPT_NONE;

	switch (TOTD)
	{
		case TIME_MIDNIGHT:
		{

		}
		break;
		case TIME_NEWDAY:
		{
			for (EntityList_t::const_iterator it = m_mobList.begin(); it != m_mobList.end(); ++it)
			{
				CMobEntity* PMob = (CMobEntity*)it->second;

				if (PMob->m_SpawnType == SPAWNTYPE_ATNIGHT)
				{
					PMob->SetDespawnTimer(1);
					PMob->m_AllowRespawn = false;
				}
			}
		}
		break;
		case TIME_DAWN:
		{
			ScriptType = SCRIPT_TIME_DAWN;

			for (EntityList_t::const_iterator it = m_mobList.begin(); it != m_mobList.end(); ++it)
			{
				CMobEntity* PMob = (CMobEntity*)it->second;

				if (PMob->m_SpawnType == SPAWNTYPE_ATEVENING)
				{
					PMob->SetDespawnTimer(1);
					PMob->m_AllowRespawn = false;
				}
			}
		}
		break;
		case TIME_DAY:
		{
			ScriptType = SCRIPT_TIME_DAY;
		}
		break;
		case TIME_DUSK:
		{
			ScriptType = SCRIPT_TIME_DUSK;
		}
		break;
		case TIME_EVENING:
		{
			ScriptType = SCRIPT_TIME_EVENING;

			for (EntityList_t::const_iterator it = m_mobList.begin(); it != m_mobList.end(); ++it)
			{
				CMobEntity* PMob = (CMobEntity*)it->second;

				if (PMob->m_SpawnType == SPAWNTYPE_ATEVENING)
				{
					PMob->SetDespawnTimer(0);
					PMob->m_AllowRespawn = true;
					PMob->PBattleAI->SetCurrentAction(ACTION_SPAWN);
				}
			}
		}
		break;
		case TIME_NIGHT:
		{
			for (EntityList_t::const_iterator it = m_mobList.begin(); it != m_mobList.end(); ++it)
			{
				CMobEntity* PMob = (CMobEntity*)it->second;

				if (PMob->m_SpawnType == SPAWNTYPE_ATNIGHT)
				{
					PMob->SetDespawnTimer(0);
					PMob->m_AllowRespawn = true;
					PMob->PBattleAI->SetCurrentAction(ACTION_SPAWN);
				}
			}
		}
		break;
	}
	if (ScriptType != SCRIPT_NONE)
	{
		for (EntityList_t::const_iterator it = m_charList.begin(); it != m_charList.end(); ++it)
		{
			charutils::CheckEquipLogic((CCharEntity*)it->second, ScriptType, TOTD);
		}
	}
}

void CZoneEntities::SavePlayTime()
{
	if (!m_charList.empty())
	{
		for (EntityList_t::const_iterator it = m_charList.begin(); it != m_charList.end(); ++it)
		{
			CCharEntity* PChar = (CCharEntity*)it->second;
			charutils::SavePlayTime(PChar);
		}
	}
}

CCharEntity* CZoneEntities::GetCharByName(int8* name)
{
	if (!m_charList.empty())
	{
		for (EntityList_t::const_iterator it = m_charList.begin(); it != m_charList.end(); ++it)
		{
			CCharEntity* PCurrentChar = (CCharEntity*)it->second;
			if (stricmp(PCurrentChar->GetName(), name) == 0)
			{
				return PCurrentChar;
			}
		}
	}
	return nullptr;
}

CCharEntity* CZoneEntities::GetCharByID(uint32 id)
{
	for (auto PChar : m_charList)
	{
		if (PChar.second->id == id)
		{
			return (CCharEntity*)PChar.second;
		}
	}
	return nullptr;
}

void CZoneEntities::PushPacket(CBaseEntity* PEntity, GLOBAL_MESSAGE_TYPE message_type, CBasicPacket* packet)
{
	// Do not send packets that are updates of a hidden GM..
	if (packet != nullptr && packet->getType() == 0x0D && PEntity != nullptr && PEntity->objtype == TYPE_PC && ((CCharEntity*)PEntity)->m_isGMHidden)
	{
		// Ensure this packet is not despawning us..
		if (packet->getData()[0x06] != 0x20)
		{
			delete packet;
			return;
		}
	}

	if (!m_charList.empty())
	{
		switch (message_type)
		{
			case CHAR_INRANGE_SELF:
			{
				if (PEntity->objtype == TYPE_PC)
				{
					((CCharEntity*)PEntity)->pushPacket(new CBasicPacket(*packet));
				}
			}
			case CHAR_INRANGE:
			{
				for (EntityList_t::const_iterator it = m_charList.begin(); it != m_charList.end(); ++it)
				{
					CCharEntity* PCurrentChar = (CCharEntity*)it->second;
					if (PEntity != PCurrentChar)
					{
						if (distance(PEntity->loc.p, PCurrentChar->loc.p) < 50 && 
                            ((PEntity->objtype != TYPE_PC) || (((CCharEntity*)PEntity)->m_moghouseID == PCurrentChar->m_moghouseID)))
						{
							if (packet != nullptr && packet->getType() == 0x0E &&
								(RBUFB(packet->getData(), (0x0A) - 4) != 0x20 ||
								RBUFB(packet->getData(), (0x0A) - 4) != 0x0F))
							{
								uint32 id = RBUFL(packet->getData(), (0x04) - 4);
								uint16 targid = RBUFW(packet->getData(), (0x08) - 4);

								CBaseEntity* entity = GetEntity(targid);

								SpawnIDList_t spawnlist;

								if (entity)
								{
									if (entity->targid < 0x400)
									{
										if (entity->objtype == TYPE_MOB)
										{
											spawnlist = PCurrentChar->SpawnMOBList;
										}
										else if (entity->objtype == TYPE_NPC)
										{
											spawnlist = PCurrentChar->SpawnNPCList;
										}
									}
									else if (entity->targid >= 0x700)
									{
										spawnlist = PCurrentChar->SpawnPETList;
									}
									else
									{
										entity = nullptr;
									}
								}
								if (!entity)
								{
									// got a char or nothing as the target of this entity update (which really shouldn't happen ever)
									// so we're just going to skip this packet
									break;
								}
								SpawnIDList_t::iterator iter = spawnlist.lower_bound(id);

								if (!(iter == spawnlist.end() ||
									spawnlist.key_comp()(id, iter->first)))
								{
									PCurrentChar->pushPacket(new CBasicPacket(*packet));
								}
							}
							else
							{
								PCurrentChar->pushPacket(new CBasicPacket(*packet));
							}
						}
					}
				}
			}
			break;
			case CHAR_INSHOUT:
			{
				for (EntityList_t::const_iterator it = m_charList.begin(); it != m_charList.end(); ++it)
				{
					CCharEntity* PCurrentChar = (CCharEntity*)it->second;
					if (PEntity != PCurrentChar)
					{
						if (distance(PEntity->loc.p, PCurrentChar->loc.p) < 180 && 
                            ((PEntity->objtype != TYPE_PC) || (((CCharEntity*)PEntity)->m_moghouseID == PCurrentChar->m_moghouseID)))
						{
							PCurrentChar->pushPacket(new CBasicPacket(*packet));
						}
					}
				}
			}
			break;
			case CHAR_INZONE:
			{
				for (EntityList_t::const_iterator it = m_charList.begin(); it != m_charList.end(); ++it)
				{
					CCharEntity* PCurrentChar = (CCharEntity*)it->second;

                    if (PCurrentChar->m_moghouseID == 0)
                    {
                        if (PEntity != PCurrentChar)
                        {
                            PCurrentChar->pushPacket(new CBasicPacket(*packet));
                        }
                    }
				}
			}
			break;
		}
	}
	delete packet;
}

void CZoneEntities::WideScan(CCharEntity* PChar, uint16 radius)
{
	PChar->pushPacket(new CWideScanPacket(WIDESCAN_BEGIN));
	for (EntityList_t::const_iterator it = m_npcList.begin(); it != m_npcList.end(); ++it)
	{
		CNpcEntity* PNpc = (CNpcEntity*)it->second;
        if (PNpc->status == STATUS_NORMAL && !PNpc->IsNameHidden() && !PNpc->IsUntargetable())
		{
			if (distance(PChar->loc.p, PNpc->loc.p) < radius)
			{
				PChar->pushPacket(new CWideScanPacket(PChar, PNpc));
			}
		}
	}
	for (EntityList_t::const_iterator it = m_mobList.begin(); it != m_mobList.end(); ++it)
	{
		CMobEntity* PMob = (CMobEntity*)it->second;
		if (PMob->status != STATUS_DISAPPEAR && !PMob->IsUntargetable())
		{
			if (distance(PChar->loc.p, PMob->loc.p) < radius)
			{
				PChar->pushPacket(new CWideScanPacket(PChar, PMob));
			}
		}
	}
	PChar->pushPacket(new CWideScanPacket(WIDESCAN_END));
}

void CZoneEntities::ZoneServer(uint32 tick)
{
	for (EntityList_t::const_iterator it = m_mobList.begin(); it != m_mobList.end(); ++it)
	{
		CMobEntity* PMob = (CMobEntity*)it->second;

		PMob->StatusEffectContainer->CheckEffects(tick);
		PMob->PBattleAI->CheckCurrentAction(tick);
		PMob->StatusEffectContainer->CheckRegen(tick);
	}

	for (EntityList_t::const_iterator it = m_npcList.begin(); it != m_npcList.end(); ++it)
	{
		CNpcEntity* PNpc = (CNpcEntity*)it->second;

		if (PNpc->PBattleAI != nullptr)
		{
			PNpc->PBattleAI->CheckCurrentAction(tick);
		}
	}

	EntityList_t::const_iterator pit = m_petList.begin();
	while (pit != m_petList.end())
	{
		CPetEntity* PPet = (CPetEntity*)pit->second;
		PPet->StatusEffectContainer->CheckEffects(tick);
		PPet->PBattleAI->CheckCurrentAction(tick);
		PPet->StatusEffectContainer->CheckRegen(tick);
		if (PPet->status == STATUS_DISAPPEAR){
			m_petList.erase(pit++);
		}
		else{
			++pit;
		}
	}

	for (EntityList_t::const_iterator it = m_charList.begin(); it != m_charList.end(); ++it)
	{
		CCharEntity* PChar = (CCharEntity*)it->second;

		if (PChar->status != STATUS_SHUTDOWN)
		{
			PChar->PRecastContainer->Check();
			PChar->StatusEffectContainer->CheckEffects(tick);
			PChar->PBattleAI->CheckCurrentAction(tick);
			PChar->PTreasurePool->CheckItems(tick);
			PChar->StatusEffectContainer->CheckRegen(tick);
		}
	}
}

void CZoneEntities::ZoneServerRegion(uint32 tick)
{
	for (EntityList_t::const_iterator it = m_mobList.begin(); it != m_mobList.end(); ++it)
	{
		CMobEntity* PMob = (CMobEntity*)it->second;

		PMob->StatusEffectContainer->CheckEffects(tick);
		PMob->PBattleAI->CheckCurrentAction(tick);
	}

	for (EntityList_t::const_iterator it = m_petList.begin(); it != m_petList.end(); ++it)
	{
		CPetEntity* PPet = (CPetEntity*)it->second;

		PPet->StatusEffectContainer->CheckEffects(tick);
		PPet->PBattleAI->CheckCurrentAction(tick);
	}

	for (EntityList_t::const_iterator it = m_charList.begin(); it != m_charList.end(); ++it)
	{
		CCharEntity* PChar = (CCharEntity*)it->second;

		if (PChar->status != STATUS_SHUTDOWN)
		{
			PChar->PRecastContainer->Check();
			PChar->StatusEffectContainer->CheckEffects(tick);
			PChar->PBattleAI->CheckCurrentAction(tick);
			PChar->PTreasurePool->CheckItems(tick);

			m_zone->CheckRegions(PChar);
		}
	}
}

EntityList_t CZoneEntities::GetCharList()
{
	return m_charList;
}