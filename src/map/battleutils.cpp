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

#include "../common/timer.h"
#include "../common/utils.h"

#include <math.h>
#include <string.h>
#include <algorithm>

#include "packets/char_health.h"
#include "packets/char_update.h"
#include "packets/entity_update.h"
#include "packets/message_basic.h"
#include "packets/inventory_finish.h"

#include "ability.h"
#include "charutils.h"
#include "battleutils.h"
#include "map.h"
#include "party.h"
#include "alliance.h"
#include "spell.h"
#include "trait.h" 
#include "weapon_skill.h"
#include "mobskill.h"
#include "mobentity.h"
#include "petentity.h"
#include "enmity_container.h"
#include "items.h"


/************************************************************************
*	lists used in battleutils											*
************************************************************************/

uint16 g_SkillTable[100][12];									// All Skills by level/skilltype
uint8  g_EnmityTable[100][2];		                            // Holds Enmity Modifier Values
uint8  g_SkillRanks[MAX_SKILLTYPE][MAX_JOBTYPE];				// Holds skill ranks by skilltype and job
uint16 g_SkillChainDamageModifiers[MAX_SKILLCHAIN_LEVEL + 1][MAX_SKILLCHAIN_COUNT + 1]; // Holds damage modifiers for skill chains [chain level][chain count]

CWeaponSkill* g_PWeaponSkillList[MAX_WEAPONSKILL_ID];			// Holds all Weapon skills
CMobSkill*    g_PMobSkillList[MAX_MOBSKILL_ID];					// List of mob skills

std::list<CWeaponSkill*> g_PWeaponSkillsList[MAX_SKILLTYPE];	// Holds Weapon skills by type
std::vector<CMobSkill*>  g_PMobFamilySkills[MAX_MOB_FAMILY];	// Mob Skills By Family

/************************************************************************
*  battleutils															*
************************************************************************/

namespace battleutils
{

/************************************************************************
*                                                                       *
*  Generate Enmity Table                                                *
*                                                                       *
************************************************************************/

void LoadEnmityTable()
{
    for (uint32 x = 0; x < 100; ++x)
    {
        g_EnmityTable[x][0] = (uint8)abs(0.5441*x + 13.191);     // cmod
        g_EnmityTable[x][1] = (uint8)abs(0.6216*x + 5.4363);     // dmod
    }
}

/************************************************************************
*                                                                       *
*                                                                       *
*                                                                       *
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
			uint8 SkillID = dsp_cap((uint8)Sql_GetIntData(SqlHandle,0), 0, MAX_SKILLTYPE-1);

			for (uint32 y = 1; y < MAX_JOBTYPE; ++y) 
			{
				g_SkillRanks[SkillID][y] = dsp_cap((uint16)Sql_GetIntData(SqlHandle,y), 0, 11);
			}
		}
	}
}

/************************************************************************
*  Load Weapon Skills from database										*
************************************************************************/

void LoadWeaponSkillsList()
{
	memset(g_PWeaponSkillList,0,sizeof(g_PWeaponSkillList));

	const int8* fmtQuery = "SELECT weaponskillid, name, jobs, type, skilllevel, element, animation, `range`, aoe, primary_sc, secondary_sc, tertiary_sc \
							FROM weapon_skills \
							WHERE weaponskillid < %u \
							ORDER BY type, skilllevel ASC";

	int32 ret = Sql_Query(SqlHandle, fmtQuery, MAX_WEAPONSKILL_ID);

	if( ret != SQL_ERROR && Sql_NumRows(SqlHandle) != 0)
	{
		while(Sql_NextRow(SqlHandle) == SQL_SUCCESS) 
		{
			CWeaponSkill* PWeaponSkill = new CWeaponSkill(Sql_GetIntData(SqlHandle,0));
			
			PWeaponSkill->setName(Sql_GetData(SqlHandle, 1));
			PWeaponSkill->setJob(Sql_GetData(SqlHandle, 2));
			PWeaponSkill->setType(Sql_GetIntData(SqlHandle, 3));
			PWeaponSkill->setSkillLevel(Sql_GetIntData(SqlHandle, 4));
            PWeaponSkill->setElement(Sql_GetIntData(SqlHandle, 5));
			PWeaponSkill->setAnimationId(Sql_GetIntData(SqlHandle, 6));
			PWeaponSkill->setRange(Sql_GetIntData(SqlHandle, 7));
			PWeaponSkill->setAoe(Sql_GetIntData(SqlHandle, 8));
            PWeaponSkill->setPrimarySkillchain(Sql_GetIntData(SqlHandle, 9));
            PWeaponSkill->setSecondarySkillchain(Sql_GetIntData(SqlHandle, 10));
            PWeaponSkill->setTertiarySkillchain(Sql_GetIntData(SqlHandle, 11));
			
			g_PWeaponSkillList[PWeaponSkill->getID()] = PWeaponSkill;
			g_PWeaponSkillsList[PWeaponSkill->getType()].push_back(PWeaponSkill);
		}
	}
}


/************************************************************************
*                                                                       *
*  Load Mob Skills from database                                        *
*                                                                       *
************************************************************************/

void LoadMobSkillsList()
{
	memset(g_PMobSkillList, 0, sizeof(g_PMobSkillList));

	const int8* fmtQuery = "SELECT mob_skill_id, family_id, mob_anim_id, mob_skill_name, \
						   mob_skill_aoe, mob_skill_distance, mob_anim_time, mob_prepare_time, \
						   mob_valid_targets, mob_skill_flag \
						   FROM mob_skill \
						   WHERE mob_skill_id < %u \
						   ORDER BY family_Id, mob_skill_id ASC";

	int32 ret = Sql_Query(SqlHandle, fmtQuery, MAX_MOBSKILL_ID);

	if( ret != SQL_ERROR && Sql_NumRows(SqlHandle) != 0)
	{
		while(Sql_NextRow(SqlHandle) == SQL_SUCCESS) 
		{
			CMobSkill* PMobSkill = new CMobSkill(Sql_GetIntData(SqlHandle,0));
			PMobSkill->setfamilyID(Sql_GetIntData(SqlHandle,1));
			PMobSkill->setAnimationID(Sql_GetIntData(SqlHandle,2));
			PMobSkill->setName(Sql_GetData(SqlHandle,3));
			PMobSkill->setAoe(Sql_GetIntData(SqlHandle,4));
			PMobSkill->setDistance(Sql_GetFloatData(SqlHandle,5));
			PMobSkill->setAnimationTime(Sql_GetIntData(SqlHandle,6));
			PMobSkill->setActivationTime(Sql_GetIntData(SqlHandle,7));
			PMobSkill->setValidTargets(Sql_GetIntData(SqlHandle,8));
			PMobSkill->setFlag(Sql_GetIntData(SqlHandle,9));
			PMobSkill->setMsg(185); //standard damage message. Scripters will change this.
			PMobSkill->m_SkillCondition = SKILLBEHAVIOUR_NONE;
			PMobSkill->m_SkillConditionValue = 0;
			g_PMobSkillList[PMobSkill->getID()] = PMobSkill;
			g_PMobFamilySkills[PMobSkill->getfamilyID()].push_back(PMobSkill);
		}
	}
}

void LoadSkillChainDamageModifiers()
{
    memset(g_SkillChainDamageModifiers, 0, sizeof(g_SkillChainDamageModifiers));

    const int8* fmtQuery = "SELECT chain_level, chain_count, initial_modifier, magic_burst_modifier \
                           FROM skillchain_damage_modifiers \
                           ORDER BY chain_level, chain_count";

    int32 ret = Sql_Query(SqlHandle, fmtQuery);

    if( ret != SQL_ERROR && Sql_NumRows(SqlHandle) != 0)
    {
        for (uint32 x = 0; Sql_NextRow(SqlHandle) == SQL_SUCCESS; ++x)
        {
            uint16 level = (uint16)Sql_GetIntData(SqlHandle, 0);
            uint16 count = (uint16)Sql_GetIntData(SqlHandle, 1);
            uint16 value = (uint16)Sql_GetIntData(SqlHandle, 2);
            g_SkillChainDamageModifiers[level][count] = value;
        }
    }

    return;
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
*  Clear Mob Skills List												*
************************************************************************/
void FreeMobSkillList()
{
	for(int32 SkillID= 0; SkillID < MAX_MOBSKILL_ID; ++SkillID)
	{
		delete g_PMobSkillList[SkillID];
	}
}

void FreeSkillChainDamageModifiers()
{
    // These aren't dynamicly allocated at this point so no need to free them.
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

bool isValidSelfTargetWeaponskill(int wsid){
	switch(wsid){
	case 163: //starlight
	case 164: //moonlight
	case 173: //dagan
	case 190: //myrkr
		return true;
	}
	return false;
}

/************************************************************************
*                                                                       *
*  Get Enmity Modifier                                                  *
*                                                                       *
************************************************************************/

uint8 GetEnmityMod(uint8 level, uint8 modType)
{
    DSP_DEBUG_BREAK_IF(modType >= 2);
 
	if(level>=100) { level = 99; }

	return g_EnmityTable[level][modType];
}

/************************************************************************
*                                                                       *
*  Get Weapon Skill by ID                                               *
*                                                                       *
************************************************************************/

CWeaponSkill* GetWeaponSkill(uint16 WSkillID)
{
    DSP_DEBUG_BREAK_IF(WSkillID >= MAX_WEAPONSKILL_ID);
	
    return g_PWeaponSkillList[WSkillID];
}

/************************************************************************
*                                                                       *
* Get List of Weapon Skills from skill type								*
*                                                                       *
************************************************************************/

std::list<CWeaponSkill*> GetWeaponSkills(uint8 skill)
{
    DSP_DEBUG_BREAK_IF(skill >= MAX_SKILLTYPE);

	return g_PWeaponSkillsList[skill];
}

/************************************************************************
*                                                                       *
*  Get Mob Skill by Id													*
*                                                                       *
************************************************************************/

CMobSkill* GetMobSkill(uint16 SkillID)
{
    DSP_DEBUG_BREAK_IF(SkillID >= MAX_MOBSKILL_ID);

    return g_PMobSkillList[SkillID];
}

/************************************************************************
*                                                                       *
*  Get Mob Skills by family id                                          *
*                                                                       *
************************************************************************/

std::vector<CMobSkill*> GetMobSkillsByFamily(uint16 FamilyID)
{
    DSP_DEBUG_BREAK_IF(FamilyID >= sizeof(g_PMobFamilySkills));

	return g_PMobFamilySkills[FamilyID];
}

uint16	CalculateEnspellDamage(CBattleEntity* PAttacker, CBattleEntity* PDefender, uint8 Tier, uint8 element){
	//Tier 1 enspells have their damaged pre-calculated AT CAST TIME and is stored in MOD_ENSPELL_DMG
	if(Tier==1){return PAttacker->getMod(MOD_ENSPELL_DMG);}

	//Tier 2 enspells calculate the damage on each hit and increment the potency in MOD_ENSPELL_DMG per hit
	uint16 skill = PAttacker->GetSkill(SKILL_ENH) + PAttacker->getMod(MOD_ENHANCE);
	uint16 cap = 3 + ((6*skill)/100);
	if(skill>200){
		cap = 5 + ((5*skill)/100);
	}
	cap *= 2;
	if(PAttacker->getMod(MOD_ENSPELL_DMG) > cap){
		PAttacker->setModifier(MOD_ENSPELL_DMG,cap);
		return cap;
	}
	if(PAttacker->getMod(MOD_ENSPELL_DMG) == cap) { return cap; }
	if(PAttacker->getMod(MOD_ENSPELL_DMG) < cap){
		PAttacker->addModifier(MOD_ENSPELL_DMG,1);
		return PAttacker->getMod(MOD_ENSPELL_DMG)-1;
	}
}

/************************************************************************
*                                                                       *
*  Handles Enspell effect and damage						            *
*                                                                       *
************************************************************************/

void HandleEnspell(CCharEntity* PAttacker, CBattleEntity* PDefender,apAction_t* Action,uint8 hitNumber){
	//DEBUG: REMOVE WHEN ACTION PACKET ISSUE IS RESOLVED (multi hits do not display correctly)
	//if(hitNumber>0){return;}

	//TODO: run on test server for a bit, revert back to 1 hand if buggy.

	switch(PAttacker->getMod(MOD_ENSPELL)){
	case ENSPELL_I_FIRE:
		Action->subeffect = SUBEFFECT_FIRE_DAMAGE;
		Action->submessageID = 163;
		Action->flag = 3;
		Action->subparam = CalculateEnspellDamage(PAttacker,PDefender,1,FIRE);
		PDefender->addHP(-Action->subparam);
		break;
	case ENSPELL_I_EARTH:
		Action->subeffect = SUBEFFECT_EARTH_DAMAGE;
		Action->submessageID = 163;
		Action->flag = 1;
		Action->subparam = CalculateEnspellDamage(PAttacker,PDefender,1,EARTH);
		PDefender->addHP(-Action->subparam);
		break;
	case ENSPELL_I_WATER:
		Action->subeffect = SUBEFFECT_WATER_DAMAGE;
		Action->submessageID = 163;
		Action->flag = 1;
		Action->subparam = CalculateEnspellDamage(PAttacker,PDefender,1,WATER);
		PDefender->addHP(-Action->subparam);
		break;
	case ENSPELL_I_WIND:
		Action->subeffect = SUBEFFECT_WIND_DAMAGE;
		Action->submessageID = 163;
		Action->flag = 3;
		Action->subparam = CalculateEnspellDamage(PAttacker,PDefender,1,WIND);
		PDefender->addHP(-Action->subparam);
		break;
	case ENSPELL_I_ICE:
		Action->subeffect = SUBEFFECT_ICE_DAMAGE;
		Action->submessageID = 163;
		Action->flag = 1;
		Action->subparam = CalculateEnspellDamage(PAttacker,PDefender,1,ICE);
		PDefender->addHP(-Action->subparam);
		break;
	case ENSPELL_I_THUNDER:
		Action->subeffect = SUBEFFECT_LIGHTNING_DAMAGE;
		Action->submessageID = 163;
		Action->flag = 3;
		Action->subparam = CalculateEnspellDamage(PAttacker,PDefender,1,THUNDER);
		PDefender->addHP(-Action->subparam);
		break;
	case ENSPELL_I_LIGHT:
		Action->subeffect = SUBEFFECT_LIGHT_DAMAGE;
		Action->submessageID = 163;
		Action->flag = 3;
		Action->subparam = CalculateEnspellDamage(PAttacker,PDefender,1,LIGHT);
		PDefender->addHP(-Action->subparam);
		break;
	case ENSPELL_I_DARK:
		Action->subeffect = SUBEFFECT_DARKNESS_DAMAGE;
		Action->submessageID = 163;
		Action->flag = 1;
		Action->subparam = CalculateEnspellDamage(PAttacker,PDefender,1,DARK);
		PDefender->addHP(-Action->subparam);
		break;
	case ENSPELL_BLOOD_WEAPON:
		Action->subeffect = SUBEFFECT_BLOOD_WEAPON;
		Action->submessageID = 167;
		Action->flag = 1;
		Action->subparam = PAttacker->addHP(Action->param);
		if(PAttacker->objtype == TYPE_PC){
			charutils::UpdateHealth((CCharEntity*)PAttacker);
		}
		break;
	case ENSPELL_II_FIRE:
		//if(hitNumber>0){return;}//only main hand hit (no da/multihit) works for enspell 2s
		Action->subeffect = SUBEFFECT_FIRE_DAMAGE;
		Action->submessageID = 163;
		Action->flag = 3;
		Action->subparam = CalculateEnspellDamage(PAttacker,PDefender,2,FIRE);
		PDefender->addHP(-Action->subparam);
		break;
	case ENSPELL_II_EARTH:
		if(hitNumber>0){return;}
		Action->subeffect = SUBEFFECT_EARTH_DAMAGE;
		Action->submessageID = 163;
		Action->flag = 1;
		Action->subparam = CalculateEnspellDamage(PAttacker,PDefender,2,EARTH);
		PDefender->addHP(-Action->subparam);
		break;
	case ENSPELL_II_WATER:
		if(hitNumber>0){return;}
		Action->subeffect = SUBEFFECT_WATER_DAMAGE;
		Action->submessageID = 163;
		Action->flag = 1;
		Action->subparam = CalculateEnspellDamage(PAttacker,PDefender,2,WATER);
		PDefender->addHP(-Action->subparam);
		break;
	case ENSPELL_II_WIND:
		if(hitNumber>0){return;}
		Action->subeffect = SUBEFFECT_WIND_DAMAGE;
		Action->submessageID = 163;
		Action->flag = 3;
		Action->subparam = CalculateEnspellDamage(PAttacker,PDefender,2,WIND);
		PDefender->addHP(-Action->subparam);
		break;
	case ENSPELL_II_ICE:
		if(hitNumber>0){return;}
		Action->subeffect = SUBEFFECT_ICE_DAMAGE;
		Action->submessageID = 163;
		Action->flag = 1;
		Action->subparam = CalculateEnspellDamage(PAttacker,PDefender,2,ICE);
		PDefender->addHP(-Action->subparam);
		break;
	case ENSPELL_II_THUNDER:
		if(hitNumber>0){return;}
		Action->subeffect = SUBEFFECT_LIGHTNING_DAMAGE;
		Action->submessageID = 163;
		Action->flag = 3;
		Action->subparam = CalculateEnspellDamage(PAttacker,PDefender,2,THUNDER);
		PDefender->addHP(-Action->subparam);
		break;
	}
}

/************************************************************************
*                                                                       *
*  Handles Ranged weapon's additional effects (e.g. Bolts)              *
*                                                                       *
************************************************************************/

void HandleRangedAdditionalEffect(CCharEntity* PAttacker, CBattleEntity* PDefender,apAction_t* Action){
	CItemWeapon* PAmmo = (CItemWeapon*)PAttacker->getStorage(LOC_INVENTORY)->GetItem(PAttacker->equip[SLOT_AMMO]);
	//add effects dont have 100% proc, presume level dependant. 95% chance but -5% for each level diff.
	//capped at 5% proc when mob is 18 (!!!) levels higher than you.
	uint8 chance = 95;
	if(PDefender->GetMLevel() > PAttacker->GetMLevel()){
		chance -= 5*(PDefender->GetMLevel() - PAttacker->GetMLevel());
		chance = dsp_cap(chance,5,95);
	}
	if(rand()%100 >= chance){return;}
	if(PAmmo==NULL){return;}

	switch(PAmmo->getID()){
	case 18700:{ //Wind Arrow
	//damage doesn't exceed ~67 unless wearing wind staff/iceday/weather
	//there isn't a formula, but INT affects damage, so this is guesstimated. It seems to be level
	//invarient since its used on harder monsters for damage occasionally. Assuming the modifier
	//is simply AGI with a degree of randomisation
			Action->subeffect = SUBEFFECT_WIND_DAMAGE;
			Action->submessageID = 163;
			Action->flag = 3;
			//calculate damage
			uint8 damage = (PAttacker->AGI() - PDefender->AGI())/2;
			damage = dsp_cap(damage,0,50);
			damage += 10; //10~60
			damage += rand()%8; //10~67 randomised
			//set damage TODO: handle resist/staff/day
			Action->subparam  = damage;
			PDefender->addHP(-damage);
		}
		break;
	case 18699:{ //Earth Arrow
	//damage doesn't exceed ~67 unless wearing Earth staff/earthsday/weather
	//there isn't a formula, but VIT affects damage, so this is guesstimated. It seems to be level
	//invarient since its used on harder monsters for damage occasionally. Assuming the modifier
	//is simply VIT with a degree of randomisation
			Action->subeffect = SUBEFFECT_EARTH_DAMAGE;
			Action->submessageID = 163;
			Action->flag = 1;
			//calculate damage
			uint8 damage = (PAttacker->VIT() - PDefender->VIT())/2;
			damage = dsp_cap(damage,0,50);
			damage += 10; //10~60
			damage += rand()%8; //10~67 randomised
			//set damage TODO: handle resist/staff/day
			Action->subparam  = damage;
			PDefender->addHP(-damage);
		}
		break;
	case 18698:{ //Water Arrow
	//damage doesn't exceed ~67 unless wearing light staff/iceday/weather
	//there isn't a formula, but INT affects damage, so this is guesstimated. It seems to be level
	//invarient since its used on harder monsters for damage occasionally. Assuming the modifier
	//is simply MND with a degree of randomisation
			Action->subeffect = SUBEFFECT_WATER_DAMAGE;
			Action->submessageID = 163;
			Action->flag = 1;
			//calculate damage
			uint8 damage = (PAttacker->MND() - PDefender->MND())/2;
			damage = dsp_cap(damage,0,50);
			damage += 10; //10~60
			damage += rand()%8; //10~67 randomised
			//set damage TODO: handle resist/staff/day
			Action->subparam  = damage;
			PDefender->addHP(-damage);
		}
		break;
	case 18158:{//Sleep Arrow
			if(!PDefender->StatusEffectContainer->HasStatusEffect(EFFECT_SLEEP) &&
				!PDefender->StatusEffectContainer->HasStatusEffect(EFFECT_SLEEP_II) &&
				!PDefender->isDead() && PDefender->hasImmunity(1) == false){
			Action->subeffect = SUBEFFECT_SLEEP;
			Action->subparam  = EFFECT_SLEEP;
			Action->submessageID = 160;
			Action->flag = 3;
			int duration = 25 - (PDefender->GetMLevel() - PAttacker->GetMLevel());
			duration = dsp_cap(duration,1,25);
			PDefender->StatusEffectContainer->AddStatusEffect(
					new CStatusEffect(EFFECT_SLEEP,EFFECT_SLEEP,1,0,duration));
			}
		}
		break;
	case 18157:{ //Poison Arrow
			if(!PDefender->StatusEffectContainer->HasStatusEffect(EFFECT_POISON) && 
				PDefender->hasImmunity(256) == false){
				Action->subeffect = SUBEFFECT_POISON;
				Action->subparam  = EFFECT_POISON;
				Action->submessageID = 160;
				Action->flag = 1;
				//4hp/tick for 30secs
				PDefender->StatusEffectContainer->AddStatusEffect(
					new CStatusEffect(EFFECT_POISON,EFFECT_POISON,4,3,30));
			}
		}
		break;
	case 18153:{ //Holy Bolt
	//damage doesn't exceed ~67 unless wearing light staff/lightsday/weather
	//there isn't a formula, but MND affects damage, so this is guesstimated. It seems to be level
	//invarient since its used on harder monsters for damage occasionally. Assuming the modifier
	//is simply MND with a degree of randomisation
			Action->subeffect = SUBEFFECT_LIGHT_DAMAGE;
			Action->submessageID = 163;
			Action->flag = 3;
			//calculate damage
			uint8 damage = (PAttacker->MND() - PDefender->MND())/2;
			damage = dsp_cap(damage,0,50);
			damage += 10; //10~60
			damage += rand()%8; //10~67 randomised
			//set damage TODO: handle resist/staff/day
			Action->subparam  = damage;
			PDefender->addHP(-damage);
		}
		break;
	case 18151:{ //Bloody Bolt
	//INT/2 is a semi-confirmed damage calculation. Also affected by level of target. Resists strongly
	//and even doesn't proc on mobs strong to dark e.g. bats/skeles.
			Action->subeffect = SUBEFFECT_HP_DRAIN;
			Action->submessageID = 161;
			Action->flag = 3;
			int damage = (PAttacker->INT() - PDefender->INT())/2;
			damage += (PAttacker->GetMLevel() - PDefender->GetMLevel());
			damage = dsp_cap(damage,0,50);
			damage += PAttacker->GetMLevel()/2;
			damage += rand()%20; //At 75 -> 37~56 low or 87~106 high
			Action->subparam  = damage;
			PDefender->addHP(-damage);
			PAttacker->addHP(damage);
			charutils::UpdateHealth(PAttacker);
		}
		break;
	case 18152:{ //Venom Bolt
			if(!PDefender->StatusEffectContainer->HasStatusEffect(EFFECT_POISON) && 
				PDefender->hasImmunity(256) == false){
				Action->subeffect = SUBEFFECT_POISON;
				Action->subparam  = EFFECT_POISON;
				Action->submessageID = 160;
				Action->flag = 1;
				//4hp/tick for 30secs
				PDefender->StatusEffectContainer->AddStatusEffect(
					new CStatusEffect(EFFECT_POISON,EFFECT_POISON,4,3,30));
			}
		}
		break;
	case 18150:{//Blind Bolt
			if(!PDefender->StatusEffectContainer->HasStatusEffect(EFFECT_BLINDNESS) && 
				PDefender->hasImmunity(64) == false){
				Action->subeffect = SUBEFFECT_BLIND;
				Action->subparam  = EFFECT_BLINDNESS;
				Action->submessageID = 160;
				Action->flag = 1;
				PDefender->StatusEffectContainer->AddStatusEffect(
					new CStatusEffect(EFFECT_BLINDNESS,EFFECT_BLINDNESS,10,0,30));
			}
		}
		break;
	case 18149:{//Sleep Bolt
			if(!PDefender->StatusEffectContainer->HasStatusEffect(EFFECT_SLEEP) &&
				!PDefender->StatusEffectContainer->HasStatusEffect(EFFECT_SLEEP_II) &&
				!PDefender->isDead() && PDefender->hasImmunity(1) == false){
			Action->subeffect = SUBEFFECT_SLEEP;
			Action->subparam  = EFFECT_SLEEP;
			Action->submessageID = 160;
			Action->flag = 3;
			int duration = 25 - (PDefender->GetMLevel() - PAttacker->GetMLevel());
			duration = dsp_cap(duration,1,25);
			PDefender->StatusEffectContainer->AddStatusEffect(
					new CStatusEffect(EFFECT_SLEEP,EFFECT_SLEEP,1,0,duration));
			}
		}
		break;
	case 18148:{ //Acid Bolt
			if(!PDefender->StatusEffectContainer->HasStatusEffect(EFFECT_DEFENSE_DOWN)){
			Action->subeffect = SUBEFFECT_DEFENS_DOWN;
			Action->subparam  = EFFECT_DEFENSE_DOWN;
			Action->submessageID = 160;
			Action->flag = 1;
			PDefender->StatusEffectContainer->AddStatusEffect(
					new CStatusEffect(EFFECT_DEFENSE_DOWN,EFFECT_DEFENSE_DOWN,12,0,60));
			}
		}
		break;
	case 17324:{ //Lightning Arrow
	//damage doesn't exceed ~67
	//there isn't a formula. It seems to be level
	//invarient since its used on harder monsters for damage occasionally. Assuming the modifier
	//is simply DEX with a degree of randomisation
			Action->subeffect = SUBEFFECT_LIGHTNING_DAMAGE;
			Action->submessageID = 163;
			Action->flag = 3;
			//calculate damage
			uint8 damage = (PAttacker->DEX() - PDefender->DEX())/2;
			damage = dsp_cap(damage,0,50);
			damage += 10; //10~60
			damage += rand()%8; //10~67 randomised
			//set damage TODO: handle resist/staff/day
			Action->subparam  = damage;
			PDefender->addHP(-damage);
		}
		break;
	case 17323:{ //Ice Arrow
	//damage doesn't exceed ~67 unless wearing ice staff/iceday/weather
	//there isn't a formula, but INT affects damage, so this is guesstimated. It seems to be level
	//invarient since its used on harder monsters for damage occasionally. Assuming the modifier
	//is simply INT with a degree of randomisation
			Action->subeffect = SUBEFFECT_ICE_DAMAGE;
			Action->submessageID = 163;
			Action->flag = 1;
			//calculate damage
			uint8 damage = (PAttacker->INT() - PDefender->INT())/2;
			damage = dsp_cap(damage,0,50);
			damage += 10; //10~60
			damage += rand()%8; //10~67 randomised
			//set damage TODO: handle resist/staff/day
			Action->subparam  = damage;
			PDefender->addHP(-damage);
		}
		break;
	case 17322:{ //Fire Arrow
	//damage doesn't exceed ~67 unless wearing ice staff/iceday/weather
	//there isn't a formula, but INT affects damage, so this is guesstimated. It seems to be level
	//invarient since its used on harder monsters for damage occasionally. Assuming the modifier
	//is simply INT with a degree of randomisation
			Action->subeffect = SUBEFFECT_FIRE_DAMAGE;
			Action->submessageID = 163;
			Action->flag = 3;
			//calculate damage
			uint8 damage = (PAttacker->INT() - PDefender->INT())/2;
			damage = dsp_cap(damage,0,50);
			damage += 10; //10~60
			damage += rand()%8; //10~67 randomised
			//set damage TODO: handle resist/staff/day
			Action->subparam  = damage;
			PDefender->addHP(-damage);
		}
		break;
	}
}

uint8 GetRangedHitRate(CBattleEntity* PAttacker, CBattleEntity* PDefender){
	int acc = 0;
	int hitrate = 75;
	if(PAttacker->objtype == TYPE_PC){
		CCharEntity* PChar = (CCharEntity*)PAttacker;
		CItemWeapon* PItem = (CItemWeapon*)PChar->getStorage(LOC_INVENTORY)->GetItem(PChar->equip[SLOT_RANGED]);
		if(PItem!=NULL && (PItem->getType() & ITEM_WEAPON)){
			int skill = PChar->GetSkill(PItem->getSkillType());
			acc = skill;
			if(skill>200){ acc = 200 + (skill-200)*0.9;}
			acc += PChar->getMod(MOD_RACC);
			acc += PChar->AGI()/2;
			acc = ((100 +  PChar->getMod(MOD_RACCP)) * acc)/100 + 
				dsp_min(((100 +  PChar->getMod(MOD_FOOD_RACCP)) * acc)/100,  PChar->getMod(MOD_FOOD_RACC_CAP));
		}
	}
	else{//monster racc not handled yet
		return 95;
	}

	int eva = (PDefender->getMod(MOD_EVA) * (100 + PDefender->getMod(MOD_EVAP)))/100 + PDefender->AGI()/2;
	hitrate = hitrate + (acc - eva) / 2 + (PAttacker->GetMLevel() - PDefender->GetMLevel())*2;
	uint8 finalhitrate = dsp_cap(hitrate, 20, 95);
	return finalhitrate;
}

//todo: need to penalise attacker's RangedAttack depending on distance from mob. (% decrease)
float GetRangedPDIF(CBattleEntity* PAttacker, CBattleEntity* PDefender){
	//get ranged attack value
	uint16 rAttack = 1;
	if(PAttacker->objtype == TYPE_PC){
		CCharEntity* PChar = (CCharEntity*)PAttacker;
		CItemWeapon* PItem = (CItemWeapon*)PChar->getStorage(LOC_INVENTORY)->GetItem(PChar->equip[SLOT_RANGED]);
		if (PItem != NULL && (PItem->getType() & ITEM_WEAPON)){
			rAttack = PChar->RATT(PItem->getSkillType());
		}
		else{
			PItem = (CItemWeapon*)PChar->getStorage(LOC_INVENTORY)->GetItem(PChar->equip[SLOT_AMMO]);
			if (PItem == NULL || !(PItem->getType() & ITEM_WEAPON) || (PItem->getSkillType() != SKILL_THR)){
				ShowDebug("battleutils::GetRangedPDIF Cannot find a valid ranged weapon to calculate PDIF for. \n");
			}
			else{
				rAttack = PChar->RATT(PItem->getSkillType());
			}
		}
	}
	else{//assume mobs capped
		rAttack = battleutils::GetMaxSkill(SKILL_ARC,JOB_RNG,PAttacker->GetMLevel());
	}

	//get ratio (not capped for RAs)
	float ratio = (float)rAttack / (float)PDefender->DEF();

	//level correct (0.025 not 0.05 like for melee)
	if(PDefender->GetMLevel() > PAttacker->GetMLevel()){
		ratio -= 0.025f * (PDefender->GetMLevel() - PAttacker->GetMLevel());
	}
	if(ratio < 0) { ratio = 0; }
	if(ratio > 3) { ratio = 3; }

	//calculate min/max PDIF
	float minPdif = 0;
	float maxPdif = 0;
	if(ratio < 0.9){
		minPdif = ratio;
		maxPdif = (10.0f/9.0f) * ratio;
	}
	else if(ratio <= 1.1){
		minPdif = 1;
		maxPdif = 1;
	}
	else if(ratio <= 3){
		minPdif = (-3.0f/19.0f) + ((20.0f/19.0f) * ratio);
		maxPdif = ratio;
	}

	//return random number between the two
	return ((maxPdif-minPdif) * ((float)rand()/RAND_MAX)) + minPdif;
}

float CalculateBaseTP(int delay){
	float x = 1;
	if(delay<=180){
		x = 5.0f + (((float)delay-180.0f)*1.5f)/180.0f;
	}
	else if(delay<=450){
		x = 5.0f + (((float)delay-180.0f)*6.5f)/270.0f;
	}
	else if(delay<=480){
		x = 11.5f + (((float)delay-450.0f)*1.5f)/30.0f;
	}
	else if(delay<=530){
		x = 13.0f + (((float)delay-480.0f)*1.5f)/50.0f;
	}
	else{
		x = 14.5f + (((float)delay-530.0f)*3.5f)/470.0f;
	}
	return x;
}

bool IsParried(CBattleEntity* PAttacker, CBattleEntity* PDefender)
{
    if(isFaceing(PDefender->loc.p, PAttacker->loc.p, 40))
    {
        return (rand() % 100 < battleutils::GetParryRate(PAttacker, PDefender));
    }

    return false;
}

bool IsGuarded(CBattleEntity* PAttacker, CBattleEntity* PDefender)
{
    if(isFaceing(PDefender->loc.p, PAttacker->loc.p, 40))
    {
        return(rand() % 100 < battleutils::GetGuardRate(PAttacker, PDefender));
    }
    
    return false;
}

bool IsBlocked(CBattleEntity* PAttacker, CBattleEntity* PDefender)
{
    if(isFaceing(PDefender->loc.p, PAttacker->loc.p, 40))
    {
        return(rand() % 100 < battleutils::GetBlockRate(PAttacker, PDefender));    
    }

    return false;   
}

bool TryInterruptSpell(CBattleEntity* PAttacker, CBattleEntity* PDefender){
	int base = 40; //Reasonable assumption for the time being.
	int diff = PAttacker->GetMLevel() - PDefender->GetMLevel();
	float check = base + diff;

	if(PDefender->objtype==TYPE_PC) { //Check player's skill.  
		//For mobs, we can assume their skill is capped at their level, so this term is 1 anyway.
		CCharEntity* PChar = (CCharEntity*) PDefender;
		float skill = PChar->GetSkill(PChar->PBattleAI->GetCurrentSpell()->getSkillType());
		if(skill <= 0) {
			skill = 1;
		}
			
		float cap = GetMaxSkill((SKILLTYPE)PChar->PBattleAI->GetCurrentSpell()->getSkillType(),
			PChar->GetMJob(),PChar->GetMLevel());
		if(skill > cap) {
			skill = cap;
		}
		float ratio = (float)cap/skill;
		check *= ratio;
	} 

	float aquaveil = ((float)((100.0f - (float)PDefender->getMod(MOD_SPELLINTERRUPT))/100.0f));
	check *= aquaveil;

	if(rand()%100 < check)  {
		//Mark for interruption.
		return true;
	}
	return false;
}

/***********************************************************************
		Calculates the block rate of the defender
Generally assumed to be a linear relationship involving shield skill and
'projected' skill (like with spell interruption). According to
www.bluegartr.com/threads/103597-Random-Facts-Thread/page22 it appears
to be BASE+(PLD_Skill - MOB_Skill)/4.6 where base is the base activation
for the given shield type (unknown). These are subject to caps (65% max
for non-Ochain shields) and presumably 5% min cap *untested*
Presuming base values 10%/20%/30%/40% (big->low)
They don't mention anything about caps on PLD_Skill-MOB_Skill but there
has to be, else a Lv75 PLD with 0 skill would never be able to skillup
as they need to be HIT to skillup, meaning they can't really lvl up on
low level monsters as they miss too much. Presuming a min cap of -10%.
************************************************************************/
uint8 GetBlockRate(CBattleEntity* PAttacker,CBattleEntity* PDefender)
{
    if(PDefender->objtype == TYPE_PC && battleutils::IsEngauged(PDefender))
    {
		CCharEntity* PChar = (CCharEntity*)PDefender;
		CItemArmor* PItem = (CItemArmor*)PChar->getStorage(LOC_INVENTORY)->GetItem(PChar->equip[SLOT_SUB]);
		if(PItem!=NULL && PItem->getID()!=65535 && PItem->getShieldSize()>0 && PItem->getShieldSize()<=5)
        {
			float chance = ((5-PItem->getShieldSize())*10.0f)+ //base
				dsp_max(((float)(PChar->GetSkill(SKILL_SHL)+PChar->getMod(MOD_SHIELD)-GetMaxSkill(SKILL_SHL,JOB_PLD,PAttacker->GetMLevel()))/4.6f),-10);
			//TODO: HANDLE OCHAIN
			if(PItem->getShieldSize()==5){return 65;}//aegis, presume capped? need info.
			//65% cap
			return dsp_cap(chance,5,65);
		}
	}

	return 0;
}

uint8 GetParryRate(CBattleEntity* PAttacker, CBattleEntity* PDefender)
{
    CItemWeapon* PWeapon = GetEntityWeapon(PDefender, SLOT_MAIN);

    if(PWeapon != NULL && PWeapon->getID() != 0 && PWeapon->getID() != 65535 &&
       PWeapon->getSkillType() != SKILL_H2H && battleutils::IsEngauged(PDefender))
    {
        if( PDefender->GetMJob() == JOB_NIN || PDefender->GetMJob() == JOB_SAM || 
            PDefender->GetMJob() == JOB_THF || PDefender->GetMJob() == JOB_BST || PDefender->GetMJob() == JOB_DRG ||
            PDefender->GetMJob() == JOB_PLD || PDefender->GetMJob() == JOB_WAR || PDefender->GetMJob() == JOB_BRD || 
            PDefender->GetMJob() == JOB_DRK || PDefender->GetMJob() == JOB_RDM || PDefender->GetMJob() == JOB_COR)
        {
            int skill = PDefender->GetSkill(SKILL_PAR) + PDefender->getMod(MOD_PARRY); //max A-, so need gear+ for 20% parry
            int max = GetMaxSkill(SKILL_SHL, JOB_PLD, PDefender->GetMLevel()); //A+ skill
            int chance = 20 * ((double)skill / (double)max);
            return dsp_cap(chance, 1, 20);//20% max parry rate
        }
    }

    return 0;
}

uint8 GetGuardRate(CBattleEntity* PAttacker, CBattleEntity* PDefender)
{
    CItemWeapon* PWeapon = GetEntityWeapon(PDefender, SLOT_MAIN);

    // Defender must have no weapon equipped, or a hand to hand weapon equipped to guard
    if(PWeapon == NULL || PWeapon->getID() == 0 || PWeapon->getID() == 65535 || 
        PWeapon->getSkillType() == SKILL_H2H  && battleutils::IsEngauged(PDefender))
    {
        int skill = PDefender->GetSkill(SKILL_GRD) + PDefender->getMod(MOD_GUARD);
        int max = GetMaxSkill(SKILL_SHL, JOB_PLD, PDefender->GetMLevel());
        int chance = 20 * ((double)skill / (double)max);
        return dsp_cap(chance, 1, 20);
    }

    return 0;
}

/************************************************************************
*																		*
*  Calculates damage based on damage and resistance to damage type		*
*																		*
************************************************************************/

uint16 TakePhysicalDamage(CBattleEntity* PAttacker, CBattleEntity* PDefender, int16 damage, bool isBlocked, uint8 slot, uint16 tpMultiplier, CBattleEntity* taChar)
{
	if(PAttacker->StatusEffectContainer->HasStatusEffect(EFFECT_FORMLESS_STRIKES))
	{
		uint8 formlessMod = 70;
		//TODO: Add an additional 5 to formlessMod per merit in Formless Strikes
		damage = damage * formlessMod /100;
	}
	else
	{
		if (PDefender->StatusEffectContainer->HasStatusEffect(EFFECT_INVINCIBLE, 0))
		{
			damage = 0;
		}
	
		damage = (damage * (100 + PDefender->getMod(MOD_DMG) + PDefender->getMod(MOD_DMGPHYS))) / 100;
		
		switch(PAttacker->m_Weapons[slot]->getDmgType())
		{
			case DAMAGE_CROSSBOW:
			case DAMAGE_GUN:
			case DAMAGE_PIERCING: damage = (damage * (PDefender->getMod(MOD_PIERCERES))) / 1000; break;
			case DAMAGE_SLASHING: damage = (damage * (PDefender->getMod(MOD_SLASHRES)))	 / 1000; break;
			case DAMAGE_IMPACT:	  damage = (damage * (PDefender->getMod(MOD_IMPACTRES))) / 1000; break;
			case DAMAGE_HTH:	  damage = (damage * (PDefender->getMod(MOD_HTHRES)))	 / 1000; break;
		}

		if (isBlocked && PDefender->m_Weapons[SLOT_SUB]->IsShield())
		{
			damage = (damage * PDefender->m_Weapons[SLOT_SUB]->getShieldAbsorption()) / 100;
		}
	}
	damage = dsp_max(damage - PDefender->getMod(MOD_PHALANX),0);

    if (damage > 0 && PDefender->getMod(MOD_STONESKIN) > 0)
    {
        int16 absorb = dsp_cap(PDefender->getMod(MOD_STONESKIN), 0, damage);

        PDefender->delModifier(MOD_STONESKIN, absorb);

        if(PDefender->getMod(MOD_STONESKIN) == 0)
        {
			PDefender->StatusEffectContainer->DelStatusEffect(EFFECT_STONESKIN);
		}
        damage -= absorb;
    }

    PDefender->addHP(-damage);

    if (PAttacker->PMaster != NULL)
    {
        PDefender->m_OwnerID.id = PAttacker->PMaster->id;
        PDefender->m_OwnerID.targid = PAttacker->PMaster->targid; 
    }
    else
    {
        PDefender->m_OwnerID.id = PAttacker->id;
        PDefender->m_OwnerID.targid = PAttacker->targid; 
    }

    float TP = 0;

    if (damage > 0)
    {
        switch (PDefender->objtype)
        {
            case TYPE_PC:
            {
                PDefender->StatusEffectContainer->DelStatusEffectsByFlag(EFFECTFLAG_DAMAGE);
                battleutils::MakeEntityStandUp(PDefender);
                charutils::UpdateHealth((CCharEntity*)PDefender);
            }
            break;
            case TYPE_MOB:
            {
                PDefender->StatusEffectContainer->DelStatusEffectsByFlag(EFFECTFLAG_DAMAGE);
                if (PDefender->PMaster == NULL)
                {
                    PDefender->addTP(TP);
                }
				if(taChar == NULL){
					((CMobEntity*)PDefender)->PEnmityContainer->UpdateEnmityFromDamage(PAttacker, damage);
				}else{
					((CMobEntity*)PDefender)->PEnmityContainer->UpdateEnmityFromDamage(taChar, damage);
				}
            }
            break;
            case TYPE_PET:
            {
                ((CPetEntity*)PDefender)->loc.zone->PushPacket(PDefender, CHAR_INRANGE, new CEntityUpdatePacket(PDefender, ENTITY_UPDATE));
            }
            break;
        }

        if (PDefender->PBattleAI->GetCurrentAction() == ACTION_MAGIC_CASTING &&
            PDefender->PBattleAI->GetCurrentSpell()->getSpellGroup() != SPELLGROUP_SONG)
        { //try to interrupt the spell
            if (TryInterruptSpell(PAttacker, PDefender))
            {
				if(PDefender->objtype == TYPE_PC){
					CCharEntity* PChar = (CCharEntity*) PDefender;
					PChar->pushPacket(new CMessageBasicPacket(PChar, PChar, 0, 0, 16)); 
				}
                PDefender->PBattleAI->SetCurrentAction(ACTION_MAGIC_INTERRUPT);
            }
        }
		float baseTp = 0;
		if(slot==SLOT_RANGED && PAttacker->objtype == TYPE_PC){
			CCharEntity* PChar = (CCharEntity*)PAttacker;
			CItemWeapon* PRange = (CItemWeapon*)PChar->getStorage(LOC_INVENTORY)->GetItem(PChar->equip[SLOT_RANGED]);
			CItemWeapon* PAmmo = (CItemWeapon*)PChar->getStorage(LOC_INVENTORY)->GetItem(PChar->equip[SLOT_AMMO]);
			int delay = 0; uint16 offset = 240;
			if(PRange != NULL) { delay += PRange->getDelay(); }
			if(PAmmo != NULL) { delay += PAmmo->getDelay(); offset += 240; }
			baseTp = CalculateBaseTP(offset + ((delay * 60) / 1000));
		}
		else if(slot==SLOT_AMMO && PAttacker->objtype == TYPE_PC){
			//todo: e.g. pebbles
		}
		else
        {
            int16 delay = ((PAttacker->m_Weapons[SLOT_MAIN]->getDelay() * 60) / 1000);
			if(PAttacker->m_Weapons[SLOT_SUB]->getDmgType() > 0 && PAttacker->m_Weapons[SLOT_SUB]->getDmgType() < 4){
				delay += PAttacker->m_Weapons[SLOT_SUB]->getDelay() * 60 / 1000;
				delay = delay * (1 - (float)PAttacker->getMod(MOD_DUAL_WIELD) / 100.0f ) / 2;
			}
            float ratio = 1.0f;
                
            if((PAttacker->m_Weapons[slot]->getDmgType() == DAMAGE_HTH))
            {
                delay -= PAttacker->getMod(MOD_MARTIAL_ARTS);
                ratio = 2.0f;
            }

            baseTp = CalculateBaseTP(delay) / ratio;
		}

		PAttacker->addTP(tpMultiplier*(baseTp * (1.0f + 0.01f * (float)PAttacker->getMod(MOD_STORETP))));
		//PAttacker->addTP(20);
		//account for attacker's subtle blow which reduces the baseTP gain for the defender
		baseTp = baseTp * ((100.0f - dsp_cap((float)PAttacker->getMod(MOD_SUBTLE_BLOW), 0.0f, 50.0f)) / 100.0f);

		//mobs hit get basetp+3 whereas pcs hit get basetp/3
		if(PDefender->objtype == TYPE_PC){
			//yup store tp counts on hits taken too!
			PDefender->addTP((baseTp / 3) * (1.0f + 0.01f * (float)PDefender->getMod(MOD_STORETP)));
		}
		else{
			PDefender->addTP((baseTp + 3) * (1.0f + 0.01f * (float)PDefender->getMod(MOD_STORETP)));
		}

        if (PAttacker->objtype == TYPE_PC)
        {
            charutils::UpdateHealth((CCharEntity*)PAttacker);
        }
    }

    if (PAttacker->objtype == TYPE_PC)
    {
        PAttacker->StatusEffectContainer->DelStatusEffectsByFlag(EFFECTFLAG_ATTACK);
    }
	return damage;
}

/************************************************************************
*																		*
*  Calculate Power of Damage Spell										*
*																		*
************************************************************************/

uint16 TakeMagicDamage(CBattleEntity* PAttacker, CBattleEntity* PDefender) 
{
	DSP_DEBUG_BREAK_IF(PAttacker->PBattleAI->GetCurrentSpell() == NULL);
    DSP_DEBUG_BREAK_IF(PAttacker->PBattleAI->GetCurrentAction() != ACTION_MAGIC_FINISH);
	
	CSpell* PSpell = PAttacker->PBattleAI->GetCurrentSpell();

	int32 INT  = PAttacker->INT() - PDefender->INT();
	int32 base = PSpell->getBase();
	float M    = PSpell->getMultiplier();

	int32 damage = INT < 0 ? base + INT : base + (INT * M); 
	
    damage = damage * (100 - (10 * PAttacker->m_ActionList.size() / 2)) / 100;
	damage = damage * (1000 - PDefender->getMod(MOD_FIREDEF + PSpell->getElement())) / 1000;
	
	PDefender->addHP(-damage);
	
    if (PAttacker->PMaster != NULL)
    {
        PDefender->m_OwnerID.id = PAttacker->PMaster->id;
        PDefender->m_OwnerID.targid = PAttacker->PMaster->targid; 
    }
    else
    {
        PDefender->m_OwnerID.id = PAttacker->id;
        PDefender->m_OwnerID.targid = PAttacker->targid; 
    }
	
	switch (PDefender->objtype)
	{
		case TYPE_PC:
		{
            PDefender->StatusEffectContainer->DelStatusEffectsByFlag(EFFECTFLAG_DAMAGE);
			
			if(PDefender->animation == ANIMATION_SIT)
		    {
			    PDefender->animation = ANIMATION_NONE;
                ((CCharEntity*)PDefender)->pushPacket(new CCharUpdatePacket((CCharEntity*)PDefender));
            }
            charutils::UpdateHealth((CCharEntity*)PDefender);
		}
		break;
		case TYPE_MOB:
		{
			((CMobEntity*)PDefender)->PEnmityContainer->UpdateEnmityFromDamage(PAttacker, damage); 
		}
		break;
	}
	return damage;
}

/************************************************************************
*																		*
*  Calculate Probability attack will hit (20% min cap - 95% max cap)	*
*																		*
************************************************************************/

uint8 GetHitRate(CBattleEntity* PAttacker, CBattleEntity* PDefender) 
{
    int32 hitrate = 75;

    if (PAttacker->objtype == TYPE_PC && PAttacker->StatusEffectContainer->HasStatusEffect(EFFECT_SNEAK_ATTACK))
    {
		hitrate = 100; //attack with SA active cannot miss
	}
    else
    {
		int32 defendereva = (PDefender->getMod(MOD_EVA) * (100 + PDefender->getMod(MOD_EVAP)))/100 + PDefender->AGI()/2;
		int32 attackeracc = (PAttacker->getMod(MOD_ACC) * (100 + PAttacker->getMod(MOD_ACCP)))/100 + PAttacker->DEX()/2;
		
		hitrate = hitrate + (attackeracc - defendereva) / 2 + (PAttacker->GetMLevel() - PDefender->GetMLevel())*2;

		hitrate = dsp_cap(hitrate, 20, 95);
    }
	return (uint8)hitrate;
}

/************************************************************************
*																		*
*  Calculate Probability attack will hit with accuracy offset			*
*																		*
************************************************************************/

uint8 GetHitRateAccOffset(CBattleEntity* PAttacker, CBattleEntity* PDefender, uint32 accuracy) 
{
    int32 hitrate = 75;

    if (PAttacker->objtype == TYPE_PC && PAttacker->StatusEffectContainer->HasStatusEffect(EFFECT_SNEAK_ATTACK))
    {
		hitrate = 100; //attack with SA active cannot miss
	}
    else
    {
		int32 defendereva = (PDefender->getMod(MOD_EVA) * (100 + PDefender->getMod(MOD_EVAP)))/100 + PDefender->AGI()/2;
		int32 attackeracc = ((PAttacker->getMod(MOD_ACC) + accuracy) * (100 + PAttacker->getMod(MOD_ACCP)))/100 + PAttacker->DEX()/2;
		
		hitrate = hitrate + (attackeracc - defendereva) / 2 + (PAttacker->GetMLevel() - PDefender->GetMLevel())*2;

		hitrate = dsp_cap(hitrate, 20, 95);
    }
	return (uint8)hitrate;
}

/************************************************************************
*																		*
*  Crit Rate															*
*																		*
************************************************************************/

uint8 GetCritHitRate(CBattleEntity* PAttacker, CBattleEntity* PDefender, bool ignoreSneakAttack)
{
	int32 crithitrate = 5;
	if(PAttacker->StatusEffectContainer->HasStatusEffect(EFFECT_MIGHTY_STRIKES,0) || 
		PAttacker->StatusEffectContainer->HasStatusEffect(EFFECT_MIGHTY_STRIKES)){
			return 100;
	}
	else if (PAttacker->objtype == TYPE_PC && (!ignoreSneakAttack) && PAttacker->StatusEffectContainer->HasStatusEffect(EFFECT_SNEAK_ATTACK))
	{	
        // TODO: WRONG CALCULATION OF A POSITION OF THE CHARACTER

		if(abs(PDefender->loc.p.rotation - PAttacker->loc.p.rotation) < 23)
		{
			crithitrate = 100;
		}
	}
	else
	{
		int32 attackerdex = PAttacker->DEX();
		int32 defenderagi = PDefender->AGI();

		int32 dDEX = dsp_cap(attackerdex - defenderagi,0,50);

		crithitrate += (dDEX * 30) / 100 + PAttacker->getMod(MOD_CRITHITRATE) + PDefender->getMod(MOD_ENEMYCRITRATE);
		crithitrate  = dsp_cap(crithitrate,0,100);
	}
	return (uint8)crithitrate;
}

/************************************************************************
*																		*
*	Formula for calculating damage ratio								*
*																		*
************************************************************************/

float GetDamageRatio(CBattleEntity* PAttacker, CBattleEntity* PDefender, bool isCritical)  
{
	//wholly possible for DEF to be near 0 with the amount of debuffs/effects now.
    float ratio = (float)PAttacker->ATT() / (float)((PDefender->DEF()==0) ? 1 : PDefender->DEF());
	float cRatioMax = 0;
	float cRatioMin = 0;

	float cap = 2.0f;
	if(PAttacker->objtype==TYPE_PC){
		switch(PAttacker->m_Weapons[SLOT_MAIN]->getSkillType()){
		case SKILL_GAX:
		case SKILL_GSD:
		case SKILL_GKT:
		case SKILL_POL:
		case SKILL_SYH:
		case SKILL_STF:
			cap = 2.2f;
			break;
		}
	}
	if(PAttacker->objtype == TYPE_MOB){
		cap = 2.2f; //simply set for the 2h calc further on
	}


	ratio = dsp_cap(ratio,0,cap);
	//2hs have more of a 'buffer' (0.2 more) for level correction than 1hs
	float cRatio = ratio;
	if(PAttacker->objtype == TYPE_PC) 
	{
		if(PAttacker->GetMLevel() < PDefender->GetMLevel()) 
		{
			cRatio -= 0.050f * (PDefender->GetMLevel() - PAttacker->GetMLevel());
		}
	}
	//but its still capped
	cRatio = dsp_cap(cRatio,0,2);

	if(cap==2.0f){//1h weapon algorithm source: PChan @ BG (aka reliable)
		if((0 <= cRatio) && (cRatio < 0.5)) {
			cRatioMax = 1.0f + ((10.0f/9.0f)*(cRatio-0.5f));
		} else if((0.5 <= cRatio) && (cRatio <= 0.75f)) {
			cRatioMax = 1.0f;
		} else if((0.75f < cRatio) && (cRatio <= 2)) {
			cRatioMax = 1.0f + ((10.0f/9.0f)*(cRatio-0.75f));
		}

		if((0 <= cRatio) && (cRatio < 0.5)) {
			cRatioMin =  (float)(1.0f/6.0f);
		} else if((0.5 <= cRatio) && (cRatio <= 1.25)) {
			cRatioMin = 1.0f + ((10.0f/9.0f)*(cRatio-1.25));
		} else if((1.25 < cRatio) && (cRatio <= 1.5)) {
			cRatioMin = 1.0f;
		} else if((1.5 < cRatio) && (cRatio <= 2)) {
			cRatioMin = 1.0f + ((10.0f/9.0f)*(cRatio-1.5));
		}
	}
	else{//2h weapon
		if((0 <= cRatio) && (cRatio < 0.5)) {
			cRatioMax = 0.4f + 1.2f * cRatio;
		} else if((0.5 <= cRatio) && (cRatio <= (5.0f/6.0f))) {
			cRatioMax = 1;
		} else if(((5.0f/6.0f) < cRatio) && (cRatio <= (10.0f/6.0f))) {
			cRatioMax = 1.25f * (cRatio);
		} else if(((10.0f/6.0f) < cRatio) && (cRatio <= 2)) {
			cRatioMax = 1.2f * (cRatio);
		}

		if((0 <= cRatio) && (cRatio < 1.25)) {
			cRatioMin =  (float)(-0.5 + 1.2 * cRatio);
		} else if((1.25 <= cRatio) && (cRatio <= 1.5)) {
			cRatioMin = 1;
		} else if((1.5 < cRatio) && (cRatio <= 2)) {
			cRatioMin = (float)(-0.8 + 1.2 * cRatio);
		}
	}

	cRatioMin = (cRatioMin < 0 ? 0 : cRatioMin);

	if(isCritical){
		cRatioMin += 1;
		cRatioMax += 1;
	}

	cRatioMax = (cRatioMax > 3 ? 3 : cRatioMax);
	float pDIF = ((cRatioMax-cRatioMin) * ((float)rand()/RAND_MAX)) + cRatioMin;

	//x1.00 ~ x1.05 final multiplier, giving max value 3*1.05 -> 3.15
	return pDIF * (1+((0.5f) * ((float)rand()/RAND_MAX)));
}

/************************************************************************
*  	Formula for Strength												*
************************************************************************/

int32 GetFSTR(CBattleEntity* PAttacker, CBattleEntity* PDefender, uint8 SlotID) 
{
	int32 rank = PAttacker->m_Weapons[SlotID]->getDamage() / 9; 

	float dif = PAttacker->STR() - PDefender->VIT();

	int32 fstr = 1.95 + 0.195 * dif;

	if(SlotID==SLOT_RANGED){ //different caps than melee weapons
		fstr /= 2; //fSTR2
		if(fstr <= (-rank*2)){
			return (-rank*2);
		}
		if((fstr > (-rank*2)) && (fstr <= (2*(rank + 8)))) {
			return fstr;
		} else {
			return 2*(rank + 8);
		}
	}
	else{
		if(fstr <= (-rank)) {
			return (-rank);
		}
		if((fstr > (-rank)) && (fstr <= rank + 8)) {
			return fstr;
		} else {
			return rank + 8;
		}
	}
}

/************************************************************************
*                                                                       *
*  Returns the number of hits for multihit weapons if applicable        *
*                                                                       *
************************************************************************/

uint8 CheckMultiHits(CBattleEntity* PEntity, CItemWeapon* PWeapon)
{
	uint8 num = PWeapon->getHitCount();

	uint8 tripleAttack = PEntity->getMod(MOD_TRIPLE_ATTACK);
	uint8 doubleAttack = PEntity->getMod(MOD_DOUBLE_ATTACK);

	//check for merit upgrades
	if (PEntity->objtype == TYPE_PC)
	{
		CCharEntity* PChar = (CCharEntity*)PEntity;

		//merit chance only applies if player has the job trait
		if (charutils::hasTrait(PChar, TRAIT_TRIPLE_ATTACK)) {
			tripleAttack += PChar->PMeritPoints->GetMeritValue(MERIT_TRIPLE_ATTACK_RATE,PEntity->GetMLevel());
		}
		if (charutils::hasTrait(PChar, TRAIT_DOUBLE_ATTACK)) {
			doubleAttack += PChar->PMeritPoints->GetMeritValue(MERIT_DOUBLE_ATTACK_RATE,PEntity->GetMLevel());
		}
	}

	if (rand()%100 <= tripleAttack)
	{		
		num +=2; 
	}
	else if (rand()%100 <= doubleAttack) 
	{
		num +=1;
	}

	if(PEntity->GetMJob() == JOB_SAM)
	{
		if (PEntity->StatusEffectContainer->HasStatusEffect(EFFECT_HASSO))
		{
			if(rand()%100 < PEntity->getMod(MOD_ZANSHIN)/4) num++;
		}
	}
	return dsp_min(num, 8);
}

/*****************************************************************************
	Handles song buff effects. Returns true if the song has been handled
	or false if the song effect has not been implemented. This is used in
	luautils to check if it needs to load a spell script or not.
******************************************************************************/
bool SingSong(CBattleEntity* PCaster,CBattleEntity* PTarget,CSpell* PSpell){
	uint8 tier = 1;
	EFFECT effect = EFFECT_NONE;
	uint8 tick = 0;

	//calculate strengths. Need to know TIER and EFFECTTYPE (Minuet, Paeon, etc) for icon
	if(PSpell->getID() >= 394 && PSpell->getID() <= 398){ 
		effect = EFFECT_MINUET;
		tier = PSpell->getID()-393;
	}
	else if(PSpell->getID() >= 389 && PSpell->getID() <= 393){ 
		effect = EFFECT_MINNE;
		tier = PSpell->getID()-388;
	}
	else if(PSpell->getID() >= 399 && PSpell->getID() <= 400){ 
		effect = EFFECT_MADRIGAL;
		tier = PSpell->getID()-398;
	}
	else if(PSpell->getID() >= 403 && PSpell->getID() <= 404){ 
		effect = EFFECT_MAMBO;
		tier = PSpell->getID()-382;
	}
	else if(PSpell->getID() >= 386 && PSpell->getID() <= 388){ 
		effect = EFFECT_BALLAD;
		tier = PSpell->getID()-385;
		tick = 3;
	}
	else if(PSpell->getID() >= 419 && PSpell->getID() <= 420){ 
		effect = EFFECT_MARCH;
		tier = PSpell->getID()-418;
	}
	else if(PSpell->getID() >= 378 && PSpell->getID() <= 385){ 
		effect = EFFECT_PAEON;
		tier = PSpell->getID()-377;
		tick = 3;
	}

	if(effect==EFFECT_NONE){
		return false;
	}
	//TODO: Handle instruments!

	CStatusEffect* PStatus = new CStatusEffect(effect,effect,tier,tick,120,PCaster->targid);
	PStatus->SetFlag(EFFECTFLAG_ON_ZONE);//wears on zone
	
	uint8 maxSongs = 2;
	if(PCaster->objtype==TYPE_PC){
		CCharEntity* PChar = (CCharEntity*)PCaster;
		CItemWeapon* PItem = (CItemWeapon*)PChar->getStorage(LOC_INVENTORY)->GetItem(PChar->equip[SLOT_RANGED]);
		if(PItem==NULL || PItem->getID()==65535 || !(PItem->getSkillType()==SKILL_STR || PItem->getSkillType()==SKILL_WND || PItem->getSkillType()==47) ){
			//TODO: Remove check for Skilltype=47, its a DB error should be 41 (String)!!
			maxSongs = 1;
		}
		else{
			//handle skillups
			if(PItem->getSkillType()==SKILL_STR || PItem->getSkillType()==47){
				charutils::TrySkillUP(PChar,SKILL_STR,PChar->GetMLevel());
			}
			else if(PItem->getSkillType()==SKILL_WND){
				charutils::TrySkillUP(PChar,SKILL_WND,PChar->GetMLevel());
			}
		}
	}

	if(PTarget->StatusEffectContainer->ApplyBardEffect(PStatus,maxSongs)){
		//ShowDebug("Applied %s! \n",PSpell->getName()); 
	}
	return true;
}


/************************************************************************
*                                                                       *
*  Chance paralysis will cause you to be paralyzed                      *
*                                                                       *
************************************************************************/

bool IsParalised(CBattleEntity* PAttacker)
{
	return (rand()%100 < dsp_cap(PAttacker->getMod(MOD_PARALYZE) - PAttacker->getMod(MOD_PARALYZERES), 0, 100));
}

/*****************************************************************************
Returns true if the Third Eye anticipates the attacks. Must specify various
parameters including if the effect should 100% be removed (e.g. in the case of AoE)
by setting forceRemove to true. Must also specify the ignore boolean, which is true
to ignore the effects of Third Eye (but NOT try to remove).
******************************************************************************/
bool IsAnticipated(CBattleEntity* PDefender, bool forceRemove, bool ignore)
{
	if(ignore){
		return false;
	}

	if(PDefender->GetMJob() != JOB_SAM && PDefender->GetSJob() != JOB_SAM){
		//faster check than via hasStatusEffect
		return false;
	}
	if(!PDefender->StatusEffectContainer->HasStatusEffect(EFFECT_THIRD_EYE)){
		return false;
	}

	CStatusEffect* effect = PDefender->StatusEffectContainer->GetStatusEffect(EFFECT_THIRD_EYE,0);
	if(effect == NULL) { //shouldn't occur but checking anyway
		return false;
	}
	if(forceRemove){
		PDefender->StatusEffectContainer->DelStatusEffect(EFFECT_THIRD_EYE);
		return false;
	}
	
	//power stores how many times this effect has anticipated
	uint8 pastAnticipations = effect->GetPower();

	if(pastAnticipations>7){
		//max 7 anticipates!
		PDefender->StatusEffectContainer->DelStatusEffect(EFFECT_THIRD_EYE);
		return false;
	}

	bool hasSeigan = PDefender->StatusEffectContainer->HasStatusEffect(EFFECT_SEIGAN,0);

	if(!hasSeigan && pastAnticipations == 0){
		PDefender->StatusEffectContainer->DelStatusEffect(EFFECT_THIRD_EYE);
		return true;
	}
	else if(!hasSeigan){
		PDefender->StatusEffectContainer->DelStatusEffect(EFFECT_THIRD_EYE);
		return false;
	}
	else{ //do have seigan, decay anticipations correctly (guesstimated)
		//5-6 anticipates is a 'lucky' streak, going to assume 15% decay per proc, with a 100% base w/ Seigan
		if(rand()%100 < (100-(pastAnticipations*15))){
			//increment power and don't remove
			effect->SetPower(effect->GetPower()+1);
			return true;
		}
		PDefender->StatusEffectContainer->DelStatusEffect(EFFECT_THIRD_EYE);
		return false;
	}

	return false;
}

/************************************************************************
*                                                                       *
*                                                                       *
*                                                                       *
************************************************************************/

bool IsAbsorbByShadow(CBattleEntity* PDefender)
{
	//utsus always overwrites blink, so if utsus>0 then we know theres no blink.
    uint16 Shadow = PDefender->getMod(MOD_UTSUSEMI);
	uint16 modShadow = MOD_UTSUSEMI;
	if(Shadow==0){
		Shadow=PDefender->getMod(MOD_BLINK);
		modShadow = MOD_BLINK;
		//random chance, assume 80% proc
		if(rand()%100 < 20){
			return false;
		}
	}

    if (Shadow > 0) 
    {
        PDefender->setModifier(modShadow, --Shadow);

        if (Shadow == 0)
        {
			switch(modShadow){
			case MOD_UTSUSEMI:
				PDefender->StatusEffectContainer->DelStatusEffect(EFFECT_COPY_IMAGE);
				break;
			case MOD_BLINK:
				PDefender->StatusEffectContainer->DelStatusEffect(EFFECT_BLINK);
				break;
			}
        }
        else if (Shadow < 4 && MOD_UTSUSEMI==modShadow)
        {
            if (PDefender->objtype == TYPE_PC)
            {
                CStatusEffect* PStatusEffect = PDefender->StatusEffectContainer->GetStatusEffect(EFFECT_COPY_IMAGE, 0);

                if (PStatusEffect != NULL)
                {
                    uint16 icon = EFFECT_COPY_IMAGE_3;
                    switch (PDefender->getMod(MOD_UTSUSEMI))
                    {
                        case 1: icon = EFFECT_COPY_IMAGE_1; break;
                        case 2: icon = EFFECT_COPY_IMAGE_2; break;
                    }
                    PStatusEffect->SetIcon(icon);
                    PDefender->StatusEffectContainer->UpdateStatusIcons();
                }
            }
        }
        return true;
    }

    return false;
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
        case SYSTEM_HUMANOID:	KillerEffect = PDefender->getMod(MOD_HUMANOID_KILLER); break;
		case SYSTEM_LIZARD:		KillerEffect = PDefender->getMod(MOD_LIZARD_KILLER);   break;
        case SYSTEM_LUMINION:   KillerEffect = PDefender->getMod(MOD_LUMINION_KILLER); break;
        case SYSTEM_LUMORIAN:   KillerEffect = PDefender->getMod(MOD_LUMORIAN_KILLER); break;
		case SYSTEM_PLANTOID:	KillerEffect = PDefender->getMod(MOD_PLANTOID_KILLER); break;
		case SYSTEM_UNDEAD:		KillerEffect = PDefender->getMod(MOD_UNDEAD_KILLER);   break;
		case SYSTEM_VERMIN:		KillerEffect = PDefender->getMod(MOD_VERMIN_KILLER);   break;
	}
	return (rand()%100 < KillerEffect);
}

/************************************************************************
*                                                                       *
*  Moves mob  - mode 1 = walk / 2 = run                                 *
*                                                                       *
************************************************************************/

void MoveTo(CBattleEntity* PEntity, position_t pos, uint8 mode)
{
	DSP_DEBUG_BREAK_IF(mode < 1 || mode > 2);

    // TODO: не учитывается модификатор передвижения PEntity->getMod(MOD_MOVE)

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

/****************************************************************
*	Determine if an enfeeble spell will land - untested			*
****************************************************************/

bool EnfeebleHit(CBattleEntity* PCaster, CBattleEntity* PDefender, EFFECT Effect)
{

	int16 dlvl = (PCaster->GetMLevel() - PDefender->GetMLevel());
	int16 maxCap = 90;
	int16 minCap = 10; 
	int16 chance = 40 + (dlvl*5);

	chance = (chance > maxCap ? maxCap : chance);
	chance = (chance < minCap ? minCap : chance);
	if (Effect > 1 && Effect < 15)
	{
		chance = chance + (PDefender->getMod((MODIFIER)(Effect + 238)) / 10);
	}

	if (rand()%100 < chance)
	{
		return true;
	}

	return false;
}

/************************************************************************
*																		*
*  Gets SkillChain Effect												*
*																		*
************************************************************************/
#define PAIR(x, y) ((x << 8) + y)

uint8 GetSkillchainSubeffect(SKILLCHAIN_ELEMENT skillchain)
{
    DSP_DEBUG_BREAK_IF(skillchain < SC_NONE || skillchain > SC_DARKNESS_II);

    static const uint8 effects[] = {
        SUBEFFECT_NONE,          // SC_NONE
        SUBEFFECT_TRANSFIXION,   // SC_TRANSFIXION
        SUBEFFECT_COMPRESSION,   // SC_COMPRESSION
        SUBEFFECT_LIQUEFACATION, // SC_LIQUEFACTION
        SUBEFFECT_SCISSION,      // SC_SCISSION
        SUBEFFECT_REVERBERATION, // SC_REVERBERATION
        SUBEFFECT_DETONATION,    // SC_DETONATION
        SUBEFFECT_INDURATION,    // SC_INDURATION
        SUBEFFECT_IMPACTION,     // SC_IMPACTION
        SUBEFFECT_GRAVITATION,   // SC_GRAVITATION
        SUBEFFECT_DISTORTION,    // SC_DISTORTION
        SUBEFFECT_FUSION,        // SC_FUSION
        SUBEFFECT_FRAGMENTATION, // SC_FRAGMENTATION
        SUBEFFECT_LIGHT,         // SC_LIGHT
        SUBEFFECT_DARKNESS,      // SC_DARKNESS
        SUBEFFECT_LIGHT,         // SC_LIGHT_II
        SUBEFFECT_DARKNESS,      // SC_DARKNESS_II
    };

    return effects[skillchain];
}

uint8 GetSkillchainTier(SKILLCHAIN_ELEMENT skillchain)
{
    DSP_DEBUG_BREAK_IF(skillchain < SC_NONE || skillchain > SC_DARKNESS_II);

    static const uint8 tiers[] = {
        0, // SC_NONE
        1, // SC_TRANSFIXION
        1, // SC_COMPRESSION
        1, // SC_LIQUEFACTION
        1, // SC_SCISSION
        1, // SC_REVERBERATION
        1, // SC_DETONATION
        1, // SC_INDURATION
        1, // SC_IMPACTION
        2, // SC_GRAVITATION
        2, // SC_DISTORTION
        2, // SC_FUSION
        2, // SC_FRAGMENTATION
        3, // SC_LIGHT
        3, // SC_DARKNESS
        4, // SC_LIGHT_II
        4, // SC_DARKNESS_II
    };

    return tiers[skillchain];
}

SKILLCHAIN_ELEMENT FormSkillchain(std::list<SKILLCHAIN_ELEMENT> resonance, std::list<SKILLCHAIN_ELEMENT> skill)
{
    SKILLCHAIN_ELEMENT result = SC_NONE;

    for(std::list<SKILLCHAIN_ELEMENT>::iterator i = resonance.begin(); i != resonance.end(); i++)
    {
        for(std::list<SKILLCHAIN_ELEMENT>::iterator j = skill.begin(); j != skill.end(); j++)
        {
            // TODO: This could probably be implemented as a composite key lookup map.  For now I like the way this looks.

            switch(PAIR((*i), (*j)))
            {
                // Level 1 Pairs
                case PAIR(SC_TRANSFIXION, SC_COMPRESSION)   : return SC_COMPRESSION;   break;
                case PAIR(SC_TRANSFIXION, SC_SCISSION)      : return SC_DISTORTION;    break; // -> Lv2
                case PAIR(SC_TRANSFIXION, SC_REVERBERATION) : return SC_REVERBERATION; break;

                case PAIR(SC_COMPRESSION, SC_TRANSFIXION)   : return SC_TRANSFIXION;   break;
                case PAIR(SC_COMPRESSION, SC_DETONATION)    : return SC_DETONATION;    break;

                case PAIR(SC_LIQUEFACTION, SC_SCISSION)     : return SC_SCISSION;      break;
                case PAIR(SC_LIQUEFACTION, SC_IMPACTION)    : return SC_FUSION;        break; // -> Lv2

                case PAIR(SC_SCISSION, SC_LIQUEFACTION)     : return SC_LIQUEFACTION;  break;
                case PAIR(SC_SCISSION, SC_REVERBERATION)    : return SC_REVERBERATION; break;
                case PAIR(SC_SCISSION, SC_DETONATION)       : return SC_DETONATION;    break;

                case PAIR(SC_REVERBERATION, SC_INDURATION)  : return SC_INDURATION;    break;
                case PAIR(SC_REVERBERATION, SC_IMPACTION)   : return SC_IMPACTION;     break;

                case PAIR(SC_DETONATION, SC_COMPRESSION)    : return SC_GRAVITATION;   break; // -> Lv2
                case PAIR(SC_DETONATION, SC_SCISSION)       : return SC_SCISSION;      break;

                case PAIR(SC_INDURATION, SC_COMPRESSION)    : return SC_COMPRESSION;   break;
                case PAIR(SC_INDURATION, SC_REVERBERATION)  : return SC_FRAGMENTATION; break; // -> Lv2
                case PAIR(SC_INDURATION, SC_IMPACTION)      : return SC_IMPACTION;     break;

                case PAIR(SC_IMPACTION, SC_LIQUEFACTION)    : return SC_LIQUEFACTION;  break;
                case PAIR(SC_IMPACTION, SC_DETONATION)      : return SC_DETONATION;    break;

                // Level 2 Pairs
                case PAIR(SC_GRAVITATION, SC_DISTORTION)    : return SC_DARKNESS;      break; // -> Lv3
                case PAIR(SC_GRAVITATION, SC_FRAGMENTATION) : return SC_FRAGMENTATION; break;

                case PAIR(SC_DISTORTION, SC_GRAVITATION)    : return SC_DARKNESS;      break; // -> Lv3
                case PAIR(SC_DISTORTION, SC_FUSION)         : return SC_FUSION;        break;

                case PAIR(SC_FUSION, SC_GRAVITATION)        : return SC_GRAVITATION;   break;
                case PAIR(SC_FUSION, SC_FRAGMENTATION)      : return SC_LIGHT;         break; // -> Lv3

                case PAIR(SC_FRAGMENTATION, SC_DISTORTION)  : return SC_DISTORTION;    break;
                case PAIR(SC_FRAGMENTATION, SC_FUSION)      : return SC_LIGHT;         break; // -> Lv3

                // Level 3 Pairs
                case PAIR(SC_LIGHT, SC_LIGHT)               : return SC_LIGHT_II;      break; // -> Lv4
                case PAIR(SC_DARKNESS, SC_DARKNESS)         : return SC_DARKNESS_II;   break; // -> Lv4

                default: break;
            }
        }
    }

    return SC_NONE;
}

SUBEFFECT GetSkillChainEffect(CBattleEntity* PDefender, CWeaponSkill* PWeaponSkill)
{
    CStatusEffect* PEffect = PDefender->StatusEffectContainer->GetStatusEffect(EFFECT_SKILLCHAIN, 0);
    SKILLCHAIN_ELEMENT skillchain = SC_NONE;

    if (PEffect == NULL)
    {
        // No effect exists, apply an effect using the weaponskill ID as the power with a tier of 0.
        PDefender->StatusEffectContainer->AddStatusEffect(new CStatusEffect(EFFECT_SKILLCHAIN, 0, PWeaponSkill->getID(), 0, 6, 0, 0, 0));
        return SUBEFFECT_NONE;
    }
    else
    {
        std::list<SKILLCHAIN_ELEMENT> skillProperties;
        skillProperties.push_back((SKILLCHAIN_ELEMENT)PWeaponSkill->getPrimarySkillchain());
        skillProperties.push_back((SKILLCHAIN_ELEMENT)PWeaponSkill->getSecondarySkillchain());
        skillProperties.push_back((SKILLCHAIN_ELEMENT)PWeaponSkill->getTertiarySkillchain());

        std::list<SKILLCHAIN_ELEMENT> resonanceProperties;
        // Previous effect exists
        if(PEffect->GetTier() == 0)
        {
            DSP_DEBUG_BREAK_IF(!PEffect->GetPower());
            // Previous effect is an opening effect, meaning the power is 
            // actually the ID of the opening weaponskill.  We need all 3 
            // of the possible skillchain properties on the initial link.
            resonanceProperties.push_back((SKILLCHAIN_ELEMENT)g_PWeaponSkillList[PEffect->GetPower()]->getPrimarySkillchain());
            resonanceProperties.push_back((SKILLCHAIN_ELEMENT)g_PWeaponSkillList[PEffect->GetPower()]->getSecondarySkillchain());
            resonanceProperties.push_back((SKILLCHAIN_ELEMENT)g_PWeaponSkillList[PEffect->GetPower()]->getTertiarySkillchain());    
        }
        else
        {
            // Previous effect is not an opening effect, meaning the power is
            // The skill chain ID resonating.
            resonanceProperties.push_back((SKILLCHAIN_ELEMENT)PEffect->GetPower());
        }

        skillchain = FormSkillchain(resonanceProperties, skillProperties);

        if(skillchain != SC_NONE)
        {
            PEffect->SetStartTime(gettick());
            PEffect->SetTier(GetSkillchainTier((SKILLCHAIN_ELEMENT)skillchain));
            PEffect->SetPower(skillchain);
            PEffect->SetSubPower(dsp_min(PEffect->GetSubPower() + 1, 5)); // Linked, limited to 5

            return (SUBEFFECT)GetSkillchainSubeffect((SKILLCHAIN_ELEMENT)skillchain);
        }

        PEffect->SetStartTime(gettick());
        PEffect->SetTier(0);
        PEffect->SetPower(PWeaponSkill->getID());
        PEffect->SetSubPower(0);

        return SUBEFFECT_NONE;
    }
}

uint16 GetSkillchainMinimumResistance(SKILLCHAIN_ELEMENT element, CBattleEntity* PDefender)
{
    static const uint16 resistances[][4] = 
    {
        {MOD_NONE,       MOD_NONE, MOD_NONE, MOD_NONE}, // SC_NONE
        {MOD_LIGHTDEF,   MOD_NONE, MOD_NONE, MOD_NONE}, // SC_TRANSFIXION
        {MOD_DARKDEF,    MOD_NONE, MOD_NONE, MOD_NONE}, // SC_COMPRESSION
        {MOD_FIREDEF,    MOD_NONE, MOD_NONE, MOD_NONE}, // SC_LIQUEFACTION
        {MOD_EARTHDEF,   MOD_NONE, MOD_NONE, MOD_NONE}, // SC_SCISSION
        {MOD_WATERDEF,   MOD_NONE, MOD_NONE, MOD_NONE}, // SC_REVERBERATION
        {MOD_WINDDEF,    MOD_NONE, MOD_NONE, MOD_NONE}, // SC_DETONATION
        {MOD_ICEDEF,     MOD_NONE, MOD_NONE, MOD_NONE}, // SC_INDURATION
        {MOD_THUNDERDEF, MOD_NONE, MOD_NONE, MOD_NONE}, // SC_IMPACTION

        {MOD_FIREDEF,  MOD_LIGHTDEF,   MOD_NONE, MOD_NONE}, // SC_FUSION
        {MOD_WINDDEF,  MOD_THUNDERDEF, MOD_NONE, MOD_NONE}, // SC_FRAGMENTATION
        {MOD_EARTHDEF, MOD_DARKDEF,    MOD_NONE, MOD_NONE}, // SC_GRAVITATION
        {MOD_ICEDEF,   MOD_WATERDEF,   MOD_NONE, MOD_NONE}, // SC_DISTORTION

        {MOD_FIREDEF, MOD_WINDDEF,  MOD_THUNDERDEF, MOD_LIGHTDEF}, // SC_LIGHT
        {MOD_ICEDEF,  MOD_EARTHDEF, MOD_WATERDEF,   MOD_DARKDEF},  // SC_DARKNESS_II
        {MOD_FIREDEF, MOD_WINDDEF,  MOD_THUNDERDEF, MOD_LIGHTDEF}, // SC_LIGHT
        {MOD_ICEDEF,  MOD_EARTHDEF, MOD_WATERDEF,   MOD_DARKDEF},  // SC_DARKNESS_II
    };

    switch(element)
    {
        // Level 1 skill chains
        case SC_LIQUEFACTION:
        case SC_IMPACTION:
        case SC_DETONATION:
        case SC_SCISSION:
        case SC_REVERBERATION:
        case SC_INDURATION:
        case SC_COMPRESSION:
        case SC_TRANSFIXION:
            return PDefender->getMod(resistances[element][0]);
            break;

        // Level 2 skill chains
        case SC_FUSION:
        case SC_FRAGMENTATION:
        case SC_GRAVITATION:
        case SC_DISTORTION:
            return dsp_min(PDefender->getMod(resistances[element][0]), PDefender->getMod(resistances[element][1]));
            break;

        // Level 3 & 4 skill chains
        case SC_LIGHT:
        case SC_LIGHT_II:
        case SC_DARKNESS:
        case SC_DARKNESS_II:
            return dsp_min(dsp_min(PDefender->getMod(resistances[element][0]), 
                                     PDefender->getMod(resistances[element][1])), 
                            dsp_min(PDefender->getMod(resistances[element][2]), 
                                     PDefender->getMod(resistances[element][3])));
            break;

        default:
            DSP_DEBUG_BREAK_IF(true);
            return 0;
            break;
    }
}

uint16 TakeSkillchainDamage(CBattleEntity* PAttacker, CBattleEntity* PDefender, uint16 lastSkillDamage)
{
    DSP_DEBUG_BREAK_IF(PAttacker == NULL);
    DSP_DEBUG_BREAK_IF(PDefender == NULL);

    CStatusEffect* PEffect = PDefender->StatusEffectContainer->GetStatusEffect(EFFECT_SKILLCHAIN, 0);

    // Determine the skill chain level and elemental resistance.
    SKILLCHAIN_ELEMENT skillchain = (SKILLCHAIN_ELEMENT)PEffect->GetPower();
    uint16 chainLevel = PEffect->GetTier();
    uint16 chainCount = PEffect->GetSubPower();
    int16  resistance = GetSkillchainMinimumResistance(skillchain, PDefender);

    DSP_DEBUG_BREAK_IF(chainLevel <= 0 || chainLevel > 4 || chainCount <= 0 || chainCount > 5);

    // Skill chain damage = (Closing Damage) 
    //                      × (Skill chain Level/Number from Table) 
    //                      × (1 + Skill chain Bonus ÷ 100) 
    //                      × (1 + Skill chain Damage + %/100) 
    //            TODO:     × (1 + Day/Weather bonuses) 
    //            TODO:     × (1 + Staff Affinity)

    uint32 damage = floor((double)lastSkillDamage
                          * g_SkillChainDamageModifiers[chainLevel][chainCount] / 1000
                          * (100 + PAttacker->getMod(MOD_SKILLCHAINBONUS)) / 100
                          * (100 + PAttacker->getMod(MOD_SKILLCHAINDMG)) / 100);

    damage = damage * (1000 - resistance) / 1000;

    PDefender->addHP(-damage);

    if (PAttacker->PMaster != NULL)
    {
        PDefender->m_OwnerID.id = PAttacker->PMaster->id;
        PDefender->m_OwnerID.targid = PAttacker->PMaster->targid; 
    }
    else
    {
        PDefender->m_OwnerID.id = PAttacker->id;
        PDefender->m_OwnerID.targid = PAttacker->targid; 
    }

    switch (PDefender->objtype)
    {
        case TYPE_PC:
        {
            PDefender->StatusEffectContainer->DelStatusEffectsByFlag(EFFECTFLAG_DAMAGE);

            if(PDefender->animation == ANIMATION_SIT)
            {
                PDefender->animation = ANIMATION_NONE;
                ((CCharEntity*)PDefender)->pushPacket(new CCharUpdatePacket((CCharEntity*)PDefender));
            }

            charutils::UpdateHealth((CCharEntity*)PDefender);
        }
        break;

        case TYPE_MOB:
        {
            ((CMobEntity*)PDefender)->PEnmityContainer->UpdateEnmityFromDamage(PAttacker, damage); 
        }
        break;
    }

    return damage;
}

CItemArmor* GetEntityArmor(CBattleEntity* PEntity, SLOTTYPE Slot)
{
    DSP_DEBUG_BREAK_IF(Slot < SLOT_HEAD || Slot > SLOT_LINK);

    if(PEntity->objtype == TYPE_PC)
    {
        return (CItemArmor*)(((CCharEntity*)PEntity)->getStorage(LOC_INVENTORY)->GetItem(((CCharEntity*)PEntity)->equip[Slot]));
    }
    else if(PEntity->objtype == TYPE_NPC)
    {
        return NULL;
    }

    return NULL;
}

CItemWeapon* GetEntityWeapon(CBattleEntity* PEntity, SLOTTYPE Slot)
{
    DSP_DEBUG_BREAK_IF(Slot < SLOT_MAIN || Slot > SLOT_AMMO);

    if(PEntity->objtype == TYPE_PC)
    {
        return (CItemWeapon*)(((CCharEntity*)PEntity)->getStorage(LOC_INVENTORY)->GetItem(((CCharEntity*)PEntity)->equip[Slot]));
    }
    else if(PEntity->objtype == TYPE_NPC)
    {
        return (CItemWeapon*)(((CMobEntity*)PEntity)->m_Weapons[Slot]);
    }

    return NULL;
}

void MakeEntityStandUp(CBattleEntity* PEntity)
{
    DSP_DEBUG_BREAK_IF(PEntity == NULL);

    if (PEntity->objtype == TYPE_PC)
    {    
        CCharEntity* PPlayer = ((CCharEntity*)PEntity);

        if (PPlayer->animation == ANIMATION_HEALING)
        {
            PPlayer->StatusEffectContainer->DelStatusEffect(EFFECT_HEALING);
        }
    }    
}

bool IsEngauged(CBattleEntity* PEntity)
{
    DSP_DEBUG_BREAK_IF(PEntity == NULL);

    return (PEntity->animation != ANIMATION_HEALING &&
            PEntity->PBattleAI != NULL &&
            PEntity->PBattleAI->GetBattleTarget() != NULL);
}

/************************************************************************
*                                                                       *
*  Для всех сущностей, за исключением персонажей, по умолчанию true     *
*                                                                       *
************************************************************************/

bool HasNinjaTool(CBattleEntity* PEntity, CSpell* PSpell, bool ConsumeTool)
{
    DSP_DEBUG_BREAK_IF(PEntity == NULL || PSpell == NULL);

    if (PEntity->objtype == TYPE_PC)
    {
        CCharEntity* PChar = ((CCharEntity*)PEntity);

        uint8  SlotID = 0;
        uint16 toolID = PSpell->getMPCost();

        if (ERROR_SLOTID == (SlotID = PChar->getStorage(LOC_INVENTORY)->SearchItem(toolID)))
        {
            if (PChar->GetMJob() == JOB_NIN)
            {
                switch (toolID)
                {
                    case ITEM_UCHITAKE: 
                    case ITEM_TSURARA: 
                    case ITEM_KAWAHORI_OGI: 
                    case ITEM_MAKIBISHI: 
                    case ITEM_HIRAISHIN: 
                    case ITEM_MIZU_DEPPO:
                        toolID = ITEM_INOSHISHINOFUDA;
                        break;

                    case ITEM_RYUNO:
                    case ITEM_MOKUJIN:
                    case ITEM_SANJAKU_TENUGUI:
                    case ITEM_KABENRO:
                    case ITEM_SHINOBI_TABI:
                    case ITEM_SHIHEI:
                        toolID = ITEM_SHIKANOFUDA;
                        break;

                    case ITEM_SOSHI:
                    case ITEM_KODOKU:
                    case ITEM_KAGINAWA:
                    case ITEM_JUSATSU:
                    case ITEM_SAIRUI_RAN:
                    case ITEM_JINKO:
                        toolID = ITEM_CHONOFUDA;
                        break;

                    default: return false;
                } 
                if (ERROR_SLOTID == (SlotID = PChar->getStorage(LOC_INVENTORY)->SearchItem(toolID)))
                {
                    return false;
                }
            }
            else
            {
                return false;
            }
        }
        // Should only make it to this point if a ninja tool was found.

        if(ConsumeTool && rand() % 100 > PChar->getMod(MOD_NINJA_TOOL))
        {
            charutils::UpdateItem(PChar, LOC_INVENTORY, SlotID, -1);
            PChar->pushPacket(new CInventoryFinishPacket());
        }
    }
    return true;
}

CBattleEntity* getAvailableTrickAttackChar(CBattleEntity* taUser, CBattleEntity* PMob)
{					
	if (taUser->PParty != NULL)
    {
		if (taUser->PParty->m_PAlliance != NULL)
        {
			for(uint8 a = 0; a < taUser->PParty->m_PAlliance->partyList.size(); ++a)
            {
				for(uint8 i = 0; i < taUser->PParty->m_PAlliance->partyList.at(a)->members.size(); ++i)
                {
					if (abs(taUser->PParty->m_PAlliance->partyList.at(a)->members.at(i)->loc.p.rotation - taUser->loc.p.rotation) < 23 &&
					    abs(PMob->loc.p.rotation - taUser->PParty->m_PAlliance->partyList.at(a)->members.at(i)->loc.p.rotation) < 23)
                    {
									
						float distancePartyChar = distance(taUser->PParty->m_PAlliance->partyList.at(a)->members.at(i)->loc.p,PMob->loc.p);
						float distanceTaChar = distance(taUser->loc.p,PMob->loc.p);
								
						//is the party char closer to the mob than the TA user?
						if(distancePartyChar < distanceTaChar)
                        {
							return taUser->PParty->m_PAlliance->partyList.at(a)->members.at(i);
						}
					}
				}
			}
		}else{//no alliance
			for(uint8 i = 0; i < taUser->PParty->members.size(); ++i)
            {
				if(abs(taUser->PParty->members.at(i)->loc.p.rotation - taUser->loc.p.rotation) < 23 &&
				abs(PMob->loc.p.rotation - taUser->PParty->members.at(i)->loc.p.rotation) < 23)
                {

					float distancePartyChar = distance(taUser->PParty->members.at(i)->loc.p,PMob->loc.p);
					float distanceTaChar = distance(taUser->loc.p,PMob->loc.p);

					//is the party char closer to the mob than the TA user?
					if(distancePartyChar < distanceTaChar)
                    {
						return taUser->PParty->members.at(i);
					}
				}
			}
		}
	}
//no Trick attack party member available
return NULL;
}

/************************************************************************
*                                                                       *
*  Adds enmity to PSource for all the MOB targets who have              *
*  PTarget on their enmity list.                                        *
*                                                                       *
************************************************************************/

void GenerateCureEnmity(CBattleEntity* PSource, CBattleEntity* PTarget, uint16 amount)
{
	DSP_DEBUG_BREAK_IF(PSource == NULL);
	DSP_DEBUG_BREAK_IF(PTarget == NULL);
    DSP_DEBUG_BREAK_IF(amount < 0);
	DSP_DEBUG_BREAK_IF(PSource->objtype != TYPE_PC);
	
	CCharEntity* PChar = (CCharEntity*)PSource;
	
    for (SpawnIDList_t::const_iterator it = PChar->SpawnMOBList.begin();  it != PChar->SpawnMOBList.end(); ++it)
    {
		CMobEntity* PCurrentMob = (CMobEntity*)it->second;
		
		if(PCurrentMob->PEnmityContainer->HasTargetID(PTarget->id))
        {
            PCurrentMob->PEnmityContainer->UpdateEnmityFromCure(PChar, PTarget->GetMLevel(), amount,(amount == 65535)); //true for "cure v"
		}
	}
}


}; 
