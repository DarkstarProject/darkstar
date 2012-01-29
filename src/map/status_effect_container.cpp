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

#include "../common/showmsg.h"
#include "../common/timer.h"

#include <string.h>

#include "lua/luautils.h"

#include "packets/char_sync.h"
#include "packets/char_update.h"
#include "packets/message_basic.h"

#include "battleentity.h" 
#include "charentity.h"
#include "itemutils.h"
#include "map.h"
#include "status_effect_container.h"
#include "zoneutils.h"

const int8* EFFECT_NAMES[] = 
{
	"ko",
	"weakness",
	"sleep",
	"poison",
	"paralysis",
	"blindness",
	"silence",
	"petrification",
	"disease",
	"curse",
	"stun",
	"bind",
	"weight",
	"slow",
	"charm",
	"doom",
	"amnesia",
	"charm",
	"gradual_petrification",
	"sleep",
	"curse",
	"addle",
	"st22",
	"st23",
	"st24",
	"st25",
	"st26",
	"st27",
	"terror",
	"mute",
	"bane",
	"plague",
	"flee",
	"haste",
	"blaze_spikes",
	"ice_spikes",
	"blink",
	"stoneskin",
	"shock_spikes",
	"aquaveil",
	"protect",
	"shell",
	"regen",
	"refresh",
	"mighty_strikes",
	"boost",
	"hundred_fists",
	"manafont",
	"chainspell",
	"perfect_dodge",
	"invincible",
	"blood_weapon",
	"soul_voice",
	"eagle_eye_shot",
	"meikyo_shisui",
	"astral_flow",
	"berserk",
	"defender",
	"aggressor",
	"focus",
	"dodge",
	"counterstance",
	"sentinel",
	"souleater",
	"last_resort",
	"sneak_attack",
	"copy_image",
	"third_eye",
	"warcry",
	"invisible",
	"deodorize",
	"sneak",
	"sharpshot",
	"barrage",
	"holy_circle",
	"arcane_circle",
	"hide",
	"camouflage",
	"divine_seal",
	"elemental_seal",
	"str_boost",
	"dex_boost",
	"vit_boost",
	"agi_boost",
	"int_boost",
	"mnd_boost",
	"chr_boost",
	"trick_attack",
	"max_hp_boost",
	"max_mp_boost",
	"accuracy_boost",
	"attack_boost",
	"evasion_boost",
	"defense_boost",
	"enfire",
	"enblizzard",
	"enaero",
	"enstone",
	"enthunder",
	"enwater",
	"barfire",
	"barblizzard",
	"baraero",
	"barstone",
	"barthunder",
	"barwater",
	"barsleep",
	"barpoison",
	"barparalyze",
	"barblind",
	"barsilence",
	"barpetrify",
	"barvirus",
	"reraise",
	"cover",
	"unlimited_shot",
	"phalanx",
	"warding_circle",
	"ancient_circle",
	"str_boost",
	"dex_boost",
	"vit_boost",
	"agi_boost",
	"int_boost",
	"mnd_boost",
	"chr_boost",
	"spirit_surge",
	"costume",
	"burn",
	"frost",
	"choke",
	"rasp",
	"shock",
	"drown",
	"dia",
	"bio",
	"str_down",
	"dex_down",
	"vit_down",
	"agi_down",
	"int_down",
	"mnd_down",
	"chr_down",
	"level_restriction",
	"max_hp_down",
	"max_mp_down",
	"accuracy_down",
	"attack_down",
	"evasion_down",
	"defense_down",
	"physical_shield",
	"arrow_shield",
	"magic_shield",
	"damage_spikes",
	"shining_ruby",
	"medicine",
	"flash",
	"sj_restriction",
	"provoke",
	"penalty",
	"preparations",
	"sprint",
	"enchantment",
	"azure_lore",
	"chain_affinity",
	"burst_affinity",
	"overdrive",
	"magic_def_down",
	"inhibit_tp",
	"potency",
	"regain",
	"pax",
	"intension",
	"dread_spikes",
	"magic_acc_down",
	"magic_atk_down",
	"quickening",
	"encumbrance",
	"firestorm",
	"hailstorm",
	"windstorm",
	"sandstorm",
	"thunderstorm",
	"rainstorm",
	"aurorastorm",
	"voidstorm",
	"helix",
	"sublimation_activated",
	"sublimation_complete",
	"max_tp_down",
	"magic_atk_boost",
	"magic_def_boost",
	"requiem",
	"lullaby",
	"elegy",
	"paeon",
	"ballad",
	"minne",
	"minuet",
	"madrigal",
	"prelude",
	"mambo",
	"aubade",
	"pastoral",
	"hum",
	"fantasia",
	"operetta",
	"capriccio",
	"serenade",
	"round",
	"gavotte",
	"fugue",
	"rhapsody",
	"aria",
	"march",
	"etude",
	"carol",
	"threnody",
	"hymnus",
	"mazurka",
	"sirvente",
	"dirge",
	"scherzo",
	"bard_song_32",
	"st224",
	"st225",
	"st226",
	"st227",
	"st228",
	"st229",
	"st230",
	"st231",
	"(none)",
	"auto-regen",
	"auto-refresh",
	"fishing_imagery",
	"woodworking_imagery",
	"smithing_imagery",
	"goldsmithing_imagery",
	"clothcraft_imagery",
	"leathercraft_imagery",
	"bonecraft_imagery",
	"alchemy_imagery",
	"cooking_imagery",
	"imagery",
	"imagery",
	"imagery",
	"imagery",
	"imagery",
	"dedication",
	"ef_badge",
	"food",
	"chocobo",
	"signet",
	"battlefield",
	"none",
	"sanction",
	"besieged",
	"illusion",
	"encumbrance",
	"obliviscence",
	"impairment",
	"omerta",
	"debilitation",
	"pathos",
	"flurry",
	"concentration",
	"allied_tags",
	"sigil",
	"level_sync",
	"aftermath_lv1",
	"aftermath_lv2",
	"aftermath_lv3",
	"aftermath",
	"enlight",
	"auspice",
	"confrontation",
	"enfire_ii",
	"enblizzard_ii",
	"enaero_ii",
	"enstone_ii",
	"enthunder_ii",
	"enwater_ii",
	"perfect_defense",
	"egg",
	"visitant",
	"baramnesia",
	"atma",
	"endark",
	"enmity_boost",
	"subtle_blow_plus",
	"enmity_down",
	"pennant",
	"negate_petrify",
	"negate_terror",
	"negate_amnesia",
	"negate_doom",
	"negate_poison",
	"crit_hit_evasion_down",
	"overload",
	"fire_maneuver",
	"ice_maneuver",
	"wind_maneuver",
	"earth_maneuver",
	"thunder_maneuver",
	"water_maneuver",
	"light_maneuver",
	"dark_maneuver",
	"double-up_chance",
	"bust",
	"fighters_roll",
	"monks_roll",
	"healers_roll",
	"wizards_roll",
	"warlocks_roll",
	"rogues_roll",
	"gallants_roll",
	"chaos_roll",
	"beast_roll",
	"choral_roll",
	"hunters_roll",
	"samurai_roll",
	"ninja_roll",
	"drachen_roll",
	"evokers_roll",
	"maguss_roll",
	"corsairs_roll",
	"puppet_roll",
	"dancers_roll",
	"scholars_roll",
	"bolters_roll",
	"casters_roll",
	"coursers_roll",
	"blitzers_roll",
	"tacticians_roll",
	"allies_roll",
	"none",
	"none",
	"none",
	"none",
	"warriors_charge",
	"formless_strikes",
	"assassins_charge",
	"feint",
	"fealty",
	"dark_seal",
	"diabolic_eye",
	"nightingale",
	"troubadour",
	"killer_instinct",
	"stealth_shot",
	"flashy_shot",
	"sange",
	"hasso",
	"seigan",
	"convergence",
	"diffusion",
	"snake_eye",
	"light_arts",
	"dark_arts",
	"penury",
	"parsimony",
	"celerity",
	"alacrity",
	"rapture",
	"ebullience",
	"accession",
	"manifestation",
	"drain_samba",
	"aspir_samba",
	"haste_samba",
	"velocity_shot",
	"none",
	"none",
	"none",
	"building_flourish",
	"trance",
	"tabula_rasa",
	"drain_daze",
	"aspir_daze",
	"haste_daze",
	"finishing_move",
	"finishing_move",
	"finishing_move",
	"finishing_move",
	"finishing_move",
	"lethargic_daze",
	"lethargic_daze",
	"lethargic_daze",
	"lethargic_daze",
	"lethargic_daze",
	"sluggish_daze",
	"sluggish_daze",
	"sluggish_daze",
	"sluggish_daze",
	"sluggish_daze",
	"weakened_daze",
	"weakened_daze",
	"weakened_daze",
	"weakened_daze",
	"weakened_daze",
	"addendum_white",
	"addendum_black",
	"reprisal",
	"magic_evasion_down",
	"retaliation",
	"footwork",
	"klimaform",
	"sekkanoki",
	"pianissimo",
	"saber_dance",
	"fan_dance",
	"altruism",
	"focalization",
	"tranquility",
	"equanimity",
	"enlightenment",
	"afflatus_solace",
	"afflatus_misery",
	"composure",
	"yonin",
	"innin",
	"carbuncles_favor",
	"ifrits_favor",
	"shivas_favor",
	"garudas_favor",
	"titans_favor",
	"ramuhs_favor",
	"leviathans_favor",
	"fenrirs_favor",
	"diaboloss_favor",
	"avatars_favor",
	"multi_strikes",
	"double_shot",
	"transcendency",
	"restraint",
	"perfect_counter",
	"mana_wall",
	"divine_emblem",
	"nether_void",
	"sengikori",
	"futae",
	"presto",
	"climactic_flourish",
	"copy_image_2",
	"copy_image_3",
	"copy_image_4",
	"multi_shots",
	"bewildered_daze",
	"bewildered_daze",
	"bewildered_daze",
	"bewildered_daze",
	"bewildered_daze",
	"divine_caress",
	"saboteur",
	"tenuto",
	"spur",
	"efflux",
	"earthen_armor",
	"divine_caress",
	"blood_rage",
	"impetus",
	"conspirator",
	"sepulcher",
	"arcane_crest",
	"hamanoha",
	"dragon_breaker",
	"triple_shot",
	"striking_flourish",
	"perpetuance",
	"immanence",
	"migawari",
	"none",
	"none",
	"none",
	"none",
	"none",
	"none",
	"none",
	"none",
	"none",
	"none",
	"none",
	"none",
	"none",
	"none",
	"none",
	"none",
	"none",
	"none",
	"none",
	"none",
	"none",
	"none",
	"none",
	"none",
	"none",
	"none",
	"none",
	"none",
	"none",
	"none",
	"none",
	"none",
	"none",
	"none",
	"none",
	"none",
	"none",
	"none",
	"none",
	"none",
};

const int8* GetStatusEffectName(uint16 EffectID) 
{
	switch (EffectID)
	{
		case EFFECT_HEALING:	return "healing";
		case EFFECT_LEAVEGAME:	return "leavegame";
        case EFFECT_SKILLCHAIN: return "skillchain";
	}
	return EFFECT_NAMES[EffectID < 512 ? EffectID : 511];
}

CStatusEffectContainer::CStatusEffectContainer(CBattleEntity * PEntity) 
	: m_pOwner(PEntity)
{
    DSP_DEBUG_BREAK_IF(m_pOwner == NULL);

	m_Flags = 0;
	m_EffectCheckTime = gettick();
	m_StatusEffectList.reserve(32);

	memset(m_StatusIcons, EFFECT_NONE, sizeof(m_StatusIcons));
}

CStatusEffectContainer::~CStatusEffectContainer()
{
	for (uint32 i = 0; i < m_StatusEffectList.size(); ++i)
	{
		delete m_StatusEffectList.at(i);
	}
}

/************************************************************************
*																		*
*  Добавляем статус-эффект в контейнер									*
*  Если не ошибаюсь, то максимально-возможное количество эффектов 32 	*
*																		*
************************************************************************/

void CStatusEffectContainer::AddStatusEffect(CStatusEffect * PStatusEffect)
{
	if(PStatusEffect != NULL) 
	{
		SetEffectName(PStatusEffect);
		PStatusEffect->SetStartTime(gettick());

		m_StatusEffectList.push_back(PStatusEffect);

		if (PStatusEffect->GetStatusID() < 512 && m_pOwner->objtype == TYPE_PC) 
		{
			AddStatusIcon(PStatusEffect->GetStatusID());

            CCharEntity* PChar = (CCharEntity*)m_pOwner;

            if (PChar->status == STATUS_NORMAL) PChar->status = STATUS_UPDATE;

            PChar->pushPacket(new CMessageBasicPacket(PChar, PChar, PStatusEffect->GetStatusID(), 0, 205));
            PChar->pushPacket(new CCharUpdatePacket(PChar));
            PChar->pushPacket(new CCharSyncPacket(PChar));
		}
		luautils::OnEffectGain(m_pOwner, PStatusEffect);

        m_pOwner->addModifiers(&PStatusEffect->modList);
	}
}

/************************************************************************
*																		*
*  Эффекты во всех методах удаляются одинаково, вынес этот код в		*
*  отдельную функцию. Удаляем иконки только у CharEntity.				*
*																		*
************************************************************************/

void CStatusEffectContainer::RemoveStatusEffect(uint32 id)
{
    CStatusEffect* PStatusEffect = m_StatusEffectList.at(id);

    luautils::OnEffectLose(m_pOwner, PStatusEffect);

    m_pOwner->delModifiers(&PStatusEffect->modList);

    m_StatusEffectList.erase(m_StatusEffectList.begin() + id);

	if (PStatusEffect->GetStatusID() < 512 && m_pOwner->objtype == TYPE_PC)
	{
        DelStatusIcon(PStatusEffect->GetStatusID());

        CCharEntity* PChar = (CCharEntity*)m_pOwner;

        if (PChar->status == STATUS_NORMAL) PChar->status = STATUS_UPDATE;

        PChar->pushPacket(new CMessageBasicPacket(PChar, PChar, PStatusEffect->GetStatusID(), 0, 206));
        PChar->pushPacket(new CCharUpdatePacket(PChar));
        PChar->pushPacket(new CCharSyncPacket(PChar));
	}
    delete PStatusEffect;
}

/************************************************************************
*																		*
*  Удаляем статус-эффект по его основному и дополнительному типам.		*
*  Возвращаем результат выполнения операции.							*
*																		*
************************************************************************/

bool CStatusEffectContainer::DelStatusEffect(EFFECT StatusID) 
{
	for (uint32 i = 0; i < m_StatusEffectList.size(); ++i) 
	{
		if (m_StatusEffectList.at(i)->GetStatusID() == StatusID)
		{
			RemoveStatusEffect(i);
			return true;
		}
	}
	return false;
}

bool CStatusEffectContainer::DelStatusEffect(EFFECT StatusID, uint16 SubID) 
{
	for (uint32 i = 0; i < m_StatusEffectList.size(); ++i) 
	{
		if (m_StatusEffectList.at(i)->GetStatusID() == StatusID &&
		   (m_StatusEffectList.at(i)->GetSubID() == SubID))
		{
			RemoveStatusEffect(i);
			return true;
		}
	}
	return false;
}

/************************************************************************
*																		*
*  Удаляем последний добавленный отрицательный эффект с флагом	erasa.	*
*  Возвращаем результат выполнения операции.							*
*																		*
************************************************************************/

bool CStatusEffectContainer::EraseStatusEffect(bool RemoveAll)
{
	for (int32 i = (int32)m_StatusEffectList.size() - 1 ; i >= 0 ; --i) 
	{
		if (m_StatusEffectList.at(i)->GetFlag() == EFFECTFLAG_ERASABLE)
		{
			RemoveStatusEffect(i);
			if (!RemoveAll) return true;
		}
	}
	return false;
}

/************************************************************************
*																		*
*  Удаляем последний добавленный положительный эффект с флагом	dispel.	*
*  Возвращаем результат выполнения операции.							*
*																		*
************************************************************************/

bool CStatusEffectContainer::DispelStatusEffect(bool RemoveAll)
{
	for (int32 i = (int32)m_StatusEffectList.size() - 1 ; i >= 0 ; --i) 
	{
		if (m_StatusEffectList.at(i)->GetFlag() == EFFECTFLAG_DISPELABLE)
		{
			RemoveStatusEffect(i);
			if (!RemoveAll) return true;
		}
	}
	return false;
}

/************************************************************************
*																		*
*  Проверяем наличие статус-эффекта	в контейнере						*
*																		*
************************************************************************/

bool CStatusEffectContainer::HasStatusEffect(EFFECT StatusID)
{
	for (uint32 i = 0; i < m_StatusEffectList.size(); ++i) 
	{
		if (m_StatusEffectList.at(i)->GetStatusID() == StatusID)
		{
			return true;
		}
	}
	return false;
}

/************************************************************************
*                                                                       *
*  Проверяем наличие статус-эффекта	в контейнере с уникальным subid     *
*                                                                       *
************************************************************************/

bool CStatusEffectContainer::HasStatusEffect(EFFECT StatusID, uint16 SubID)
{
	for (uint32 i = 0; i < m_StatusEffectList.size(); ++i) 
	{
		if (m_StatusEffectList.at(i)->GetStatusID() == StatusID &&
		   (m_StatusEffectList.at(i)->GetSubID() == SubID))
		{
			return true;
		}
	}
	return false;
}

/************************************************************************
*                                                                       *
*                                                                       *
*                                                                       *
************************************************************************/

CStatusEffect* CStatusEffectContainer::GetStatusEffect(EFFECT StatusID, uint16 SubID)
{
	for (uint32 i = 0; i < m_StatusEffectList.size(); ++i) 
	{
		if (m_StatusEffectList.at(i)->GetStatusID() == StatusID &&
		   (m_StatusEffectList.at(i)->GetSubID() == SubID))
		{
			return m_StatusEffectList[i];
		}
	}
	return 0;
}

/************************************************************************
*																		*
*  Добавляем иконку эффекта в m_StatusIcons, сортируя их по возрастанию	*
*																		*
************************************************************************/

void CStatusEffectContainer::AddStatusIcon(EFFECT StatusID) 
{
	if (m_StatusIcons[31] != EFFECT_NONE)
	{
		ShowDebug(CL_CYAN"CStatusEffectContainer::AddStatusIcon: entity has 32 statuses, cannot add another\n"CL_RESET);
		return;
	}

	uint8 count = 0;

	for (count = 0; count < 32; ++count)
	{ 
		if (m_StatusIcons[count] != EFFECT_NONE)
		{
			if (m_StatusIcons[count] + ((m_Flags & (1 << count)) ? 256 : 0) > StatusID)
			{
				for(uint8 i = 30; i > count; --i)
				{
					m_StatusIcons[i] = m_StatusIcons[i-1];
				}

				uint32 flag = m_Flags & ((uint64)0xFFFFFFFF >> (32 - count));
				m_Flags = ((m_Flags ^ flag) << 1) | flag;

				break;
			}
		}else{
			break;
		}
	}

	if (StatusID > 255)
	{
		m_Flags |= (1 << count);
		m_StatusIcons[count] = StatusID - 256;
	}else{
		m_StatusIcons[count] = StatusID;
	}
}

/************************************************************************
*																		*
*  Удаляем иконку эффекта из m_StatusIcons								*
*																		*
************************************************************************/

void CStatusEffectContainer::DelStatusIcon(EFFECT StatusID) 
{
	for (uint8 count = 0; count < 32; ++count)
	{ 
		if (m_StatusIcons[count] + ((m_Flags & (1 << count)) ? 256 : 0) == StatusID)
		{
			for(uint8 i = count; i < 31; ++i)
			{
				m_StatusIcons[i] = m_StatusIcons[i+1];
			}
			m_StatusIcons[31] = EFFECT_NONE;

			uint32 flag = m_Flags & ((uint64)0xFFFFFFFF >> (32 - count));
			m_Flags = ((m_Flags ^ flag) >> 1) & (0xFFFFFFFF << count) | flag;

			return;
		}
	}
}

/************************************************************************
*                                                                       *
*  Устанавливаем имя эффекта для работы со скриптами                    *
*                                                                       *
************************************************************************/

void CStatusEffectContainer::SetEffectName(CStatusEffect* StatusEffect)
{
    DSP_DEBUG_BREAK_IF(StatusEffect->GetStatusID() == EFFECT_FOOD && StatusEffect->GetSubID() == 0);
    DSP_DEBUG_BREAK_IF(StatusEffect->GetStatusID() == EFFECT_NONE && StatusEffect->GetSubID() == 0);

    string_t name;

	if (StatusEffect->GetSubID() == 0)
	{
		name.insert(0,"globals/effects/");
		name.insert(name.size(),GetStatusEffectName(StatusEffect->GetStatusID()));
	} else {
		CItem* Ptem = itemutils::GetItemPointer(StatusEffect->GetSubID());
		if (Ptem != NULL)
		{
            name.insert(0,"globals/items/");
			name.insert(name.size(),Ptem->getName());
		}
	}
    StatusEffect->SetName(name);
}

/************************************************************************
*																		*
*  Загружаем эффекты персонажа											*
*																		*
************************************************************************/

void CStatusEffectContainer::LoadStatusEffects()
{
    DSP_DEBUG_BREAK_IF(m_pOwner->objtype != TYPE_PC);

	const int8* fmtQuery = "SELECT effectid, power, tick, duration, flag, subid \
							FROM char_effects \
							WHERE charid = %u;";

	int32 ret = Sql_Query(SqlHandle,fmtQuery,m_pOwner->id);

	if( ret != SQL_ERROR && Sql_NumRows(SqlHandle) != 0)
	{
		while(Sql_NextRow(SqlHandle) == SQL_SUCCESS) 
		{
			CStatusEffect* PStatusEffect = new CStatusEffect(
				(EFFECT)Sql_GetUIntData(SqlHandle,0),
				(uint16)Sql_GetUIntData(SqlHandle,1),
				(uint32)Sql_GetUIntData(SqlHandle,2),
				(uint32)Sql_GetUIntData(SqlHandle,3),
				(uint16)Sql_GetUIntData(SqlHandle,4),
				(uint16)Sql_GetUIntData(SqlHandle,5));

			AddStatusEffect(PStatusEffect);
		}
	}
}

/************************************************************************
*																		*
*  Сохраняем временные эффекты персонажа								*								
*																		*
************************************************************************/

void CStatusEffectContainer::SaveStatusEffects()
{
    DSP_DEBUG_BREAK_IF(m_pOwner->objtype != TYPE_PC);

	Sql_Query(SqlHandle,"DELETE FROM char_effects WHERE charid = %u",m_pOwner->id);

	for (uint32 i = 0; i < m_StatusEffectList.size(); ++i) 
	{
		if (m_StatusEffectList.at(i)->GetDuration() != 0)
		{
			const int8* fmtQuery = "INSERT INTO char_effects (charid, effectid, power, tick, duration, flag, subid) \
									VALUES(%u,%u,%u,%u,%u,%u,%u);";

			Sql_Query(SqlHandle,fmtQuery,
				m_pOwner->id,
				m_StatusEffectList.at(i)->GetStatusID(),
				m_StatusEffectList.at(i)->GetPower(),
				m_StatusEffectList.at(i)->GetTickTime() / 1000,
			   (m_StatusEffectList.at(i)->GetDuration() + m_StatusEffectList.at(i)->GetStartTime() - gettick()) / 1000,
				m_StatusEffectList.at(i)->GetFlag(),
				m_StatusEffectList.at(i)->GetSubID());
		}
	}
}

/************************************************************************
*																		*
*  Проверяем все эффекты на необходимость удаление, если их срок		*
*  действия истек.														*
*																		*
************************************************************************/

void CStatusEffectContainer::CheckEffects(uint32 tick)
{
	DSP_DEBUG_BREAK_IF(m_pOwner == NULL);
	
	if (!m_pOwner->isDead()) 
	{
		if ((tick - m_EffectCheckTime) < 1000 )
		{
			return;
		}

		m_EffectCheckTime = tick;

		for (uint32 i = 0; i < m_StatusEffectList.size(); ++i) 
		{
			CStatusEffect* PStatusEffect = m_StatusEffectList.at(i);

			if (PStatusEffect->GetTickTime() != 0 &&
				PStatusEffect->GetLastTick() + PStatusEffect->GetTickTime() <= tick) 
			{
				PStatusEffect->SetLastTick(tick);
				luautils::OnEffectTick(m_pOwner,PStatusEffect);
			}

			if (PStatusEffect->GetDuration() != 0 &&
				PStatusEffect->GetDuration() + PStatusEffect->GetStartTime() <= tick) 
			{	
				RemoveStatusEffect(i--);
			}
		}
    }
}