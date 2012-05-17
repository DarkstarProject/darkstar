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

#include "packets/char_health.h"
#include "packets/char_update.h"
#include "packets/entity_update.h"
#include "packets/message_basic.h"

#include "ability.h"
#include "charutils.h"
#include "battleutils.h"
#include "map.h"
#include "spell.h"
#include "trait.h" 
#include "weapon_skill.h"
#include "mobskill.h"
#include "mobentity.h"
#include "petentity.h"
#include "enmity_container.h"


/************************************************************************
*	lists used in battleutils											*
************************************************************************/

uint16 g_SkillTable[100][12];									// All Skills by level/skilltype
uint8  g_EnmityTable[100][2];		                            // Holds Enmity Modifier Values
uint8  g_SkillRanks[MAX_SKILLTYPE][MAX_JOBTYPE];				// Holds skill ranks by skilltype and job

CAbility*	  g_PAbilityList[MAX_ABILITY_ID];					// Complete Abilities List
CWeaponSkill* g_PWeaponSkillList[MAX_WEAPONSKILL_ID];			// Holds all Weapon skills
CMobSkill*    g_PMobSkillList[MAX_MOBSKILL_ID];					// List of mob skills

std::list<CAbility*>     g_PAbilitiesList[MAX_JOBTYPE];			// Abilities List By Job Type
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
			uint8 SkillID = cap_value((uint8)Sql_GetIntData(SqlHandle,0), 0, MAX_SKILLTYPE-1);

			for (uint32 y = 1; y < MAX_JOBTYPE; ++y) 
			{
				g_SkillRanks[SkillID][y] = cap_value((uint16)Sql_GetIntData(SqlHandle,y), 0, 11);
			}
		}
	}
}

/************************************************************************
*  Load Abilities from Database											*
************************************************************************/

void LoadAbilitiesList()
{
	memset(g_PAbilityList,0,sizeof(g_PAbilityList));

	const int8* fmtQuery = "SELECT abilityId, name, job, level, validTarget, recastTime, animation, `range`, isAOE, recastId, CE, VE \
							FROM abilities \
                            WHERE job > 0 AND job < %u AND abilityId < %u \
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
			PAbility->setCE(Sql_GetIntData(SqlHandle,10));
			PAbility->setVE(Sql_GetIntData(SqlHandle,11));

			g_PAbilityList[PAbility->getID()] = PAbility;
			g_PAbilitiesList[PAbility->getJob()].push_back(PAbility);
		}
	}
}

/************************************************************************
*  Load Weapon Skills from database										*
************************************************************************/

void LoadWeaponSkillsList()
{
	memset(g_PWeaponSkillList,0,sizeof(g_PWeaponSkillList));

	const int8* fmtQuery = "SELECT weaponskillid, name, jobs, type, skilllevel, element, animation, `range`, aoe \
							FROM weapon_skills \
							WHERE weaponskillid < %u \
							ORDER BY type, skilllevel ASC";

	int32 ret = Sql_Query(SqlHandle, fmtQuery, MAX_WEAPONSKILL_ID);

	if( ret != SQL_ERROR && Sql_NumRows(SqlHandle) != 0)
	{
		while(Sql_NextRow(SqlHandle) == SQL_SUCCESS) 
		{
			CWeaponSkill* PWeaponSkill = new CWeaponSkill(Sql_GetIntData(SqlHandle,0));
			
			PWeaponSkill->setName(Sql_GetData(SqlHandle,1));
			PWeaponSkill->setJob(Sql_GetData(SqlHandle,2));
			PWeaponSkill->setType(Sql_GetIntData(SqlHandle,3));
			PWeaponSkill->setSkillLevel(Sql_GetIntData(SqlHandle,4));
			PWeaponSkill->setElement(Sql_GetIntData(SqlHandle,5));
			PWeaponSkill->setAnimationId(Sql_GetIntData(SqlHandle,6));
			PWeaponSkill->setRange(Sql_GetIntData(SqlHandle,7));
			PWeaponSkill->setAoe(Sql_GetIntData(SqlHandle,8));
			
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
			g_PMobSkillList[PMobSkill->getID()] = PMobSkill;
			g_PMobFamilySkills[PMobSkill->getfamilyID()].push_back(PMobSkill);
		}
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
*	Get Ability By ID													*
************************************************************************/

CAbility* GetAbility(uint16 AbilityID)
{
	if (AbilityID < MAX_ABILITY_ID)
	{
		//ShowDebug(CL_GREEN"Getting CurrentAbility %u \n"CL_RESET, g_PAbilityList[AbilityID]->getID());
		return g_PAbilityList[AbilityID];
	}
	ShowFatalError(CL_RED"AbilityID <%u> is out of range\n"CL_RESET, AbilityID);
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
*                                                                       *
*  Get Enmity Modifier                                                  *
*                                                                       *
************************************************************************/

uint8 GetEnmityMod(uint8 level, uint8 modType)
{
    DSP_DEBUG_BREAK_IF(level >= 100);
    DSP_DEBUG_BREAK_IF(modType >= 2);
    
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

/************************************************************************
*																		*
*  Calculates damage based on damage and resistance to damage type		*
*																		*
************************************************************************/

uint16 TakePhysicalDamage(CBattleEntity* PAttacker, CBattleEntity* PDefender, int16 damage)
{
	if (PDefender->StatusEffectContainer->HasStatusEffect(EFFECT_INVINCIBLE))
	{
		damage = 0;
	}

    damage = (damage * (100 + PDefender->getMod(MOD_DMG) + PDefender->getMod(MOD_DMGPHYS)))/100;

	switch(PAttacker->m_Weapons[SLOT_MAIN]->getDmgType())
	{
		case DAMAGE_CROSSBOW:
		case DAMAGE_GUN:
		case DAMAGE_PIERCING: damage = (damage * (PDefender->getMod(MOD_PIERCERES))) / 1000; break;
		case DAMAGE_SLASHING: damage = (damage * (PDefender->getMod(MOD_SLASHRES)))	 / 1000; break;
		case DAMAGE_IMPACT:	  damage = (damage * (PDefender->getMod(MOD_IMPACTRES))) / 1000; break;
		case DAMAGE_HTH:	  damage = (damage * (PDefender->getMod(MOD_HTHRES)))	 / 1000; break;
	}

	damage = damage - PDefender->getMod(MOD_PHALANX);
	if(damage<0){
		damage = 0;
	}

	if(damage>0 && PDefender->getMod(MOD_STONESKIN) >= damage){
		PDefender->addModifier(MOD_STONESKIN,-damage);
		damage = 0;
		if(PDefender->getMod(MOD_STONESKIN)==0){
			//wear off
			PDefender->StatusEffectContainer->DelStatusEffect(EFFECT_STONESKIN);
		}
	}
	else if(damage>0 && PDefender->getMod(MOD_STONESKIN)>0 && PDefender->getMod(MOD_STONESKIN) < damage){
		damage = damage - PDefender->getMod(MOD_STONESKIN);
		PDefender->StatusEffectContainer->DelStatusEffect(EFFECT_STONESKIN);
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
        if (PDefender->PBattleAI->GetCurrentAction() == ACTION_MAGIC_CASTING &&
            PDefender->PBattleAI->GetCurrentSpell()->getSpellGroup() != SPELLGROUP_SONG)
        { //try to interrupt the spell
            if (TryInterruptSpell(PAttacker,PDefender))
            {
				if(PDefender->objtype == TYPE_PC){
					CCharEntity* PChar = (CCharEntity*) PDefender;
					PChar->pushPacket(new CMessageBasicPacket(PChar, PChar, 0, 0, 16)); 
				}
                PDefender->PBattleAI->SetCurrentAction(ACTION_MAGIC_INTERRUPT);
            }
        }

		float baseTp = CalculateBaseTP((PAttacker->m_Weapons[SLOT_MAIN]->getDelay() * 60) / 1000);
		PAttacker->addTP(baseTp*(1.0f+0.01f*(float)PAttacker->getMod(MOD_STORETP)));
		//PAttacker->addTP(20);
		//account for attacker's subtle blow which reduces the baseTP gain for the defender
		baseTp = baseTp * ((100.0f -cap_value((float)PAttacker->getMod(MOD_SUBTLE_BLOW),0.0f,50.0f)) / 100.0f);

		//mobs hit get basetp+3 whereas pcs hit get basetp/3
		if(PDefender->objtype == TYPE_PC){
			//yup store tp counts on hits taken too!
			PDefender->addTP((baseTp/3) *(1.0f+0.01f*(float)PDefender->getMod(MOD_STORETP)));
		}
		else{
			PDefender->addTP((baseTp+3) *(1.0f+0.01f*(float)PDefender->getMod(MOD_STORETP)));
		}

        if (PAttacker->objtype == TYPE_PC)
        {
            charutils::UpdateHealth((CCharEntity*)PAttacker);
        }
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
			PDefender->StatusEffectContainer->DelStatusEffectsByFlag(EFFECTFLAG_DAMAGE);
            if (PDefender->PMaster == NULL)
            {
                PDefender->addTP(TP);
            }
            ((CMobEntity*)PDefender)->PEnmityContainer->UpdateEnmityFromDamage(PAttacker, damage);
        }
        break;
		case TYPE_PET:
        {
			((CPetEntity*)PDefender)->loc.zone->PushPacket(PDefender,CHAR_INRANGE,new CEntityUpdatePacket(PDefender,ENTITY_UPDATE));
		}
		break;
    }
    if (PAttacker->objtype == TYPE_PC)
    {
        PDefender->StatusEffectContainer->DelStatusEffectsByFlag(EFFECTFLAG_ATTACK);
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
	damage = damage * (1000 + PDefender->getMod(MOD_FIRERES + PSpell->getElement())) / 1000;
	
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

		hitrate = cap_value(hitrate, 20, 95);
    }
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

	if (PAttacker->objtype == TYPE_PC && PAttacker->StatusEffectContainer->HasStatusEffect(EFFECT_SNEAK_ATTACK))
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
    float cRatio = PAttacker->ATT() / PDefender->DEF();

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
*                                                                       *
*  Chance paralysis will cause you to be paralyzed                      *
*                                                                       *
************************************************************************/

bool IsParalised(CBattleEntity* PAttacker)
{
	return (rand()%100 < cap_value(PAttacker->getMod(MOD_PARALYZE) - PAttacker->getMod(MOD_PARALYZERES), 0, 100));
}

/************************************************************************
*                                                                       *
*                                                                       *
*                                                                       *
************************************************************************/

bool IsAbsorbByShadow(CBattleEntity* PDefender)
{
    uint16 Shadow = PDefender->getMod(MOD_UTSUSEMI);

    if (Shadow != 0) 
    {
        PDefender->setModifier(MOD_UTSUSEMI, --Shadow);

        if (Shadow == 0)
        {
            PDefender->StatusEffectContainer->DelStatusEffect(EFFECT_COPY_IMAGE);
        }
        else if (Shadow < 4)
        {
            if (PDefender->objtype == TYPE_PC)
            {
                CStatusEffect* PStatusEffect = PDefender->StatusEffectContainer->GetStatusEffect(EFFECT_COPY_IMAGE, 0);

                if (PStatusEffect != NULL)
                {
                    uint16 icon = EFFECT_COPY_IMAGE_3;
                    switch (Shadow)
                    {
                        case 1: icon = EFFECT_COPY_IMAGE_1; break;
                        case 2: icon = EFFECT_COPY_IMAGE_2; break;
                    }
                    PStatusEffect->SetIcon(icon);
                    PStatusEffect->SetPower(Shadow);
                    PDefender->StatusEffectContainer->UpdateStatusIcons();
                }
            }
        }
        return true;
    }
    // TODO: blink
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

SUBEFFECT GetSkillChainEffect(CBattleEntity* PDefender, CWeaponSkill* PWeaponSkill)
{
	CStatusEffect* PEffect = PDefender->StatusEffectContainer->GetStatusEffect(EFFECT_SKILLCHAIN, 0);

	if (PEffect == NULL)
	{
        PDefender->StatusEffectContainer->AddStatusEffect(new CStatusEffect(EFFECT_SKILLCHAIN,0,PWeaponSkill->getElement(),0,6));
		return SUBEFFECT_NONE;
	}
    else
    {
        PEffect->SetStartTime(gettick());

        if (PEffect->GetPower() & LIGHT)
	    {
            if (PEffect->GetPower() & FIRE)
            {
                if (PWeaponSkill->hasElement(DARK + EARTH)) 
		        {
                    PEffect->SetPower(DARK + EARTH);
			        return SUBEFFECT_GRAVITATION;
		        }
		        if (PWeaponSkill->hasElement(THUNDER + WIND)) 
		        {
                    PEffect->SetPower(LIGHT + FIRE + THUNDER + WIND);
			        return SUBEFFECT_LIGHT;
		        }
            }
		    if (PWeaponSkill->hasElement(EARTH)) 
		    {
                PEffect->SetPower(WATER + ICE);
			    return SUBEFFECT_DISTORTION;
		    }
		    if (PWeaponSkill->hasElement(DARK)) 
		    {
                PEffect->SetPower(DARK);
			    return SUBEFFECT_COMPRESSION;
		    }
		    if (PWeaponSkill->hasElement(WATER)) 
		    {
                PEffect->SetPower(WATER);
			    return SUBEFFECT_REVERBERATION;
		    }
	    }
	    if (PEffect->GetPower() & DARK)
	    {
            if (PEffect->GetPower() & EARTH)
            {
                if (PWeaponSkill->hasElement(THUNDER + WIND)) 
		        {
                    PEffect->SetPower(THUNDER + WIND);
			        return SUBEFFECT_FRAGMENTATION;
		        }
		        if (PWeaponSkill->hasElement(WATER + ICE)) 
		        {
                    PEffect->SetPower(THUNDER + WIND + WATER + ICE);
			        return SUBEFFECT_DARKNESS;
		        }
            }
		    if (PWeaponSkill->hasElement(WIND)) 
		    {
                PEffect->SetPower(WIND);
			    return SUBEFFECT_DETONATION;
		    }
		    if (PWeaponSkill->hasElement(LIGHT)) 
		    {
                PEffect->SetPower(LIGHT);
			    return SUBEFFECT_TRANSFIXION;
		    }
	    }
	    if (PEffect->GetPower() & FIRE)
	    {
		    if (PWeaponSkill->hasElement(THUNDER)) 
		    {
                PEffect->SetPower(LIGHT + FIRE);
			    return SUBEFFECT_FUSION;
		    }
		    if (PWeaponSkill->hasElement(EARTH)) 
		    {
                PEffect->SetPower(EARTH);
			    return SUBEFFECT_SCISSION;
		    }
	    }
	    if (PEffect->GetPower() & EARTH)
	    {
		    if (PWeaponSkill->hasElement(WIND)) 
		    {
                PEffect->SetPower(WIND);
			    return SUBEFFECT_DETONATION;
		    }
		    if (PWeaponSkill->hasElement(WATER)) 
		    {
                PEffect->SetPower(WATER);
			    return SUBEFFECT_REVERBERATION;
		    }
		    if (PWeaponSkill->hasElement(FIRE)) 
		    {
                PEffect->SetPower(FIRE);
			    return SUBEFFECT_LIQUEFACATION;
		    }
	    }
	    if (PEffect->GetPower() & THUNDER)
	    {
            if (PEffect->GetPower() & WIND &&
                PWeaponSkill->hasElement(WATER + ICE)) 
            {
		        PEffect->SetPower(WATER + ICE);
			    return SUBEFFECT_DISTORTION;
            }
		    if (PWeaponSkill->hasElement(WIND)) 
		    {
                PEffect->SetPower(WIND);
			    return SUBEFFECT_DETONATION;
		    }
		    if (PWeaponSkill->hasElement(FIRE)) 
		    {
                PEffect->SetPower(FIRE);
			    return SUBEFFECT_LIQUEFACATION;
		    }
	    }
	    if (PEffect->GetPower() & WATER)
	    {
            if (PEffect->GetPower() & ICE &&
                PWeaponSkill->hasElement(LIGHT + FIRE))
            {
                PEffect->SetPower(LIGHT + FIRE);
                return SUBEFFECT_FUSION;
            }
		    if (PWeaponSkill->hasElement(ICE)) 
		    {
                PEffect->SetPower(ICE);
			    return SUBEFFECT_INDURATION;
		    }
		    if (PWeaponSkill->hasElement(THUNDER)) 
		    {
                PEffect->SetPower(THUNDER);
			    return SUBEFFECT_IMPACTION;
		    }
	    }
	    if (PEffect->GetPower() & WIND)
	    {
		    if (PWeaponSkill->hasElement(DARK)) 
		    {
                PEffect->SetPower(DARK + EARTH);
			    return SUBEFFECT_GRAVITATION;
		    }
		    if (PWeaponSkill->hasElement(EARTH)) 
		    {
                PEffect->SetPower(EARTH);
			    return SUBEFFECT_SCISSION;
		    }
	    }
	    if (PEffect->GetPower() & ICE)
	    {
            if (PWeaponSkill->hasElement(WATER))
		    {
                PEffect->SetPower(THUNDER + WIND);
			    return SUBEFFECT_FRAGMENTATION;
		    }
		    if (PWeaponSkill->hasElement(DARK)) 
		    {
                PEffect->SetPower(DARK);
			    return SUBEFFECT_COMPRESSION;
		    }
		    if (PWeaponSkill->hasElement(THUNDER))
		    {
                PEffect->SetPower(THUNDER);
			    return SUBEFFECT_IMPACTION;
		    }
	    }
        PEffect->SetPower(PWeaponSkill->getElement());
    }
    return SUBEFFECT_NONE;;
}

}; 