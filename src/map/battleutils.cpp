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

#include "lua/luautils.h"

#include "ability.h"
#include "modifier.h"
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
#include "packets/pet_sync.h"
#include "packets/char_sync.h"
#include "ai/ai_pet_dummy.h"



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
	//Unhandled Scenario
	DSP_DEBUG_BREAK_IF(true);
	return 0;
}


/************************************************************************
*                                                                       *
*  Handles damage multiplier, relic weapons ect				            *
*                                                                       *
************************************************************************/

uint32 CheckForDamageMultiplier(CItemWeapon* PWeapon, uint32 damage, uint8 hitNumber)
{
	if (PWeapon==NULL)
		return damage;

	uint32 originalDamage = damage;

	switch (PWeapon->getID())
	{
		//relic weapons have 16% (ffxiclopedia) chance to do x times damage, cannot proc with weapon skills

		// Relic: 2.5 times damage
		case 18264:		// Spharai, h2h
		case 18276:		// Excalibur, sword
		case 18282:		// Ragnarok, great sword
		case 18288:		// Guttler, axe
		case 18300:		// Gungnir, polearm
		case 18318:		// Amanomurakumo, great katana
		case 18330:		// Claustrum, staff
			if (rand()%100 > 16) return originalDamage;
			return (damage = (damage * (float)2.5));
			break;

		// Relic: 3 times damage
		case 18270:		// Mandau, dagger
		case 18312:		// Kikoku, katana
		case 18324:		// Mjollnir, club
		case 18336:		// Annihilator, marksmanship
		case 18348:		// Yoichinoyumi, archery
			if (rand()%100 >= 16) return originalDamage;
			return (damage = (damage * 3));
			break;

		// Relic: 2 times damage
		case 18294:		// Bravura, great axe
		case 18306:		// Apocalypse, scythe
			if (rand()%100 >= 16) return originalDamage;
			return (damage = (damage * 2));
			break;


		//mythic weapons, same distribution as multi attacking weapons

		// Mythic: 2 time damage
		case 19001:		// Gastraphetes(lvl75), marksmanship
		case 19007:		// Death Penalty(lvl75), marksmanship
			if (rand()%100 < 55) return originalDamage;
			return (damage = (damage * 2));
			break;


		default:
			return originalDamage;			// just to be sure
			break;
	}



}


/************************************************************************
*                                                                       *
*  Handles damage reduction gear							            *
*                                                                       *
************************************************************************/

uint32 HandleSpecialPhysicalDamageReduction(CCharEntity* PChar, uint32 damage, apAction_t* Action)
{
	// check for special damage reducing gear
	CItemArmor* PArmor = (CItemWeapon*)PChar->getStorage(LOC_INVENTORY)->GetItem(PChar->equip[SLOT_BACK]);

	uint32 originalDamage = damage;
	if(PArmor != NULL)
	{
		switch(PArmor->getID())
		{
			//shadow mantle 10% chance to annual damage
			case 13658:
				if (rand()%100 > 10) return originalDamage;
				damage = 0;
				break;


			default:
				return originalDamage;
		}
	}
	return damage;

}

uint16 CalculateSpikeDamage(CBattleEntity* PAttacker, CBattleEntity* PDefender, uint8 spikesType, uint16 damageTaken)
{
    uint16 damage = PDefender->getMod(MOD_SPIKES_DMG);
    int16 intStat = PDefender->INT();
    int16 mattStat = PDefender->getMod(MOD_MATT);

    switch(spikesType){
        case SPIKE_DREAD:
            // drain same as damage taken
            damage = damageTaken;
        break;
        case SPIKE_REPRISAL:
            damage += (float)damageTaken*0.3;
            if(PDefender->StatusEffectContainer->HasStatusEffect(EFFECT_SENTINEL)){
                // bonus
                damage *= rand()%2+1;
            }
        break;
        default:
        break;
    }

    return damage;
}

bool HandleSpikesDamage(CBattleEntity* PAttacker, CBattleEntity* PDefender, apAction_t* Action, uint16 damage)
{
    uint16 spikes = PDefender->getMod(MOD_SPIKES);
    Action->submessageID = 44;
    if(spikes)
    {
        Action->subparam = CalculateSpikeDamage(PAttacker, PDefender, spikes, damage);

        // handle level diff
        int lvlDiff = dsp_cap((PDefender->GetMLevel() - PAttacker->GetMLevel()), -5, 5)*2;

        switch(spikes){

            case SPIKE_BLAZE:
            Action->subeffect = SUBEFFECT_BLAZE_SPIKES;
            PAttacker->addHP(-Action->subparam);
            break;

            case SPIKE_ICE:
            Action->subeffect = SUBEFFECT_ICE_SPIKES;
            PAttacker->addHP(-Action->subparam);
            break;

            case SPIKE_SHOCK:
            Action->subeffect = SUBEFFECT_SHOCK_SPIKES;
            PAttacker->addHP(-Action->subparam);
            break;

            case SPIKE_DREAD:
                if(PAttacker->m_EcoSystem == SYSTEM_UNDEAD){
                    // is undead no effect
                    return false;
                } else {
                    Action->submessageID = 132;

                    PAttacker->addHP(-Action->subparam);
                    PDefender->addHP(Action->subparam);

                    if(PDefender->objtype == TYPE_PC){
                        charutils::UpdateHealth((CCharEntity*)PDefender);
                    }

                    Action->subeffect = SUBEFFECT_DREAD_SPIKES;
                }
            break;

            case SPIKE_REPRISAL:
                if(Action->reaction == REACTION_BLOCK){
                    Action->subeffect = SUBEFFECT_REPRISAL;
                    PAttacker->addHP(-Action->subparam);
                } else {
                    // only works on shield blocks
                    return false;
                }
            break;
        }

        if(PAttacker->objtype == TYPE_PC){
            charutils::UpdateHealth((CCharEntity*)PAttacker);
        }

        Action->flag = 2;
        return true;
    } else if(PDefender->objtype == TYPE_PC){
        CCharEntity* PCharDef = (CCharEntity*)PDefender;
        bool activate = false;
        uint8 chance;
        SUBEFFECT spikesEffect = (SUBEFFECT)0;
        uint8 damage;


        // SHIELD
        CItem* PItem = PCharDef->getStorage(LOC_INVENTORY)->GetItem(PCharDef->equip[SLOT_SUB]);

        if(PItem){
            switch(PItem->getID())
            {
                case 16169: //collaber shield
                spikesEffect = SUBEFFECT_BLAZE_SPIKES;
                damage = 28;
                chance = 25;
                break;
                case 12305: // ice shield
                spikesEffect = SUBEFFECT_ICE_SPIKES;
                damage = 20;
                chance = 25;
                break;
                case 12357: // ice shield +1
                spikesEffect = SUBEFFECT_ICE_SPIKES;
                damage = 25;
                chance = 30;
                break;
            }

            if(spikesEffect && HandleSpikesEquip(PAttacker, PDefender, Action, damage, spikesEffect, chance)){
                return true;
            }
        }

        // BODY
        // deal with spikesEffect effect gear
        PItem = PCharDef->getStorage(LOC_INVENTORY)->GetItem(PCharDef->equip[SLOT_BODY]);

        if(PItem){
            spikesEffect = (SUBEFFECT)0;
            switch(PItem->getID())
            {
                case 13782: // ninja chainmail
                spikesEffect = SUBEFFECT_BLAZE_SPIKES;
                damage = 25;
                chance = 25;
                break;
                case 14485: // ninja chainmail +1
                spikesEffect = SUBEFFECT_SHOCK_SPIKES;
                damage = 25;
                chance = 25;
                break;
                case 14376: // rasetsu samue
                spikesEffect = SUBEFFECT_SHOCK_SPIKES;
                damage = 15;
                chance = 25;
                break;
                case 14377: // rasetsu samue +1
                spikesEffect = SUBEFFECT_SHOCK_SPIKES;
                damage = 20;
                chance = 30;
                break;
                case 13705: //ogre jerkin
                spikesEffect = SUBEFFECT_ICE_SPIKES;
                damage = 20;
                chance = 25;
                break;
                case 14366: //ogre jerkin +1
                spikesEffect = SUBEFFECT_ICE_SPIKES;
                damage = 25;
                chance = 30;
                break;
                case 12597: // war aketon
                spikesEffect = SUBEFFECT_BLAZE_SPIKES;
                damage = 25;
                chance = 25;
                break;
                case 13771: // war aketon +1
                spikesEffect = SUBEFFECT_BLAZE_SPIKES;
                damage = 30;
                chance = 30;
                break;
                case 14420: // igqira_weskit
                spikesEffect = SUBEFFECT_CURSE_SPIKES;
				damage = 0;
                chance = 30;
                break;
                case 14421: // genie_weskit
                spikesEffect = SUBEFFECT_CURSE_SPIKES;
				damage = 0;
                chance = 35;
                break;
            }

            if(spikesEffect && HandleSpikesEquip(PAttacker, PDefender, Action, damage, spikesEffect, chance)){
                //body activated return
                return true;
            }
        }

        // LEGS
        PItem = PCharDef->getStorage(LOC_INVENTORY)->GetItem(PCharDef->equip[SLOT_LEGS]);

        if(PItem){
            spikesEffect = (SUBEFFECT)0;
            switch(PItem->getID())
            {
                case 12880: // ogre trousers
                spikesEffect = SUBEFFECT_ICE_SPIKES;
                damage = 15;
                chance = 20;
                break;
                case 14279: // ogre trousers +1
                spikesEffect = SUBEFFECT_ICE_SPIKES;
                damage = 20;
                chance = 25;
                break;
                case 14299: // rasetsu hakama
                spikesEffect = SUBEFFECT_ICE_SPIKES;
                damage = 15;
                chance = 20;
                break;
                case 14300: // rasetsu hakama +1
                spikesEffect = SUBEFFECT_ICE_SPIKES;
                damage = 20;
                chance = 25;
                break;
                case 12853: // war brais
                spikesEffect = SUBEFFECT_BLAZE_SPIKES;
                damage = 20;
                chance = 20;
                break;
                case 14238: // war brais +1
                spikesEffect = SUBEFFECT_BLAZE_SPIKES;
                damage = 25;
                chance = 25;
                break;
                case 14321: // igqira_lappas
                spikesEffect = SUBEFFECT_CURSE_SPIKES;
				damage = 0;
                chance = 25;
                break;
                case 14322: // genie_lappas
                spikesEffect = SUBEFFECT_CURSE_SPIKES;
				damage = 0;
                chance = 30;
                break;
            }

            if(spikesEffect && HandleSpikesEquip(PAttacker, PDefender, Action, damage, spikesEffect, chance)){
                return true;
            }
        }

        // HEAD
        PItem = PCharDef->getStorage(LOC_INVENTORY)->GetItem(PCharDef->equip[SLOT_HEAD]);

        if(PItem){
            spikesEffect = (SUBEFFECT)0;
            switch(PItem->getID())
            {
                case 16125: // breeder mask
                spikesEffect = SUBEFFECT_BLAZE_SPIKES;
                damage = 20;
                chance = 15;
                break;
                case 13925: // rasetsu_jinpachi
                spikesEffect = SUBEFFECT_BLAZE_SPIKES;
                damage = 20;
                chance = 15;
                break;
                case 13926: // rasetsu_jinpachi +1
                spikesEffect = SUBEFFECT_BLAZE_SPIKES;
                damage = 25;
                chance = 20;
                break;
                case 13920: // wyvern helm
                spikesEffect = SUBEFFECT_BLAZE_SPIKES;
                damage = 20;
                chance = 15;
                break;
                case 13921: //wyvern helm +1
                spikesEffect = SUBEFFECT_BLAZE_SPIKES;
                damage = 25;
                chance = 20;
                break;
                case 15159: //igqira_tiara
                spikesEffect = SUBEFFECT_CURSE_SPIKES;
				damage = 0;
                chance = 20;
                break;
                case 15160: //genie_tiara
                spikesEffect = SUBEFFECT_CURSE_SPIKES;
				damage = 0;
                chance = 25;
                break;
            }

            if(spikesEffect && HandleSpikesEquip(PAttacker, PDefender, Action, damage, spikesEffect, chance)){
                return true;
            }
        }

        // HANDS
        PItem = PCharDef->getStorage(LOC_INVENTORY)->GetItem(PCharDef->equip[SLOT_HANDS]);

        if(PItem){
            spikesEffect = (SUBEFFECT)0;
            switch(PItem->getID())
            {
                case 15042: // gothic gauntlets
                case 14952: // ice gauntlets
                spikesEffect = SUBEFFECT_ICE_SPIKES;
                damage = 15;
                chance = 15;
                break;
                case 14852: // igqira_manillas
                spikesEffect = SUBEFFECT_CURSE_SPIKES;
				damage = 0;
                chance = 20;
                break;
                case 14853: // genie_manillas
                spikesEffect = SUBEFFECT_CURSE_SPIKES;
				damage = 0;
                chance = 25;
                break;
            }

            if(spikesEffect && HandleSpikesEquip(PAttacker, PDefender, Action, damage, spikesEffect, chance)){
                return true;
            }
        }

        // FEET
        PItem = PCharDef->getStorage(LOC_INVENTORY)->GetItem(PCharDef->equip[SLOT_FEET]);

        if(PItem){
            spikesEffect = (SUBEFFECT)0;
            switch(PItem->getID())
            {
                case 11402: // gothic sabatons
                spikesEffect = SUBEFFECT_ICE_SPIKES;
                damage = 15;
                chance = 15;
                break;
                case 12946: // suzakus sun-ate
                spikesEffect = SUBEFFECT_BLAZE_SPIKES;
                damage = 20;
                chance = 20;
                break;
                case 11392: // koschei crackows
                spikesEffect = SUBEFFECT_CURSE_SPIKES;
				damage = 0;
                chance = 20;
                break;
            }

            if(spikesEffect && HandleSpikesEquip(PAttacker, PDefender, Action, damage, spikesEffect, chance)){
                return true;
            }
        }
    }

    return false;
}

bool HandleSpikesEquip(CBattleEntity* PAttacker, CBattleEntity* PDefender, apAction_t* Action, uint8 damage, SUBEFFECT spikesType, uint8 chance)
{
    int lvlDiff = dsp_cap((PDefender->GetMLevel() - PAttacker->GetMLevel()), -5, 5)*2;

    if(rand()%100 <= chance+lvlDiff){
        // spikes landed
        Action->subeffect = spikesType;
        Action->flag = 2;

        if(spikesType == SUBEFFECT_CURSE_SPIKES){
            Action->submessageID = 0; // log says nothing?
            Action->subparam = EFFECT_CURSE;
        } else {
            uint8 ratio = (float)damage/4;
            Action->subparam = damage - rand()%ratio + rand()%ratio;
            PAttacker->addHP(-Action->subparam);
        }

        return true;
    }

    return false;
}

void HandleSpikesStatusEffect(CBattleEntity* PAttacker, apAction_t* Action)
{
    int lvlDiff = 0;
    if( Action->ActionTarget ){
        lvlDiff = dsp_cap((Action->ActionTarget->GetMLevel() - PAttacker->GetMLevel()), -5, 5)*2;
    }
    switch(Action->subeffect)
	{
        case SUBEFFECT_CURSE_SPIKES:
            if(PAttacker->StatusEffectContainer->HasStatusEffect(EFFECT_CURSE) == false){
                PAttacker->StatusEffectContainer->AddStatusEffect(new CStatusEffect(EFFECT_CURSE, EFFECT_CURSE, 15, 0, 180));
            }
        break;
		case SUBEFFECT_ICE_SPIKES:
		{
			if(rand()%100 <= 30+lvlDiff && PAttacker->StatusEffectContainer->HasStatusEffect(EFFECT_PARALYSIS) == false){
				PAttacker->StatusEffectContainer->AddStatusEffect(new CStatusEffect(EFFECT_PARALYSIS, EFFECT_PARALYSIS, 20, 0, 30));
			}
			break;
		}
		case SUBEFFECT_SHOCK_SPIKES:
		{
            if(rand()%100 <= 30+lvlDiff && PAttacker->StatusEffectContainer->HasStatusEffect(EFFECT_STUN) == false){
                PAttacker->StatusEffectContainer->AddStatusEffect(new CStatusEffect(EFFECT_STUN, EFFECT_STUN, 1, 0, 3));
            }
			break;
		}
		default:
			break;
	}
}

/************************************************************************
*                                                                       *
*  Handles Enspell effect and damage						            *
*                                                                       *
************************************************************************/

void HandleEnspell(CCharEntity* PAttacker, CBattleEntity* PDefender, apAction_t* Action, uint8 hitNumber, uint16 delay, uint16 finaldamage)
{
	// Enspell overwrites weapon effects

	 if (PAttacker->getMod(MOD_ENSPELL) > 0)
	 {
		switch(PAttacker->getMod(MOD_ENSPELL))
		{
			case ENSPELL_I_FIRE:
				Action->subeffect = SUBEFFECT_FIRE_DAMAGE;
				Action->submessageID = 163;
				Action->flag = 3;
				Action->subparam = CalculateEnspellDamage(PAttacker,PDefender,1,FIRE);
				PDefender->addHP(-Action->subparam);
				return;
			case ENSPELL_I_EARTH:
				Action->subeffect = SUBEFFECT_EARTH_DAMAGE;
				Action->submessageID = 163;
				Action->flag = 1;
				Action->subparam = CalculateEnspellDamage(PAttacker,PDefender,1,EARTH);
				PDefender->addHP(-Action->subparam);
				return;
			case ENSPELL_I_WATER:
				Action->subeffect = SUBEFFECT_WATER_DAMAGE;
				Action->submessageID = 163;
				Action->flag = 1;
				Action->subparam = CalculateEnspellDamage(PAttacker,PDefender,1,WATER);
				PDefender->addHP(-Action->subparam);
				return;
			case ENSPELL_I_WIND:
				Action->subeffect = SUBEFFECT_WIND_DAMAGE;
				Action->submessageID = 163;
				Action->flag = 3;
				Action->subparam = CalculateEnspellDamage(PAttacker,PDefender,1,WIND);
				PDefender->addHP(-Action->subparam);
				return;
			case ENSPELL_I_ICE:
				Action->subeffect = SUBEFFECT_ICE_DAMAGE;
				Action->submessageID = 163;
				Action->flag = 1;
				Action->subparam = CalculateEnspellDamage(PAttacker,PDefender,1,ICE);
				PDefender->addHP(-Action->subparam);
				return;
			case ENSPELL_I_THUNDER:
				Action->subeffect = SUBEFFECT_LIGHTNING_DAMAGE;
				Action->submessageID = 163;
				Action->flag = 3;
				Action->subparam = CalculateEnspellDamage(PAttacker,PDefender,1,THUNDER);
				PDefender->addHP(-Action->subparam);
				return;
			case ENSPELL_I_LIGHT:
				Action->subeffect = SUBEFFECT_LIGHT_DAMAGE;
				Action->submessageID = 163;
				Action->flag = 3;
				Action->subparam = CalculateEnspellDamage(PAttacker,PDefender,1,LIGHT);
				PDefender->addHP(-Action->subparam);
				return;
			case ENSPELL_I_DARK:
				Action->subeffect = SUBEFFECT_DARKNESS_DAMAGE;
				Action->submessageID = 163;
				Action->flag = 1;
				Action->subparam = CalculateEnspellDamage(PAttacker,PDefender,1,DARK);
				PDefender->addHP(-Action->subparam);
				return;
			case ENSPELL_BLOOD_WEAPON:
				Action->subeffect = SUBEFFECT_BLOOD_WEAPON;
				Action->submessageID = 167;
				Action->flag = 1;
				Action->subparam = PAttacker->addHP(Action->param);
				if(PAttacker->objtype == TYPE_PC){
					charutils::UpdateHealth((CCharEntity*)PAttacker);
				}
				return;

			// No DA or multihit works for enspell II - Retail behaviour
			case ENSPELL_II_FIRE:
				if(hitNumber>0){break;}
				Action->subeffect = SUBEFFECT_FIRE_DAMAGE;
				Action->submessageID = 163;
				Action->flag = 3;
				Action->subparam = CalculateEnspellDamage(PAttacker,PDefender,2,FIRE);
				PDefender->addHP(-Action->subparam);
				return;
			case ENSPELL_II_EARTH:
				if(hitNumber>0){break;}
				Action->subeffect = SUBEFFECT_EARTH_DAMAGE;
				Action->submessageID = 163;
				Action->flag = 1;
				Action->subparam = CalculateEnspellDamage(PAttacker,PDefender,2,EARTH);
				PDefender->addHP(-Action->subparam);
				return;
			case ENSPELL_II_WATER:
				if(hitNumber>0){break;}
				Action->subeffect = SUBEFFECT_WATER_DAMAGE;
				Action->submessageID = 163;
				Action->flag = 1;
				Action->subparam = CalculateEnspellDamage(PAttacker,PDefender,2,WATER);
				PDefender->addHP(-Action->subparam);
				return;
			case ENSPELL_II_WIND:
				if(hitNumber>0){break;}
				Action->subeffect = SUBEFFECT_WIND_DAMAGE;
				Action->submessageID = 163;
				Action->flag = 3;
				Action->subparam = CalculateEnspellDamage(PAttacker,PDefender,2,WIND);
				PDefender->addHP(-Action->subparam);
				return;
			case ENSPELL_II_ICE:
				if(hitNumber>0){break;}
				Action->subeffect = SUBEFFECT_ICE_DAMAGE;
				Action->submessageID = 163;
				Action->flag = 1;
				Action->subparam = CalculateEnspellDamage(PAttacker,PDefender,2,ICE);
				PDefender->addHP(-Action->subparam);
				return;
			case ENSPELL_II_THUNDER:
				if(hitNumber>0){break;}
				Action->subeffect = SUBEFFECT_LIGHTNING_DAMAGE;
				Action->submessageID = 163;
				Action->flag = 3;
				Action->subparam = CalculateEnspellDamage(PAttacker,PDefender,2,THUNDER);
				PDefender->addHP(-Action->subparam);
				return;
			case ENSPELL_DRAIN_SAMBA:
				if (hitNumber <= 2 &&
                         PDefender->m_EcoSystem != SYSTEM_UNDEAD &&
                         !PDefender->StatusEffectContainer->HasStatusEffect(EFFECT_DRAIN_DAZE) &&
                         PAttacker->StatusEffectContainer->HasStatusEffect(EFFECT_DRAIN_SAMBA))
				{
					PDefender->StatusEffectContainer->DelStatusEffect(EFFECT_ASPIR_DAZE);
					PDefender->StatusEffectContainer->DelStatusEffect(EFFECT_HASTE_DAZE);
				PDefender->StatusEffectContainer->AddStatusEffect(new CStatusEffect(EFFECT_DRAIN_DAZE,EFFECT_DRAIN_DAZE,10,0,10));
				}
                break;
			case ENSPELL_ASPIR_SAMBA:
				if (hitNumber <= 2 &&
                    PDefender->m_EcoSystem != SYSTEM_UNDEAD &&
                    !PDefender->StatusEffectContainer->HasStatusEffect(EFFECT_ASPIR_DAZE) && PAttacker->StatusEffectContainer->HasStatusEffect(EFFECT_ASPIR_SAMBA))
				{
					PDefender->StatusEffectContainer->DelStatusEffect(EFFECT_DRAIN_DAZE);
					PDefender->StatusEffectContainer->DelStatusEffect(EFFECT_HASTE_DAZE);
				PDefender->StatusEffectContainer->AddStatusEffect(new CStatusEffect(EFFECT_ASPIR_DAZE,EFFECT_ASPIR_DAZE,10,0,10));
				}
			case ENSPELL_HASTE_SAMBA:
				if (hitNumber <= 2 &&
                    !PDefender->StatusEffectContainer->HasStatusEffect(EFFECT_HASTE_DAZE) &&
                    PAttacker->StatusEffectContainer->HasStatusEffect(EFFECT_HASTE_SAMBA))
				{
					if (PDefender->StatusEffectContainer->HasStatusEffect(EFFECT_ASPIR_DAZE))
						PDefender->StatusEffectContainer->DelStatusEffect(EFFECT_ASPIR_DAZE);
					if (PDefender->StatusEffectContainer->HasStatusEffect(EFFECT_DRAIN_DAZE))
						PDefender->StatusEffectContainer->DelStatusEffect(EFFECT_DRAIN_DAZE);
				PDefender->StatusEffectContainer->AddStatusEffect(new CStatusEffect(EFFECT_HASTE_DAZE,EFFECT_HASTE_DAZE,10,0,10));
				}
		}
	}

    // Sambas should be done last, enspells and additional effects take priority
	// Generic drain for anyone able to do melee damage to a dazed target
	delay = delay / 10;


	if (PDefender->StatusEffectContainer->HasStatusEffect(EFFECT_DRAIN_DAZE))
	{
		uint8 Samba = rand()%((delay * 3) / 100) + 1;

        // vary damage based on lvl diff
        int8 lvlDiff = (PDefender->GetMLevel() - PAttacker->GetMLevel())/2;

        if(lvlDiff < -5){
            lvlDiff = -5;
        }

        Samba -= lvlDiff;

        if (Samba > (finaldamage / 2)){
            Samba = finaldamage / 2;
        }

        if(finaldamage <= 2){
            Samba = 0;
        }

		Action->subeffect = SUBEFFECT_HP_DRAIN;
		Action->submessageID = 161;
		Action->flag = 3;
		Action->subparam = Samba;
		PAttacker->addHP(Samba);	// does not do any additional drain to targets HP, only a portion of it
        if(PAttacker->objtype == TYPE_PC){
    		charutils::UpdateHealth(PAttacker);
        }
		return;
 	}

	if (PDefender->StatusEffectContainer->HasStatusEffect(EFFECT_ASPIR_DAZE))
	{
		uint8 Samba = Samba = rand()%(delay * 1 / 100) + 1;

		if (Samba >= finaldamage / 4) { Samba = finaldamage / 4; }

		Action->subeffect = SUBEFFECT_HP_DRAIN;
		Action->submessageID = 162;
		Action->flag = 3;
		Action->subparam = Samba;
		PAttacker->addMP(Samba);
        if(PAttacker->objtype == TYPE_PC){
    		charutils::UpdateHealth(PAttacker);
        }
		return;
	}
	if (PDefender->StatusEffectContainer->HasStatusEffect(EFFECT_HASTE_DAZE))
	{
	if (PAttacker->StatusEffectContainer->HasStatusEffect(EFFECT_HASTE)){return;}
	PAttacker->StatusEffectContainer->AddStatusEffect(new CStatusEffect(EFFECT_HASTE, EFFECT_HASTE, 50, 0, 10));
	return;
	}

    // elemental damage equation = (weapDmg / 2) +- (weapDmg / 4)

	// no enspells active, check weapon additional effects
	CItemWeapon* PWeapon = (CItemWeapon*)PAttacker->getStorage(LOC_INVENTORY)->GetItem(PAttacker->equip[SLOT_MAIN]);

	if (Action->animation == 1)
		PWeapon = (CItemWeapon*)PAttacker->getStorage(LOC_INVENTORY)->GetItem(PAttacker->equip[SLOT_SUB]);
	if(PWeapon != NULL)
	{
        EFFECT dispelled;
		switch(PWeapon->getID())
		{
			//Additional Effect: HP drain Weapons
			case 16827:
			case 16528:
			case 16824:
			case 17651:
			case 16556:
			case 16609:
			case 16580:
			case 17646:
			case 16777:
			case 16791:
			case 16846:
			case 16881:
			case 17561:
			case 17562:
			case 17778:
			case 17779:
			case 17576:
			case 17510:
				//30 % chance to drain, will heal 30% of damage done
				if (rand()%100 >= 30 || PWeapon==NULL) return;

				Action->subeffect = SUBEFFECT_HP_DRAIN;
				Action->submessageID = 161;
				Action->flag = 3;
				Action->subparam  = (float)(Action->param * 0.3f);
				PAttacker->addHP(Action->subparam);

                if(PAttacker->objtype == TYPE_PC){
    				charutils::UpdateHealth(PAttacker);
                }
				return;


			//Additional Effect: Dispel Weapons (10% chance needs verifying)
			case 16942:
			case 16944:
			case 16950:
			case 16951:
			case 18330:
				if (rand()%100 > 10) return;
				dispelled = PDefender->StatusEffectContainer->DispelStatusEffect();
                // if(dispelled > 0){
                //     Action->submessageID = 42;
                //     Action->flag = 2;
                //     Action->subeffect = SUBEFFECT_LIGHT;
                //     Action->subparam = dispelled;
                // }
				return;
			default:
				return;
		}
	}
	return;
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
	if(rand()%100 >= chance || PAmmo==NULL || PDefender->StatusEffectContainer->HasStatusEffect(EFFECT_ARROW_SHIELD, 0)){return;}

	switch(PAmmo->getID()){
    case 17325:{ // kabura_arrow

        //check wind resistance
        if(rand()%100 <= PDefender->getMod(MOD_WINDRES)){return;}

        if(PDefender->StatusEffectContainer->AddStatusEffect(
                new CStatusEffect(EFFECT_SILENCE,EFFECT_SILENCE,1,0,60))){
            Action->subeffect = SUBEFFECT_SILENCE;
            Action->subparam  = EFFECT_SILENCE;
            Action->submessageID = 160;
            Action->flag = 3;
        }
    }
    break;
    case 18159:{ // Demon Arrow

        //check water resistance
        if(rand()%100 <= PDefender->getMod(MOD_WATERRES)){return;}

        if(PDefender->StatusEffectContainer->AddStatusEffect(
                new CStatusEffect(EFFECT_ATTACK_DOWN,EFFECT_ATTACK_DOWN,12,0,60))){
            Action->subeffect = SUBEFFECT_DEFENSE_DOWN;
            Action->subparam  = EFFECT_ATTACK_DOWN;
            Action->submessageID = 160;
            Action->flag = 1;
        }

    }
    break;
    case 18160:{ // Spartan Bullet
        //check thunder resistance
        if(rand()%100 <= PDefender->getMod(MOD_THUNDERRES) && rand()%50 < 100){return;}

        if(PDefender->StatusEffectContainer->AddStatusEffect(
            new CStatusEffect(EFFECT_STUN,EFFECT_STUN,1,0,4))){
            Action->subeffect = SUBEFFECT_STUN;
            Action->subparam  = EFFECT_STUN;
            Action->submessageID = 160;
            Action->flag = 3;
        }
    }
    break;
    case 17329: // patriarch_protectors_arrow
    case 18696:{ // Paralysis Arrow
            //check ice resistance
            if(rand()%100 <= PDefender->getMod(MOD_ICERES)){return;}

            uint8 power = 20;

            if(PAmmo->getID() == 17329){
                power = 30;
            }

            if(PDefender->StatusEffectContainer->AddStatusEffect(
                new CStatusEffect(EFFECT_PARALYSIS,EFFECT_PARALYSIS,power,0,30))){
                Action->subeffect = SUBEFFECT_PARALYSIS;
                Action->subparam  = EFFECT_PARALYSIS;
                Action->submessageID = 160;
                Action->flag = 1;
            }
    }
    break;
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
            damage += (float)damage * ((float)PDefender->getMod(MOD_WINDRES)/-100);
			//set damage TODO: handle resi st/staff/day
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

            damage += (float)damage * ((float)PDefender->getMod(MOD_EARTHRES)/-100);
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
            damage += (float)damage * ((float)PDefender->getMod(MOD_WATERRES)/-100);
			Action->subparam  = damage;
			PDefender->addHP(-damage);
		}
		break;
	case 18158:{//Sleep Arrow
			if(!PDefender->isDead() && PDefender->hasImmunity(1) == false){

            int duration = 25 - (PDefender->GetMLevel() - PAttacker->GetMLevel())*5 - ((float)PDefender->getMod(MOD_LIGHTRES)/5);

            if(duration <= 1){
                duration = 1;
            } else {
                //randomize sleep duration
                duration -= rand()%(duration/2);
            }

			duration = dsp_cap(duration,1,25);
			if(PDefender->StatusEffectContainer->AddStatusEffect(
					new CStatusEffect(EFFECT_SLEEP,EFFECT_SLEEP,1,0,duration))){
                Action->subeffect = SUBEFFECT_SLEEP;
                Action->subparam  = EFFECT_SLEEP;
                Action->submessageID = 160;
                Action->flag = 3;
            }
			}
		}
		break;
	case 18157:{ //Poison Arrow

            if(PDefender->hasImmunity(256) == false){
                //check water resistance
                if(rand()%100 <= PDefender->getMod(MOD_WATERRES)){return;}

				//4hp/tick for 30secs
				if(PDefender->StatusEffectContainer->AddStatusEffect(
					new CStatusEffect(EFFECT_POISON,EFFECT_POISON,4,3,30))){
                    Action->subeffect = SUBEFFECT_POISON;
                    Action->subparam  = EFFECT_POISON;
                    Action->submessageID = 160;
                    Action->flag = 1;
                }
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
            damage += (float)damage * ((float)PDefender->getMod(MOD_LIGHTRES)/-100);
			Action->subparam  = damage;
			PDefender->addHP(-damage);
		}
		break;
	case 18151:{ //Bloody Bolt

        //check dark resistance
        if(PDefender->m_EcoSystem == SYSTEM_UNDEAD ||
           rand()%100 <= PDefender->getMod(MOD_DARKRES)){return;}
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

            damage += (float)damage * ((float)PDefender->getMod(MOD_DARKRES)/-100);

			Action->subparam  = damage;
			PDefender->addHP(-damage);
			PAttacker->addHP(damage);
			charutils::UpdateHealth(PAttacker);
		}
		break;
	case 18152:{ //Venom Bolt
			if(PDefender->hasImmunity(256) == false){
                //check water resistance
                if(rand()%100 <= PDefender->getMod(MOD_WATERRES)){return;}

				//4hp/tick for 30secs
				if(PDefender->StatusEffectContainer->AddStatusEffect(
					new CStatusEffect(EFFECT_POISON,EFFECT_POISON,4,3,30))){
                    Action->subeffect = SUBEFFECT_POISON;
                    Action->subparam  = EFFECT_POISON;
                    Action->submessageID = 160;
                    Action->flag = 1;
                }
			}
		}
		break;
	case 18150:{//Blind Bolt
			if(PDefender->hasImmunity(64) == false){
                //check dark resistance
                if(rand()%100 <= PDefender->getMod(MOD_DARKRES)){return;}

                if(PDefender->StatusEffectContainer->AddStatusEffect(
                    new CStatusEffect(EFFECT_BLINDNESS,EFFECT_BLINDNESS,10,0,30))){
    				Action->subeffect = SUBEFFECT_BLIND;
    				Action->subparam  = EFFECT_BLINDNESS;
    				Action->submessageID = 160;
    				Action->flag = 1;
                }
			}
		}
		break;
	case 18149:{//Sleep Bolt
			if(!PDefender->isDead() && PDefender->hasImmunity(1) == false){

			int duration = 25 - (PDefender->GetMLevel() - PAttacker->GetMLevel())*5 - ((float)PDefender->getMod(MOD_LIGHTRES)/5);

            if(duration <= 1){
                duration = 1;
            } else {
                //randomize sleep duration
                duration -= rand()%(duration/2);
            }

            duration = dsp_cap(duration,1,25);

			if(PDefender->StatusEffectContainer->AddStatusEffect(
					new CStatusEffect(EFFECT_SLEEP,EFFECT_SLEEP,1,0,duration))){

                Action->subeffect = SUBEFFECT_SLEEP;
                Action->subparam  = EFFECT_SLEEP;
                Action->submessageID = 160;
                Action->flag = 3;
            }
			}
		}
		break;
	case 18148:{ //Acid Bolt

            //check wind resistance
            if(rand()%100 <= PDefender->getMod(MOD_WINDRES)){return;}

            if(PDefender->StatusEffectContainer->AddStatusEffect(
                    new CStatusEffect(EFFECT_DEFENSE_DOWN,EFFECT_DEFENSE_DOWN,12,0,60))){
        		Action->subeffect = SUBEFFECT_DEFENSE_DOWN;
        		Action->subparam  = EFFECT_DEFENSE_DOWN;
        		Action->submessageID = 160;
        		Action->flag = 1;
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
            damage += (float)damage * ((float)PDefender->getMod(MOD_THUNDERRES)/-100);
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
            damage += (float)damage * ((float)PDefender->getMod(MOD_ICERES)/-100);
			Action->subparam  = damage;
			PDefender->addHP(-damage);
		}
		break;
    case 17327: // Grand knights Arrow
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
            damage += (float)damage * ((float)PDefender->getMod(MOD_FIRERES)/-100);

            if(PAmmo->getID() == 17327){
                damage *= 2;
            }

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
        // NOTE this is handled as a mobskill
		return 95;
	}

	int eva = PDefender->EVA();
	hitrate = hitrate + (acc - eva) / 2 + (PAttacker->GetMLevel() - PDefender->GetMLevel())*2;
	uint8 finalhitrate = dsp_cap(hitrate, 20, 95);
	return finalhitrate;
}

//todo: need to penalise attacker's RangedAttack depending on distance from mob. (% decrease)
float GetRangedPDIF(CBattleEntity* PAttacker, CBattleEntity* PDefender)
{

	//get ranged attack value
	uint16 rAttack = 1;
    // return zero if arrow shield active
    if (PDefender->StatusEffectContainer->HasStatusEffect(EFFECT_ARROW_SHIELD, 0))
    {
        return 0;
    }

	if(PAttacker->objtype == TYPE_PC)
	{
		CCharEntity* PChar = (CCharEntity*)PAttacker;
		CItemWeapon* PItem = (CItemWeapon*)PChar->getStorage(LOC_INVENTORY)->GetItem(PChar->equip[SLOT_RANGED]);

		if (PItem != NULL && (PItem->getType() & ITEM_WEAPON))
		{
			rAttack = PChar->RATT(PItem->getSkillType());
		}
		else
		{
			PItem = (CItemWeapon*)PChar->getStorage(LOC_INVENTORY)->GetItem(PChar->equip[SLOT_AMMO]);

			if (PItem == NULL || !(PItem->getType() & ITEM_WEAPON) || (PItem->getSkillType() != SKILL_THR)){
				ShowDebug("battleutils::GetRangedPDIF Cannot find a valid ranged weapon to calculate PDIF for. \n");
			}
			else
			{
				rAttack = PChar->RATT(PItem->getSkillType());
			}
		}
	}
	else
	{
		//assume mobs capped
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

	if(ratio < 0.9)
	{
		minPdif = ratio;
		maxPdif = (10.0f/9.0f) * ratio;
	}
	else if(ratio <= 1.1)
	{
		minPdif = 1;
		maxPdif = 1;
	}
	else if(ratio <= 3)
	{
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
    if(isFaceing(PDefender->loc.p, PAttacker->loc.p, 40) && !PDefender->isAsleep())
    {
        return (rand() % 100 < battleutils::GetParryRate(PAttacker, PDefender));
    }

    return false;
}

bool IsGuarded(CBattleEntity* PAttacker, CBattleEntity* PDefender)
{
    if(isFaceing(PDefender->loc.p, PAttacker->loc.p, 40) && !PDefender->isAsleep())
    {
        return(rand() % 100 < battleutils::GetGuardRate(PAttacker, PDefender));
    }

    return false;
}

bool IsBlocked(CBattleEntity* PAttacker, CBattleEntity* PDefender)
{
	if(isFaceing(PDefender->loc.p, PAttacker->loc.p, 40) && !PDefender->isAsleep())
    {
        return(rand() % 100 < battleutils::GetBlockRate(PAttacker, PDefender));
    }

    return false;
}

bool TryInterruptSpell(CBattleEntity* PAttacker, CBattleEntity* PDefender){

	//Reasonable assumption for the time being.
	int base = 40;

	int diff = PAttacker->GetMLevel() - PDefender->GetMLevel();

	if (PDefender->objtype == TYPE_MOB) {
		base = 5;
	}

	float check = base + diff;
	uint8 meritReduction = 0;

	if(PDefender->objtype==TYPE_PC) { //Check player's skill.
		//For mobs, we can assume their skill is capped at their level, so this term is 1 anyway.
		CCharEntity* PChar = (CCharEntity*)PDefender;
		float skill = PChar->GetSkill(PChar->PBattleAI->GetCurrentSpell()->getSkillType());
		if(skill <= 0) {
			skill = 1;
		}

		float cap = GetMaxSkill((SKILLTYPE)PChar->PBattleAI->GetCurrentSpell()->getSkillType(), PChar->GetMJob(), PChar->GetMLevel());

		//if cap is 0 then player is using a spell from their subjob
		if (cap == 0)
		{
			cap = GetMaxSkill((SKILLTYPE)PChar->PBattleAI->GetCurrentSpell()->getSkillType(), PChar->GetSJob(),
				PChar->GetSLevel()); // << this might be GetMLevel, however this leaves no chance of avoiding interuption
		}

		if(skill > cap)
			skill = cap;

		float ratio = (float)cap/skill;
		check *= ratio;

		//prevent from spilling over 100 - resulting in players never being interupted
		if (check > 100) check = 100;

		//apply any merit reduction
		meritReduction = ((CCharEntity*)PDefender)->PMeritPoints->GetMeritValue(MERIT_SPELL_INTERUPTION_RATE,PDefender->GetMLevel());
	}

	float aquaveil = ((float)((100.0f - (meritReduction + (float)PDefender->getMod(MOD_SPELLINTERRUPT)))/100.0f));
	check *= aquaveil;
	uint8 chance = rand()%100;

	// caps, always give a 1% chance of interrupt
	if (check < 1) {
		check = 0;
	}

	if(chance < check)
	{
		//Interrupt the spell cast.
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

uint16 TakePhysicalDamage(CBattleEntity* PAttacker, CBattleEntity* PDefender, int16 damage, bool isBlocked, uint8 slot, uint16 tpMultiplier, CBattleEntity* taChar, bool giveTPtoVictim)
{
	if(PAttacker->StatusEffectContainer->HasStatusEffect(EFFECT_FORMLESS_STRIKES))
	{
		uint8 formlessMod = 70;

		if (PAttacker->objtype == TYPE_PC)
			formlessMod += ((CCharEntity*)PAttacker)->PMeritPoints->GetMeritValue(MERIT_FORMLESS_STRIKES, PAttacker->GetMLevel());

		damage = damage * formlessMod / 100;
	}
	else
	{
		if (PDefender->StatusEffectContainer->HasStatusEffect(EFFECT_INVINCIBLE, 0) || PDefender->StatusEffectContainer->HasStatusEffect(EFFECT_PHYSICAL_SHIELD, 0))
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
		if(PAttacker->objtype == TYPE_MOB && PAttacker->PMaster == NULL)
		{
			//uncharmed mob still attacking another mob - dont allow 2 mobs to go purple
		}
		else
		{
			PDefender->m_OwnerID.id = PAttacker->id;
			PDefender->m_OwnerID.targid = PAttacker->targid;
		}
    }

    float TP = 0;
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

            //if the mob is charmed by player
            if(PDefender->PMaster != NULL && PDefender->PMaster->objtype == TYPE_PC)
            {
                ((CPetEntity*)PDefender)->loc.zone->PushPacket(PDefender, CHAR_INRANGE, new CEntityUpdatePacket(PDefender, ENTITY_UPDATE));
            }

        }
        break;
        case TYPE_PET:
        {
            ((CPetEntity*)PDefender)->loc.zone->PushPacket(PDefender, CHAR_INRANGE, new CEntityUpdatePacket(PDefender, ENTITY_UPDATE));
        }
        break;
    }

    if (damage > 0)
    {

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

		if((slot==SLOT_RANGED || slot==SLOT_AMMO) && PAttacker->objtype == TYPE_PC)
		{
			CCharEntity* PChar = (CCharEntity*)PAttacker;
			CItemWeapon* PAmmo = (CItemWeapon*)PChar->getStorage(LOC_INVENTORY)->GetItem(PChar->equip[SLOT_AMMO]);

			int delay = 0; uint16 offset = 240;

			delay = PAttacker->GetRangedWeaponDelay(true);

			baseTp = CalculateBaseTP((delay * 110) / 1000);
		}
		else
        {
			int16 delay = PAttacker->GetWeaponDelay(true);

			if (PAttacker->m_Weapons[SLOT_SUB]->getDmgType() > 0 &&
				PAttacker->m_Weapons[SLOT_SUB]->getDmgType() < 4 &&
				PAttacker->m_Weapons[slot]->getDmgType() != DAMAGE_HTH)
			{
				delay = delay / 2;
			}

            float ratio = 1.0f;

            if(PAttacker->m_Weapons[slot]->getDmgType() == DAMAGE_HTH)
            {
                ratio = 2.0f;
            }

            baseTp = CalculateBaseTP((delay * 60) / 1000) / ratio;
		}


		// add to to attacker
		PAttacker->addTP( tpMultiplier * (baseTp * (1.0f + 0.01f * (float)(PAttacker->getMod(MOD_STORETP) + getStoreTPbonusFromMerit(PAttacker)))));

		if (giveTPtoVictim == true)
		{
			//account for attacker's subtle blow which reduces the baseTP gain for the defender
			baseTp = baseTp * ((100.0f - dsp_cap((float)PAttacker->getMod(MOD_SUBTLE_BLOW), 0.0f, 50.0f)) / 100.0f);

			//mobs hit get basetp+3 whereas pcs hit get basetp/3
			if(PDefender->objtype == TYPE_PC)
			{
				//yup store tp counts on hits taken too!
				PDefender->addTP((baseTp / 3) * (1.0f + 0.01f * (float)(PDefender->getMod(MOD_STORETP) + getStoreTPbonusFromMerit(PAttacker))));
			}
			else
			{
				PDefender->addTP((baseTp + 3) * (1.0f + 0.01f * (float)PDefender->getMod(MOD_STORETP)));
			}
		}


        if (PAttacker->objtype == TYPE_PC)
            charutils::UpdateHealth((CCharEntity*)PAttacker);
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

    if (PDefender->StatusEffectContainer->HasStatusEffect(EFFECT_MAGIC_SHIELD, 0))
    {
        damage = 0;
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
*  attackNumber: 0=main, 1=sub, 2=kick									*
*																		*
************************************************************************/

uint8 GetHitRateEx(CBattleEntity* PAttacker, CBattleEntity* PDefender, uint8 attackNumber, uint8 offsetAccuracy) //subWeaponAttack is for calculating acc of dual wielded sub weapon
{
    int32 hitrate = 75;

	if (PAttacker->objtype == TYPE_PC && ((PAttacker->StatusEffectContainer->HasStatusEffect(EFFECT_SNEAK_ATTACK) && abs(PDefender->loc.p.rotation - PAttacker->loc.p.rotation) < 23) ||
		(charutils::hasTrait((CCharEntity*)PAttacker, TRAIT_ASSASSIN) && PAttacker->StatusEffectContainer->HasStatusEffect(EFFECT_TRICK_ATTACK) && battleutils::getAvailableTrickAttackChar(PAttacker, PDefender))))
    {
		hitrate = 100; //attack with SA active or TA/Assassin cannot miss
	}
    else
    {
		hitrate = hitrate + (PAttacker->ACC(attackNumber,offsetAccuracy) - PDefender->EVA()) / 2 + (PAttacker->GetMLevel() - PDefender->GetMLevel())*2;

		hitrate = dsp_cap(hitrate, 20, 95);
    }
	return (uint8)hitrate;
}
uint8 GetHitRate(CBattleEntity* PAttacker, CBattleEntity* PDefender)
{
	return GetHitRateEx(PAttacker, PDefender, 0, 0); //assume attack 0(main)
}
uint8 GetHitRate(CBattleEntity* PAttacker, CBattleEntity* PDefender, uint8 attackNumber)
{
	return GetHitRateEx(PAttacker, PDefender, attackNumber, 0);
}
uint8 GetHitRate(CBattleEntity* PAttacker, CBattleEntity* PDefender, uint8 attackNumber, uint8 offsetAccuracy)
{
	return GetHitRateEx(PAttacker, PDefender, attackNumber, offsetAccuracy);
}

/************************************************************************
*																		*
*  Crit Rate															*
*																		*
************************************************************************/

uint8 GetCritHitRate(CBattleEntity* PAttacker, CBattleEntity* PDefender, bool ignoreSneakTrickAttack)
{
	int32 crithitrate = 5;
	if(PAttacker->StatusEffectContainer->HasStatusEffect(EFFECT_MIGHTY_STRIKES,0) ||
		PAttacker->StatusEffectContainer->HasStatusEffect(EFFECT_MIGHTY_STRIKES)){
			return 100;
	}
	else if (PAttacker->objtype == TYPE_PC && (!ignoreSneakTrickAttack) && PAttacker->StatusEffectContainer->HasStatusEffect(EFFECT_SNEAK_ATTACK))
	{

		if(abs(PDefender->loc.p.rotation - PAttacker->loc.p.rotation) < 23)
		{
			crithitrate = 100;
		}
	}
	else if(PAttacker->GetMJob() == JOB_THF && charutils::hasTrait((CCharEntity*)PAttacker, TRAIT_ASSASSIN) && (!ignoreSneakTrickAttack) &&
		PAttacker->StatusEffectContainer->HasStatusEffect(EFFECT_TRICK_ATTACK))
	{
		CBattleEntity* taChar = battleutils::getAvailableTrickAttackChar(PAttacker,PDefender);
		if(taChar != NULL) crithitrate = 100;
	}
	else
	{
		//apply merit mods
		if (PAttacker->objtype == TYPE_PC) crithitrate += ((CCharEntity*)PAttacker)->PMeritPoints->GetMeritValue(MERIT_CRIT_HIT_RATE,PAttacker->GetMLevel());
		if (PDefender->objtype == TYPE_PC) crithitrate -= ((CCharEntity*)PDefender)->PMeritPoints->GetMeritValue(MERIT_ENEMY_CRIT_RATE,PDefender->GetMLevel());

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

float GetDamageRatio(CBattleEntity* PAttacker, CBattleEntity* PDefender, bool isCritical, uint16 bonusAttPercent)
{
	// used to apply a % of attack bonus
	float attPercentBonus = 0;
	if (bonusAttPercent >= 1)
		attPercentBonus = (float)(PAttacker->ATT() * bonusAttPercent / 100);

	//wholly possible for DEF to be near 0 with the amount of debuffs/effects now.
    float ratio = (float)(PAttacker->ATT() + attPercentBonus) / (float)((PDefender->DEF()==0) ? 1 : PDefender->DEF());
	float cRatioMax = 0;
	float cRatioMin = 0;

	float cap = 2.0f;
	if(PAttacker->objtype==TYPE_PC){
		if(PAttacker->m_Weapons[SLOT_MAIN]->isTwoHanded()){
			cap = 2.2f;
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
	return pDIF * (1+((0.05f) * ((float)rand()/RAND_MAX)));
}

/************************************************************************
*  	Formula for Strength												*
************************************************************************/

int32 GetFSTR(CBattleEntity* PAttacker, CBattleEntity* PDefender, uint8 SlotID)
{
	int32 rank = 0;
	int32 fstr = 0;
	float dif = PAttacker->STR() - PDefender->VIT();
	if (dif >= 12) {
		fstr = (dif+4)/2;
	} else if (dif >= 6){
		fstr = (dif+6)/2;
	} else if (dif >= 1){
		fstr = (dif+7)/2;
	} else if (dif >= -2){
		fstr = (dif+8)/2;
	} else if (dif >= -7){
		fstr = (dif+9)/2;
	} else if (dif >= -15){
		fstr = (dif+10)/2;
	} else if (dif >= -21){
		fstr = (dif+12)/2;
	} else {
		fstr = (dif+13)/2;
	}
	if(SlotID==SLOT_RANGED)
	{
		rank = PAttacker->GetRangedWeaponRank();
		//different caps than melee weapons
		if(fstr <= (-rank*2))
			return (-rank*2);

		if((fstr > (-rank*2)) && (fstr <= (2*(rank + 8))))
			return fstr;

		else
			return 2*(rank + 8);
	}
	else
	{
		fstr /= 2;
		if( SlotID == SLOT_MAIN)
		{
			rank = PAttacker->GetMainWeaponRank();
		} else if( SlotID == SLOT_SUB )
		{
			rank = PAttacker->GetSubWeaponRank();
		}
		// everything else
		if(fstr <= (-rank))
			return (-rank);

		if((fstr > (-rank)) && (fstr <= rank + 8))
			return fstr;
		else
			return rank + 8;
	}
}

/************************************************************************
*                                                                       *
*  Returns the number of hits for multihit weapons if applicable        *
*                                                                       *
************************************************************************/

uint8 CheckMultiHits(CBattleEntity* PEntity, CItemWeapon* PWeapon)
{
	//checking players weapon hit count
	uint8 num = PWeapon->getHitCount(NULL);

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

	else if (PEntity->objtype == TYPE_MOB)
	{
		//Monk
		if(PEntity->GetMJob() == JOB_MNK)
		{
			num = 2;
		}

		//check for unique mobs
		switch (PEntity->id)
		{
			case 17498522:// Charybdis 2-6
				num = (2 + PWeapon->getHitCount(5));

			default:
				break;
		}
	}


	if (rand()%100 < tripleAttack)
	{
		num +=2;
	}
	else if (rand()%100 < doubleAttack)
	{
		num +=1;
	}


	// hasso occasionally triggers Zanshin after landing a normal attack,
	// only active while Samurai is set as Main Job
	if(PEntity->GetMJob() == JOB_SAM)
	{
		if (PEntity->StatusEffectContainer->HasStatusEffect(EFFECT_HASSO))
		{
			uint8 zanshin = PEntity->getMod(MOD_ZANSHIN);
			if (PEntity->objtype == TYPE_PC)
				zanshin += ((CCharEntity*)PEntity)->PMeritPoints->GetMeritValue(MERIT_ZASHIN_ATTACK_RATE, PEntity->GetMLevel());

			if(rand()%100 < (zanshin / 4) )
				num++;
		}
	}


	return dsp_min(num, 8);
}

/*****************************************************************************
	Handles song buff effects. Returns true if the song has been handled
	or false if the song effect has not been implemented. This is used in
	luautils to check if it needs to load a spell script or not.
******************************************************************************/
uint16 SingSong(CBattleEntity* PCaster,CBattleEntity* PTarget,CSpell* PSpell){
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
		return effect;
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
        PSpell->setMessage(230);
	}
	return effect;
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
	int16 KillerEffect = 0;

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

        PEntity->loc.p.x += (cosf(angle) * ((float)(PEntity->speed * (1+(PEntity->getMod(MOD_MOVE) / 100.0f))) / 0x28) * (mode) * 1.08);

		PEntity->loc.p.y = pos.y;

        PEntity->loc.p.z += (sinf(angle) * ((float)(PEntity->speed * (1+(PEntity->getMod(MOD_MOVE) / 100.0f))) / 0x28) * (mode) * 1.08);

		PEntity->loc.p.moving += ((0x36*((float)PEntity->speed/0x28)) - (0x14*(mode - 1)));

		if(PEntity->loc.p.moving > 0x2fff)
		{
			PEntity->loc.p.moving = 0;
		}
	}
}

/************************************************************************
*                                                                       *
*  Moves mob into melee range and turns to face with a given            *
*  angle threshold                                                      *
*                                                                       *
************************************************************************/


void MoveIntoRange(CBattleEntity* PPursuer, CBattleEntity* PTarget, uint8 angleThreshold)
{
	// if(angle >= angleThreshold){
    // }

    // always change angle for now
    uint8 angle = getangle(PPursuer->loc.p, PTarget->loc.p);
    PPursuer->loc.p.rotation = angle;

    if (distance(PPursuer->loc.p, PTarget->loc.p) > PPursuer->m_ModelSize){

		MoveTo(PPursuer, PTarget->loc.p, 2);
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

		uint16 meritBonus = 0;

		if (charutils::hasTrait(PChar, TRAIT_NINJA_TOOL_EXPERT))
			meritBonus = PChar->PMeritPoints->GetMeritValue(MERIT_NINJA_TOOL_EXPERTISE,PChar->GetMLevel());

		uint16 chance = (PChar->getMod(MOD_NINJA_TOOL) + meritBonus);

        if(ConsumeTool && rand() % 100 > chance)
        {
			charutils::UpdateItem(PChar, LOC_INVENTORY, SlotID, -1);
            PChar->pushPacket(new CInventoryFinishPacket());
        }
    }
    return true;
}


/*
 * Find if any party members are in position for trick attack.  Do this by making a narrow triangle:
 *  one endpoint at the mob, and the other two endpoints being equidistant from the TA user, perpendicular to
 *  the line between the mob and the TA user.  Find the slope of the line between the TA user and the mob, and
 *  decide whether to use x or z as the dependent variable (to avoid big numbers and divide by 0 errors on
 *  vertical slopes).  Using this slope, we can find the angle of the perpendicular line to the x or z line
 *  (depending on what the dependent var is), and using that angle, the disassembled x and z components to that
 *  line.  Divide those by 2 for a half yalm length line for each side of the base of the triangle, and we get
 *  the min and max values for x/z around the TA user.  Now it's simply a matter of first: making sure the
 *  TA target is closer than the TA user, and that the TA targets x and z coordinates fall within the triangle
 *  we made.  Using the min/max points and the mobs coordinate, we can construct min and max slopes, check that
 *  the x or z coordinates are between the mob and player, and finally calculate where the z coordinate should
 *  be based on the users x coordinate (or the other way around in a z dependent scenario) and check if the
 *  actual z coordinate is between those two values.
 */

CBattleEntity* getAvailableTrickAttackChar(CBattleEntity* taUser, CBattleEntity* PMob)
{
	float taUserX = taUser->loc.p.x;
	float taUserZ = taUser->loc.p.z;
	float mobX = PMob->loc.p.x;
	float mobZ = PMob->loc.p.z;

	float xdif = taUserX - mobX;
	float zdif = taUserZ - mobZ;
	float slope = 0;
	float maxSlope = 0;
	float minSlope = 0;
	bool zDependent = true; //using a slope where z is dependent var
	if (abs(xdif) <= abs(zdif))
	{
		slope = xdif / zdif;

		float angle = atan((double)1)*2 - atan(slope);

		float zoffset = cos(angle) / 2;
		float xoffset = sin(angle) / 2;
		float maxXpoint = taUserX + xoffset;
		float maxZpoint = taUserZ - zoffset;
		float minXpoint = taUserX - xoffset;
		float minZpoint = taUserZ + zoffset;
		maxSlope = ((maxXpoint - mobX) / (maxZpoint - mobZ));
		minSlope = ((minXpoint - mobX) / (minZpoint - mobZ));
		zDependent = false;
	} else {
		slope = zdif / xdif;

		float angle = atan((double)1)*2 - atan(slope);

		float xoffset = cos(angle) / 2;
		float zoffset = sin(angle) / 2;
		float maxXpoint = taUserX + xoffset;
		float maxZpoint = taUserZ + zoffset;
		float minXpoint = taUserX - xoffset;
		float minZpoint = taUserZ - zoffset;
		maxSlope = (maxZpoint - mobZ) / (maxXpoint - mobX);
		minSlope = (minZpoint - mobZ) / (minXpoint - mobX);
	}
	if (taUser->PParty != NULL)
    {
		if (taUser->PParty->m_PAlliance != NULL)
        {
			for(uint8 a = 0; a < taUser->PParty->m_PAlliance->partyList.size(); ++a)
            {
				for(uint8 i = 0; i < taUser->PParty->m_PAlliance->partyList.at(a)->members.size(); ++i)
                {
					if(taUser->id != taUser->PParty->m_PAlliance->partyList.at(a)->members.at(i)->id &&
						distance(taUser->PParty->m_PAlliance->partyList.at(a)->members.at(i)->loc.p,PMob->loc.p) <= distance(taUser->loc.p,PMob->loc.p))
                    {
						if(zDependent)
						{
							//is member between taUser and PMob on x line?
							if((taUser->PParty->m_PAlliance->partyList.at(a)->members.at(i)->loc.p.x <= taUserX &&
								taUser->PParty->m_PAlliance->partyList.at(a)->members.at(i)->loc.p.x >= mobX) ||
								(taUser->PParty->m_PAlliance->partyList.at(a)->members.at(i)->loc.p.x >= taUserX &&
								taUser->PParty->m_PAlliance->partyList.at(a)->members.at(i)->loc.p.x <= mobX))
							{
								if((taUser->PParty->m_PAlliance->partyList.at(a)->members.at(i)->loc.p.z - mobZ <=
									(taUser->PParty->m_PAlliance->partyList.at(a)->members.at(i)->loc.p.x - mobX)*maxSlope) &&
									(taUser->PParty->m_PAlliance->partyList.at(a)->members.at(i)->loc.p.z - mobZ >=
									(taUser->PParty->m_PAlliance->partyList.at(a)->members.at(i)->loc.p.x - mobX)*minSlope))
								{
									//finally found a TA partner
									return taUser->PParty->m_PAlliance->partyList.at(a)->members.at(i);
								}
							}
						} else {
							//is member between taUser and PMob on z line?
							if((taUser->PParty->m_PAlliance->partyList.at(a)->members.at(i)->loc.p.z <= taUserZ &&
								taUser->PParty->m_PAlliance->partyList.at(a)->members.at(i)->loc.p.z >= mobZ) ||
								(taUser->PParty->m_PAlliance->partyList.at(a)->members.at(i)->loc.p.z >= taUserZ &&
								taUser->PParty->m_PAlliance->partyList.at(a)->members.at(i)->loc.p.z <= mobZ))
							{
								if((taUser->PParty->m_PAlliance->partyList.at(a)->members.at(i)->loc.p.x - mobX <=
									(taUser->PParty->m_PAlliance->partyList.at(a)->members.at(i)->loc.p.z - mobZ)*maxSlope) &&
									(taUser->PParty->m_PAlliance->partyList.at(a)->members.at(i)->loc.p.x - mobX >=
									(taUser->PParty->m_PAlliance->partyList.at(a)->members.at(i)->loc.p.z - mobZ)*minSlope))
								{
									//finally found a TA partner
									return taUser->PParty->m_PAlliance->partyList.at(a)->members.at(i);
								}
							}
						}
					}
				}
			}
		}else{//no alliance
			for(uint8 i = 0; i < taUser->PParty->members.size(); ++i)
            {
				if(taUser->PParty->members.at(i)->id != taUser->id &&
					distance(taUser->PParty->members.at(i)->loc.p,PMob->loc.p) <= distance(taUser->loc.p,PMob->loc.p))
                {
					if(zDependent)
					{
						//is member between taUser and PMob on x line?
						if((taUser->PParty->members.at(i)->loc.p.x <= taUserX &&
							taUser->PParty->members.at(i)->loc.p.x >= mobX) ||
							(taUser->PParty->members.at(i)->loc.p.x >= taUserX &&
							taUser->PParty->members.at(i)->loc.p.x <= mobX))
						{
							if((taUser->PParty->members.at(i)->loc.p.z - mobZ <=
								(taUser->PParty->members.at(i)->loc.p.x - mobX)*maxSlope) &&
								(taUser->PParty->members.at(i)->loc.p.z - mobZ >=
								(taUser->PParty->members.at(i)->loc.p.x - mobX)*minSlope))
							{
								//finally found a TA partner
								return taUser->PParty->members.at(i);
							}
						}
					} else {
						//is member between taUser and PMob on z line?
						if((taUser->PParty->members.at(i)->loc.p.z <= taUserZ &&
							taUser->PParty->members.at(i)->loc.p.z >= mobZ) ||
							(taUser->PParty->members.at(i)->loc.p.z >= taUserZ &&
							taUser->PParty->members.at(i)->loc.p.z <= mobZ))
						{
							if((taUser->PParty->members.at(i)->loc.p.x - mobX <=
								(taUser->PParty->members.at(i)->loc.p.z - mobZ)*maxSlope) &&
								(taUser->PParty->members.at(i)->loc.p.x - mobX >=
								(taUser->PParty->members.at(i)->loc.p.z - mobZ)*minSlope))
							{
								//finally found a TA partner
								return taUser->PParty->members.at(i);
							}
						}
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


/************************************************************************
*                                                                       *
*	Transfer Enmity (used with ACCOMPLICE & COLLABORATOR ability type)  *
*                                                                       *
************************************************************************/

void TransferEnmity(CBattleEntity* CharHateReceiver, CBattleEntity* CharHateGiver, CMobEntity* PMob, uint8 percentToTransfer)
{
	//CBaseEntity* PMob = CharHateGiver->loc.zone->GetEntity(mobID, TYPE_MOB);

	((CMobEntity*)PMob)->PEnmityContainer->LowerEnmityByPercent(CharHateGiver , percentToTransfer, CharHateReceiver);
}



/************************************************************************
*                                                                       *
*	Effect from soul eater		                                        *
*                                                                       *
************************************************************************/
uint16 doSoulEaterEffect(CCharEntity* m_PChar, uint16 damage)
{
	// Souleater has no effect <10HP.
	if(m_PChar->GetMJob()==JOB_DRK && m_PChar->health.hp>=10 && m_PChar->StatusEffectContainer->HasStatusEffect(EFFECT_SOULEATER))
	{
		//lost 10% current hp, converted to damage (displayed as just a strong regular hit)
		float drainPercent = 0.1;
		CItem* PItemHead = ((CCharEntity*)m_PChar)->getStorage(LOC_INVENTORY)->GetItem(((CCharEntity*)m_PChar)->equip[SLOT_HEAD]);
		CItem* PItemBody = ((CCharEntity*)m_PChar)->getStorage(LOC_INVENTORY)->GetItem(((CCharEntity*)m_PChar)->equip[SLOT_BODY]);
		CItem* PItemLegs = ((CCharEntity*)m_PChar)->getStorage(LOC_INVENTORY)->GetItem(((CCharEntity*)m_PChar)->equip[SLOT_LEGS]);
		if(PItemHead->getID() == 12516 || PItemHead->getID() == 15232 || PItemBody->getID() == 14409 || PItemLegs->getID() == 15370){
		drainPercent = 0.12;
	}
		damage = damage + m_PChar->health.hp*drainPercent;
		m_PChar->addHP(-drainPercent*m_PChar->health.hp);
	}
		else if(m_PChar->GetSJob()==JOB_DRK &&m_PChar->health.hp>=10 && m_PChar->StatusEffectContainer->HasStatusEffect(EFFECT_SOULEATER)){
		//lose 10% Current HP, only HALF (5%) converted to damage
		damage = damage + m_PChar->health.hp*0.05;
		m_PChar->addHP(-0.1*m_PChar->health.hp);
	}
	return damage;
}



/************************************************************************
*                                                                       *
*	Samurai get merit storeTP value                                     *
*                                                                       *
************************************************************************/
uint8 getStoreTPbonusFromMerit(CBattleEntity* PEntity)
{
	if (PEntity->objtype == TYPE_PC)
	{
		if (((CCharEntity*)PEntity)->GetMJob() == JOB_SAM || ((CCharEntity*)PEntity)->GetSJob() == JOB_SAM)
		{
			return ((CCharEntity*)PEntity)->PMeritPoints->GetMeritValue(MERIT_STORE_TP_EFFECT, PEntity->GetMLevel());
		}
	}
	return 0;
}



/************************************************************************
*                                                                       *
*	Samurai overwhelm damage bonus                                      *
*                                                                       *
************************************************************************/
uint16 getOverWhelmDamageBonus(CCharEntity* m_PChar, CBattleEntity* PDefender, uint16 damage)
{
	if (m_PChar->GetMJob() == JOB_SAM || m_PChar->GetSJob() == JOB_SAM) // only allow if player 75 or more
	{
		if (m_PChar->GetMLevel() >= 75)
		{
			// must be facing mob
			if(abs(PDefender->loc.p.rotation - m_PChar->loc.p.rotation) > 90)
			{
				uint8 meritCount = m_PChar->PMeritPoints->GetMeritValue(MERIT_OVERWHELM, m_PChar->GetMLevel());

				switch (meritCount)
				{
					case 1:	damage += (float)damage * 0.05f; break;
					case 2:	damage += (float)damage * 0.10f; break;
					case 3:	damage += (float)damage * 0.15f; break;
					case 4:	damage += (float)damage * 0.17f; break;
					case 5:	damage += (float)damage * 0.19f; break;
					default: break;
				}
			}
		}
	}
	return damage;
}


/************************************************************************
*                                                                       *
*	get barrage shot count		                                        *
*                                                                       *
************************************************************************/

uint8 getBarrageShotCount(CCharEntity* PChar)
{
	/*
	Ranger level 30, four shots.
	Ranger level 50, five shots.
	Ranger level 75, six shots.
	Ranger level 90, seven shots.
	Ranger level 99, eight shots.
	*/

	// only archery + marksmanship can use barrage
	CItemWeapon* PItem = (CItemWeapon*)PChar->getStorage(LOC_INVENTORY)->GetItem(PChar->equip[SLOT_RANGED]);

	if(PItem && PItem->getSkillType() != 25 && PItem->getSkillType() != 26)
		return 0;




	uint8 lvl = PChar->jobs.job[JOB_RNG];		// Get Ranger level of char
	uint8 shotCount = 0;					// the total number of extra hits

	if (PChar->GetSJob() == JOB_RNG)		// if rng is sub then use the sub level
		lvl = PChar->GetSLevel();

	// Hunters bracers+1 will add an extra shot
	CItemArmor* PItemHands = (CItemArmor*)PChar->getStorage(LOC_INVENTORY)->GetItem(PChar->equip[SLOT_HANDS]);


	if (PItemHands && PItemHands->getID() == 14900)
		shotCount ++;

	if		(lvl < 30)	return 0;
	else if (lvl < 50)	shotCount += 3;
	else if (lvl < 75)	shotCount += 4;
	else if (lvl < 90)	shotCount += 5;
	else if (lvl < 99)	shotCount += 6;
	else if (lvl >= 99) shotCount += 7;


	// make sure we have enough ammo for all these shots
	CItemWeapon* PAmmo = (CItemWeapon*)PChar->getStorage(LOC_INVENTORY)->GetItem(PChar->equip[SLOT_AMMO]);

	if (PAmmo && PAmmo->getQuantity() < shotCount)
	{
		shotCount = PAmmo->getQuantity()-1;
	}

	return shotCount;
}




/************************************************************************
*                                                                       *
*	Jump DRG Job ability		                                        *
*                                                                       *
************************************************************************/

uint16 jumpAbility(CBattleEntity* PAttacker, CBattleEntity* PVictim, uint8 tier)
{

	// super jump - remove 99% of enmity
	if (tier == 3 && PVictim->objtype == TYPE_MOB)
	{
		((CMobEntity*)PVictim)->PEnmityContainer->LowerEnmityByPercent(PAttacker , 99, NULL);
		return 0;
	}

	// target has perfect dodge - do not go any further
	if (PVictim->StatusEffectContainer->HasStatusEffect(EFFECT_PERFECT_DODGE,0))
		return 0;


	// multihit's just multiply jump damage
	uint16 subType = PAttacker->m_Weapons[SLOT_SUB]->getDmgType();
	uint8 numattacksLeftHand = 0;

	//sub weapon is equipped
	if ((subType > 0 && subType < 4))
		numattacksLeftHand = battleutils::CheckMultiHits(PAttacker, PAttacker->m_Weapons[SLOT_SUB]);

	//h2h equipped
	if(PAttacker->m_Weapons[SLOT_MAIN]->getDmgType() == DAMAGE_HTH)
		numattacksLeftHand = battleutils::CheckMultiHits(PAttacker, PAttacker->m_Weapons[SLOT_MAIN]);

	// normal multi hit from left hand
	uint8 numattacksRightHand = battleutils::CheckMultiHits(PAttacker, PAttacker->m_Weapons[SLOT_MAIN]);


	CItemWeapon* PWeapon = PAttacker->m_Weapons[SLOT_MAIN];
	uint8 fstrslot = SLOT_MAIN;

	uint8 hitrate = battleutils::GetHitRate(PAttacker, PVictim);
	uint8 realHits = 0;			// to store the real number of hit for tp multipler
	uint16 totalDamage = 0;
	uint16 damageForRound = 0;
	bool hitTarget = false;

		// Loop number of hits
		for (uint8 i = 0; i < (numattacksLeftHand + numattacksRightHand); ++i)
		{
			if (i != 0)
			{
				if (PVictim->isDead())
					break;

					if (PAttacker->m_Weapons[SLOT_MAIN]->getDmgType() != DAMAGE_HTH && i>=numattacksRightHand)
					{
						PWeapon = PAttacker->m_Weapons[SLOT_SUB];
						fstrslot = SLOT_SUB;
					}
			}

			if(rand()%100 < hitrate)
			{

                // attack hit, try to be absorbed by shadow
                if (!battleutils::IsAbsorbByShadow(PVictim))
                {
    				// successful hit, add damage
    				uint8 AttMultiplerPercent = 0;

    				// get jump attack bonus from gear
    				if (PAttacker->objtype == TYPE_PC)
    					AttMultiplerPercent = PAttacker->getMod(MOD_JUMP_ATT_BONUS);

    				float DamageRatio = battleutils::GetDamageRatio(PAttacker, PVictim, false, AttMultiplerPercent);
    				damageForRound = (uint16)((PAttacker->GetMainWeaponDmg() + battleutils::GetFSTR(PAttacker,PVictim,SLOT_MAIN)) * DamageRatio);

    				// bonus applies to jump only, not high jump
    				if (tier == 1)
    				{
    					float jumpBonus = ( (PAttacker->VIT() / (float)256)+1 );
    					damageForRound = damageForRound * jumpBonus;
    				}

    				hitTarget = true;
    				realHits++;

        			// incase player has gungnir^^ (or any other damage increases weapons)
        			damageForRound = battleutils::CheckForDamageMultiplier(PWeapon,damageForRound,i);


        			totalDamage += damageForRound;

                }
            }
		}


	//check for soul eater
	if (PAttacker->objtype == TYPE_PC)
		totalDamage = battleutils::doSoulEaterEffect((CCharEntity*)PAttacker, totalDamage);

	// bonus jump tp is added even if damage is 0, will not add if jump misses
	if (PAttacker->objtype == TYPE_PC && hitTarget)
	{
		int mod = PAttacker->getMod(MOD_JUMP_TP_BONUS);
		PAttacker->addTP( ((float)(mod)/(float)10));
	}

	// if damage is 0 then jump missed
	if (totalDamage == 0)
		return 0;


	// high jump removes %50 emnity + more from any gear mods
	if (tier == 2 && PVictim->objtype == TYPE_MOB)
	{
		uint16 enmityReduction = PAttacker->getMod(MOD_HIGH_JUMP_ENMITY_REDUCTION) + 50;

		// cap it
		if (enmityReduction > 100) enmityReduction = 100;

		((CMobEntity*)PVictim)->PEnmityContainer->LowerEnmityByPercent(PAttacker , enmityReduction, NULL);
	}


	// try skill up (CharEntity only)
	if (PAttacker->objtype == TYPE_PC)
		charutils::TrySkillUP((CCharEntity*)PAttacker, (SKILLTYPE)PWeapon->getSkillType(), PVictim->GetMLevel());

	// jump + high jump doesn't give any tp to victim
	battleutils::TakePhysicalDamage(PAttacker, PVictim, totalDamage, false, fstrslot, realHits, NULL, false);
	return totalDamage;
}




/************************************************************************
*                                                                       *
*	Entity charms another		                                        *
*                                                                       *
************************************************************************/

void tryToCharm(CBattleEntity* PCharmer, CBattleEntity* PVictim)
{
	//Gear with Charm + does not affect the success rate of Charm, but increases the duration of the Charm.
	//Each +1 to Charm increases the duration of charm by 5%; +20 Charm doubles the duration of charm.

	//Too Weak			30 Minutes
	//Easy Prey			20 Minutes
	//Decent Challenge	10 Minutes
	//Even Match		3.0 Minutes
	//Tough				1.5 Minutes
	//VT				1 minute	guess
	//IT				30 seconds	guess

	uint32 CharmTime = 0;
	uint32 base = 0;


	// player charming mob
	if (PVictim->objtype == TYPE_MOB && PCharmer->objtype == TYPE_PC)
	{
		//Bind uncharmable mobs for 5 seconds
		if(PVictim->m_EcoSystem == SYSTEM_BEASTMEN || PVictim->m_EcoSystem == SYSTEM_ARCANA ||
			PVictim->m_EcoSystem == SYSTEM_UNCLASSIFIED || PVictim->m_EcoSystem == SYSTEM_ARCHAICMACHINE ||
			PVictim->m_EcoSystem == SYSTEM_AVATAR || PVictim->m_EcoSystem == SYSTEM_DEMON ||
			PVictim->m_EcoSystem == SYSTEM_ELEMENTAL || PVictim->m_EcoSystem == SYSTEM_EMPTY ||
			PVictim->m_EcoSystem == SYSTEM_LUMORIAN || PVictim->m_EcoSystem == SYSTEM_LUMINION ||
			PVictim->m_EcoSystem == SYSTEM_UNDEAD){
			((CMobEntity*)PVictim)->PEnmityContainer->UpdateEnmity(PCharmer, 0, 0);
			PVictim->StatusEffectContainer->AddStatusEffect(
					new CStatusEffect(EFFECT_BIND,EFFECT_BIND,1,0,5));
			return;
		}

		// cannot charm NM
		if (((CMobEntity*)PVictim)->m_Type & MOBTYPE_NOTORIOUS){
			((CMobEntity*)PVictim)->PEnmityContainer->UpdateEnmity(PCharmer, 0, 0);
			return;
		}
		else
		{
			// mob is charmable
			uint16 baseExp = charutils::GetRealExp(PCharmer->GetMLevel(),PVictim->GetMLevel());

			if(baseExp >= 400) {//IT
				CharmTime = 22500;
				base = 90;
			} else if(baseExp >= 240) {//VT
				CharmTime = 45000;
				base = 75;
			} else if(baseExp >= 120) {//T
				CharmTime = 90000;
				base = 60;
			} else if(baseExp == 100) {//EM
				CharmTime = 180000;
				base = 40;
			} else if(baseExp >=  75) {//DC
				CharmTime = 600000;
				base = 30;
			} else if(baseExp >=  15) {//EP
				CharmTime = 1200000;
				base = 20;
			} else if(baseExp ==   0) {//TW
				CharmTime = 1800000;
				base = 10;
			}
		}

		//apply charm time extension from gear
		uint8 charmModValue = (PCharmer->getMod(MOD_CHARM));
		float extraCharmTime = (float)(CharmTime*(charmModValue * 0.5f)/10);
		CharmTime += extraCharmTime;

		//randomize charm time
		CharmTime += (float)(CharmTime*(((rand()%50)-25) * 0.1f)/10);


		if (TryCharm(PCharmer, PVictim, base) == false)
		{
			//player failed to charm mob - agro mob
			((CMobEntity*)PVictim)->PEnmityContainer->UpdateEnmity(PCharmer, 0, 0);
			return;
		}
	}

	else if (PVictim->objtype == TYPE_PC)
	{
		//TODO: calculate time mob charms player for and work out a reliable base
		base = 50;

		//mob failed to charm player
		if (TryCharm(PCharmer, PVictim, base) == false)
		{
			return;
		}
	}


	//Charm is a success - take control of charmed Entity
	PVictim->isCharmed = true;

	PVictim->PMaster = PCharmer;
	PCharmer->PPet = PVictim;



	if (PVictim->objtype == TYPE_MOB)
	{
		//make the mob disengage
		if(PCharmer->PPet->PBattleAI != NULL && PCharmer->PPet->PBattleAI->GetCurrentAction() == ACTION_ENGAGE){
			PCharmer->PPet->PBattleAI->SetCurrentAction(ACTION_DISENGAGE);
		}


		//clear the victims emnity list
		((CMobEntity*)PVictim)->PEnmityContainer->Clear();

		//cancel the mobs mobBattle ai
		PCharmer->PPet->PBattleAI = NULL;

		//set the mobs ai to petAi
		PCharmer->PPet->PBattleAI = new CAIPetDummy((CPetEntity*)PVictim);
		PCharmer->PPet->PBattleAI->SetLastActionTime(gettick());
		PCharmer->PPet->charmTime = gettick() + CharmTime;
		PCharmer->PPet->PBattleAI->SetCurrentAction(ACTION_ROAMING);

		charutils::BuildingCharPetAbilityTable((CCharEntity*)PCharmer,(CPetEntity*)PVictim,PVictim->id);
		((CCharEntity*)PCharmer)->pushPacket(new CCharUpdatePacket((CCharEntity*)PCharmer));
		((CCharEntity*)PCharmer)->pushPacket(new CPetSyncPacket((CCharEntity*)PCharmer));
		PVictim->loc.zone->PushPacket(PVictim, CHAR_INRANGE, new CEntityUpdatePacket(PVictim, ENTITY_UPDATE));
	}

	else if (PVictim->objtype == TYPE_PC)
	{
		//TODO: mob take control of player
	}

}



/************************************************************************
*                                                                       *
*	calculate if charm is successful                                    *
*                                                                       *
************************************************************************/

bool TryCharm(CBattleEntity* PCharmer, CBattleEntity* PVictim, uint32 base)
{
	//---------------------------------------------------------
	//	chance of charm is based on:
	//	-CHR - both entities
	//	-Victims M level
	//  -charmers BST level (not main level)
	//
	//  -75 with a BST SJ lvl10 will struggle on EP
	//	-75 with a BST SJ lvl75 will not - thats player has bst leveled to 75 and is using it as SJ
	//---------------------------------------------------------


	uint8 charmerBSTlevel = 0;

		if (PCharmer->objtype == TYPE_PC)
			charmerBSTlevel = ((CCharEntity*)PCharmer)->jobs.job[JOB_BST];

		else if (PCharmer->objtype == TYPE_MOB)
			charmerBSTlevel = PCharmer->GetMLevel();


	float check = base;

	float levelRatio = (float)(PVictim->GetMLevel())/charmerBSTlevel;
	check *= levelRatio;

	float chrRatio = (float)PVictim->CHR() / PCharmer->CHR();
	check *= chrRatio;


	//check for hidden effect items (maybe use another modifier for hidden effects)
	if (PCharmer->objtype == TYPE_PC)
	{
		CCharEntity* PChar = (CCharEntity*)PCharmer;
		CItemWeapon* PWeapon = (CItemWeapon*)PChar->getStorage(LOC_INVENTORY)->GetItem(PChar->equip[SLOT_MAIN]);

		float hiddenEffect = 0;
		if(PWeapon)
		{
			switch (PWeapon->getID())
			{
				case 17557:	hiddenEffect = 10; break; //light staff 10%
				case 17558:	hiddenEffect = 15; break; //apollo staff 15%
			}
		}
		float StaffMods = ((float)((100.0f - hiddenEffect)/100.0f));
		check *= StaffMods;
	}


	//cap chance at 95%
	if(check < 5) check = 5;

	if(check < rand()%100)
		return true;

	return false;
}



/************************************************************************
*                                                                       *
*	Get available targets, for mob abilities and spells                 *
*                                                                       *
************************************************************************/
// TODO: The logic in this is too tightly coupled with the return value. E.g. change the logic here will potentially result in
// null pointers because we 'assume' that the returned enum means the target (e.g. pets, alliances) exist. Should change this
// to return a vector with CBattleEntitys of all the targets hit, with the args CBattleEntity source, CBattleEntity target, uint16 radius,
// bool isTargetAroundSource, bool includeAlliances -- then we can change everything over to this system.
TARGET_PARTY_TYPE getAvailableAoeTargets(CBattleEntity* PTarget)
{
	switch (PTarget->objtype)
	{
		case TYPE_PC:
			if (PTarget->PParty != NULL)
				return PTarget->PParty->m_PAlliance != NULL ? ALLIANCE_TARGET : PARTY_TARGET;
			else
				return SOLO_TARGET;
			break;

		case TYPE_PET:
		case TYPE_MOB:
			if (PTarget->PMaster != NULL)
			{
				if (PTarget->PMaster->objtype == TYPE_PC)
				{
					if (PTarget->PMaster->PParty != NULL)
						return PTarget->PMaster->PParty->m_PAlliance != NULL ? PET_ALLIANCE_TARGET : PET_PARTY_TARGET;
					else
						return PET_AND_MASTER;
				}
				else if (PTarget->PMaster->objtype == TYPE_MOB)
				{
					//not implemented yet, master is a mob
				}
			}
			else
			{
				// the charmed mob was released
				return INVALID_MOB_TARGET;
			}

			break;
	}
	//Unhandled Scenario
	DSP_DEBUG_BREAK_IF(true);
	return SOLO_TARGET;
}


/************************************************************************
*                                                                       *
*	for spamming mob AOE action, abilities & spells                     *
*                                                                       *
************************************************************************/

bool handleMobAoeAction(CBattleEntity* PAttacker, CBattleEntity* PTarget, apAction_t* Action, float radius, position_t* radiusAround)
{
	if (distance(*radiusAround, PTarget->loc.p) > radius || PTarget->isDead() || PTarget->getZone() != PAttacker->getZone())
	{
		return false;
	}

	Action->ActionTarget = PTarget;
	return true;
}

EFFECT getCorsairRollEffect(uint16 id)
{
	switch(id)
	{
	case ABILITY_FIGHTERS_ROLL:
		return EFFECT_FIGHTERS_ROLL;
	case ABILITY_MONKS_ROLL:
		return EFFECT_MONKS_ROLL;
	case ABILITY_HEALERS_ROLL:
		return EFFECT_HEALERS_ROLL;
	case ABILITY_WIZARDS_ROLL:
		return EFFECT_WIZARDS_ROLL;
	case ABILITY_WARLOCKS_ROLL:
		return EFFECT_WARLOCKS_ROLL;
	case ABILITY_ROGUES_ROLL:
		return EFFECT_ROGUES_ROLL;
	case ABILITY_GALLANTS_ROLL:
		return EFFECT_GALLANTS_ROLL;
	case ABILITY_CHAOS_ROLL:
		return EFFECT_CHAOS_ROLL;
	case ABILITY_BEAST_ROLL:
		return EFFECT_BEAST_ROLL;
	case ABILITY_CHORAL_ROLL:
		return EFFECT_CHORAL_ROLL;
	case ABILITY_HUNTERS_ROLL:
		return EFFECT_HUNTERS_ROLL;
	case ABILITY_SAMURAI_ROLL:
		return EFFECT_SAMURAI_ROLL;
	case ABILITY_NINJA_ROLL:
		return EFFECT_NINJA_ROLL;
	case ABILITY_DRACHEN_ROLL:
		return EFFECT_DRACHEN_ROLL;
	case ABILITY_EVOKERS_ROLL:
		return EFFECT_EVOKERS_ROLL;
	case ABILITY_MAGUSS_ROLL:
		return EFFECT_MAGUSS_ROLL;
	case ABILITY_CORSAIRS_ROLL:
		return EFFECT_CORSAIRS_ROLL;
	case ABILITY_PUPPET_ROLL:
		return EFFECT_PUPPET_ROLL;
	case ABILITY_DANCERS_ROLL:
		return EFFECT_DANCERS_ROLL;
	case ABILITY_SCHOLARS_ROLL:
		return EFFECT_SCHOLARS_ROLL;
	}
	//Unhandled Scenario
	DSP_DEBUG_BREAK_IF(true);
	return EFFECT_BUST;
}

void ClaimMob(CBattleEntity* PDefender, CBattleEntity* PAttacker)
{
    if(PDefender->objtype == TYPE_MOB){

        CMobEntity* mob = (CMobEntity*)PDefender;

        mob->PEnmityContainer->UpdateEnmityFromDamage(PAttacker, 0);
        mob->m_OwnerID.id = PAttacker->id;
        mob->m_OwnerID.targid = PAttacker->targid;
    }
}

};
