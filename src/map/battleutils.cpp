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
#include "mobskill.h"
#include "mobentity.h"


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

CMobSkill* g_PMobSkillList[MAX_MOBSKILL_ID];			// List of mob skills

std::list<CTrait*> g_PTraitsList[23];
std::list<CAbility*> g_PAbilitiesList[MAX_JOBTYPE];				// глобальный массив списков способностей, разбитый по профессиям (для быстрой инициализации) 
std::list<CWeaponSkill*> g_PWeaponSkillsList[MAX_SKILLTYPE];	// Holds Weapon skills by type
std::list<CMobSkill*> g_PMobFamilySkills[270];					// Mob Skills By Family

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

	const int8* fmtQuery = "SELECT spellid, name, jobs, `group`, validTargets, castTime, recastTime, animation, mpCost, \
							isAOE, base, effect, element, multiplier, defaultMsgType \
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
			PSpell->setBase(Sql_GetIntData(SqlHandle,10)); 
			PSpell->setEffect(Sql_GetIntData(SqlHandle,11)); 
			PSpell->setElement(Sql_GetIntData(SqlHandle,12)); 
			PSpell->setMultiplier(Sql_GetIntData(SqlHandle,13)); 
			PSpell->setSpellType(Sql_GetIntData(SqlHandle,14));
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

	const int8* fmtQuery = "SELECT abilityId, name, job, level, validTarget, recastTime, animation, `range`, isAOE, recastId \
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
			PAbility->setRecastId(Sql_GetIntData(SqlHandle,9));
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


/************************************************************************
*  Load Mob Skills from database										*
************************************************************************/

void LoadMobSkillsList()
{
	memset(g_PMobSkillList,0,sizeof(g_PMobSkillList));

	const int8* fmtQuery = "SELECT mob_skill_id, mob_skill_name, family_id, mob_skill_type, \
						   mob_skill_element, mob_skill_critical, mob_skill_num_hit, mob_skill_aoe, \
						   mob_skill_distance, mob_skill_flag, mob_skill_effect \
						   FROM mob_skill \
						   WHERE mob_skill_id < %u \
						   ORDER BY family_Id, mob_skill_id ASC";

	int32 ret = Sql_Query(SqlHandle, fmtQuery, MAX_MOBSKILL_ID);

	if( ret != SQL_ERROR && Sql_NumRows(SqlHandle) != 0)
	{
		while(Sql_NextRow(SqlHandle) == SQL_SUCCESS) 
		{
			CMobSkill* PMobSkill = new CMobSkill(Sql_GetIntData(SqlHandle,0));
			
			PMobSkill->setName(Sql_GetData(SqlHandle,1));
			PMobSkill->setfamilyID(Sql_GetIntData(SqlHandle,2));
			PMobSkill->setSkillType(Sql_GetIntData(SqlHandle,3));
			PMobSkill->setElement(Sql_GetIntData(SqlHandle,4));
			PMobSkill->setCritical(Sql_GetIntData(SqlHandle,5));
			PMobSkill->setNumHits(Sql_GetIntData(SqlHandle,6));
			PMobSkill->setAoe(Sql_GetIntData(SqlHandle,7));
			PMobSkill->setDistance(Sql_GetFloatData(SqlHandle,8));
			PMobSkill->setFlag(Sql_GetIntData(SqlHandle,9));
			PMobSkill->setEffect(Sql_GetIntData(SqlHandle,10));
			
			g_PMobSkillList[PMobSkill->getID()] = PMobSkill;
			g_PMobFamilySkills[PMobSkill->getfamilyID()].push_back(PMobSkill);
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
*	Clear Abilities List												*
************************************************************************/

void FreeAbilitiesList()
{
	for(int32 AbilityID = 0; AbilityID < MAX_ABILITY_ID; ++AbilityID)
	{
		delete g_PAbilityList[AbilityID];
	}
}


/************************************************************************
*  Clear Weapon Skills List												*
************************************************************************/

void FreeWeaponSkillsList()
{
	for(int32 SkillId= 0; SkillId < MAX_WEAPONSKILL_ID; ++SkillId)
	{
		delete g_PWeaponSkillList[SkillId];
	}
}


/************************************************************************
*  Clear Traits List													*
************************************************************************/
void FreeTraitsList()
{
	for(int32 TraitID= 0; TraitID < MAX_TRAIT_ID; ++TraitID)
	{
		delete g_PTraitList[TraitID];
	}
}

/************************************************************************
*  Clear Mob Skills List												*
************************************************************************/
void FreeMobSkillList()
{
	for(int32 SkillID= 0; SkillID < MAX_MOBSKILL_ID; ++SkillID)
	{
		delete g_PMobSkillList[SkillID];
	}
}

/************************************************************************
*	Get Skill Rank By SkillId and JobId									*
************************************************************************/

uint8 GetSkillRank(SKILLTYPE SkillID, JOBTYPE JobID)
{
	return g_SkillRanks[SkillID][JobID];
}

/************************************************************************
*	Return Max Skill by SkillType, JobType, and level					*
************************************************************************/

uint16 GetMaxSkill(SKILLTYPE SkillID, JOBTYPE JobID, uint8 level)
{
	return g_SkillTable[level][g_SkillRanks[SkillID][JobID]];
}

/************************************************************************
*	Get Spell By Id														*
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
*	Check If user can cast spell										*
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
*	Get Ability By ID													*
************************************************************************/

CAbility* GetAbility(uint16 AbilityID)
{
	if (AbilityID < MAX_ABILITY_ID)
	{
		//ShowDebug(CL_GREEN"Getting CurrentAbility %u \n"CL_RESET, g_PAbilityList[AbilityID]->getID());
		return g_PAbilityList[AbilityID];
	}
	ShowFatalError(CL_RED"AbilityID <%u> is out of range\n", AbilityID);
	return NULL;
}

/************************************************************************
*	Get Abilities By JobID												*
************************************************************************/

std::list<CAbility*> GetAbilities(JOBTYPE JobID)
{
	return g_PAbilitiesList[JobID];
}

/************************************************************************
*	Function may not be needed											*
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
*  Get Weapon Skill by Id												*
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
* Get List of Weapon Skills from skill type								*
************************************************************************/

std::list<CWeaponSkill*> GetWeaponSkills(uint8 skill)
{
	
	return g_PWeaponSkillsList[skill];
}

/************************************************************************
*  Get Mob Skill by Id												*
************************************************************************/

CMobSkill* GetMobSkill(uint16 SkillID)
{
	if (SkillID < MAX_MOBSKILL_ID)
	{
		return g_PMobSkillList[SkillID];
	}
	ShowFatalError(CL_RED"MobSkillID <%u> out of range\n", SkillID);
	return NULL;
}


/************************************************************************
* Get Mob Skills by family id											*
************************************************************************/

std::list<CMobSkill*> GetMobSkillsByFamily(uint16 familyID)
{
	return g_PMobFamilySkills[familyID];
}

/************************************************************************
* Get Trait By Id														*
************************************************************************/

CTrait* GetTrait(uint16 TraitID)
{
	return g_PTraitList[TraitID];
}

/************************************************************************
* Get List of Traits by Main Job and Sub Job							*
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

uint16 TakePhysicalDamage(CBattleEntity* PAttacker, CBattleEntity* PDefender, int16 damage, CZone* PZone)
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

		if (damage > 0 && MagicInterruptRate  < rand()*100)
		{
			PDefender->PBattleAI->SetCurrentAction(ACTION_MAGIC_INTERRUPT);
		}
	}

	// неправильно, при промахе персонаж не должен прерывать отдых
	// так же нужно прерывать и другие действия: рыбалку, синтез, сидение, заставки

	if (PDefender->objtype == TYPE_PC)
	{
		PDefender->StatusEffectContainer->DelStatusEffect(EFFECT_INVISIBLE);
		PDefender->StatusEffectContainer->DelStatusEffect(EFFECT_HIDE);
		PDefender->StatusEffectContainer->DelStatusEffect(EFFECT_CAMOUFLAGE);
		PDefender->StatusEffectContainer->DelStatusEffect(EFFECT_SNEAK);
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
		};
		
		if (damage > 0)
		{
			(CCharEntity*)PDefender->addTP(3);
		}
	}
	
	PZone->PushPacket(PDefender,CHAR_INRANGE_SELF, new CCharHealthPacket((CCharEntity*)PDefender)); 
	
	return damage;
}

/************************************************************************
*																		*
*  Calculate Power of Damage Spell										*
*																		*
************************************************************************/

uint32 MagicCalculateDamage(CBattleEntity* PCaster, CBattleEntity* PTarget, CSpell* PSpell, int8 targetNumber, CZone* PZone) 
{
	int32 dINT = PCaster->stats.INT - PTarget->stats.INT; 
	int32 base = PSpell->getBase(); 
	float M = PSpell->getMultiplier(); 

	int32 D = (dINT < 0 ? base + dINT : base + (dINT * M)); 

	if (PSpell->isAOE() && targetNumber > 1)
	{
		if (targetNumber > 1 && targetNumber < 10) 
			D = (D * 0.9); // Need to correct this later, every +2 targets, reduce by 0.1
		else if (targetNumber >= 10)
		{
			D = (D * 0.4);
		}
	}

	switch(PSpell->getElement())
	{
	case 1: // Fire
	{
		D = (PTarget->getMod(MOD_FIRERES) > 0 ? (D * (PTarget->getMod(MOD_FIRERES))) / 1000 : D);
	}
		break;
	case 2: // Earth
	{
		D = (PTarget->getMod(MOD_EARTHRES) > 0 ? (D * (PTarget->getMod(MOD_EARTHRES))) / 1000 : D);
	}
		break;
	case 3: // water
	{
		D = (PTarget->getMod(MOD_WATERRES) > 0 ? (D * (PTarget->getMod(MOD_WATERRES))) / 1000 : D);
	}
		break;
	case 4: // air
	{
		D = (PTarget->getMod(MOD_WINDRES) > 0 ? (D * (PTarget->getMod(MOD_WINDRES))) / 1000 : D);
	}
		break;
	case 5: // ice 
	{
		D = (PTarget->getMod(MOD_ICERES) > 0 ? (D * (PTarget->getMod(MOD_ICERES))) / 1000 : D);
	}
		break;
	case 6: // thunder
	{
		D = (PTarget->getMod(MOD_THUNDERRES) > 0 ? (D * (PTarget->getMod(MOD_THUNDERRES))) / 1000 : D);
	}
		break;
	case 7: // light
	{
		D = (PTarget->getMod(MOD_LIGHTRES) > 0 ? (D * (PTarget->getMod(MOD_LIGHTRES))) / 1000 : D);
	}
		break;
	case 8: // dark
	{
		D = (PTarget->getMod(MOD_DARKRES) > 0 ? (D * (PTarget->getMod(MOD_DARKRES))) / 1000 : D);
	}
		break;
	};
	
	PTarget->addHP(-D);
	PTarget->m_OwnerID = PCaster->id;
	
	PZone->PushPacket(PTarget,CHAR_INRANGE_SELF, new CCharHealthPacket((CCharEntity*)PTarget)); 
	return D;

}

/************************************************************************
*																		*
*  Calculate Power of Cure Spell										*
*																		*
************************************************************************/

uint32 MagicCalculateCure(CBattleEntity* PCaster, CBattleEntity* PTarget, CSpell* PSpell, int8 targetNumber, CZone* PZone) 
{

	int32 h; 
	float x;
	float x2;
	float x3;

	float y;
	float y2;
	float y3;

	int32 minCap;
	int32 midCap;
	int32 maxCap;

	switch (PSpell->getID())
	{
	case 1: 
		x = 2;
		x2 = 4;
		x3 = 114;
		y = -10;
		y2 = 5;
		y3 = 29.125;

		minCap = 10;
		midCap = 20;
		maxCap = 30;
		
		break;
	case 2: case 7:
		x = 2;
		x2 = 4;
		x3 = 214/3;
		y = 20;
		y2 = 47.5;
		y3 = 87.62;

		minCap = 60;
		midCap = 75;
		maxCap = 90;
		break;
	case 3: case 8:
		x = 2;
		x2 = 4;
		x3 = 94/3;
		y = 70;
		y2 = 115;
		y3 = 180.43;

		minCap = 130;
		midCap = 160;
		maxCap = 190;
		break;
	case 4: case 9:
		x = 4/3;
		x2 = 4;
		x3 = 13;
		y = 165;
		y2 = 275;
		y3 = 1064/3;

		minCap = 270;
		midCap = 330;
		maxCap = 390;
		break;
	case 5: case 10:
		x = 4/3;
		x2 = 1;
		x3 = 17/6;
		y = 330;
		y2 = 410;
		y3 = 591.2;

		minCap = 450;
		midCap = 570;
		maxCap = 690;
		break;
	case 6: case 11: //not implemented
		x = 2;
		x2 = 4;
		x3 = 114;
		y = -10;
		y2 = 5;
		y3 = 29.125;

		minCap = 10;
		midCap = 20;
		maxCap = 30;
		break;
	};
	

	h = (((3*(PCaster->stats.MND + (PCaster->GetSkill(SKILL_HEA)/10)/5) + PCaster->stats.VIT) / x) + y) + MOD_HEALING; //+ Day bonus + Weather bonus) 

	if (h < minCap)
	{
		h = minCap;
	}
	else if (minCap < h < maxCap) 
	{
		h = (((3*(PCaster->stats.MND + (PCaster->GetSkill(SKILL_HEA)/10)/5) + PCaster->stats.VIT) / x2) + y2) + MOD_HEALING; //+ Day bonus + Weather bonus) 
	}
	else if (maxCap < h)
	{
		h = (((3*(PCaster->stats.MND + (PCaster->GetSkill(SKILL_HEA)/10)/5) + PCaster->stats.VIT) / x3) + y3) + MOD_HEALING; //+ Day bonus + Weather bonus) 
	}

	h = (h > maxCap ? maxCap : h);

	if  (PTarget->objtype == TYPE_MOB)
	{
		if (PTarget->m_EcoSystem == SYSTEM_UNDEAD) 
		{
			PTarget->addHP(-h);
			PZone->PushPacket(PTarget,CHAR_INRANGE_SELF, new CCharHealthPacket((CCharEntity*)PTarget)); 
			return -h; 
		}
		return 0; 
	}
	else 
	{
		PTarget->addHP(h);
		PZone->PushPacket(PTarget,CHAR_INRANGE_SELF, new CCharHealthPacket((CCharEntity*)PTarget)); 
	}
	return h;
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
*  Crit Rate															*
*																		*
************************************************************************/

uint8 GetCritHitRate(CBattleEntity* PAttacker, CBattleEntity* PDefender)
{
	int32 crithitrate = 5;

	if (PAttacker->StatusEffectContainer->HasStatusEffect(EFFECT_SNEAK_ATTACK) && (abs(PDefender->loc.p.rotation - PAttacker->loc.p.rotation) < 23))
	{// && 
		ShowDebug(CL_BLUE"SneakAttack!  \n"CL_RESET); 
		crithitrate = 100;
		PAttacker->StatusEffectContainer->DelStatusEffect(EFFECT_SNEAK_ATTACK);
	}
	else
	{
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
*	Formula for calculating damage ratio								*
*																		*
************************************************************************/

float GetDamageRatio(CBattleEntity* PAttacker, CBattleEntity* PDefender)  
{
	
	float attackeratt = PAttacker->getMod(MOD_ATT) + (PAttacker->stats.STR + PAttacker->getMod(MOD_STR))/2;
	attackeratt = (PAttacker->getMod(MOD_ATTP) != 0 ? attackeratt + (attackeratt * (PAttacker->getMod(MOD_ATTP)*.01)) : attackeratt);
		
	float defenderdef = PDefender->getMod(MOD_DEF) + (PDefender->stats.VIT + PDefender->getMod(MOD_VIT))/2;
	defenderdef = (PDefender->getMod(MOD_DEFP) != 0 ? defenderdef + (defenderdef * (PDefender->getMod(MOD_DEFP)*.01)) : defenderdef);
	
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
*  	Formula for Strength												*
************************************************************************/

int32 GetFSTR(CBattleEntity* PAttacker, CBattleEntity* PDefender) 
{
	int32 rank = PAttacker->m_Weapons[SLOT_MAIN]->getDamage() / 9; 

	float dif = ((PAttacker->stats.STR * 2) + PAttacker->getMod(MOD_STR)) - ((PDefender->stats.VIT * 2) + PDefender->getMod(MOD_VIT));

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
*	Chance paralysis will cause you to be paralyzed  					*
************************************************************************/

bool IsParalised(CBattleEntity* PAttacker)
{
	return (rand()%100 < PAttacker->getMod(MOD_PARALYZE)); // PAttacker->getMod(MOD_PARALYZERES)
}

/************************************************************************
*																		*
*  Intimidation from Killer Effects (chance to intimidate)				*
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
* Moves mob  - mode 1 = walk / 2 = run									*
************************************************************************/

void MoveTo(CBattleEntity* PEntity, position_t pos, uint8 mode)
{
	//DSP_DEBUG_BREAK_IF(mode < 1 || mode > 2);

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


/************************************************************************
*	White Mage Benediction Ability										*
************************************************************************/

int32 battleutils::AbilityBenediction(CBattleEntity* PCaster, CBattleEntity* PTarget)
{
	int32 hpHealed = PTarget->health.maxhp * PCaster->GetMLevel() / PTarget->GetMLevel();
		PTarget->addHP(hpHealed);
	(PTarget->StatusEffectContainer->HasStatusEffect(EFFECT_SLEEP) ? PTarget->StatusEffectContainer->DelStatusEffect(EFFECT_SLEEP) : NULL);
	(PTarget->StatusEffectContainer->HasStatusEffect(EFFECT_POISON) ? PTarget->StatusEffectContainer->DelStatusEffect(EFFECT_POISON) : NULL);
	(PTarget->StatusEffectContainer->HasStatusEffect(EFFECT_PARALYSIS) ? PTarget->StatusEffectContainer->DelStatusEffect(EFFECT_PARALYSIS) : NULL);
	(PTarget->StatusEffectContainer->HasStatusEffect(EFFECT_BLINDNESS) ? PTarget->StatusEffectContainer->DelStatusEffect(EFFECT_BLINDNESS) : NULL);
	(PTarget->StatusEffectContainer->HasStatusEffect(EFFECT_SILENCE) ? PTarget->StatusEffectContainer->DelStatusEffect(EFFECT_SILENCE) : NULL);
	(PTarget->StatusEffectContainer->HasStatusEffect(EFFECT_PETRIFICATION) ? PTarget->StatusEffectContainer->DelStatusEffect(EFFECT_PETRIFICATION) : NULL);
	(PTarget->StatusEffectContainer->HasStatusEffect(EFFECT_DISEASE) ? PTarget->StatusEffectContainer->DelStatusEffect(EFFECT_DISEASE) : NULL);
	(PTarget->StatusEffectContainer->HasStatusEffect(EFFECT_CURSE) ? PTarget->StatusEffectContainer->DelStatusEffect(EFFECT_CURSE) : NULL);
	(PTarget->StatusEffectContainer->HasStatusEffect(EFFECT_STUN) ? PTarget->StatusEffectContainer->DelStatusEffect(EFFECT_STUN) : NULL);
	(PTarget->StatusEffectContainer->HasStatusEffect(EFFECT_BIND) ? PTarget->StatusEffectContainer->DelStatusEffect(EFFECT_BIND) : NULL);
	(PTarget->StatusEffectContainer->HasStatusEffect(EFFECT_WEIGHT) ? PTarget->StatusEffectContainer->DelStatusEffect(EFFECT_WEIGHT) : NULL);
	(PTarget->StatusEffectContainer->HasStatusEffect(EFFECT_SLOW) ? PTarget->StatusEffectContainer->DelStatusEffect(EFFECT_SLOW) : NULL);
	(PTarget->StatusEffectContainer->HasStatusEffect(EFFECT_GRADUAL_PETRIFICATION) ? PTarget->StatusEffectContainer->DelStatusEffect(EFFECT_GRADUAL_PETRIFICATION) : NULL);
	(PTarget->StatusEffectContainer->HasStatusEffect(EFFECT_MUTE) ? PTarget->StatusEffectContainer->DelStatusEffect(EFFECT_MUTE) : NULL);
	(PTarget->StatusEffectContainer->HasStatusEffect(EFFECT_BANE) ? PTarget->StatusEffectContainer->DelStatusEffect(EFFECT_BANE) : NULL);
	(PTarget->StatusEffectContainer->HasStatusEffect(EFFECT_PLAGUE) ? PTarget->StatusEffectContainer->DelStatusEffect(EFFECT_PLAGUE) : NULL);
	(PTarget->StatusEffectContainer->HasStatusEffect(EFFECT_BURN) ? PTarget->StatusEffectContainer->DelStatusEffect(EFFECT_BURN) : NULL);
	(PTarget->StatusEffectContainer->HasStatusEffect(EFFECT_FROST) ? PTarget->StatusEffectContainer->DelStatusEffect(EFFECT_FROST) : NULL);
	(PTarget->StatusEffectContainer->HasStatusEffect(EFFECT_RASP) ? PTarget->StatusEffectContainer->DelStatusEffect(EFFECT_RASP) : NULL);
	(PTarget->StatusEffectContainer->HasStatusEffect(EFFECT_CHOKE) ? PTarget->StatusEffectContainer->DelStatusEffect(EFFECT_CHOKE) : NULL);
	(PTarget->StatusEffectContainer->HasStatusEffect(EFFECT_SHOCK) ? PTarget->StatusEffectContainer->DelStatusEffect(EFFECT_SHOCK) : NULL);
	(PTarget->StatusEffectContainer->HasStatusEffect(EFFECT_DROWN) ? PTarget->StatusEffectContainer->DelStatusEffect(EFFECT_DROWN) : NULL);
	(PTarget->StatusEffectContainer->HasStatusEffect(EFFECT_DIA) ? PTarget->StatusEffectContainer->DelStatusEffect(EFFECT_DIA) : NULL);
	(PTarget->StatusEffectContainer->HasStatusEffect(EFFECT_BIO) ? PTarget->StatusEffectContainer->DelStatusEffect(EFFECT_BIO) : NULL);
	(PTarget->StatusEffectContainer->HasStatusEffect(EFFECT_STR_DOWN) ? PTarget->StatusEffectContainer->DelStatusEffect(EFFECT_STR_DOWN) : NULL);
	(PTarget->StatusEffectContainer->HasStatusEffect(EFFECT_DEX_DOWN) ? PTarget->StatusEffectContainer->DelStatusEffect(EFFECT_DEX_DOWN) : NULL);
	(PTarget->StatusEffectContainer->HasStatusEffect(EFFECT_VIT_DOWN) ? PTarget->StatusEffectContainer->DelStatusEffect(EFFECT_VIT_DOWN) : NULL);
	(PTarget->StatusEffectContainer->HasStatusEffect(EFFECT_AGI_DOWN) ? PTarget->StatusEffectContainer->DelStatusEffect(EFFECT_AGI_DOWN) : NULL);
	(PTarget->StatusEffectContainer->HasStatusEffect(EFFECT_MND_DOWN) ? PTarget->StatusEffectContainer->DelStatusEffect(EFFECT_MND_DOWN) : NULL);
	(PTarget->StatusEffectContainer->HasStatusEffect(EFFECT_INT_DOWN) ? PTarget->StatusEffectContainer->DelStatusEffect(EFFECT_INT_DOWN) : NULL);
	(PTarget->StatusEffectContainer->HasStatusEffect(EFFECT_CHR_DOWN) ? PTarget->StatusEffectContainer->DelStatusEffect(EFFECT_CHR_DOWN) : NULL);
	(PTarget->StatusEffectContainer->HasStatusEffect(EFFECT_ACCURACY_DOWN) ? PTarget->StatusEffectContainer->DelStatusEffect(EFFECT_ACCURACY_DOWN) : NULL);
	(PTarget->StatusEffectContainer->HasStatusEffect(EFFECT_ATTACK_DOWN) ? PTarget->StatusEffectContainer->DelStatusEffect(EFFECT_ATTACK_DOWN) : NULL);
	(PTarget->StatusEffectContainer->HasStatusEffect(EFFECT_EVASION_DOWN) ? PTarget->StatusEffectContainer->DelStatusEffect(EFFECT_EVASION_DOWN) : NULL);
	(PTarget->StatusEffectContainer->HasStatusEffect(EFFECT_DEFENSE_DOWN) ? PTarget->StatusEffectContainer->DelStatusEffect(EFFECT_DEFENSE_DOWN) : NULL);
	(PTarget->StatusEffectContainer->HasStatusEffect(EFFECT_MAGIC_DEF_DOWN) ? PTarget->StatusEffectContainer->DelStatusEffect(EFFECT_MAGIC_DEF_DOWN) : NULL);
	(PTarget->StatusEffectContainer->HasStatusEffect(EFFECT_INHIBIT_TP) ? PTarget->StatusEffectContainer->DelStatusEffect(EFFECT_INHIBIT_TP) : NULL);
	(PTarget->StatusEffectContainer->HasStatusEffect(EFFECT_MAGIC_ACC_DOWN) ? PTarget->StatusEffectContainer->DelStatusEffect(EFFECT_MAGIC_ACC_DOWN) : NULL);
	(PTarget->StatusEffectContainer->HasStatusEffect(EFFECT_MAGIC_ATK_DOWN) ? PTarget->StatusEffectContainer->DelStatusEffect(EFFECT_MAGIC_ATK_DOWN) : NULL);
	(PTarget->StatusEffectContainer->HasStatusEffect(EFFECT_ENCUMBRANCE) ? PTarget->StatusEffectContainer->DelStatusEffect(EFFECT_ENCUMBRANCE) : NULL);
	(PTarget->StatusEffectContainer->HasStatusEffect(EFFECT_HELIX) ? PTarget->StatusEffectContainer->DelStatusEffect(EFFECT_HELIX) : NULL);
	(PTarget->StatusEffectContainer->HasStatusEffect(EFFECT_MAX_TP_DOWN) ? PTarget->StatusEffectContainer->DelStatusEffect(EFFECT_MAX_TP_DOWN) : NULL);
	(PTarget->StatusEffectContainer->HasStatusEffect(EFFECT_REQUIEM) ? PTarget->StatusEffectContainer->DelStatusEffect(EFFECT_REQUIEM) : NULL);
	(PTarget->StatusEffectContainer->HasStatusEffect(EFFECT_LULLABY) ? PTarget->StatusEffectContainer->DelStatusEffect(EFFECT_LULLABY) : NULL);
	(PTarget->StatusEffectContainer->HasStatusEffect(EFFECT_ELEGY) ? PTarget->StatusEffectContainer->DelStatusEffect(EFFECT_ELEGY) : NULL);

	if (rand()%100 > 50)
	{
		(PTarget->StatusEffectContainer->HasStatusEffect(EFFECT_DOOM) ? PTarget->StatusEffectContainer->DelStatusEffect(EFFECT_DOOM) : NULL);
	}

	return hpHealed;
}

/************************************************************************
*	Use Mob Skill Ability												*
************************************************************************/

uint32 PerformMobSkill(CBattleEntity* PAttacker, CBattleEntity* PDefender)
{
	 std::list<CMobSkill*> MobSkills = GetMobSkillsByFamily(((CMobEntity*)PAttacker)->m_Family);
	 CMobEntity* PMob = (CMobEntity*)PAttacker;

	 //int8 hp = PAttacker->GetHPP();
	 
	 //int8 tilt1; 
	 //int8 tilt2; 

	//1  PHYSICAL
	//2  RANGED
	//3  MAGICAL
	//4  HEALING
	//5  ENHANCING
	//6  ENFEEBLING	
	//7  DISPEL
	//8  SPECIAL

	 for (std::list<CMobSkill*>::iterator it = MobSkills.begin(); it != MobSkills.end(); ++it)
	{
		CMobSkill* PMobSkill = *it;
		if (rand()%100 < 30) 
		{
			return PMobSkill->getID(); 
		}
	}
	//	int8 skillType = PMobSkill->getSkillType(); 
	//	switch (skillType)
	//	{
	//	case 1: 

	//	case 2:

	//	case 3:

	//	case 4:

	//	case 5:

	//	case 6:

	//	case 7:

	//	case 8:

	//		break;
	//	};
	//}


	// if (hp >= 80)
	// {
	//	 //favor enfeebling / enhancing
	//	 if (rand()%100 < 50)
	//	 {
	//		


	//	 }
	//	 else 
	//	{
	//		if (rand()%100 < 60)
	//		{

	//		}
	//	 }
	// }
	// else if (hp >= 60)
	// {
	//	//favor damaging / enfeebling
	// }
	// else if (hp >= 40)
	// {
	//	//favor damaging / healing 
	// }
	// else if (hp >= 20)
	// {
	//	 //favor healing / 2 hour ability
	// }
	// else 
	// {
	//	 //favor healing
	// }



	 return 0;
}


bool Enfeeble(CBattleEntity* PCaster, CBattleEntity* PDefender, EFFECT Effect)
{

	int16 dlvl = (PCaster->GetMLevel() - PDefender->GetMLevel());
	int16 maxCap = 90;
	int16 minCap = 10; 
	int16 chance = 40 + (dlvl*5);

	chance = (chance > maxCap ? maxCap : chance);
	chance = (chance < minCap ? minCap : chance);
	if (Effect > 1 && Effect < 15)
	{
		chance + (PDefender->getMod((MODIFIER)(Effect + 238)) / 10);
	}

	if (rand()%100 < chance)
	{
		return true;
	}

	return false;
	//switch(Effect)
	//{	
	//case EFFECT_SLEEP:
	//	chance + (PDefender->getMod((MODIFIER)(Effect + 238)) / 10);
	//case EFFECT_POISON:
	//	chance + (PDefender->getMod(MOD_POISONRES) / 10);
	//case EFFECT_PARALYSIS:
	//	chance + (PDefender->getMod(MOD_PARALYZERES) / 10);
	//case EFFECT_BLINDNESS:
	//	chance + (PDefender->getMod(MOD_BLINDRES) / 10);
	//case EFFECT_CURSE:
	//	chance + (PDefender->getMod(MOD_CURSERES) / 10);

	//case EFFECT_SLOW: 
	//	chance + (PDefender->getMod(MOD_SLOWRES) / 10);
	//case EFFECT_CHARM:
	//	chance + (PDefender->getMod(MOD_CHARMRES) / 10);


	//MOD_SLEEPRES			= 0xF0,
	//MOD_POISONRES			= 0xF1,
	//MOD_PARALYZERES			= 0xF2,
	//MOD_BLINDRES			= 0xF3,
	//MOD_SILENCERES			= 0xF4,
	//MOD_VIRUSRES			= 0xF5,
	//MOD_PETRIFYRES			= 0xF6,
	//MOD_BINDRES				= 0xF7,
	//MOD_CURSERES			= 0xF8,
	//MOD_GRAVITYRES			= 0xF9,
	//MOD_SLOWRES				= 0xFA,
	//MOD_STUNRES				= 0xFB,
	//MOD_CHARMRES			= 0xFC,

}



}; // namespace battleutils