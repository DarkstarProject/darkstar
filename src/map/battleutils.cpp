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

#include "../common/timer.h"
#include "../common/utils.h"

#include <string.h>

#include "packets/char_health.h"
#include "packets/char_update.h"

#include "ability.h"
#include "charentity.h"
#include "battleutils.h"
#include "map.h"
#include "spell.h"
#include "trait.h" 
#include "weapon_skill.h"

/************************************************************************
*																		*
*  Таблицы предварительно загружаемых данных							*
*																		*
************************************************************************/

uint16 g_SkillTable[100][12];									// таблица максимальных значений умений по уровням и рангам
uint8  g_SkillRanks[MAX_SKILLTYPE][MAX_JOBTYPE];				// таблица рангов для профессий

CSpell*		  g_PSpellList[MAX_SPELL_ID];						// глобальный массив указателей на заклинания
CAbility*	  g_PAbilityList[MAX_ABILITY_ID];					// глобальный массив указателей на способности
CWeaponSkill* g_PWeaponSkillList[MAX_WEAPONSKILL_ID];			// Holds all Weapon skills
CTrait*		  g_PTraitList[MAX_TRAIT_ID]; 

std::list<CTrait*> g_PTraitsList[23];
std::list<CAbility*> g_PAbilitiesList[MAX_JOBTYPE];				// глобальный массив списков способностей, разбитый по профессиям (для быстрой инициализации) 
std::list<CWeaponSkill*> g_PWeaponSkillsList[MAX_SKILLTYPE];	// Holds Weapon skills by type

/************************************************************************
*																		*
*  namespace battleutils												*
*																		*
************************************************************************/

namespace battleutils
{

/************************************************************************
*																		*
*  Загружаем таблицу Skill_Cap											*
*																		*
************************************************************************/

void LoadSkillTable()
{
	memset(g_SkillTable,0, sizeof(g_SkillTable));
	memset(g_SkillRanks,0, sizeof(g_SkillRanks));

	const int8* fmtQuery = "SELECT r0,r1,r2,r3,r4,r5,r6,r7,r8,r9,r10,r11 \
						    FROM skill_caps \
							ORDER BY level \
							LIMIT 100";

	int32 ret = Sql_Query(SqlHandle,fmtQuery);
	
	if( ret != SQL_ERROR && Sql_NumRows(SqlHandle) != 0)
	{
		for (uint32 x = 0; x < 100 && Sql_NextRow(SqlHandle) == SQL_SUCCESS; ++x)
		{
			for (uint32 y = 0; y < 12; ++y) 
			{
				g_SkillTable[x][y] = (uint16)Sql_GetIntData(SqlHandle,y);
			}
		}
	}

	fmtQuery = "SELECT skillid,war,mnk,whm,blm,rdm,thf,pld,drk,bst,brd,rng,sam,nin,drg,smn,blu,cor,pup,dnc,sch \
				FROM skill_ranks \
				LIMIT 64";

	ret = Sql_Query(SqlHandle,fmtQuery);
	
	if( ret != SQL_ERROR && Sql_NumRows(SqlHandle) != 0)
	{
		for (uint32 x = 0; x < MAX_SKILLTYPE && Sql_NextRow(SqlHandle) == SQL_SUCCESS; ++x)
		{
			uint8 SkillID = cap_value((uint8)Sql_GetIntData(SqlHandle,0), 0, MAX_SKILLTYPE-1);

			for (uint32 y = 1; y < MAX_JOBTYPE; ++y) 
			{
				g_SkillRanks[SkillID][y] = cap_value((uint16)Sql_GetIntData(SqlHandle,y), 0, 11);
			}
		}
	}
}

/************************************************************************
*																		*
*  Инициализируем глобальный массив заклинаний							*
*																		*
************************************************************************/

void LoadSpellList()
{
	memset(g_PSpellList,0,sizeof(g_PSpellList));

	const int8* fmtQuery = "SELECT spellid, name, jobs, `group`, validTargets, castTime, recastTime, animation, mpCost, isAOE \
							FROM spell_list \
							WHERE spellid < %u;";

	int32 ret = Sql_Query(SqlHandle,fmtQuery,MAX_SPELL_ID);

	if( ret != SQL_ERROR && Sql_NumRows(SqlHandle) != 0)
	{
		while(Sql_NextRow(SqlHandle) == SQL_SUCCESS) 
		{
			CSpell* PSpell = new CSpell(Sql_GetIntData(SqlHandle,0));

			PSpell->setName(Sql_GetData(SqlHandle,1));
			PSpell->setJob(Sql_GetData(SqlHandle,2));
			PSpell->setSpellGroup((SPELLGROUP)Sql_GetIntData(SqlHandle,3));
			PSpell->setValidTarget(Sql_GetIntData(SqlHandle,4));
			PSpell->setCastTime((uint16)(Sql_GetFloatData(SqlHandle,5) * 1000));
			PSpell->setRecastTime(Sql_GetIntData(SqlHandle,6));
			PSpell->setAnimationID(Sql_GetIntData(SqlHandle,7));
			PSpell->setMPCost(Sql_GetIntData(SqlHandle,8));
			PSpell->setAOE(Sql_GetIntData(SqlHandle,9));

			g_PSpellList[PSpell->getID()] = PSpell;
		}
	}
}

/************************************************************************
*																		*
*  Инициализируем глобальный массив способностей						*
*																		*
************************************************************************/

void LoadAbilitiesList()
{
	memset(g_PAbilityList,0,sizeof(g_PAbilityList));

	const int8* fmtQuery = "SELECT abilityId, name, job, level, validTarget, recastTime, animation, `range`, isAOE \
							FROM abilities WHERE job > 0 AND job < %u AND abilityId < %u \
							ORDER BY job, level ASC";

	int32 ret = Sql_Query(SqlHandle, fmtQuery, MAX_JOBTYPE, MAX_ABILITY_ID);

	if( ret != SQL_ERROR && Sql_NumRows(SqlHandle) != 0)
	{
		while(Sql_NextRow(SqlHandle) == SQL_SUCCESS) 
		{
			CAbility* PAbility = new CAbility(Sql_GetIntData(SqlHandle,0));
		
			PAbility->setName(Sql_GetData(SqlHandle,1));
			PAbility->setJob((JOBTYPE)Sql_GetIntData(SqlHandle,2));
			PAbility->setLevel(Sql_GetIntData(SqlHandle,3));
			PAbility->setValidTarget(Sql_GetIntData(SqlHandle,4));
			PAbility->setRecastTime(Sql_GetIntData(SqlHandle,5));
			PAbility->setAnimationID(Sql_GetIntData(SqlHandle,6));
			PAbility->setRange(Sql_GetIntData(SqlHandle,7));
			PAbility->setAOE(Sql_GetIntData(SqlHandle,8));
			
			g_PAbilityList[PAbility->getID()] = PAbility;
			g_PAbilitiesList[PAbility->getJob()].push_back(PAbility);
		}
	}
}

/************************************************************************
*																		*
*  Load Weapon Skills from database										*
*																		*
************************************************************************/

void LoadWeaponSkillsList()
{
	memset(g_PWeaponSkillList,0,sizeof(g_PWeaponSkillList));

	const int8* fmtQuery = "SELECT weaponskillid, name, jobs, skilltype, skilllevel, skillchain, animation, `range`, aoe \
							FROM weapon_skills \
							WHERE weaponskillid < %u \
							ORDER BY skilltype, skilllevel ASC";

	int32 ret = Sql_Query(SqlHandle, fmtQuery, MAX_WEAPONSKILL_ID);

	if( ret != SQL_ERROR && Sql_NumRows(SqlHandle) != 0)
	{
		while(Sql_NextRow(SqlHandle) == SQL_SUCCESS) 
		{
			CWeaponSkill* PWeaponSkill = new CWeaponSkill(Sql_GetIntData(SqlHandle,0));
			
			PWeaponSkill->setName(Sql_GetData(SqlHandle,1));
			PWeaponSkill->setJob(Sql_GetData(SqlHandle,2));
			PWeaponSkill->setSkillType(Sql_GetIntData(SqlHandle,3));
			PWeaponSkill->setSkillLevel(Sql_GetIntData(SqlHandle,4));
			PWeaponSkill->setSkillChain(Sql_GetIntData(SqlHandle,5));
			PWeaponSkill->setAnimationId(Sql_GetIntData(SqlHandle,6));
			PWeaponSkill->setRange(Sql_GetIntData(SqlHandle,7));
			PWeaponSkill->setAoe(Sql_GetIntData(SqlHandle,8));
			
			g_PWeaponSkillList[PWeaponSkill->getID()] = PWeaponSkill;
			g_PWeaponSkillsList[PWeaponSkill->getSkillType()].push_back(PWeaponSkill);
		}
	}
}

void LoadTraitsList()
{
	//memset(g_PTraitList,0,sizeof(g_PTraitList));

	const int8* fmtQuery = "SELECT TraitId, name, job, level \
							FROM traits \
							WHERE job > 0 \
							ORDER BY job, traitID, level ASC";

	int32 ret = Sql_Query(SqlHandle, fmtQuery, MAX_TRAIT_ID);

	if( ret != SQL_ERROR && Sql_NumRows(SqlHandle) != 0)
	{
		while(Sql_NextRow(SqlHandle) == SQL_SUCCESS) 
		{
			
			CTrait* PTrait = new CTrait(Sql_GetIntData(SqlHandle,0));
			
			PTrait->setName(Sql_GetData(SqlHandle,1));
			PTrait->setJob(Sql_GetIntData(SqlHandle,2));
			PTrait->setLevel(Sql_GetIntData(SqlHandle,3));
			
			g_PTraitList[PTrait->getID()] = PTrait;
			g_PTraitsList[PTrait->getJob()].push_back(PTrait);
		}
	}
}


/************************************************************************
*																		*
*  Освобождаем глобальный массив заклинаний								*
*																		*
************************************************************************/

void FreeSpellList()
{
	for(int32 SpellID = 0; SpellID < MAX_SPELL_ID; ++SpellID)
	{
		delete g_PSpellList[SpellID];
	}
}

/************************************************************************
*																		*
*  Освобождаем массив способностей. Освобождать сортированные списки	*
*  способностей не нужно, т.к. мы удалили объекты, то всю работу за		*
*  нас сделает система													*
*																		*
************************************************************************/

void FreeAbilitiesList()
{
	for(int32 AbilityID = 0; AbilityID < MAX_ABILITY_ID; ++AbilityID)
	{
		delete g_PAbilityList[AbilityID];
	}
}


/************************************************************************
*																		*
*  Clear Weapon Skills List												*
*																		*
************************************************************************/

void FreeWeaponSkillsList()
{
	for(int32 SkillId= 0; SkillId < MAX_WEAPONSKILL_ID; ++SkillId)
	{
		delete g_PWeaponSkillList[SkillId];
	}
}


/************************************************************************
*																		*
*  Clear Traits List													*
*																		*
************************************************************************/
void FreeTraitsList()
{
	for(int32 TraitID= 0; TraitID < MAX_TRAIT_ID; ++TraitID)
	{
		delete g_PTraitList[TraitID];
	}
}

/************************************************************************
*																		*
*  Получаем ранг умения для выбранной профессии							*
*																		*
************************************************************************/

uint8 GetSkillRank(SKILLTYPE SkillID, JOBTYPE JobID)
{
	return g_SkillRanks[SkillID][JobID];
}

/************************************************************************
*																		*
*  Получаем максимальное значение умения для выбранной профессии c		*
*  заданным уровнем														*
*																		*
************************************************************************/

uint16 GetMaxSkill(SKILLTYPE SkillID, JOBTYPE JobID, uint8 level)
{
	return g_SkillTable[level][g_SkillRanks[SkillID][JobID]];
}

/************************************************************************
*																		*
*  Получаем указатель на заклинание										*
*																		*
************************************************************************/

CSpell* GetSpell(uint16 SpellID)
{
	if (SpellID < MAX_SPELL_ID)
	{
		return g_PSpellList[SpellID];
	}
	ShowFatalError(CL_RED"SpellID <%u> out of range\n", SpellID);
	return NULL;
}

/************************************************************************
*																		*
*  Проверяем, может ли персонаж использовать заклинание					*
*																		*
************************************************************************/

bool CanUseSpell(CBattleEntity* PCaster, uint16 SpellID)
{
	if (GetSpell(SpellID) != NULL)
	{
		uint8 JobMLVL = g_PSpellList[SpellID]->getJob(PCaster->GetMJob());
		uint8 JobSLVL = g_PSpellList[SpellID]->getJob(PCaster->GetSJob());

		return (PCaster->GetMLevel() >= JobMLVL || PCaster->GetSLevel() >= JobSLVL);
	}
	return false;
}

/************************************************************************
*																		*
*  Получаем указатель на способность									*
*																		*
************************************************************************/

CAbility* GetAbility(uint16 AbilityID)
{
	if (AbilityID < MAX_ABILITY_ID)
	{
		ShowDebug(CL_GREEN"Getting CurrentAbility %u \n"CL_RESET, g_PAbilityList[AbilityID]->getID());
		return g_PAbilityList[AbilityID];
	}
	ShowFatalError(CL_RED"AbilityID <%u> is out of range\n", AbilityID);
	return NULL;
}

/************************************************************************
*																		*
*  Получаем список способностей для указанной профессии					*
*																		*
************************************************************************/

std::list<CAbility*> GetAbilities(JOBTYPE JobID)
{
	return g_PAbilitiesList[JobID];
}

/************************************************************************
*																		*
*  Проверяем, может ли персонаж использовать способность				*
*																		*
************************************************************************/

bool CanUseAbility(CBattleEntity* PAttacker, uint16 AbilityID)
{
	if (GetAbility(AbilityID) != NULL)
	{
		//...
	}
	return false;
}

/************************************************************************
*																		*
*  Get Weapon Skill by Id												*
*																		*
************************************************************************/

CWeaponSkill* GetWeaponSkill(uint16 WSkillID)
{
	if (WSkillID < MAX_WEAPONSKILL_ID)
	{
		return g_PWeaponSkillList[WSkillID];
	}
	ShowFatalError(CL_RED"WeaponSkillID <%u> out of range\n", WSkillID);
	return NULL;
}


/************************************************************************
*																		*
* Get List of Weapon Skills from skill type								*
*																		*
************************************************************************/

std::list<CWeaponSkill*> GetWeaponSkills(uint8 skill)
{
	
	return g_PWeaponSkillsList[skill];
}

CTrait* GetTrait(uint16 TraitID)
{
	return g_PTraitList[TraitID];
}

/************************************************************************
*																		*
* Get List of Traits by Main Job and Sub Job							*
*																		*
************************************************************************/

std::list<CTrait*> GetTraits(JOBTYPE JobID)
{
	return g_PTraitsList[JobID];
}

/************************************************************************
*																		*
*  Пересчет нанесенного урона с учетом врожденной сопротивляемости		*
*																		*
************************************************************************/

uint16 TakePhysicalDamage(CBattleEntity* PAttacker, CBattleEntity* PDefender, int16 damage)
{
	if (PDefender->StatusEffectContainer->HasStatusEffect(EFFECT_INVINCIBLE))
	{
		damage = 0;
	}

	damage = (damage * (100 + PDefender->getMod(MOD_DMG)))/100;

	switch(PAttacker->m_Weapons[SLOT_MAIN]->getDmgType())
	{
		case DAMAGE_CROSSBOW:
		case DAMAGE_GUN:
		case DAMAGE_PIERCING: damage = (damage * (PDefender->getMod(MOD_PIERCERES))) / 1000; break;
		case DAMAGE_SLASHING: damage = (damage * (PDefender->getMod(MOD_SLASHRES)))	 / 1000; break;
		case DAMAGE_IMPACT:	  damage = (damage * (PDefender->getMod(MOD_IMPACTRES))) / 1000; break;
		case DAMAGE_HTH:	  damage = (damage * (PDefender->getMod(MOD_HTHRES)))	 / 1000; break;
	}

	PDefender->addHP(-damage);

	PDefender->m_OwnerID = PAttacker->id;

	// прерывание магических атак

	if (PDefender->PBattleAI->GetCurrentAction() == ACTION_MAGIC_CASTING)
	{
		uint32 MagicInterruptRate = 50; // должен вычисляться на основании skill, разници уровней сущностей и модификаторе прерывания чтения заклинаний MOD_SPELLINTRATE

		if (MagicInterruptRate  < rand()*100)
		{
			PDefender->PBattleAI->SetCurrentAction(ACTION_MAGIC_INTERRUPT);
		}
	}

	// неправильно, при промахе персонаж не должен прерывать отдых
	// так же нужно прерывать и другие действия: рыбалку, синтез, сидение, заставки

	if (PDefender->objtype == TYPE_PC)
	{
		switch (PDefender->animation)
		{
			case ANIMATION_SIT:
			{
				PDefender->animation = ANIMATION_NONE;

				((CCharEntity*)PDefender)->pushPacket(new CCharUpdatePacket((CCharEntity*)PDefender));
			}
			break;
			case ANIMATION_HEALING:
			{
				PDefender->animation = ANIMATION_NONE;

				PDefender->StatusEffectContainer->DelStatusEffect(EFFECT_HEALING);
				PDefender->StatusEffectContainer->DelStatusEffect(EFFECT_LEAVEGAME);
			}
			break;
		}
	
		(CCharEntity*)PDefender->addTP(3);
		((CCharEntity*)PDefender)->pushPacket(new CCharHealthPacket((CCharEntity*)PDefender));
	}

	return damage;
}

/************************************************************************
*																		*
*  Расчет вероятности попадания. Минимальная 20%, максимальная 95%		*
*																		*
************************************************************************/

uint8 GetHitRate(CBattleEntity* PAttacker, CBattleEntity* PDefender) 
{
	int32 hitrate = 75;

		int32 defendereva = (PDefender->getMod(MOD_EVA) * (100 + PDefender->getMod(MOD_EVAP)))/100 + (PAttacker->stats.AGI + PAttacker->getMod(MOD_AGI))/2;
		int32 attackeracc = (PAttacker->getMod(MOD_ACC) * (100 + PAttacker->getMod(MOD_ACCP)))/100 + (PAttacker->stats.DEX + PAttacker->getMod(MOD_DEX))/2; 
	
		hitrate = hitrate + (attackeracc - defendereva) / 2 + (PAttacker->GetMLevel() - PDefender->GetMLevel())*2;

		hitrate = cap_value(hitrate, 20, 95);
	
	return (uint8)hitrate;
}

/************************************************************************
*																		*
*  Расчет вероятности нанесения критического удара						*
*																		*
************************************************************************/

uint8 GetCritHitRate(CBattleEntity* PAttacker, CBattleEntity* PDefender)
{
	int32 crithitrate = 5;

	if (PAttacker->StatusEffectContainer->HasStatusEffect(EFFECT_SNEAK_ATTACK))
	{
		crithitrate = 100;
	}else{
		int32 attackerdex = PAttacker->stats.DEX + PAttacker->getMod(MOD_DEX);
		int32 defenderagi = PDefender->stats.AGI + PDefender->getMod(MOD_AGI);

		int32 dDEX = cap_value(attackerdex - defenderagi,0,50);

		crithitrate += (dDEX * 30) / 100 + PAttacker->getMod(MOD_CRITHITRATE) + PDefender->getMod(MOD_ENEMYCRITRATE);
		crithitrate  = cap_value(crithitrate,0,100);
	}

	return (uint8)crithitrate;
}

/************************************************************************
*																		*
*  																		*
*																		*
************************************************************************/

float GetDamageRatio(CBattleEntity* PAttacker, CBattleEntity* PDefender)  
{
	float attackeratt = PAttacker->getMod(MOD_ATT) + (PAttacker->stats.STR + PAttacker->getMod(MOD_STR))/2;
	float defenderdef = PDefender->getMod(MOD_DEF) + (PDefender->stats.VIT + PDefender->getMod(MOD_VIT))/2;

	float cRatio = attackeratt / defenderdef;

	float cRatioMax = 0;
	float cRatioMin = 0;

	if(PAttacker->objtype == TYPE_PC) 
	{
		if(PAttacker->GetMLevel() < PDefender->GetMLevel()) 
		{
			cRatio -= 0.050f * (PDefender->GetMLevel() - PAttacker->GetMLevel());
		}
	}

	cRatio = cap_value(cRatio,0,2);

	if((0 <= cRatio) && (cRatio < 0.5)) {
		cRatioMax = 0.4f + 1.2f * cRatio;
	} else if((0.5 <= cRatio) && (cRatio <= (5/6))) {
		cRatioMax = 1;
	} else if(((5/6) < cRatio) && (cRatio <= 2)) {
		cRatioMax = 1.2f * (cRatio);
	}

	if((0 <= cRatio) && (cRatio < 1.25)) {
		cRatioMin =  (float)(-0.5 + 1.2 * cRatio);
	} else if((1.25 <= cRatio) && (cRatio <= 1.5)) {
		cRatioMin = 1;
	} else if((1.5 < cRatio) && (cRatio <= 2)) {
		cRatioMin = (float)(-0.8 + 1.2 * cRatio);
	}

	cRatioMin = (cRatioMin < 0 ? 0 : cRatioMin);

	return ((cRatioMax-cRatioMin) * ((float)rand()/RAND_MAX)) + cRatioMin;
}

/************************************************************************
*																		*
*  																		*
*																		*
************************************************************************/

int32 GetFSTR(CBattleEntity* PAttacker, CBattleEntity* PDefender) 
{
	int32 rank = PAttacker->m_Weapons[SLOT_MAIN]->getDamage() / 9; 

	float dif = (PAttacker->stats.STR + PAttacker->getMod(MOD_STR)) - (PDefender->stats.VIT + PDefender->getMod(MOD_VIT));

	int32 fstr = 1.95 + 0.195 * dif;

	if(fstr < (-rank)) {
		return (-rank);
	}
	if((fstr > (-rank)) && (fstr <= rank + 8)) {
		return fstr;
	} else {
		return rank + 8;
	}
}

/************************************************************************
*																		*
*  																		*
*																		*
************************************************************************/

bool IsParalised(CBattleEntity* PAttacker)
{
	return (rand()%100 < PAttacker->getMod(MOD_PARALYZE)); // PAttacker->getMod(MOD_PARALYZERES)
}

/************************************************************************
*																		*
*  Расчет вероятности запугивания атакуущего							*
*																		*
************************************************************************/

bool IsIntimidated(CBattleEntity* PAttacker, CBattleEntity* PDefender)
{
	uint16 KillerEffect = 0;

	switch (PAttacker->m_EcoSystem)
	{
		case SYSTEM_AMORPH:		KillerEffect = PDefender->getMod(MOD_AMORPH_KILLER);   break;
		case SYSTEM_AQUAN:		KillerEffect = PDefender->getMod(MOD_AQUAN_KILLER);    break;
		case SYSTEM_ARCANA:		KillerEffect = PDefender->getMod(MOD_ARCANA_KILLER);   break;
		case SYSTEM_BEAST:		KillerEffect = PDefender->getMod(MOD_BEAST_KILLER);    break;
		case SYSTEM_BIRD:		KillerEffect = PDefender->getMod(MOD_BIRD_KILLER);     break;
		case SYSTEM_DEMON:		KillerEffect = PDefender->getMod(MOD_DEMON_KILLER);    break;
		case SYSTEM_DRAGON:		KillerEffect = PDefender->getMod(MOD_DRAGON_KILLER);   break;
		case SYSTEM_EMPTY:		KillerEffect = PDefender->getMod(MOD_EMPTY_KILLER);    break;
		case SYSTEM_LIZARD:		KillerEffect = PDefender->getMod(MOD_LIZARD_KILLER);   break;
		case SYSTEM_PLANTOID:	KillerEffect = PDefender->getMod(MOD_PLANTOID_KILLER); break;
		case SYSTEM_UNDEAD:		KillerEffect = PDefender->getMod(MOD_UNDEAD_KILLER);   break;
		case SYSTEM_VERMIN:		KillerEffect = PDefender->getMod(MOD_VERMIN_KILLER);   break;
		case SYSTEM_HUMANOID:	KillerEffect = PDefender->getMod(MOD_HUMANOID_KILLER); break;
	}

	return (rand()%100 < KillerEffect);
}

/************************************************************************
*																		*
*  Перемещаем сущности в указанную точку. Перемещение осуществляется	*
*  "своим ходом". При вызове метода сущность уже должена смотреть в		*
*  точку назначения. Mode - режим: 1 - пешком; 2 - бегом.				*
*																		*
************************************************************************/

void MoveTo(CBattleEntity* PEntity, position_t pos, uint8 mode)
{
	DSP_DEBUG_BREAK_IF(mode < 1 || mode > 2);

	if (PEntity->speed != 0)
	{
		float angle = (1 - (float)PEntity->loc.p.rotation / 255) * 6.28318f;

		PEntity->loc.p.x += (cosf(angle) * ((float)PEntity->speed/0x28) * (mode) * 1.08);
		PEntity->loc.p.y = pos.y;
		PEntity->loc.p.z += (sinf(angle) * ((float)PEntity->speed/0x28) * (mode) * 1.08);

		PEntity->loc.p.moving += ((0x36*((float)PEntity->speed/0x28)) - (0x14*(mode - 1)));

		if(PEntity->loc.p.moving > 0x2fff) 
		{
			PEntity->loc.p.moving = 0;
		}
	}
}

}; // namespase battleutils