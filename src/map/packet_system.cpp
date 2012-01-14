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

#include "../common/blowfish.h"
#include "../common/md52.h"
#include "../common/mmo.h"
#include "../common/showmsg.h"
#include "../common/socket.h"
#include "../common/strlib.h"
#include "../common/taskmgr.h"
#include "../common/timer.h"
#include "../common/utils.h"

#include <string.h>

#include "packet_system.h"
#include "conquest_system.h"
#include "battleutils.h"
#include "charutils.h"
#include "fishingutils.h"
#include "itemutils.h"
#include "map.h"
#include "mobentity.h"
#include "npcentity.h"
#include "synthutils.h"
#include "trade_container.h"
#include "zone.h"
#include "zoneutils.h"

#include "lua/luautils.h"

#include "packets/auction_house.h"
#include "packets/automaton_update.h"
#include "packets/bazaar_check.h"
#include "packets/bazaar_item.h"
#include "packets/bazaar_message.h"
#include "packets/campaing_map.h"
#include "packets/char.h"
#include "packets/char_abilities.h"
#include "packets/char_appearance.h"
#include "packets/char_check.h"
#include "packets/char_equip.h"
#include "packets/char_emotion.h"
#include "packets/char_jobs.h"
#include "packets/char_health.h"
#include "packets/char_skills.h"
#include "packets/char_spells.h"
#include "packets/char_stats.h"
#include "packets/char_sync.h"
#include "packets/char_update.h"
#include "packets/chat_message.h"
#include "packets/chocobo_digging.h"
#include "packets/chocobo_music.h"
#include "packets/conquest_map.h"
#include "packets/cs_position.h"
#include "packets/delivery_box.h"
#include "packets/downloading_data.h"
#include "packets/entity_update.h"
#include "packets/guild_menu_buy.h"
#include "packets/guild_menu_sell.h"
#include "packets/inventory_assign.h"
#include "packets/inventory_finish.h"
#include "packets/inventory_item.h"
#include "packets/inventory_modify.h"
#include "packets/inventory_size.h"
#include "packets/lock_on.h"
#include "packets/menu_config.h"
#include "packets/menu_merit.h"
#include "packets/message_basic.h"
#include "packets/message_debug.h"
#include "packets/message_standard.h"
#include "packets/message_system.h"
#include "packets/party_invite.h"
#include "packets/party_map.h"
#include "packets/party_search.h"
#include "packets/position.h"
#include "packets/release.h"
#include "packets/server_ip.h"
#include "packets/server_message.h"
#include "packets/shop_appraise.h"
#include "packets/shop_buy.h"
#include "packets/stop_downloading.h"
#include "packets/wide_scan_track.h"
#include "packets/zone_in.h"
#include "packets/zone_visited.h"
#include "packets/menu_raisetractor.h"

int32 (*PacketParcer[512])(map_session_data_t*, CCharEntity*, int8*);

/************************************************************************
*																		*
*  Отображения содержимого входящего пакета в консоли					*
*																		*
************************************************************************/

void PrintPacket(int8* data)
{
	int8 message[50];
	memset(&message,0,50);

	for(int y = 0; y < data[1]*2; y++) 
	{
		sprintf(message,"%s %02hx",message,(uint8)data[y]);
		if(((y+1)%16) == 0) 
		{
			message[48] = '\n';
			ShowDebug(message);
			memset(&message,0,50);
		}
	}
	if (strlen(message) > 0) 
	{
		message[strlen(message)] = '\n';
		ShowDebug(message);
	}
}

/************************************************************************
*                                                                       *
*  Неизвестный пакет                                                    *
*                                                                       *
************************************************************************/

int32 SmallPacket0x000(map_session_data_t* session, CCharEntity* PChar, int8* data)
{
    ShowWarning(CL_YELLOW"parse: Unhandled game packet %03hX from user: %s\n"CL_RESET, (RBUFW(data,0) & 0x1FF), PChar->GetName());
    return 0;
}

/************************************************************************
*                                                                       *
*  Нереализованный пакет                                                *
*                                                                       *
************************************************************************/

int32 SmallPacket0xFFF(map_session_data_t* session, CCharEntity* PChar, int8* data)
{
    ShowDebug(CL_CYAN"parse: SmallPacket is not implemented Type<%03hX>\n"CL_RESET, (RBUFW(data,0) & 0x1FF));
    return 0;
}

/************************************************************************
*																		*
*  Вход в зону															*
*																		*
*  Обновляем sessionkey и порт клиента при каждом переходе между зонами *
*  Мы должны оставлять правильный ключ при переходе с сервера на сервер	*
*																		*
************************************************************************/

int32 SmallPacket0x00A(map_session_data_t* session, CCharEntity* PChar, int8* data)
{
	WBUFL(data,(0x5C)) = 0;

	PChar->clearPacketList();

	if (PChar->status == STATUS_DISAPPEAR) 
	{
		session->blowfish.key[4] += 2;

		md5((uint8*)(session->blowfish.key), session->blowfish.hash, 20);

		for(uint32 i = 0; i < 16; ++i)
		{
			if(session->blowfish.hash[i] == 0)
			{
				memset(session->blowfish.hash+i, 0, 16-i);
				break;
			}
		}
		blowfish_init((int8*)session->blowfish.hash, 16, session->blowfish.P, session->blowfish.S[0]);

		int8 session_key[20*2+1];
		bin2hex(session_key,(uint8*)session->blowfish.key,20);

		uint32 ServerIP = zoneutils::GetZone(PChar->getZone())->GetIP();

		PChar->PBattleAI->SetCurrentZone(zoneutils::GetZone(PChar->getZone()));
		PChar->m_ZonesList[PChar->getZone() >> 3] |= (1 << (PChar->getZone()%8));

		if (PChar->getZone() != 0 && 
			PChar->getZone() != 214) 
		{
			zoneutils::GetZone(PChar->getZone())->IncreaseZoneCounter(PChar);
		}

		const int8* fmtQuery = "UPDATE accounts_sessions SET targid = %u, session_key = x'%s', server_addr = %u, client_port = %u WHERE charid = %u";

		Sql_Query(SqlHandle,fmtQuery,
			PChar->targid,
			session_key,
			ServerIP,
			session->client_port,
			PChar->id);

		PChar->status = STATUS_NORMAL;
	}
	else
	{
		DSP_DEBUG_BREAK_IF(PChar->status != STATUS_NORMAL);	 // статус персонажа должен быть STATUS_NORMAL
	}

	int16 EventID = luautils::OnZoneIn(PChar);

	if (PChar->loc.prevzone == 0)
	{
		PChar->loc.prevzone = PChar->getZone();
	}

	charutils::SaveCharPosition(PChar);
	charutils::SaveZonesVisited(PChar);

	PChar->pushPacket(new CDownloadingDataPacket());
	PChar->pushPacket(new CZoneInPacket(PChar,EventID));
	PChar->pushPacket(new CZoneVisitedPacket(PChar));
	return 0;
};

/************************************************************************
*																		*
*  Пакет-запрос информации о персонаже. Приходит только во время 		*
*  перехода между зонами / входа в игру (что почти одно и то же)		*																	
*																		*
************************************************************************/

int32 SmallPacket0x00C(map_session_data_t* session, CCharEntity* PChar, int8* data)
{
	PChar->pushPacket(new CInventorySizePacket(PChar));
	PChar->pushPacket(new CMenuConfigPacket(PChar));
	PChar->pushPacket(new CCharJobsPacket(PChar));
	PChar->pushPacket(new CChocoboMusicPacket());

	if (PChar->PParty != NULL)
	{
		PChar->PParty->ReloadParty(PChar);
	}
	// TODO: в MogHouse TreasurePool сейчас не создается, по этому необходима проверка
	if (PChar->PTreasurePool != NULL)
	{
		PChar->PTreasurePool->UpdatePool(PChar);
	}
    zoneutils::GetZone(PChar->getZone())->SpawnTransport(PChar);
	return 0;
} 

/************************************************************************
*																		*
*  Персонаж покидает зону каким-либо из возможных способов. В случае 	*
*  выхода из игры, текущая зона находится в переменной zone, во всех	*
*  остальных случаех в prevzone. Делаем соответствующую проверку для	*
*  правильного удаления персонажа их списка зоны.						*
*																		*
************************************************************************/

int32 SmallPacket0x00D(map_session_data_t* session, CCharEntity* PChar, int8* data)
{
	PChar->InvitePending = 0;
	PChar->PWideScanTarget = NULL;

	if (PChar->animation == ANIMATION_ATTACK)
	{
		PChar->animation = ANIMATION_NONE;
	}

	PChar->RecastList.clear();

	charutils::SaveCharStats(PChar);
	charutils::SaveCharPosition(PChar);
	charutils::SaveCharExp(PChar, PChar->GetMJob());

	if (PChar->status == STATUS_SHUTDOWN)
	{
		if (PChar->PParty != NULL)
		{
			PChar->PParty->RemoveMember(PChar);
		}
		zoneutils::GetZone(PChar->getZone())->DecreaseZoneCounter(PChar);
		CTaskMgr::getInstance()->AddTask(new CTaskMgr::CTask("close_session",gettick()+5000,session,CTaskMgr::TASK_ONCE,map_close_session));
	} 
	else  // проверка именно при покидании зоны, чтобы не делать двойную проверку при входе в игру 
	{
		zoneutils::GetZone(PChar->loc.prevzone)->DecreaseZoneCounter(PChar);
		charutils::CheckEquipLogic(PChar, SCRIPT_CHANGEZONE, PChar->loc.prevzone);
	}

	PChar->status = STATUS_DISAPPEAR;
	PChar->PBattleAI->SetCurrentAction(ACTION_NONE);
	return 0;
} 	

/************************************************************************
*																		*
*  Запрос на список квестов и миссий, предметов и ключевых предметов	*																	
*																		*
************************************************************************/

int32 SmallPacket0x00F(map_session_data_t* session, CCharEntity* PChar, int8* data)
{
	charutils::SendKeyItems(PChar);
	charutils::SendQuestMissionLog(PChar);

	PChar->pushPacket(new CCharSpellsPacket(PChar));
	PChar->pushPacket(new CCharAbilitiesPacket(PChar));
	PChar->pushPacket(new CAutomatonUpdatePacket(PChar));
	PChar->pushPacket(new CCharSyncPacket(PChar));
	PChar->pushPacket(new CBazaarMessagePacket(PChar));

	charutils::SendInventory(PChar);
	return 0;
}

/************************************************************************
*																		*
*  Первый пакет после входа в игру / перехода между зонами, является	*
*  подтверждением завершения перехода персонажа.						*
*  Привязываем экипированные предметы + linkshell	 					*
*																		*
************************************************************************/	

int32 SmallPacket0x011(map_session_data_t* session, CCharEntity* PChar, int8* data)
{
	PChar->health.tp = 0;

	for(int32 i = 0; i < 16; ++i) 
	{
		if (PChar->equip[i] != 0) 
		{
			PChar->pushPacket(new CEquipPacket(PChar->equip[i],i));
		}
	}
	//PChar->pushPacket(CEquipPacket(PChar->equip[SLOT_LINK]));
	return 0;
}

/************************************************************************
*																		*
*  Перемещение персонажа (обновление позиции в зоне)					*
*  Обновление цели, выбранной персонажем, для правильного отображения	*
*  поворота головы. Из-за блуждания монстров необходимо проверять их 	*
*  видимость постоянно, так же как и видимость питомцев					*
*																		*
************************************************************************/

int32 SmallPacket0x015(map_session_data_t* session, CCharEntity* PChar, int8* data)
{
	if (PChar->status != STATUS_DISAPPEAR)
	{
		bool isUpdate = ( (PChar->status == STATUS_UPDATE) ||
						  (PChar->loc.p.x  != RBUFF(data,(0x04))) || 
						  (PChar->loc.p.z  != RBUFF(data,(0x0C))) ||
						  (PChar->m_TargID != RBUFW(data,(0x16))) );

		PChar->loc.p.x = RBUFF(data,(0x04));
		PChar->loc.p.y = RBUFF(data,(0x08));
		PChar->loc.p.z = RBUFF(data,(0x0C));

		PChar->loc.p.moving   = RBUFW(data,(0x12));
		PChar->loc.p.rotation = RBUFB(data,(0x14));

		PChar->m_TargID = RBUFW(data,(0x16));

		if (isUpdate)
		{
			PChar->status = STATUS_NORMAL;
			zoneutils::GetZone(PChar->getZone())->SpawnPCs(PChar);
			zoneutils::GetZone(PChar->getZone())->SpawnNPCs(PChar);
		}

		zoneutils::GetZone(PChar->getZone())->SpawnMOBs(PChar);
		zoneutils::GetZone(PChar->getZone())->SpawnPETs(PChar);

		if (PChar->PWideScanTarget != NULL)
		{
			PChar->pushPacket(new CWideScanTrackPacket(PChar->PWideScanTarget));

			if (PChar->PWideScanTarget->status == STATUS_DISAPPEAR)
			{
				PChar->PWideScanTarget = NULL;
			}
		}
	}
	return 0;
}

/************************************************************************
*																		*
*  Клиент запрашивает информацию об NPC, для отображения их в событиях	*
*																		*
************************************************************************/

int32 SmallPacket0x016(map_session_data_t* session, CCharEntity* PChar, int8* data)
{
	uint16 targid = RBUFW(data,(0x04));

	if (PChar->targid == targid)
	{
		PChar->pushPacket(new CCharPacket(PChar,ENTITY_SPAWN));
	}else{
		CBaseEntity* PNpc = zoneutils::GetZone(PChar->getZone())->GetEntity(targid, TYPE_NPC);

		if (PNpc == NULL)
		{
			PNpc = zoneutils::GetTrigger(targid, PChar->getZone());
		}
		PChar->pushPacket(new CEntityUpdatePacket(PNpc,ENTITY_SPAWN));
	}

	return 0;
}

/************************************************************************
*																		*
*  Kлиент сообщает серверу об ошибочном типе npc						*
*																		*
************************************************************************/

int32 SmallPacket0x017(map_session_data_t* session, CCharEntity* PChar, int8* data)
{
	uint16 targid = RBUFW(data,(0x04));
	uint32 npcid  = RBUFL(data,(0x08));
	uint8  type   = RBUFB(data,(0x12));

	ShowError(CL_RED"SmallPacket0x17: Incorrect NPC(%u,%u) type(%u)\n"CL_RESET, targid, npcid, type);
	return 0;
}

/************************************************************************
*																		*
*  Различные действия персонажа в игре: рыбалка, команды боя, общение	*
*  с npc и подобные														*
*																		*
************************************************************************/

int32 SmallPacket0x01A(map_session_data_t* session, CCharEntity* PChar, int8* data)
{
	uint32 ID     = RBUFL(data,(0x04));
	uint16 TargID =	RBUFW(data,(0x08));
	uint8  action = RBUFB(data,(0x0A));

	switch (action) 
	{
		case 0x00: // trigger
		{
			CBaseEntity* PNpc = zoneutils::GetZone(PChar->getZone() != 0 ? PChar->loc.zone : PChar->loc.prevzone)->GetEntity(TargID, TYPE_NPC);

			if (PNpc != NULL)
			{
				if (luautils::OnTrigger(PChar, PNpc) == -1 && 
					PNpc->animation == ANIMATION_CLOSE_DOOR)
				{
					PNpc->animation = ANIMATION_OPEN_DOOR;
					zoneutils::GetZone(PChar->getZone())->PushPacket(PNpc, CHAR_INRANGE, new CEntityUpdatePacket(PNpc,ENTITY_UPDATE)); 
					CTaskMgr::getInstance()->AddTask(new CTaskMgr::CTask("close_door",gettick()+7000,PNpc,CTaskMgr::TASK_ONCE,close_door));
				}
			}
			if(PChar->m_event.EventID == -1) 
			{
				PChar->m_event.reset();
				PChar->pushPacket(new CReleasePacket(PChar,RELEASE_STANDARD));
			}
		}
		break;	
		case 0x02: // attack
		{
			PChar->PBattleAI->SetCurrentAction(ACTION_ENGAGE, TargID);
			PChar->PBattleAI->CheckCurrentAction(gettick());
		}
		break;	
		case 0x03: // spellcast
		{
			uint16 SpellID = RBUFW(data,(0x0C));

			PChar->PBattleAI->SetCurrentSpell(SpellID);
			PChar->PBattleAI->SetCurrentAction(ACTION_MAGIC_START, TargID);
			PChar->PBattleAI->CheckCurrentAction(gettick());
		}
		break;
		case 0x04: // disengage
		{
			PChar->PBattleAI->SetCurrentAction(ACTION_DISENGAGE);
			PChar->PBattleAI->CheckCurrentAction(gettick());
		}
		break;	
		case 0x05: // call for help
		{
			for (SpawnIDList_t::iterator it = PChar->SpawnMOBList.begin(); it != PChar->SpawnMOBList.end(); ++it)
			{
				CMobEntity* MOB = (CMobEntity*)it->second;

				if (MOB->animation == ANIMATION_ATTACK &&
					MOB->PBattleAI->GetBattleTarget() == PChar)
				{
					MOB->m_CallForHelp = 0x20;
					zoneutils::GetZone(PChar->getZone())->PushPacket(PChar, CHAR_INRANGE_SELF, new CMessageBasicPacket(PChar,PChar,0,0,19));
					break;
				}
			}
			PChar->pushPacket(new CMessageBasicPacket(PChar,PChar,0,0,22));
		}
		break;
		case 0x07: // weaponskill
		{
			uint16 WSkillID = RBUFW(data,(0x0C));
			PChar->PBattleAI->SetCurrentWeaponSkill(WSkillID);
			PChar->PBattleAI->SetCurrentAction(ACTION_WEAPONSKILL_START, TargID);
			PChar->PBattleAI->CheckCurrentAction(gettick());
		}	
		break;	
		case 0x09: // jobability
		{
			PrintPacket(data);
			uint16 JobAbilityID = RBUFW(data,(0x0C));
			PChar->PBattleAI->SetCurrentJobAbility(JobAbilityID-16);
			PChar->PBattleAI->SetCurrentAction(ACTION_JOBABILITY_START, TargID);
			PChar->PBattleAI->CheckCurrentAction(gettick());
		}
		break;
		case 0x0B: // homepoint
		{
			PChar->health.hp = PChar->health.maxhp;
			PChar->health.mp = PChar->health.maxmp;

			PChar->loc.boundary = 0;
			PChar->loc.prevzone = PChar->loc.zone;
			PChar->loc.p = PChar->profile.home_point.p;
			PChar->loc.zone = PChar->profile.home_point.zone;

			PChar->status = STATUS_DISAPPEAR;
			PChar->animation = ANIMATION_NONE;

			PChar->clearPacketList();
			PChar->pushPacket(new CServerIPPacket(PChar,2));
		}		
		break;
		case 0x0C: break;	// assist
		case 0x0D: 	// raise menu
	    {
            PChar->PBattleAI->SetCurrentAction(ACTION_RAISE_MENU_SELECTION);
            PChar->PBattleAI->CheckCurrentAction(gettick());
	    } 
        break;
		case 0x0E: // рыбалка
		{
			fishingutils::StartFishing(PChar);
		}
		break;
		case 0x0F: // смена цели во время боя
		{
			PChar->PBattleAI->SetCurrentAction(ACTION_CHANGE_TARGET, TargID);
			PChar->PBattleAI->CheckCurrentAction(gettick());
		}
		break;
		case 0x10: // rangedattack
		{
			PChar->PBattleAI->SetCurrentAction(ACTION_RANGED_START, TargID);
			PChar->PBattleAI->CheckCurrentAction(gettick());
		}
		break;
		case 0x11: // chocobo digging
		{
			// bunch of gysahl greens
			uint8 slotID = PChar->getStorage(LOC_INVENTORY)->SearchItem(4545);

			if (slotID != ERROR_SLOTID)
			{
				charutils::UpdateItem(PChar, LOC_INVENTORY, slotID, -1);

				PChar->pushPacket(new CInventoryFinishPacket());
				PChar->pushPacket(new CChocoboDiggingPacket(PChar));
			}else{
				// You don't have any gysahl greens
				PChar->pushPacket(new CMessageSystemPacket(4545,0,39));			
			}
		}
		break;	
		case 0x12: 	// dismount
        {
            PChar->status = STATUS_UPDATE;
			PChar->animation = ANIMATION_NONE;
			PChar->StatusEffectContainer->DelStatusEffect(EFFECT_CHOCOBO);
			PChar->pushPacket(new CCharUpdatePacket(PChar));
        }
        break;
		case 0x13: // tractor menu
		{
                // по любому, это работает неправильно. проблемный код в комментарии

			    //PChar->PBattleAI->SetCurrentAction(ACTION_RAISE_MENU_SELECTION);
			    //PChar->PBattleAI->CheckCurrentAction(gettick());
			
			/*
			if(RBUFB(data,(0x0C)) == 0)
			{   
				PChar->status = STATUS_DISAPPEAR;
				PChar->loc.p  = PChar->m_StartActionPos;

				PChar->loc.boundary = 0;
				PChar->clearPacketList();
				PChar->pushPacket(new CServerIPPacket(PChar,2));
			}else{
				PChar->m_hasTractor = 0;
			}
			*/
		}
		break;	
		case 0x14: // окончание обновления данных персонажа
		{
			if (PChar->getZone() == 0)
			{
				zoneutils::GetZone(PChar->loc.prevzone)->SpawnMoogle(PChar);
			}else{
				zoneutils::GetZone(PChar->getZone())->SpawnPCs(PChar);
				zoneutils::GetZone(PChar->getZone())->SpawnNPCs(PChar);
				zoneutils::GetZone(PChar->getZone())->SpawnMOBs(PChar);
			}
		}
		break;
		case 0x18: // /blockaid
		{
			// Blockaid is currently inactive
			PChar->pushPacket(new CMessageSystemPacket(0,0,224));
		}
		break;
		default:
		{
			ShowWarning(CL_YELLOW"CLIENT PERFORMING UNHANDLED ACTION %02hX\n"CL_RESET, action);
			return 0;
		}
		break;
	}

	//ShowDebug(CL_CYAN"CLIENT PERFORMING ACTION %02hX\n"CL_RESET, action);
	return 0;
} 

/************************************************************************
*																		*
*  Назначение пакета неизвестно, но начинает появляться при				*
*  использовании способностей, если у персонажа есть питомец. Возможно	*
*  клиент требует недостающие пакеты.									*
*																		*
************************************************************************/

int32 SmallPacket0x01C(map_session_data_t* session, CCharEntity* PChar, int8* data)
{
	PrintPacket(data);
	return 0;
} 

/************************************************************************
*																		*
*  Удаление предметов из хранилищ										*
*																		*
************************************************************************/

int32 SmallPacket0x028(map_session_data_t* session, CCharEntity* PChar, int8* data)
{
	int32 quantity = RBUFB(data,(0x04));
	uint8  slotID  = RBUFB(data,(0x09));
	
	uint32 ItemID  = charutils::UpdateItem(PChar, LOC_INVENTORY, slotID, -quantity);

	if (ItemID != 0) 
	{
		PChar->pushPacket(new CMessageStandardPacket(0,ItemID,quantity,180));
	}

	PChar->pushPacket(new CInventoryFinishPacket());
	return 0;
}

/************************************************************************
*																		*
*  Перемещение предметов между хранилищами								*
*																		*
************************************************************************/

int32 SmallPacket0x029(map_session_data_t* session, CCharEntity* PChar, int8* data)
{
	uint32 quantity       = RBUFB(data,(0x04));
	uint8  FromLocationID = RBUFB(data,(0x08));
	uint8  ToLocationID   = RBUFB(data,(0x09));
	uint8  FromSlotID	  = RBUFB(data,(0x0A));
	uint8  ToSlotID		  = RBUFB(data,(0x0B));

	CItem* PItem = PChar->getStorage(FromLocationID)->GetItem(FromSlotID);

	if(PItem == NULL)
	{
		ShowWarning(CL_YELLOW"SmallPacket0x29: Trying to move NULL form location %u slot %u\n"CL_RESET, FromLocationID, FromSlotID);
		return 0;
	}
	if(PItem->getQuantity() < quantity) 
	{
		ShowWarning(CL_YELLOW"SmallPacket0x29: Trying to move too much quantity from location %u slot %u\n"CL_RESET, FromLocationID, FromSlotID);
		return 0;
	}

	uint8 newSlotID = 0;

	uint32 newQuantity = PItem->getQuantity() - quantity;
	if(newQuantity != 0) 
	{
		// делим пачку
		if (charutils::AddItem(PChar, ToLocationID, PItem->getID(), quantity) != ERROR_SLOTID) 
		{
			charutils::UpdateItem(PChar, FromLocationID, FromSlotID, -(int32)quantity);
		}
	}else{
		// переносим всю пачку, или пытаемся объединить одинаковые предметы
		if (ToSlotID < 82)
		{
			// объединение еще не реализовано
			ShowDebug("SmallPacket0x29: Trying to unite items\n", FromLocationID, FromSlotID);
			return 0;
		}
		newSlotID = PChar->getStorage(ToLocationID)->InsertItem(PItem);
		if(newSlotID != ERROR_SLOTID) 
		{
			const int8 *fmtQuery = "UPDATE char_inventory \
									SET location = %u, slot = %u \
									WHERE charid = %u AND location = %u AND slot = %u;";

			if( Sql_Query(SqlHandle,fmtQuery,ToLocationID,newSlotID,PChar->id,FromLocationID,FromSlotID) != SQL_ERROR &&
				Sql_AffectedRows(SqlHandle) != 0)
			{
				PChar->getStorage(FromLocationID)->InsertItem(NULL, FromSlotID);

				PChar->pushPacket(new CInventoryItemPacket(NULL, FromLocationID, FromSlotID));	// убираем предмет из FormLocationID
				PChar->pushPacket(new CInventoryItemPacket(PItem, ToLocationID, newSlotID));		// добавляем предмет в ToLocationID
			}
		}else{
			ShowDebug("SmallPacket0x29: Location %u is full\n", ToLocationID);
			return 0;
		}
	}

	PChar->pushPacket(new CInventoryFinishPacket());
	return 0;
}

/************************************************************************
*																		*
*  Передача предметов NPC (команда обмен - "trade")						*
*																		*
************************************************************************/

int32 SmallPacket0x036(map_session_data_t* session, CCharEntity* PChar, int8* data)
{
	uint32 npcid  = RBUFL(data,(0x04));
	uint16 targid = RBUFW(data,(0x3A));

	uint8  numItems = RBUFB(data,(0x3C));

	PChar->Container->Clean();

	for(int32 slotID = 0; slotID < numItems; ++slotID) 
	{
		uint8  invSlotID    = RBUFB(data,(0x30+slotID));
		uint32 itemQuantity = RBUFL(data,(0x08+slotID*4));
						
		CItem* PItem = PChar->getStorage(LOC_INVENTORY)->GetItem(invSlotID);

		if (PItem != NULL)
		{
			PChar->Container->setItem(slotID, PItem->getID(), invSlotID, itemQuantity);
		}
	}

	CBaseEntity* PNpc = zoneutils::GetZone(PChar->getZone())->GetEntity(targid, TYPE_NPC);

	if ((PNpc != NULL) && (PNpc->id == npcid))
	{
		luautils::OnTrade(PChar,PNpc);
	}
					
	return 0;
}

/************************************************************************
*																		*
*  Использование предметов												*
*																		*
************************************************************************/

int32 SmallPacket0x037(map_session_data_t* session, CCharEntity* PChar, int8* data)
{
	uint32 EntityID = RBUFL(data,(0x04));
	uint16 TargetID = RBUFW(data,(0x0C));
	uint8  SlotID   = RBUFB(data,(0x0E));

	CItemUsable* PItem = (CItemUsable*)PChar->getStorage(LOC_INVENTORY)->GetItem(SlotID);

	if ((PItem != NULL) && 
		(PItem->getType() & ITEM_USABLE))
	{
		if (PItem->getType() & ITEM_ARMOR)
		{
			//TODO: если ITEM_LOCKED, то должна быть проверка на то, что предмет экипирован
		}
		else if (PItem->getSubType() & ITEM_LOCKED)
		{
			return 0;
		}
		if (PChar->UContainer->GetType() == UCONTAINER_EMPTY)
		{
			PChar->UContainer->SetType(UCONTAINER_USEITEM);
			PChar->UContainer->SetItem(0, PItem);

			PChar->PBattleAI->SetCurrentAction(ACTION_ITEM_START, TargetID);

			if (PChar->PBattleAI->GetCurrentAction() != ACTION_ITEM_START)
			{
				PChar->UContainer->Clean();
			}
		}
	}
	return 0;
}

/************************************************************************
*																		*
*  Сортировка инвентаря													*
*  Жестокий алгоритм, но лучшего для неупорядоченного массива не найдем	*
*  80 - ячеек. Минимальное количество проверок - 80, максимальное 3240	*
*																		*
************************************************************************/

int32 SmallPacket0x03A(map_session_data_t* session, CCharEntity* PChar, int8* data)
{
	CItemContainer* PItemContainer = PChar->getStorage(RBUFB(data,(0x04)));

	uint8 size = PItemContainer->GetSize();

	if (size > 0)
	{
		for (uint8 slotID = 1; slotID <= size; ++slotID) 
		{
			CItem* PItem = PItemContainer->GetItem(slotID);

			if ( (PItem != NULL) && 
				 (PItem->getQuantity() < PItem->getStackSize()) &&
				!(PItem->getSubType() & ITEM_LOCKED))
			{
				for (uint8 slotID2 = slotID+1; slotID2 <= size; ++slotID2) 
				{
					CItem* PItem2 = PItemContainer->GetItem(slotID2);

					if ( (PItem2 != NULL) &&  
						 (PItem2->getID() == PItem->getID()) &&
						 (PItem2->getQuantity() < PItem2->getStackSize()) &&
						!(PItem2->getSubType() & ITEM_LOCKED)) 
					{
						uint32 totalQty = PItem->getQuantity() + PItem2->getQuantity();
						uint32 moveQty  = 0;

						if (totalQty >= PItem->getStackSize()) {
							moveQty = PItem->getStackSize() - PItem->getQuantity();
						} else {
							moveQty = PItem2->getQuantity();
						}
						if(moveQty > 0) 
						{
							charutils::UpdateItem(PChar, PItemContainer->GetID(), slotID, moveQty);
							charutils::UpdateItem(PChar, PItemContainer->GetID(), slotID2, -(int32)moveQty);								
						}
					}
				}
			}
		}
		PChar->pushPacket(new CInventoryFinishPacket());
	}
	
	return 0;
}

/************************************************************************
*																		*
*  Вероятно сообщение о недополучении каких-либо инициализирующих		*
*  пакетов для монстров, npc или других игроков. всегда пустое.			*
*																		*
************************************************************************/

int32 SmallPacket0x03C(map_session_data_t* session, CCharEntity* PChar, int8* data)
{
	ShowWarning(CL_YELLOW"SmallPacket0x03C\n"CL_RESET);
	return 0;
}

/************************************************************************
*																		*
*  Персонаж голосует за предмет в TreasurePool							*
*																		*
************************************************************************/					

int32 SmallPacket0x041(map_session_data_t* session, CCharEntity* PChar, int8* data)
{
	//PrintPacket(data);
	//uint8 SlotID  = RBUFB(data,(0x04));
	//uint16 lot = 1+(rand()%1000);
	//PChar->PTreasurePool->LotItem(PChar,SlotID,lot);

    PChar->pushPacket(new CMessageSystemPacket(0,0,155));
	return 0;
}

/************************************************************************
*																		*
*  Персонаж отказывается от предмета в TreasurePool						*
*																		*
************************************************************************/					

int32 SmallPacket0x042(map_session_data_t* session, CCharEntity* PChar, int8* data)
{
	PrintPacket(data);

	uint8 SlotID  = RBUFB(data,(0x04));

	PChar->PTreasurePool->LotItem(PChar, SlotID,0);
	return 0;
}

/************************************************************************
*																		*
*  Отправляем приветственное сообщение сервера.							*
*  По умолчанию появится сообщение <<< Welcome to "server name" >>> +	*
*  можно отправить дополнительные строки информации в размере 230 байт	*
*																		*
************************************************************************/					

int32 SmallPacket0x04B(map_session_data_t* session, CCharEntity* PChar, int8* data)
{
    PChar->pushPacket(new CServerMessagePacket(map_config.server_message));
	return 0;
}

/************************************************************************
*																		*
*  Все действия с Delivery Box											*
*																		*
************************************************************************/					

int32 SmallPacket0x04D(map_session_data_t* session, CCharEntity* PChar, int8* data)
{
	uint8 action  = RBUFB(data,(0x04));
	uint8 boxtype = RBUFB(data,(0x05));
	uint8 slotID  = RBUFB(data,(0x06));

    ShowDebug(CL_CYAN"DeliveryBox Action (%02hx)\n"CL_RESET, RBUFB(data,(0x04)));
    PrintPacket(data);

	// 0x01 - отправка клиенту старых предметов
	// 0x02 - добавление предметов в список отправляемых (подготовка к отправке)
	// 0x03 - подтверждение отправки (отправляем предметы)
	// 0x04 - возврат неправильно отправленного предмета (отмена выполненной отправки)
	// 0x05 - отправка клиенту количества новых предметов
	// 0x06 - отправка клиенту новых предметов
	// 0x07 -
	// 0x08 - обновление предмета в ячейке перед удалением
	// 0x09 - взять предмет из ячейки
	// 0x0a - вернуть предмет отправителю
	// 0x0b - удаление предмета из ячейки
	// 0x0c - подтверждение введенного имени в окне отправки
	// 0x0d - открытие окна отправки почты
	// 0x0e - открытие окна приема почты
	// 0x0f - закрытие окна почты

	switch (action)
	{
		case 0x01:
		{
			// отправляем персонажу старые предметы (предметы, которые персонаж уже видел в delivery box)
			// все старые предметы расположены в ячейках 0-7

            PChar->UContainer->Clean();
            PChar->UContainer->SetType(UCONTAINER_DELIVERYBOX);

			const int8* fmtQuery = "SELECT itemid, itemsubid, slot, quantity, sender \
                                    FROM delivery_box \
							        WHERE charid = %u \
							        ORDER BY slot \
							        LIMIT 8";

	        int32 ret = Sql_Query(SqlHandle, fmtQuery, PChar->id);

	        if (ret != SQL_ERROR && Sql_NumRows(SqlHandle) != 0)
	        {
                uint8 slotid    = 8;
                uint8 old_items = 0;

		        while(Sql_NextRow(SqlHandle) == SQL_SUCCESS) 
		        {
                    CItem* PItem = itemutils::GetItem(Sql_GetUIntData(SqlHandle,0));

                    PItem->setSubID(Sql_GetIntData(SqlHandle,1));
                    PItem->setSlotID(Sql_GetIntData(SqlHandle,2));
                    PItem->setQuantity(Sql_GetUIntData(SqlHandle,3));
                    PItem->setSender(Sql_GetData(SqlHandle,4));

                    if (PItem->getSlotID() < 8)
                    {
                        old_items++;
                        PChar->UContainer->SetItem(PItem->getSlotID(), PItem);
                        continue;
                    }
                    PChar->UContainer->SetItem(slotid++, PItem);
		        }
                for (uint8 i = 0; i < 8; ++i)
                {
                    if (!PChar->UContainer->IsSlotEmpty(i))
                    {
                        PChar->pushPacket(new CDeliveryBoxPacket(action, PChar->UContainer->GetItem(i), old_items));
                    }
                }
	        }
            return 0;
		}
		case 0x05:
		{
			// отправляем персонажу количество новых предметов (предметы, которые персонаж еще не видел в delivery box)
			// все новые предметы помещаются в контейнет начиная со значения 8
			// перемещаем новые предметы в свободные ячейки delivery box
			
            if (PChar->UContainer->GetType() != UCONTAINER_DELIVERYBOX) return 0;
 
            uint8 new_items = 0;
            
            for (uint8 slotid = 8; slotid < 16; ++slotid)
		    {
                if (PChar->UContainer->IsSlotEmpty(slotid)) break;

                CItem* PItem = PChar->UContainer->GetItem(slotid);

                for (uint8 i = 0; i < 8 ; ++i)
                {
                    if (PChar->UContainer->IsSlotEmpty(i))
                    {
                        if (Sql_Query(SqlHandle, "UPDATE delivery_box SET slot = %u WHERE charid = %u AND slot = %u", i, PChar->id, PItem->getSlotID()) != SQL_ERROR &&
                            Sql_AffectedRows(SqlHandle) != 0)
                        {
                            PItem->setSlotID(i);
                            PChar->UContainer->SetItem(i, PItem);
                            PChar->UContainer->SetItem(slotid, NULL);
                            new_items++;
                        }
                        break;
                    }
                }
			}
			PChar->pushPacket(new CDeliveryBoxPacket(action, new_items));
			return 0;
		}
		case 0x06:
		case 0x08:
		{
			// 0x08 и 0x06 идентичны
			//
			// 0х06 - добавляем предмет в определенную ячейку
			// 0х08 - обновляем предмет в определенной ячейке

			// отправляем персонажу все новые предметы (предметы, которые персонаж еще не видел в delivery box)
			// клиент отправляет запрос серверу для каждого нового предмета, при этом указывая, какая ячейка его интересует
			//
			// сервер должен отправлять два пакета с действием 0х06
			// у первого пакета data[0x0c] равняется 0x02, у второго 0x01, в остальном заголовок идентичен
			// возможно это связано с тем, что я сам отправлял себе предметы
			//
			// 0x4b 0x2c 0x00 0x00 0x06 0x01 0x01 0x01 0xff 0xff 0xff 0xff 0x02 0x01 0xff 0xff
			// 0x00 0x00 0x00 0x00 0x00 0x00 0x00 0x00 0x00 0x00 0x00 0x00 0x00 0x00 0x00 0x00
			// 0x00 0x00 0x00 0x00 0x00 0x00 0x00 0x00 0x00 0x00 0x00 0x00 0x00 0x00 0x00 0x00
			// 0x00 0x00 0x00 0x00 0x00 0x00 0x00 0x00 0x00 0x00 0x00 0x00 0x00 0x00 0x00 0x00
			// 0x00 0x00 0x00 0x00 0x00 0x00 0x00 0x00 0x00 0x00 0x00 0x00 0x00 0x00 0x00 0x00
			//
			// зачем нужен этот пустой пакет я не знаю, но и без него все отлично работает
			// предположительно он отчищает целевую ячейку от предметов, на всякий случай

            if (PChar->UContainer->GetType() == UCONTAINER_DELIVERYBOX &&
               !PChar->UContainer->IsSlotEmpty(slotID))
            {
                PChar->pushPacket(new CDeliveryBoxPacket(action, PChar->UContainer->GetItem(slotID), 1));
            }
			return 0;
		}
        case 0x09:
        case 0x0A:
        {
            //PChar->pushPacket(new CMessageStandardPacket(PChar, 0, 142));
            if (PChar->UContainer->GetType() == UCONTAINER_DELIVERYBOX &&
               !PChar->UContainer->IsSlotEmpty(slotID))
            {
                PChar->pushPacket(new CDeliveryBoxPacket(action, PChar->UContainer->GetItem(slotID), 1));
            }
			return 0;
        }
        break;
		case 0x0B:
		{
            // удаление предмета из ячейки

            if (PChar->UContainer->GetType() == UCONTAINER_DELIVERYBOX &&
               !PChar->UContainer->IsSlotEmpty(slotID))
            {
                if (Sql_Query(SqlHandle, "DELETE FROM delivery_box WHERE charid = %u AND slot = %u", PChar->id, slotID) != SQL_ERROR && 
                    Sql_AffectedRows(SqlHandle) != 0)
                {
                    PChar->pushPacket(new CDeliveryBoxPacket(action, PChar->UContainer->GetItem(slotID), 1));
                }
            }
			return 0;
		}
        case 0x0F:
        {
            if (PChar->UContainer->GetType() == UCONTAINER_DELIVERYBOX)
            {
                PChar->UContainer->Clean(true);
            }
        }
        break;
	}
	
	// отправка простых действий - открыть окно почты, закрыть окно почты

	PChar->pushPacket(new CDeliveryBoxPacket(action, 0));
	return 0;
}

/************************************************************************
*																		*
*  Все действия с Auction House                                         *
*																		*
************************************************************************/					

int32 SmallPacket0x04E(map_session_data_t* session, CCharEntity* PChar, int8* data)
{
	uint8  action   = RBUFB(data,(0x04));
    uint8  slotid   = RBUFB(data,(0x05));
    uint32 price    = RBUFL(data,(0x08));
    uint8  slot     = RBUFB(data,(0x0C));
    uint16 itemid   = RBUFW(data,(0x0E));
    uint8  quantity = RBUFB(data,(0x10));

    ShowDebug(CL_CYAN"AH Action (%02hx)\n"CL_RESET, RBUFB(data,(0x04)));
    PrintPacket(data);

    // 0x04 - продажа предмета
    // 0x05 - похоже, что в ответ на этот пакет мы можем открыть список продаж или предложить персонажу подождать немного
    // 0x0A - получение списка продаваемых персонажем предметов
    // 0x0B - подтверждение покупки
    // 0x0E - покупка предмета
    // 0x0С - отмена продажи
    // 0x0D - обновление списка продаваемых персонажем предметов

    switch(action) 
    {	
        case 0x04:
        { 
            CItem* PItem = PChar->getStorage(LOC_INVENTORY)->GetItem(slot);

            if ((PItem != NULL) && 
                (PItem->getID() == itemid) &&
               !(PItem->getSubType() & ITEM_LOCKED) &&
               !(PItem->getFlag() & ITEM_FLAG_NOAUCTION))
            {
                PItem->setCharPrice(price);
                PChar->pushPacket(new CAuctionHousePacket(action, PItem, quantity));
            }
		} 
        break;
        case 0x05: 
        { 
            // TODO: необходим таймер последного запроса статуса продаж; открывать список не чаще раза в 5 секунд

            PChar->pushPacket(new CAuctionHousePacket(action));
		} 
        break;
        case 0x0A: 
        { 
            // TODO: в идеале, хорошо было бы загружать продаваемые предметы в универсальный контейнер персонажа
            
            // ограничение клиента игры на 7 одновременно продаваемых предмета

            for (int8 slot = 0; slot < 5; ++slot)
            {
                PChar->pushPacket(new CAuctionHousePacket(0x0C, slot));
            }
		}
        break;
		case 0x0B: 
        {
            CItem* PItem = PChar->getStorage(LOC_INVENTORY)->GetItem(slot);

            if ((PItem != NULL) && 
               !(PItem->getSubType() & ITEM_LOCKED) &&
               !(PItem->getFlag() & ITEM_FLAG_NOAUCTION))
            {
                if (quantity == 0 &&
                   (PItem->getStackSize() == 1 ||
                    PItem->getStackSize() != PItem->getQuantity()))
                {
                    ShowError(CL_RED"SmallPacket0x04E::AuctionHouse: Incorrect quantity of item\n"CL_RESET);
                    return 0;
                }

                const int8* fmtQuery = "INSERT INTO auction_house(itemid, stack, seller, seller_name, date, price) \
									    VALUES(%u,%u,%u,'%s',%u,%u)";

			    if (Sql_Query(SqlHandle, 
                              fmtQuery,
                              PItem->getID(),
                              quantity == 0,
                              PChar->id,
                              PChar->GetName(),
                              CVanaTime::getInstance()->getSysTime(),
                              price) == SQL_ERROR)
			    {
				    ShowError(CL_RED"SmallPacket0x04E::AuctionHouse: Cannot insert item to database\n"CL_RESET);
				    return 0;
			    }
                charutils::UpdateItem(PChar, LOC_INVENTORY, slot, -(int32)(quantity != 0 ? 1 : PItem->getStackSize()));
            }
		} 
        break;
		case 0x0E: 
        {
            itemid = RBUFW(data,(0x0C));

            if (PChar->getStorage(LOC_INVENTORY)->GetFreeSlotsCount() == 0)
            {
                PChar->pushPacket(new CAuctionHousePacket(action, 0xE5, 0, 0));
            }
            else
            {
                CItem* PItem = itemutils::GetItemPointer(itemid);

                if (PItem != NULL)
                {
                    if (PItem->getFlag() & ITEM_FLAG_RARE)
                    {
                        for (uint8 LocID = 0; LocID < MAX_CONTAINER_ID; ++LocID)
			            {
				            if (PChar->getStorage(LocID)->SearchItem(itemid) != ERROR_SLOTID)
				            {
					            PChar->pushPacket(new CAuctionHousePacket(action, 0xE5, 0, 0));           
					            return 0;
				            }
			            }
                    }
                    CItem* gil  = PChar->getStorage(LOC_INVENTORY)->GetItem(0);
	
	                if (gil != NULL && 
                        gil->getType() & ITEM_CURRENCY &&
                        gil->getQuantity() >= price)
	                {
                        const int8* fmtQuery = "UPDATE auction_house \
                                                SET buyer_name = '%s', sale = %u, sell_date = %u \
                                                WHERE itemid = %u AND buyer_name IS NULL AND stack = %u AND price <= %u \
                                                ORDER BY price \
                                                LIMIT 1";

                        if (Sql_Query(SqlHandle, 
                                      fmtQuery, 
                                      PChar->GetName(), 
                                      price, 
                                      CVanaTime::getInstance()->getSysTime(),
                                      itemid,
                                      quantity == 0,
                                      price) != SQL_ERROR &&
                            Sql_AffectedRows(SqlHandle) != 0)
                        {
                            uint8 SlotID = charutils::AddItem(PChar, LOC_INVENTORY, itemid, (quantity == 0 ? PItem->getStackSize() : 1));

			                if (SlotID != ERROR_SLOTID)
			                {
				                charutils::UpdateItem(PChar, LOC_INVENTORY, 0, -(int32)(price));

                                PChar->pushPacket(new CAuctionHousePacket(action, 0x01, itemid, price));
				                PChar->pushPacket(new CInventoryFinishPacket());
                            }
                            return 0;
                        }
                    }
                }
                PChar->pushPacket(new CAuctionHousePacket(action, 0xC5, itemid, price));
            }
        } 
        break;
        case 0x0C: 
        {
		
		}
        break;
		case 0x0D: 
        {
            PChar->pushPacket(new CAuctionHousePacket(action, slotid));
		} 
        break;
	}
    return 0;
}

/************************************************************************
*																		*
*  Смена экипировки														*
*																		*
************************************************************************/					

int32 SmallPacket0x050(map_session_data_t* session, CCharEntity* PChar, int8* data)
{
	if (PChar->status != STATUS_NORMAL)
		return 0;

	uint8 slotID      = RBUFB(data,(0x04));
	uint8 equipSlotID = RBUFB(data,(0x05));
	
	charutils::EquipItem(PChar, slotID, equipSlotID);
	return 0;
}

/************************************************************************
*																		*
*  Завершение синтеза													*
*																		*
************************************************************************/					

int32 SmallPacket0x059(map_session_data_t* session, CCharEntity* PChar, int8* data)
{
	synthutils::sendSynthDone(PChar);
	return 0;
}

/************************************************************************
*																		*
*  Обновляем карты conquest, besieged, compaing							*
*																		*
************************************************************************/					

int32 SmallPacket0x05A(map_session_data_t* session, CCharEntity* PChar, int8* data)
{
	PChar->pushPacket(new CConquestPacket(PChar));
	PChar->pushPacket(new CCampaingPacket(PChar,0));
	PChar->pushPacket(new CCampaingPacket(PChar,1));

	// пакет не на своем месте, возможно 0x0F
	PChar->pushPacket(new CStopDownloadingPacket(PChar)); 
	return 0;
}

/************************************************************************
*																		*
*  Завершаем или обновляем текущее событие                              *
*																		*
************************************************************************/					

int32 SmallPacket0x05B(map_session_data_t* session, CCharEntity* PChar, int8* data)
{
	uint16 EventID = RBUFW(data,(0x12));
	uint32 Result  = RBUFL(data,(0x08));

	if (RBUFB(data,(0x0E)) != 0){
		luautils::OnEventUpdate(PChar,EventID,Result);
	}else{
		luautils::OnEventFinish(PChar,EventID,Result);
		PChar->m_event.reset();
	}

	PChar->pushPacket(new CReleasePacket(PChar,RELEASE_EVENT));
	return 0;
}

/************************************************************************
*																		*
*  Завершаем или обновляем текущее событие                              *
*  Так же требуется обновить позицию персонажа                          *
*																		*
************************************************************************/					

int32 SmallPacket0x05C(map_session_data_t* session, CCharEntity* PChar, int8* data)
{
	uint16 EventID = RBUFW(data,(0x1A));

	PChar->loc.p.x = RBUFF(data,(0x04));
	PChar->loc.p.y = RBUFF(data,(0x08));
	PChar->loc.p.z = RBUFF(data,(0x0C));
	PChar->loc.p.rotation = RBUFB(data,(0x1F));

	if (RBUFB(data,(0x1E)) != 0){
		luautils::OnEventUpdate(PChar,EventID,0);
	}else{
		luautils::OnEventFinish(PChar,EventID,0);
		PChar->m_event.reset();
	}

	PChar->pushPacket(new CCSPositionPacket(PChar));
	PChar->pushPacket(new CPositionPacket(PChar));
	PChar->pushPacket(new CReleasePacket(PChar,RELEASE_EVENT));
	return 0;
}

/************************************************************************
*																		*
*  Эмоции персонажей, включая специфические (/jobemote [job])			*
*																		*
************************************************************************/					

int32 SmallPacket0x05D(map_session_data_t* session, CCharEntity* PChar, int8* data)
{
	zoneutils::GetZone(PChar->getZone())->PushPacket(PChar, CHAR_INRANGE_SELF, new CCharEmotionPacket(PChar,data));
	return 0;
}

/************************************************************************
*																		*
*  Перемещение персонажа между зонами (zoneline)						*
*																		*
************************************************************************/					

int32 SmallPacket0x05E(map_session_data_t* session, CCharEntity* PChar, int8* data)
{
	uint32 zoneLineID = RBUFL(data,(0x04));
	uint8  town		  = RBUFB(data,(0x16)); // используются при выходе из mog house
	uint8  zone		  = RBUFB(data,(0x17)); // используются при выходе из mog house

	// переход между зонами с использованием таблицы zoneline
	//
	// игнорируем все zoneline пакеты,
	// пока не завершен текущий переход

	if (PChar->status == STATUS_NORMAL)
	{
		PChar->status = STATUS_DISAPPEAR;
		PChar->loc.boundary = 0;

		zoneLine_t* PZoneLine = zoneutils::GetZone(PChar->getZone())->GetZoneLine(zoneLineID);

		if (PZoneLine == NULL)
		{
			ShowError(CL_RED"SmallPacket0x5E: Zone line %u not found\n"CL_RESET, zoneLineID); // в идеале нужно добавить зону и координаты

			// You could not enter the next area.
			// разворачиваем персонажа на 180° и отправляем туда, откуда пришел

			PChar->loc.p.rotation += 128;

		}else{
			if (zoneutils::GetZone(PZoneLine->m_toZone)->GetIP() == 0)
			{
				ShowDebug(CL_CYAN"SmallPacket0x5E: Zone %u closed to chars\n"CL_RESET, PZoneLine->m_toZone);

				// You could not enter the next area.
				// разворачиваем персонажа на 180° и отправляем туда, откуда пришел

				PChar->loc.p.rotation += 128;

			}else{
				if(PZoneLine->m_zoneLineID == 1903324538)
				{
					uint8 prevzone  = 0;

					switch (town)
					{
						case 1: prevzone = zone + 0xE5; break;
						case 2: prevzone = zone + 0xE9; break;
						case 3: prevzone = zone + 0xED; break;
						case 4: prevzone = zone + 0xF2; break;
						case 5: prevzone = zone + (zone == 1 ? 0x2F : 0x30); break;
					}
					PChar->loc.zone = ( zone == 0 ? PChar->loc.prevzone : prevzone);
				}else{
					PChar->loc.prevzone = PChar->getZone();
					PChar->loc.zone     = PZoneLine->m_toZone;
				}
				PChar->loc.p = PZoneLine->m_toPos;
			}
		}
		ShowInfo(CL_WHITE"Zoning from zone %u to zone %u: %s\n"CL_RESET, PChar->loc.prevzone, PChar->loc.zone, PChar->GetName());
	}

	PChar->clearPacketList();
	PChar->pushPacket(new CServerIPPacket(PChar,2));
	return 0;
}

/************************************************************************
*                                                                       *
*  Персонаж присылает текстовую информацию для продолжения события      *
*                                                                       *
************************************************************************/					

// zone 245 cs 0x00C7 Password

int32 SmallPacket0x060(map_session_data_t* session, CCharEntity* PChar, int8* data)
{
	PrintPacket(data);

  //luautils::OnEventUpdate(PChar, 0, 0);
  //PChar->pushPacket(new CReleasePacket(PChar,RELEASE_EVENT));
	return 0;
}

/************************************************************************
*																		*
*																		*
*																		*
************************************************************************/					

int32 SmallPacket0x061(map_session_data_t* session, CCharEntity* PChar, int8* data)
{
	PChar->pushPacket(new CCharUpdatePacket(PChar));
	PChar->pushPacket(new CCharHealthPacket(PChar));
	PChar->pushPacket(new CCharStatsPacket(PChar));
	PChar->pushPacket(new CCharSkillsPacket(PChar));
	PChar->pushPacket(new CMenuMeritPacket(PChar));
	return 0;
}

/************************************************************************
*																		*
*  Завершение раскопок chocobo (chocobo gigging)						*
*																		*
************************************************************************/					

int32 SmallPacket0x063(map_session_data_t* session, CCharEntity* PChar, int8* data)
{
	return 0;
}

/************************************************************************
*																		*
*  Помечаем KeyItem как "увиденный"										*
*																		*
************************************************************************/					

int32 SmallPacket0x064(map_session_data_t* session, CCharEntity* PChar, int8* data)
{
	uint8 KeyTable = RBUFB(data,(0x4A));
	memcpy(PChar->keys.seenList+(0x40*KeyTable),data+(0x08),0x40);

	charutils::SaveKeyItems(PChar);
	return 0;
}

/************************************************************************
*																		*
*  Окончание рыбалки													*
*																		*
************************************************************************/					

int32 SmallPacket0x066(map_session_data_t* session, CCharEntity* PChar, int8* data)
{
	PrintPacket(data);

	uint16 stamina = RBUFW(data,(0x08));
	uint8  action  = RBUFB(data,(0x0E));
					
	fishingutils::FishingAction(PChar, (FISHACTION)action, stamina);
	return 0;
}

/************************************************************************
*																		*
*																		*
*																		*
************************************************************************/					

int32 SmallPacket0x06E(map_session_data_t* session, CCharEntity* PChar, int8* data)
{
	uint32 CharID = RBUFL(data,0x04);
	uint16 TargID = RBUFW(data,0x08);

	// Персонаж не должен приглашать сам себя.
	if (PChar->id == CharID)
		return 0;

    CCharEntity* PInvitee = zoneutils::GetCharFromRegion(CharID, conquest::GetCurrentRegion(PChar->getZone()));

	if (PInvitee != NULL)
	{
		if (PInvitee->PParty != NULL)
		{
			PChar->pushPacket(new CMessageStandardPacket(PChar, 0, 0, 12));
			return 0;
		}
		if (PInvitee->isDead() ||
			PInvitee->InvitePending != 0)
		{
			PChar->pushPacket(new CMessageStandardPacket(PChar, 0, 0, 23));
			return 0;
		}
		// TODO: а ведь мы можем сохранять и targid приглашающего, для корректного поиска
		PInvitee->InvitePending = PChar->id;
		PInvitee->pushPacket(new CPartyInvitePacket(PInvitee, PChar, INVITE_PARTY));

		if (PChar->PParty != NULL &&
			PChar->PParty->GetSyncTarget() != NULL)
		{
			PInvitee->pushPacket(new CMessageStandardPacket(PInvitee, 0, 0, 235));
		}
	}
	return 0;
}

/************************************************************************
*																		*
*  Персонаж покидает группу												*
*																		*
************************************************************************/					

int32 SmallPacket0x06F(map_session_data_t* session, CCharEntity* PChar, int8* data)
{
	if (PChar->PParty != NULL)
	{
		PChar->PParty->RemoveMember(PChar);
	}
	return 0;
}

/************************************************************************
*																		*
*  Лидер распускает группу												*
*																		*
************************************************************************/					

int32 SmallPacket0x070(map_session_data_t* session, CCharEntity* PChar, int8* data)
{
	if (PChar->PParty != NULL &&
		PChar->PParty->GetLeader() == PChar) 
	{
		PChar->PParty->DisbandParty();
	}
	return 0;
}

/************************************************************************
*																		*
*  Удаляем члена группы или linckshell									*
*																		*
************************************************************************/					

int32 SmallPacket0x071(map_session_data_t* session, CCharEntity* PChar, int8* data)
{
	switch(RBUFB(data,(0x0A)))
	{
		case 0:
		{
			if (PChar->PParty != NULL &&
				PChar->PParty->GetLeader() == PChar)
			{
				PChar->PParty->RemoveMemberByName(data+0x0C);
			}
		}
		break;
		default:
		{
			ShowError(CL_RED"SmallPacket0x071 : Remove packet with unknown byte <%.2X>\n"CL_RESET, RBUFB(data,(0x0A)));
		}
	}
	return 0;
}

/************************************************************************
*																		*
*  Персонаж отвечает на приглашение в группу							*
*																		*
************************************************************************/					

int32 SmallPacket0x074(map_session_data_t* session, CCharEntity* PChar, int8* data)
{
    CCharEntity* PInviter = zoneutils::GetCharFromRegion(PChar->InvitePending, conquest::GetCurrentRegion(PChar->getZone()));

	if (PInviter != NULL) 
	{
		uint8 InviteAnswer = RBUFB(data,(0x04));

		if (InviteAnswer == 0)
		{
			PInviter->pushPacket(new CMessageStandardPacket(PInviter, 0, 0, 11));
		}
		else
		{
			if (PInviter->PParty == NULL)
			{
				CParty* PParty = new CParty(PInviter);
			}
			PInviter->PParty->AddMember(PChar);
		}
	}
	PChar->InvitePending = 0;
	return 0;
}

/************************************************************************
*																		*
*  Персонаж запрашивает информацию о членах группы						*
*																		*
************************************************************************/					

int32 SmallPacket0x076(map_session_data_t* session, CCharEntity* PChar, int8* data)
{
	if (PChar->PParty != NULL)
	{
		PChar->PParty->ReloadPartyMembers(PChar);
	}
	return 0;
}

/************************************************************************
*																		*
*																		*
*																		*
************************************************************************/					

int32 SmallPacket0x077(map_session_data_t* session, CCharEntity* PChar, int8* data)
{
	switch(RBUFB(data,(0x14)))
	{
		case 0:
		{
			if (PChar->PParty != NULL &&
				PChar->PParty->GetLeader() == PChar)
			{
				PChar->PParty->AssignPartyRole(data+0x04, RBUFB(data,(0x15)));
			}
		}
		break;
		default:
		{
			ShowError(CL_RED"SmallPacket0x077 : changing role packet with unknown byte <%.2X>\n"CL_RESET, RBUFB(data,(0x14)));
		}
	}
	return 0;
}

/************************************************************************
*																		*
*  Запрос перед поиском членов группы									*
*																		*
************************************************************************/					

int32 SmallPacket0x078(map_session_data_t* session, CCharEntity* PChar, int8* data)
{
	PChar->pushPacket(new CPartySearchPacket(PChar));
	return 0;
}

/************************************************************************
*																		*
*  Покупка предмета в магазине											*
*																		*
************************************************************************/					

int32 SmallPacket0x083(map_session_data_t* session, CCharEntity* PChar, int8* data)
{
	uint8  quantity   = RBUFB(data,(0x04)); 	
	uint8  shopSlotID = RBUFB(data,(0x0A));

	uint16 itemID = PChar->Container->getItemID(shopSlotID);
	uint32 price  = PChar->Container->getQuantity(shopSlotID); // здесь мы сохранили стоимость предмета

	CItem* gil  = PChar->getStorage(LOC_INVENTORY)->GetItem(0);
	
	if ((gil != NULL) && (gil->getType() & ITEM_CURRENCY))
	{
		if (gil->getQuantity() > (price * quantity))
		{
			uint8 SlotID = charutils::AddItem(PChar, LOC_INVENTORY, itemID, quantity);

			if (SlotID != ERROR_SLOTID)
			{
				charutils::UpdateItem(PChar, LOC_INVENTORY, 0, -(int32)(price * quantity));

				PChar->pushPacket(new CShopBuyPacket(shopSlotID, quantity));
				PChar->pushPacket(new CInventoryFinishPacket());
			}
		}
	}
	return 0;
}

/************************************************************************
*																		*
*  Оценка стоимости предмета перед продажей в магазин					*
*  Помещаем информацию о продаваемом предмете в последнюю ячейку		*
*  контейнера															*
*																		*
************************************************************************/					

int32 SmallPacket0x084(map_session_data_t* session, CCharEntity* PChar, int8* data)
{
	uint32 quantity = RBUFL(data,(0x04)); 
	uint16 itemID   = RBUFW(data,(0x08));		
	uint8  slotID   = RBUFB(data,(0x0A));

	CItem* PItem = PChar->getStorage(LOC_INVENTORY)->GetItem(slotID);
	if( (PItem != NULL) && 
		(PItem->getID() == itemID) && 
	   !(PItem->getFlag() & ITEM_FLAG_NOSALE) )
	{
		// подготавливаем предмет для продажи
		PChar->Container->setItem(16, itemID, slotID, quantity);
		PChar->pushPacket(new CShopAppraisePacket(slotID, PItem->getBasePrice()));
	}
	return 0;
}

/************************************************************************
*																		*
*  Продажа предмета в магазин											*
*  Информация о продаваемом предмете была предварительно сохранена в	*
*  последней (16-ой) ячейке контейнера в 0x084-ом пакете 				*
*																		*
************************************************************************/					

int32 SmallPacket0x085(map_session_data_t* session, CCharEntity* PChar, int8* data)
{
	uint32 quantity = PChar->Container->getQuantity(16);
	uint16 itemID   = PChar->Container->getItemID(16);
	uint8  slotID   = PChar->Container->getInvSlotID(16);

	CItem* gil   = PChar->getStorage(LOC_INVENTORY)->GetItem(0);
	CItem* PItem = PChar->getStorage(LOC_INVENTORY)->GetItem(slotID);

	if ( (PItem != NULL) && (gil != NULL) && (gil->getType() & ITEM_CURRENCY) )
	{
		charutils::UpdateItem(PChar, LOC_INVENTORY, 0, quantity * PItem->getBasePrice());
		charutils::UpdateItem(PChar, LOC_INVENTORY, slotID, -(int32)quantity);

		PChar->pushPacket(new CMessageStandardPacket(0, itemID, quantity, 232));
		PChar->pushPacket(new CInventoryFinishPacket());
	}
	// очищаем ячейку для безопасности (защита от группы 0x085-ых пакетов)
	PChar->Container->setItem(16,0,-1,0);	
	return 0;
}

/************************************************************************
*																		*
*  Начало синтеза														*
*  В нулевой ячейке будет храниться кристалл							*
*																		*
************************************************************************/					

int32 SmallPacket0x096(map_session_data_t* session, CCharEntity* PChar, int8* data)
{
	PChar->Container->Clean();

	uint32 ItemID    = RBUFL(data,(0x06));
	uint8  invSlotID = RBUFB(data,(0x08));

	uint8  numItems  = RBUFB(data,(0x09));

	PChar->Container->setItem(0, ItemID, invSlotID, 0);

	for(int32 SlotID = 0; SlotID < numItems; ++SlotID) 
	{
		ItemID    = RBUFL(data,(0x0A+SlotID*2));
		invSlotID = RBUFB(data,(0x1A+SlotID));
	
		PChar->Container->setItem(SlotID+1, ItemID, invSlotID, 1);
	}

	synthutils::startSynth(PChar);
	return 0;
}

/************************************************************************
*																		*
*  Генерация случайного числа (команда /diceroll)						*
*																		*
************************************************************************/					

int32 SmallPacket0x0A2(map_session_data_t* session, CCharEntity* PChar, int8* data)
{
	uint16 diceroll = 1 + rand()%1000;

	zoneutils::GetZone(PChar->getZone())->PushPacket(PChar, CHAR_INRANGE_SELF, new CMessageStandardPacket(PChar, diceroll, 88)); 
	return 0;
}

/************************************************************************
*																		*
*  Отправляем персонажу список продаваемых гильдией предметов			*
*																		*
************************************************************************/					

int32 SmallPacket0x0AB(map_session_data_t* session, CCharEntity* PChar, int8* data)
{
	if (PChar->PGuildShop != NULL)
	{
		PChar->pushPacket(new CGuildMenuBuyPacket(PChar, PChar->PGuildShop));
	}
	return 0;
}

/************************************************************************
*																		*
*  Отправляем персонажу список покупаемых гильдией предметов			*
*																		*
************************************************************************/					

int32 SmallPacket0x0AD(map_session_data_t* session, CCharEntity* PChar, int8* data)
{
	if (PChar->PGuildShop != NULL)
	{
		PChar->pushPacket(new CGuildMenuSellPacket(PChar, PChar->PGuildShop));
	}
	return 0;
}

/************************************************************************
*																		*
*  Текстовое общение между персонажами (chat)							*
*																		*
************************************************************************/					

int32 SmallPacket0x0B5(map_session_data_t* session, CCharEntity* PChar, int8* data)
{
	if (RBUFB(data,(0x06)) == '@' && PChar->nameflags.flags & FLAG_GM)
	{
		CmdHandler.call(PChar, (const int8*)data+7);
	}
    else
    {
		switch(RBUFB(data,(0x04)))
		{
			case MESSAGE_SAY:		zoneutils::GetZone(PChar->getZone())->PushPacket(PChar, CHAR_INRANGE, new CChatMessagePacket(PChar, MESSAGE_SAY,     data+6)); break;
			case MESSAGE_EMOTION:	zoneutils::GetZone(PChar->getZone())->PushPacket(PChar, CHAR_INRANGE, new CChatMessagePacket(PChar, MESSAGE_EMOTION, data+6)); break;
			case MESSAGE_SHOUT:		zoneutils::GetZone(PChar->getZone())->PushPacket(PChar, CHAR_INSHOUT, new CChatMessagePacket(PChar, MESSAGE_SHOUT,   data+6)); break;
			case MESSAGE_LINKSHELL: break;
			case MESSAGE_PARTY:		
			{
				if (PChar->PParty != NULL)
				{
					PChar->PParty->PushPacket(PChar, 0, new CChatMessagePacket(PChar, MESSAGE_PARTY, data+6));
				}
			}
			break;
            case MESSAGE_YELL: PChar->pushPacket(new CMessageStandardPacket(PChar, 0, 256)); break;
		}
	}
	return 0;
}

/************************************************************************
*																		*
*  Текстовое общение между персонажами /tell							*
*																		*
************************************************************************/					

int32 SmallPacket0x0B6(map_session_data_t* session, CCharEntity* PChar, int8* data)
{
	int8 RecipientName[16];
	memcpy(RecipientName,data+5, 15);
	RecipientName[15] = 0;

	const int8* fmtQuery = "SELECT charid, targid, pos_zone FROM chars INNER JOIN accounts_sessions USING(charid) WHERE charname = '%s' LIMIT 1";

	int32 ret = Sql_Query(SqlHandle, fmtQuery, RecipientName);

	if (ret != SQL_ERROR && 
		Sql_NumRows(SqlHandle) != 0 &&
		Sql_NextRow(SqlHandle) == SQL_SUCCESS)
	{
		uint32 CharID = (uint32)Sql_GetUIntData(SqlHandle,0);
		uint16 TargID = (uint16)Sql_GetUIntData(SqlHandle,1);
		uint8  ZoneID = (uint8) Sql_GetUIntData(SqlHandle,2);

		CCharEntity* PTellRecipient = (CCharEntity*)zoneutils::GetZone(ZoneID)->GetEntity(TargID, TYPE_PC);

		if (PTellRecipient != NULL &&
			PTellRecipient->id == CharID &&
			PTellRecipient->status != STATUS_DISAPPEAR)
		{
			if (PTellRecipient->nameflags.flags & FLAG_AWAY)
			{
				PChar->pushPacket(new CMessageStandardPacket(PChar, 0, 0, 181));
				return 0;
			}
			PTellRecipient->pushPacket(new CChatMessagePacket(PChar, MESSAGE_TELL, data+20));
			return 0;
		}
	}
	PChar->pushPacket(new CMessageStandardPacket(PChar, 0, 0, 125));
	return 0;
}

/************************************************************************
*																		*
*  Меняем режим	получения опыта между Exp и Limit Points				*
*																		*
************************************************************************/					

int32 SmallPacket0x0BE(map_session_data_t* session, CCharEntity* PChar, int8* data)
{
	return 0;
}

/************************************************************************
*																		*
*  Отображаем членов группы на карте									*
*																		*
************************************************************************/					

int32 SmallPacket0x0D2(map_session_data_t* session, CCharEntity* PChar, int8* data)
{
	if (PChar->PParty != NULL)
	{
		for (int32 i = 0; i < PChar->PParty->members.size(); ++i) 
		{
			CCharEntity* PPartyMember = (CCharEntity*)PChar->PParty->members.at(i);

			if (PPartyMember->getZone() == PChar->getZone())
			{
				PChar->pushPacket(new CPartyMapPacket(PPartyMember));
			}
		}
	} 
	else 
	{
		PChar->pushPacket(new CPartyMapPacket(PChar));
	}
	return 0;
}

/************************************************************************
*																		*
*  Отправляем жалобу GM'y												*
*  help desk -> i want to report -> yes -> yes -> execute				*
*																		*
************************************************************************/					

int32 SmallPacket0x0D3(map_session_data_t* session, CCharEntity* PChar, int8* data)
{
	return 0;
}

/************************************************************************
*																		*
*  Установка разных nameFlags: party, away, autogroup,					*
*  флаги в help desk и т.д.												*
*																		*
************************************************************************/					

int32 SmallPacket0x0DC(map_session_data_t* session, CCharEntity* PChar, int8* data)
{
	switch(RBUFW(data,(0x04)))
	{
		case 0x0001: 
			PChar->nameflags.flags ^= FLAG_INVITE; 
			break;
		case 0x0002:
			if(RBUFB(data,(0x10)) == 1)
				PChar->nameflags.flags |=  FLAG_AWAY;
			if(RBUFB(data,(0x10)) == 2)
				PChar->nameflags.flags &= ~FLAG_AWAY;
			break;
		case 0x0004: 
			PChar->nameflags.flags ^= FLAG_ANON; 
			break;
		case 0x4000:
			//if(RBUFB(data,(0x10)) == 1)	// autotarget off
			//if(RBUFB(data,(0x10)) == 2)	// autotarget on
			break;
		case 0x8000: 
			//if(RBUFB(data,(0x10)) == 1)	// autogroup on
			//if(RBUFB(data,(0x10)) == 2)	// autogroup off
			break;
	}
    charutils::SaveCharStats(PChar);

	PChar->status = STATUS_UPDATE;
	PChar->pushPacket(new CMenuConfigPacket(PChar));
	PChar->pushPacket(new CCharUpdatePacket(PChar));
	return 0;
}

/************************************************************************
*																		*
*  Устанавливаем предпочтительный язык общения							*
*																		*
************************************************************************/					

int32 SmallPacket0x0DB(map_session_data_t* session, CCharEntity* PChar, int8* data)
{
	PChar->search.language = RBUFB(data,(0x24));
	return 0;
}

/************************************************************************
*																		*
*  Проверяем монстров или персонажей									*
*																		*
*  170 - <target> seems It seems to have high evasion and defense.		*
*  171 - <target> seems It seems to have high evasion.					*
*  172 - <target> seems It seems to have high evasion but low defense.	*
*  173 - <target> seems It seems to have high defense.					*
*  174 - <target> seems													*
*  175 - <target> seems It seems to have low defense.					*
*  176 - <target> seems It seems to have low evasion but high defense.	*
*  177 - <target> seems It seems to have low evasion.					*
*  178 - <target> seems It seems to have low evasion and defense.		*
*																		*
*  Логическая ошибка использовать опыт для определения сложности боя	*
*  Необходимы условия, основанные на разницах уровней					*
*																		*
************************************************************************/					

int32 SmallPacket0x0DD(map_session_data_t* session, CCharEntity* PChar, int8* data)
{
	uint32 id     = RBUFL(data,(0x04));
	uint16 targid = RBUFW(data,(0x08));

	CBaseEntity* PEntity = zoneutils::GetZone(PChar->getZone())->GetEntity(targid, TYPE_MOB | TYPE_PC);
	if (PEntity == NULL) 
	{
		return 0;
	}
	switch (PEntity->objtype)
	{
		case TYPE_MOB:
		{
			CMobEntity* PTarget = (CMobEntity*)PEntity;

			if (PTarget != NULL && PTarget->id == id) 
			{
				if (PTarget->m_Type & MOBTYPE_NOTORIOUS) 
				{
					PChar->pushPacket(new CMessageBasicPacket(PChar, PTarget, 0, 0, 249));
				}else{
					uint32 baseExp = charutils::GetRealExp(PChar->GetMLevel(),PTarget->GetMLevel());

					if(baseExp >= 400) {
						PChar->pushPacket(new CMessageBasicPacket(PChar, PTarget, 0, 0x46, 174));
					} else if(baseExp >= 240) {
						PChar->pushPacket(new CMessageBasicPacket(PChar, PTarget, 0, 0x45, 174));
					} else if(baseExp >= 120) {
						PChar->pushPacket(new CMessageBasicPacket(PChar, PTarget, 0, 0x44, 174));
					} else if(baseExp == 100) {
						PChar->pushPacket(new CMessageBasicPacket(PChar, PTarget, 0, 0x43, 174));
					} else if(baseExp >=  75) {
						PChar->pushPacket(new CMessageBasicPacket(PChar, PTarget, 0, 0x42, 174));
					} else if(baseExp >=  15) {
						PChar->pushPacket(new CMessageBasicPacket(PChar, PTarget, 0, 0x41, 174));
					} else if(baseExp ==   0) {
						PChar->pushPacket(new CMessageBasicPacket(PChar, PTarget, 0, 0x40, 174));
					}
				}
			}
		}
		break;
		case TYPE_PC:
		{
			CCharEntity* PTarget = (CCharEntity*)PEntity;

			if (PTarget != NULL && PTarget->id == id) 
			{
				PTarget->pushPacket(new CMessageStandardPacket(PChar, 0, 0, 89));

				PChar->pushPacket(new CBazaarMessagePacket(PTarget));
				PChar->pushPacket(new CCheckPacket(PChar, PTarget));
			}
		}
		break;
	}

	return 0;
}

/************************************************************************
*																		*
*  Устанавливаем сообщене bazaar										*
*  Буфера в 256 байт вполне достаточно для преобразования 120 байт		*
*																		*
************************************************************************/					

int32 SmallPacket0x0DE(map_session_data_t* session, CCharEntity* PChar, int8* data)
{
	PChar->bazaar.message.clear();
	PChar->bazaar.message.insert(0,data+4);

	int8 message[256];
	Sql_EscapeString(SqlHandle,message,data+4);

	Sql_Query(SqlHandle, "UPDATE char_stats SET bazaar_message = '%s' WHERE charid = %u;", message, PChar->id);
	return 0;
}

/************************************************************************
*																		*
*  Комментарий, отображаемый в списке поиска							*
*  Не уверен насчет необходимости удаления пробелов в конце строки,		*
*  об их назначении мы узнаем лишь после реализации поиска				*
*																		*
************************************************************************/					

int32 SmallPacket0x0E0(map_session_data_t* session, CCharEntity* PChar, int8* data)
{
	PChar->search.message.clear();
	PChar->search.message.insert(0,data+4);

	PChar->search.messagetype = RBUFB(data,(0xA4));

    // в ответ на этот пакет не нужно посылать что-либо клиенту
	// эта информация используется лишь при поиске персонажа
					
	//                s   a   l   u   t
	//e0  4c  c2  00  73  61  6c  75  74  20  20  20  20  20  20  20 
	//20  20  20  20  20  20  20  20  20  20  20  20  20  20  20  20 
	//20  20  20  20  20  20  20  20  20  20  20  20  20  20  20  20 
	//20  20  20  20  20  20  20  20  20  20  20  20  20  20  20  20 
	//20  20  20  20  20  20  20  20  20  20  20  20  20  20  20  20 
	//20  20  20  20  20  20  20  20  20  20  20  20  20  20  20  20 
	//20  20  20  20  20  20  20  20  20  20  20  20  20  20  20  20 
	//20  20  20  20  20  20  20  20  20  20  20  20  20  20  20  00 
	//00  00  00  00  2f  15  4c  4b  57  49  4e  08  3f  00  00  00 
	//ff  00  00  00  11  00  00  00 

	// сообщение максимум 120, 3 строки по 40 символов, идущие подряд, начиная с 5-го байта
	// тип сообщения - 4й байт с конца

	//EXP party
	    //0x11 - seek party
		//0x12 - find member
		//0x13 - other
	//Mission
		//0x21 - seek party
		//0x22 - find member
		//0x23 - other
	//Quest
		//0x31 - seek party
		//0x32 - find member
		//0x33 - other
	//Battlefield
		//0x41 - seek party
		//0x42 - find member
		//0x43 - other
	//Item
		//0x51 - Want to Sell
		//0x52 - Want to Buy
		//0x53 - Other
	//Synthesis
		//0x61 - Need Made
		//0x62 - Can Make
		//0x63 - Other
    //Others
		//0x73 - others
	return 0;
}

/************************************************************************
*																		*
*  Запрос на выход из игры. Shutdown и Logout отправляют одинаковые		*
*  запросы. В MogHouse персонаж выходит сразу, без задержки в 30 секунд	*
*																		*
*  ExitType: 1 - logout; 3 - shutdown									*
*																		*
************************************************************************/					

int32 SmallPacket0x0E7(map_session_data_t* session, CCharEntity* PChar, int8* data)
{
	if (PChar->status != STATUS_NORMAL)
		return 0;

	if (PChar->getZone() == 0 ||
		PChar->nameflags.flags & FLAG_GM)
		
	{
		PChar->status = STATUS_SHUTDOWN;
		PChar->pushPacket(new CServerIPPacket(PChar,1));
	}
	else if (PChar->animation == ANIMATION_NONE) 
	{
		uint8 ExitType = (RBUFB(data,(0x06)) == 1 ? 7 : 35);

		if (PChar->PPet == NULL || 
		   (PChar->PPet->m_EcoSystem != SYSTEM_AVATAR &&
			PChar->PPet->m_EcoSystem != SYSTEM_ELEMENTAL))
		{
			PChar->StatusEffectContainer->AddStatusEffect(new CStatusEffect(EFFECT_HEALING,0,10,0));
		}
		PChar->status = STATUS_UPDATE;
		PChar->StatusEffectContainer->AddStatusEffect(new CStatusEffect(EFFECT_LEAVEGAME,ExitType,5,0));
	}
	else if (PChar->animation == ANIMATION_HEALING)
	{
		if (PChar->StatusEffectContainer->HasStatusEffect(EFFECT_LEAVEGAME))
		{
			PChar->status = STATUS_UPDATE;
			PChar->StatusEffectContainer->DelStatusEffect(EFFECT_HEALING);
		} else {
			uint8 ExitType = (RBUFB(data,(0x06)) == 1 ? 7 : 35);

			PChar->StatusEffectContainer->AddStatusEffect(new CStatusEffect(EFFECT_LEAVEGAME,ExitType,5,0));
		}
	}
	return 0;
}

/************************************************************************
*																		*
*  Отдых персонажа (восстановление жизней, выход из игры, прерывание	*
*  чтения заклинаний, повышенная агрессия монстров и т.д.)				*
*																		*
************************************************************************/					

int32 SmallPacket0x0E8(map_session_data_t* session, CCharEntity* PChar, int8* data)
{
	if (PChar->status != STATUS_NORMAL)
		return 0;

	switch (PChar->animation) 
	{
		case ANIMATION_NONE:
		{
			if (PChar->PPet == NULL || 
			   (PChar->PPet->m_EcoSystem != SYSTEM_AVATAR &&
				PChar->PPet->m_EcoSystem != SYSTEM_ELEMENTAL))
			{
				switch (PChar->PBattleAI->GetCurrentAction())
				{
					case ACTION_ITEM_USING:		PChar->PBattleAI->SetCurrentAction(ACTION_ITEM_INTERRUPT);	break;
					case ACTION_MAGIC_CASTING:	PChar->PBattleAI->SetCurrentAction(ACTION_MAGIC_INTERRUPT);	break;
				}
				PChar->status = STATUS_UPDATE;
				PChar->PBattleAI->CheckCurrentAction(gettick());
				PChar->StatusEffectContainer->AddStatusEffect(new CStatusEffect(EFFECT_HEALING,0,10,0));
				return 0;
			}
			PChar->pushPacket(new CMessageBasicPacket(PChar,PChar,0,0,345));
		}
		break;
		case ANIMATION_HEALING: 
		{
			PChar->status = STATUS_UPDATE;
			PChar->StatusEffectContainer->DelStatusEffect(EFFECT_HEALING);
		}
		break;
	}
	return 0;
}

/************************************************************************
*																		*
*  Команда /sit (персонаж садится и наслаждается окружением)		 	*
*																		*
************************************************************************/					

int32 SmallPacket0x0EA(map_session_data_t* session, CCharEntity* PChar, int8* data)
{
	if (PChar->status != STATUS_NORMAL)
		return 0;

	PChar->status = STATUS_UPDATE;
	PChar->animation = (PChar->animation == ANIMATION_SIT ? ANIMATION_NONE : ANIMATION_SIT);
	PChar->pushPacket(new CCharUpdatePacket(PChar));
	return 0;
}

/************************************************************************
*																		*
*  Удаление статус эффекта щелчком по его иконке						*
*																		*
************************************************************************/					

int32 SmallPacket0x0F1(map_session_data_t* session, CCharEntity* PChar, int8* data)
{
	EFFECT StatusID = (EFFECT)RBUFW(data,(0x04));
	
	PChar->StatusEffectContainer->DelStatusEffect(StatusID);
	return 0;
}

/************************************************************************
*																		*
*  Клиент сообщает серверу, что входит в подобласть зоны				*
*  (в простонародье - boundary). Во избежание всяких казусов мы должны	*
*  сразу сохранять эту переменную.										*	 
*																		*
************************************************************************/					

int32 SmallPacket0x0F2(map_session_data_t* session, CCharEntity* PChar, int8* data)
{
	PChar->loc.boundary = RBUFW(data,(0x06));

	charutils::SaveCharPosition(PChar);
	return 0;
}

/************************************************************************
*																		*
*  Сканирование местности (Wide Scan)							 		*
*																		*
************************************************************************/					

int32 SmallPacket0x0F4(map_session_data_t* session, CCharEntity* PChar, int8* data)
{
	zoneutils::GetZone(PChar->getZone())->WideScan(PChar,10000); // MOD_WIDESCAN
	return 0;
}

/************************************************************************
*																		*
*  Следим за выбранной целью в Wide Scan						 		*
*																		*
************************************************************************/					

int32 SmallPacket0x0F5(map_session_data_t* session, CCharEntity* PChar, int8* data)
{
	uint16 TargID = RBUFW(data,(0x04));

	PChar->PWideScanTarget = zoneutils::GetZone(PChar->getZone())->GetEntity(TargID, TYPE_MOB | TYPE_NPC);
	return 0;
}

/************************************************************************
*																		*
*  Отмена слежения за целью, выбранной в Wide Scan				 		*
*																		*
************************************************************************/

int32 SmallPacket0x0F6(map_session_data_t* session, CCharEntity* PChar, int8* data)
{
	PChar->PWideScanTarget = NULL;
	return 0;
}

/************************************************************************
*																		*
*  Установка мебели в MogHouse									 		*
*																		*
************************************************************************/					

int32 SmallPacket0x0FA(map_session_data_t* session, CCharEntity* PChar, int8* data)
{
	uint16 ItemID = RBUFW(data,(0x04));

	if (ItemID == 0)
	{
		// выход из режима установки мебели
		// здесь мы считаем ауру и добавляем необходимый keyitem
		return 0;
	}

	uint8  slotID	= RBUFB(data,(0x06));
	uint8  col		= RBUFB(data,(0x07));
	uint8  level	= RBUFB(data,(0x08));
	uint8  row		= RBUFB(data,(0x09));
	uint8  rotation	= RBUFB(data,(0x0A));

	CItemFurnishing* PItem = (CItemFurnishing*)PChar->getStorage(LOC_MOGSAFE)->GetItem(slotID);
	
	if (PItem != NULL &&
		PItem->getID() == ItemID &&
		PItem->getType() & ITEM_FURNISHING) 
	{
		if (PItem->getFlag() & ITEM_FLAG_WALLHANDING)
		{
			rotation = (col >= 2 ? 3 : 1);
		}

		// обновляем данные в базе

		PItem->setCol(col);
		PItem->setRow(row);
		PItem->setLevel(level);
		PItem->setRotation(rotation);
	
		PItem->setSubType(ITEM_LOCKED);

		PChar->pushPacket(new CInventoryItemPacket(PItem, LOC_MOGSAFE, slotID));
		PChar->pushPacket(new CInventoryFinishPacket());
	}
	return 0;
}

/************************************************************************
*																		*
*  Удаление мебели в MogHouse									 		*
*																		*
************************************************************************/					

int32 SmallPacket0x0FB(map_session_data_t* session, CCharEntity* PChar, int8* data)
{
	uint16 ItemID = RBUFW(data,(0x04));

	if (ItemID == 0)
	{
		return 0;
	}
	
	uint8  slotID = RBUFB(data,(0x06));
	
	CItemFurnishing* PItem = (CItemFurnishing*)PChar->getStorage(LOC_MOGSAFE)->GetItem(slotID);
	
	if (PItem != NULL &&
		PItem->getID() == ItemID &&
		PItem->getType() & ITEM_FURNISHING) 
	{	
		// удаляем данные из базы
			
		PItem->setCol(0);
		PItem->setRow(0);
		PItem->setLevel(0);
		PItem->setRotation(0);
		
		PItem->setSubType(ITEM_UNLOCKED);

		PChar->pushPacket(new CInventoryItemPacket(PItem, LOC_MOGSAFE, slotID));
		PChar->pushPacket(new CInventoryFinishPacket());
	}
	return 0;
}

/************************************************************************
*																		*
*  Смена профессии. Разрешена только в зоне с флагом MISC_MOGMENU.		*
*  При смене профессии с персонажа снимаются все положительные эффекты	*
*																		*
************************************************************************/					

int32 SmallPacket0x100(map_session_data_t* session, CCharEntity* PChar, int8* data)
{
	CZone* PZone = zoneutils::GetZone(PChar->getZone());

	if (PZone->CanUseMisc(MISC_MOGMENU))
	{
		uint8 mjob = RBUFB(data,(0x04));
		uint8 sjob = RBUFB(data,(0x05));

		if ((mjob > 0x00) && (mjob < MAX_JOBTYPE)) 
		{
			PChar->SetMJob(mjob);
			PChar->SetMLevel(PChar->jobs.job[PChar->GetMJob()]);
			PChar->SetSLevel(PChar->jobs.job[PChar->GetSJob()]);
		}
		if ((sjob > 0x00) && (sjob < MAX_JOBTYPE)) 
		{
			JOBTYPE prevsjob = PChar->GetSJob();

			PChar->SetSJob(sjob);
			PChar->SetSLevel(PChar->jobs.job[PChar->GetSJob()]);

			charutils::CheckEquipLogic(PChar, SCRIPT_CHANGESJOB, prevsjob);
		}

		charutils::CheckValidEquipment(PChar);
		charutils::CalculateStats(PChar);
		charutils::SaveCharStats(PChar);
		charutils::BuildingCharSkillsTable(PChar);
		charutils::BuildingCharAbilityTable(PChar);

		PChar->health.hp = PChar->health.maxhp;
		PChar->health.mp = PChar->health.maxmp;

		PChar->StatusEffectContainer->DispelStatusEffect(true);

		PChar->pushPacket(new CCharJobsPacket(PChar));
		PChar->pushPacket(new CCharUpdatePacket(PChar));
		PChar->pushPacket(new CCharHealthPacket(PChar));
		PChar->pushPacket(new CCharStatsPacket(PChar));
		PChar->pushPacket(new CCharSkillsPacket(PChar));
		PChar->pushPacket(new CCharAbilitiesPacket(PChar));
		PChar->pushPacket(new CAutomatonUpdatePacket(PChar));
		PChar->pushPacket(new CMenuMeritPacket(PChar));
		PChar->pushPacket(new CCharSyncPacket(PChar));
	}
	return 0;
}

/************************************************************************
*																		*
*  Устанавливаем активные заклинания синего мага, модифицируем автомат	*
*																		*
************************************************************************/					

int32 SmallPacket0x102(map_session_data_t* session, CCharEntity* PChar, int8* data)
{
	return 0;
}

/************************************************************************
*																		*
*  Персонаж покидает bazaar												*	
*  (пакет нельзя обработать без сохранения id обладателя базара во		*
*  входящем 0x105)			 											*
*																		*
************************************************************************/					

int32 SmallPacket0x104(map_session_data_t* session, CCharEntity* PChar, int8* data)
{
	return 0;
}

/************************************************************************
*																		*
*  Персонаж заходит в bazaar											*
*																		*
************************************************************************/					

int32 SmallPacket0x105(map_session_data_t* session, CCharEntity* PChar, int8* data)
{
	uint32 charid = RBUFL(data,(0x04));

	CCharEntity* PTarget = (CCharEntity*)zoneutils::GetZone(PChar->getZone())->GetEntity((uint16)charid & 0x0FFF, TYPE_PC);

	if (PTarget != NULL) 
	{
		PTarget->pushPacket(new CBazaarCheckPacket(PChar,BAZAAR_ENTER));
       
		uint16 tax = zoneutils::GetZone(PChar->getZone())->GetTax();

		CItemContainer* Bazaar = PTarget->getStorage(LOC_INVENTORY);

		for(uint8 slotID = 1; slotID <= Bazaar->GetSize(); ++slotID) 
		{
			CItem* PItem = Bazaar->GetItem(slotID);

			if ((PItem != NULL) &&
				(PItem->getCharPrice() != 0) &&
			   !(PItem->getFlag() & ITEM_FLAG_EX)) 
			{
				PChar->pushPacket(new CBazaarItemPacket(PItem, slotID, tax));
			}
		}
	}
	return 0;
}

/************************************************************************
*																		*
*  Выходим из режима установки цен bazaar						 		*
*																		*
************************************************************************/					

int32 SmallPacket0x109(map_session_data_t* session, CCharEntity* PChar, int8* data)
{
	CItemContainer* PStorage = PChar->getStorage(LOC_INVENTORY);

	uint8 size = PStorage->GetSize();

	for (uint8 slotID = 1; slotID <= size; ++slotID) 
	{
		CItem* PItem = PStorage->GetItem(slotID);

		if ((PItem != NULL) && (PItem->getCharPrice() != 0)) 
		{
			PChar->nameflags.flags |= FLAG_BAZAAR;
			PChar->pushPacket(new CCharUpdatePacket(PChar));
			return 0;
		}
	}
	return 0;
}

/************************************************************************
*																		*
*  Устанавливаем цены bazaar на предметы							 	*
*																		*
************************************************************************/					

int32 SmallPacket0x10A(map_session_data_t* session, CCharEntity* PChar, int8* data)
{
	uint8  slotID = RBUFB(data,(0x04));
	uint32 price  = RBUFL(data,(0x08));

	CItem* PItem = PChar->getStorage(LOC_INVENTORY)->GetItem(slotID);

	if ((PItem != NULL) && !(PItem->getFlag() & ITEM_FLAG_EX))
	{
		Sql_Query(SqlHandle,"UPDATE char_inventory SET bazaar = %u WHERE charid = %u AND location = 0 AND slot = %u;",price,PChar->id,slotID);		

		PItem->setCharPrice(price);
		PItem->setSubType((price == 0 ? ITEM_UNLOCKED : ITEM_LOCKED));

		PChar->pushPacket(new CInventoryItemPacket(PItem, LOC_INVENTORY, slotID));
		PChar->pushPacket(new CInventoryFinishPacket());
	}
	return 0;
}

/************************************************************************
*																		*
*  Режим установки цен в bazaar (открываем меню "Set Prices")	 		*
*																		*
************************************************************************/					

int32 SmallPacket0x10B(map_session_data_t* session, CCharEntity* PChar, int8* data)
{
	PChar->nameflags.flags &= ~FLAG_BAZAAR;
	PChar->pushPacket(new CCharUpdatePacket(PChar));
	return 0;
}

/************************************************************************
*																		*
*  Инициализация массива процедур                   					*
*																		*
************************************************************************/

void PacketParderInitialize()
{
    for (uint16 i = 0; i < 512; ++i)
    {
        PacketParcer[i] = &SmallPacket0x000;
    }
    PacketParcer[0x00A] = &SmallPacket0x00A;
    PacketParcer[0x00C] = &SmallPacket0x00C;
    PacketParcer[0x00D] = &SmallPacket0x00D;
    PacketParcer[0x00F] = &SmallPacket0x00F;
    PacketParcer[0x011] = &SmallPacket0x011;
    PacketParcer[0x015] = &SmallPacket0x015;
    PacketParcer[0x016] = &SmallPacket0x016;
    PacketParcer[0x017] = &SmallPacket0x017;
    PacketParcer[0x01A] = &SmallPacket0x01A;
    PacketParcer[0x01C] = &SmallPacket0x01C;
    PacketParcer[0x028] = &SmallPacket0x028;
    PacketParcer[0x029] = &SmallPacket0x029;
    PacketParcer[0x032] = &SmallPacket0xFFF;	// not implemented
    PacketParcer[0x033] = &SmallPacket0xFFF;	// not implemented
    PacketParcer[0x034] = &SmallPacket0xFFF;	// not implemented
    PacketParcer[0x036] = &SmallPacket0x036;
    PacketParcer[0x037] = &SmallPacket0x037;
    PacketParcer[0x03A] = &SmallPacket0x03A;
    PacketParcer[0x03C] = &SmallPacket0x03C;
    PacketParcer[0x041] = &SmallPacket0x041;
    PacketParcer[0x042] = &SmallPacket0x042;
    PacketParcer[0x04B] = &SmallPacket0x04B;
    PacketParcer[0x04D] = &SmallPacket0x04D;
    PacketParcer[0x04E] = &SmallPacket0x04E;
    PacketParcer[0x050] = &SmallPacket0x050;
    PacketParcer[0x059] = &SmallPacket0x059;
    PacketParcer[0x05A] = &SmallPacket0x05A;
    PacketParcer[0x05B] = &SmallPacket0x05B;
    PacketParcer[0x05C] = &SmallPacket0x05C;
    PacketParcer[0x05D] = &SmallPacket0x05D;
    PacketParcer[0x05E] = &SmallPacket0x05E;
    PacketParcer[0x060] = &SmallPacket0x060;
    PacketParcer[0x061] = &SmallPacket0x061;
    PacketParcer[0x063] = &SmallPacket0x063;
    PacketParcer[0x064] = &SmallPacket0x064;
    PacketParcer[0x066] = &SmallPacket0x066;
    PacketParcer[0x06E] = &SmallPacket0x06E;
    PacketParcer[0x06F] = &SmallPacket0x06F;
    PacketParcer[0x070] = &SmallPacket0x070;
    PacketParcer[0x071] = &SmallPacket0x071;
    PacketParcer[0x074] = &SmallPacket0x074;
    PacketParcer[0x076] = &SmallPacket0x076;
    PacketParcer[0x077] = &SmallPacket0x077;
    PacketParcer[0x078] = &SmallPacket0x078;
    PacketParcer[0x083] = &SmallPacket0x083;
    PacketParcer[0x084] = &SmallPacket0x084;
    PacketParcer[0x085] = &SmallPacket0x085;
    PacketParcer[0x096] = &SmallPacket0x096;
    PacketParcer[0x0A0] = &SmallPacket0xFFF;	// not implemented
    PacketParcer[0x0A1] = &SmallPacket0xFFF;	// not implemented
    PacketParcer[0x0A2] = &SmallPacket0x0A2;
    PacketParcer[0x0AA] = &SmallPacket0xFFF;	// not implemented
    PacketParcer[0x0AB] = &SmallPacket0x0AB;
    PacketParcer[0x0AC] = &SmallPacket0xFFF;	// not implemented
    PacketParcer[0x0AD] = &SmallPacket0x0AD;
    PacketParcer[0x0B5] = &SmallPacket0x0B5;
    PacketParcer[0x0B6] = &SmallPacket0x0B6;
    PacketParcer[0x0BE] = &SmallPacket0xFFF;	// not implemented
    PacketParcer[0x0C3] = &SmallPacket0xFFF;	// not implemented
    PacketParcer[0x0C4] = &SmallPacket0xFFF;	// not implemented
    PacketParcer[0x0CB] = &SmallPacket0xFFF;	// not implemented
    PacketParcer[0x0D2] = &SmallPacket0x0D2;
    PacketParcer[0x0D3] = &SmallPacket0x0D3;
    PacketParcer[0x0D4] = &SmallPacket0xFFF;	// not implemented
    PacketParcer[0x0DB] = &SmallPacket0x0DB;
    PacketParcer[0x0DC] = &SmallPacket0x0DC;
    PacketParcer[0x0DD] = &SmallPacket0x0DD;
    PacketParcer[0x0DE] = &SmallPacket0x0DE;
    PacketParcer[0x0E0] = &SmallPacket0x0E0;
    PacketParcer[0x0E1] = &SmallPacket0xFFF;	// not implemented
    PacketParcer[0x0E2] = &SmallPacket0xFFF;	// not implemented
    PacketParcer[0x0E7] = &SmallPacket0x0E7;
    PacketParcer[0x0E8] = &SmallPacket0x0E8;
    PacketParcer[0x0EA] = &SmallPacket0x0EA;
    PacketParcer[0x0F1] = &SmallPacket0x0F1;
    PacketParcer[0x0F2] = &SmallPacket0x0F2;
    PacketParcer[0x0F4] = &SmallPacket0x0F4;
    PacketParcer[0x0F5] = &SmallPacket0x0F5;
    PacketParcer[0x0F6] = &SmallPacket0x0F6;
    PacketParcer[0x0FA] = &SmallPacket0x0FA;
    PacketParcer[0x0FB] = &SmallPacket0x0FB;
    PacketParcer[0x100] = &SmallPacket0x100;
    PacketParcer[0x102] = &SmallPacket0xFFF;	// not implemented
    PacketParcer[0x104] = &SmallPacket0x104;
    PacketParcer[0x105] = &SmallPacket0x105;
    PacketParcer[0x106] = &SmallPacket0xFFF;	// not implemented
    PacketParcer[0x109] = &SmallPacket0x109;
    PacketParcer[0x10A] = &SmallPacket0x10A;
    PacketParcer[0x10B] = &SmallPacket0x10B;
}

/************************************************************************
*																		*
*																 		*
*																		*
************************************************************************/