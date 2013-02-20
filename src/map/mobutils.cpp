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

#include "../common/utils.h"

#include <math.h>

#include "battleutils.h"
#include "grades.h"
#include "mobutils.h"
#include "modifier.h"
#include "spell.h"


namespace mobutils
{

/************************************************************************
*																		*
*  Расчет базовой величины оружия монстров								*
*																		*
************************************************************************/

uint16 GetWeaponDamage(CMobEntity* PMob)
{
	float MainLevel = PMob->GetMLevel();
	return (uint16)(MainLevel * (MainLevel < 40 ? 1.4 - MainLevel/100 : 1));
}

/************************************************************************
*																		*
*  Базовое значение для расчера характеристик							*
*  (на название не хватило фантазии)									*
*																		*
************************************************************************/

uint16 GetBaseToRank(uint8 rank, uint16 lvl)
{
	switch (rank)
	{
		case 1: return (5+((lvl-1)*50)/100);
		case 2: return (4+((lvl-1)*45)/100);
		case 3: return (4+((lvl-1)*40)/100);
		case 4: return (3+((lvl-1)*35)/100);
		case 5: return (3+((lvl-1)*30)/100);
		case 6: return (2+((lvl-1)*25)/100);
		case 7: return (2+((lvl-1)*20)/100);
	}
	return 0;
}

/************************************************************************
*																		*
*  Базовое значение для расчерта защиты и уклонения						*
*  (на название не хватило фантазии)									*
*																		*
************************************************************************/

uint16 GetBase(CMobEntity * PMob, uint8 rank)
 {
	switch (rank)
	{
		case 1: return (PMob->GetMLevel() > 50 ? 153+((PMob->GetMLevel()-50)*50)/10 : 6+((PMob->GetMLevel()-1)*30)/10);
		case 2: return (PMob->GetMLevel() > 50 ? 147+((PMob->GetMLevel()-50)*49)/10 : 5+((PMob->GetMLevel()-1)*29)/10);
		case 3: return (PMob->GetMLevel() > 50 ? 142+((PMob->GetMLevel()-50)*48)/10 : 5+((PMob->GetMLevel()-1)*28)/10);
		case 4: return (PMob->GetMLevel() > 50 ? 136+((PMob->GetMLevel()-50)*47)/10 : 4+((PMob->GetMLevel()-1)*27)/10);
		case 5: return (PMob->GetMLevel() > 50 ? 131+((PMob->GetMLevel()-50)*46)/10 : 4+((PMob->GetMLevel()-1)*26)/10);
		case 6: return (PMob->GetMLevel() > 50 ? 126+((PMob->GetMLevel()-50)*45)/10 : 3+((PMob->GetMLevel()-1)*25)/10);
		case 7: return (PMob->GetMLevel() > 50 ? 120+((PMob->GetMLevel()-50)*44)/10 : 3+((PMob->GetMLevel()-1)*24)/10);
	}
	return 0;
}

/************************************************************************
*																		*
*  Расчет атрибутов (характеристик) монстра								*
*																		*
************************************************************************/

void CalculateStats(CMobEntity * PMob)
{
	bool isNM = PMob->m_Type & MOBTYPE_NOTORIOUS;
	if(PMob->HPmodifier == 0){

		float growth = 1.0575;
		uint8 lvl = PMob->GetMLevel();

		//give hp boost every 10 levels after 25
		//special boosts at 25 and 50
		if(lvl > 75){
			growth = 1.2675;
		}else if(lvl > 65){
			growth = 1.2475;
		} else if(lvl > 55){
			growth = 1.2375;
		} else if(lvl > 50){
			growth = 1.2075;
		} else if(lvl > 45){
			growth = 1.1675;
		} else if(lvl > 35){
			growth = 1.1375;
		} else if(lvl > 25){
			growth = 1.0975;
		}

		PMob->health.maxhp = (int16)(18.0 * pow(PMob->GetMLevel(), growth) * PMob->HPstat);

		if(isNM){
			PMob->health.maxhp *= 2.0;
			if(PMob->GetMLevel()>75){
				PMob->health.maxhp *= 2.5;
			}
		}

	} else {
		PMob->health.maxhp = PMob->HPmodifier;
		//printf("HP: %u \n",PMob->health.maxhp);
	}

	switch(PMob->GetMJob()){
	case JOB_PLD:
	case JOB_WHM:
	case JOB_BLM:
	case JOB_RDM:
	case JOB_DRK:
	case JOB_BLU:
	case JOB_SCH:
		if(PMob->MPmodifier == 0){
			PMob->health.maxmp = (int16)(18.2 * pow(PMob->GetMLevel(),1.1075) * PMob->MPstat);
			if(isNM){
			PMob->health.maxmp *= 2.5;
				if(PMob->GetMLevel()>75){
					PMob->health.maxmp *= 2.5;
				}
			}
		} else {
			PMob->health.maxmp = PMob->MPmodifier;
		}
		break;
	}

    PMob->UpdateHealth();

	PMob->health.tp = 0;
    PMob->health.hp = PMob->GetMaxHP();
    PMob->health.mp = PMob->GetMaxMP();

	PMob->setModifier(MOD_DEF, GetBase(PMob,PMob->defRank));
	PMob->setModifier(MOD_EVA, GetBase(PMob,PMob->evaRank));

	uint16 BaseAttack = 0;
	uint16 BaseAccuracy = 0;

	if(PMob->GetMLevel() <= 30) {
		BaseAttack = (uint16)(PMob->GetMLevel() * 31 / 10);
	} else if(PMob->GetMLevel() <= 50) {
		BaseAttack = (uint16)(PMob->GetMLevel() * 33 / 10);
	} else if(PMob->GetMLevel() > 50) {
		BaseAttack = (uint16)(PMob->GetMLevel() * 37 / 10);
	}

	BaseAttack++;
	BaseAccuracy = BaseAttack;

	//MNK attack power should be lower
	if(PMob->GetMJob() == JOB_MNK){
		BaseAttack = (float)BaseAttack*0.8;
	}

	// Note: acc and att ranks are not taken into account
	PMob->setModifier(MOD_ATT, BaseAttack);

	PMob->setModifier(MOD_ACC, BaseAccuracy);

	PMob->m_Weapons[SLOT_MAIN]->setDamage(GetWeaponDamage(PMob));


    //reduce weapon delay of MNK
    if(PMob->GetMJob()==JOB_MNK){
        uint16 delay = PMob->m_Weapons[SLOT_MAIN]->getBaseDelay();

	    //reduce delay based on level
	    //this will remove about 78 delay at level 75
	    delay -= (((float)PMob->GetMLevel() * 1.05) * 1000) / 60;

		PMob->m_Weapons[SLOT_MAIN]->setDelay(delay);
    }


	uint16 fSTR = GetBaseToRank(PMob->strRank, PMob->GetMLevel());
	uint16 fDEX = GetBaseToRank(PMob->dexRank, PMob->GetMLevel());
	uint16 fVIT = GetBaseToRank(PMob->vitRank, PMob->GetMLevel());
	uint16 fAGI = GetBaseToRank(PMob->agiRank, PMob->GetMLevel());
	uint16 fINT = GetBaseToRank(PMob->intRank, PMob->GetMLevel());
	uint16 fMND = GetBaseToRank(PMob->mndRank, PMob->GetMLevel());
	uint16 fCHR = GetBaseToRank(PMob->chrRank, PMob->GetMLevel());

	uint16 mSTR = GetBaseToRank(grade::GetJobGrade(PMob->GetMJob(),2), PMob->GetMLevel());
	uint16 mDEX = GetBaseToRank(grade::GetJobGrade(PMob->GetMJob(),3), PMob->GetMLevel());
	uint16 mVIT = GetBaseToRank(grade::GetJobGrade(PMob->GetMJob(),4), PMob->GetMLevel());
	uint16 mAGI = GetBaseToRank(grade::GetJobGrade(PMob->GetMJob(),5), PMob->GetMLevel());
	uint16 mINT = GetBaseToRank(grade::GetJobGrade(PMob->GetMJob(),6), PMob->GetMLevel());
	uint16 mMND = GetBaseToRank(grade::GetJobGrade(PMob->GetMJob(),7), PMob->GetMLevel());
	uint16 mCHR = GetBaseToRank(grade::GetJobGrade(PMob->GetMJob(),8), PMob->GetMLevel());

	uint16 sSTR = GetBaseToRank(grade::GetJobGrade(PMob->GetSJob(),2), PMob->GetSLevel());
	uint16 sDEX = GetBaseToRank(grade::GetJobGrade(PMob->GetSJob(),3), PMob->GetSLevel());
	uint16 sVIT = GetBaseToRank(grade::GetJobGrade(PMob->GetSJob(),4), PMob->GetSLevel());
	uint16 sAGI = GetBaseToRank(grade::GetJobGrade(PMob->GetSJob(),5), PMob->GetSLevel());
	uint16 sINT = GetBaseToRank(grade::GetJobGrade(PMob->GetSJob(),6), PMob->GetSLevel());
	uint16 sMND = GetBaseToRank(grade::GetJobGrade(PMob->GetSJob(),7), PMob->GetSLevel());
	uint16 sCHR = GetBaseToRank(grade::GetJobGrade(PMob->GetSJob(),8), PMob->GetSLevel());

	if(PMob->GetSLevel() > 15)
	{
		sSTR /= 2;
		sDEX /= 2;
		sAGI /= 2;
		sINT /= 2;
		sMND /= 2;
		sCHR /= 2;
		sVIT /= 2;
	} else {
		sSTR = 0;
		sDEX = 0;
		sAGI = 0;
		sINT = 0;
		sMND = 0;
		sCHR = 0;
		sVIT = 0;
	}

	PMob->stats.STR = fSTR + mSTR + sSTR;
	PMob->stats.DEX = fDEX + mDEX + sDEX;
	PMob->stats.VIT = fVIT + mVIT + sVIT;
	PMob->stats.AGI = fAGI + mAGI + sAGI;
	PMob->stats.INT = fINT + mINT + sINT;
	PMob->stats.MND = fMND + mMND + sMND;
	PMob->stats.CHR = fCHR + mCHR + sCHR;

	if(isNM){
		PMob->stats.STR *= 1.5;
		PMob->stats.DEX *= 1.5;
		PMob->stats.VIT *= 1.5;
		PMob->stats.AGI *= 1.5;
		PMob->stats.INT *= 1.5;
		PMob->stats.MND *= 1.5;
		PMob->stats.CHR *= 1.5;
	}
	//natural magic evasion
	if(PMob->GetMLevel()<=83){
		PMob->setModifier(MOD_MEVA, battleutils::GetMaxSkill(SKILL_ELE, JOB_RDM, PMob->GetMLevel()));
	} else {
		PMob->setModifier(MOD_MEVA, battleutils::GetMaxSkill(SKILL_SWD, JOB_WAR, PMob->GetMLevel()));
	}

	// cap all magic skills so they play nice with spell scripts
	for (int i=SKILL_DIV; i <=SKILL_BLU; i++) {
		uint16 maxSkill = battleutils::GetMaxSkill((SKILLTYPE)i,PMob->GetMJob(),PMob->GetMLevel());
		if (maxSkill != 0) {
			PMob->WorkingSkills.skill[i] = maxSkill;
		}
		else //if the mob is WAR/BLM and can cast spell
		{
			uint16 maxSubSkill = battleutils::GetMaxSkill((SKILLTYPE)i,PMob->GetSJob(),PMob->GetSLevel());

			if (maxSubSkill != 0)
			{
				PMob->WorkingSkills.skill[i] = maxSubSkill;
			}
		}
	}
}

/* Gets the available spells for the specified monster. This looks up the types of spells the monster
 * can cast based on the bitmask in mob_pools (which has been preloaded into memory). It then resolves
 * the list of actual spell IDs based on the bits set. This mapping from bitmask > spellids is based
 * on numerous factors including the type of mob, the level of the mob, etc. The list of spells are
 * then stored in PMob->m_AvailableSpells
 */
void GetAvailableSpells(CMobEntity* PMob) {
	if (PMob->m_HasSpellScript == 1) {
		PMob->m_AvailableSpells.push_back(0); // we use spell id = 0 to indicate that its scripted
		return;
	}

	// setup recast times
	if (PMob->GetMJob() == JOB_BLM) {
		PMob->m_MagicRecastTime = 15000;
	}
	else if (PMob->GetMJob() == JOB_RDM || PMob->GetMJob() == JOB_BLU) {
		PMob->m_MagicRecastTime = 25000;
	}
	else if (PMob->GetMJob() == JOB_WHM || PMob->GetMJob() == JOB_BRD) {
		PMob->m_MagicRecastTime = 20000;
	}
	else {
		PMob->m_MagicRecastTime = 30000;
	}


	// clear spell list
	PMob->m_AvailableSpells.clear();

	// TODO: Use enums rather than hardcode the spell ids...
	if(PMob->m_EcoSystem == SYSTEM_BEASTMEN){
		// Beastmen get all spells from their main job
		switch(PMob->GetMJob()){
			case JOB_NIN:
			AddNinSpells(PMob);
			break;
			case JOB_BRD:
			AddBrdSpells(PMob);
			break;
			case JOB_WHM:
			break;
			case JOB_RDM:
			break;
			case JOB_BLM:
			break;
			case JOB_DRK:
			AddDrkSpells(PMob);
			break;
			case JOB_BLU:
			break;
			case JOB_PLD:
			AddPldSpells(PMob);
			break;
			// case JOB_SMN:
			// break;
			// case JOB_COR:
			// break;
			// case JOB_SCH:
			// break;
			default:
			break;
		}
	}

	if(PMob->m_Family == 258){
		// WORM
		AddWormSpells(PMob);
		return;
	}

	// map from PMob->m_SpellsBitmask to PMob->m_AvailableSpells
	if (PMob->m_SpellTypesBitmask[SPELLTYPE_ELEMENT_LIGHT] & SPELLTYPE_HEAL) {
		for (int i=6; i>=1; i--) {
			if (spell::CanUseSpell(PMob, i)) { // Cure VI -> I
				PMob->m_AvailableSpells.push_back(i);
				break; // we've got the highest level we can use, so stop looking for lower ones
			}
		}
	}

	// Single targe tier spells
	if (PMob->m_SpellTypesBitmask[SPELLTYPE_ELEMENT_FIRE] & SPELLTYPE_DAMAGE) {
		AddHighestAvailableSpell(PMob, 148, 144, true);  // Fire V -> I
	}
	if (PMob->m_SpellTypesBitmask[SPELLTYPE_ELEMENT_EARTH] & SPELLTYPE_DAMAGE) {
		AddHighestAvailableSpell(PMob, 163, 159, true); // Stone V -> I
	}
	if (PMob->m_SpellTypesBitmask[SPELLTYPE_ELEMENT_WATER] & SPELLTYPE_DAMAGE) {
		AddHighestAvailableSpell(PMob, 173, 169, true); // Water V -> I
	}
	if (PMob->m_SpellTypesBitmask[SPELLTYPE_ELEMENT_WIND] & SPELLTYPE_DAMAGE) {
		AddHighestAvailableSpell(PMob, 158, 154, true); // Aero V -> I
	}
	if (PMob->m_SpellTypesBitmask[SPELLTYPE_ELEMENT_ICE] & SPELLTYPE_DAMAGE) {
		AddHighestAvailableSpell(PMob, 153, 149, true); // Blizzard V -> I
	}
	if (PMob->m_SpellTypesBitmask[SPELLTYPE_ELEMENT_LIGHTNING] & SPELLTYPE_DAMAGE) {
		AddHighestAvailableSpell(PMob, 168, 164, true); // Thunder V -> I
	}
	if (PMob->m_SpellTypesBitmask[SPELLTYPE_ELEMENT_LIGHT] & SPELLTYPE_DAMAGE) {
		AddHighestAvailableSpell(PMob, 30, 28, true); // Banish III -> I
	}
	//// AoE Spells
	if (PMob->m_SpellTypesBitmask[SPELLTYPE_ELEMENT_FIRE] & SPELLTYPE_AOE) {
		AddHighestAvailableSpell(PMob, 178, 174, true); // Firaga V -> I
	}
	if (PMob->m_SpellTypesBitmask[SPELLTYPE_ELEMENT_EARTH] & SPELLTYPE_AOE) {
		AddHighestAvailableSpell(PMob, 193, 189, true); // Stonega V -> I
	}
	if (PMob->m_SpellTypesBitmask[SPELLTYPE_ELEMENT_WATER] & SPELLTYPE_AOE) {
		AddHighestAvailableSpell(PMob, 203, 199, true); // Waterga V -> I
	}
	if (PMob->m_SpellTypesBitmask[SPELLTYPE_ELEMENT_WIND] & SPELLTYPE_AOE) {
		AddHighestAvailableSpell(PMob, 188, 184, true); // Aeroga V -> I
	}
	if (PMob->m_SpellTypesBitmask[SPELLTYPE_ELEMENT_ICE] & SPELLTYPE_AOE) {
		AddHighestAvailableSpell(PMob, 183, 179, true); // Blizzaga V -> I
	}
	if (PMob->m_SpellTypesBitmask[SPELLTYPE_ELEMENT_LIGHTNING] & SPELLTYPE_AOE) {
		AddHighestAvailableSpell(PMob, 198, 194, true); // Thundaga V -> I
	}
	if (PMob->m_SpellTypesBitmask[SPELLTYPE_ELEMENT_LIGHT] & SPELLTYPE_AOE) {
		AddHighestAvailableSpell(PMob, 42, 38, true); // Banishga V -> I
	}

}

void AddHighestAvailableSpell(CMobEntity* PMob, uint16 highestId, uint16 lowestId, bool ignoreJob)
{
	for (int i=highestId; i>=lowestId; i--) {
		if (spell::CanUseSpell(PMob, i)) {
			PMob->m_AvailableSpells.push_back(i);
			break; // we've got the highest level we can use, so stop looking for lower ones
		}
		if (ignoreJob) {
			if (spell::CanUseSpellWith(i, JOB_BLM, PMob->GetMLevel()) ||
				spell::CanUseSpellWith(i, JOB_RDM, PMob->GetMLevel()) ||
				spell::CanUseSpellWith(i, JOB_WHM, PMob->GetMLevel())) {
				PMob->m_AvailableSpells.push_back(i);
				break;
			}
		}
	}
}

/*
Note for Add job spells. All the spells are added in order from highest priority.
As the mob gets weaker it will prioritize spells nearest to zero.

Adds all available ninja spells to the mob.
*/
void AddNinSpells(CMobEntity* PMob) {

	//add utsusemi first for priority spell
	AddHighestAvailableSpell(PMob, 340, 338, true);

	// add three more times to increase chance
	AddHighestAvailableSpell(PMob, 340, 338, true);
	AddHighestAvailableSpell(PMob, 340, 338, true);
	AddHighestAvailableSpell(PMob, 340, 338, true);

	// jubaku
	AddHighestAvailableSpell(PMob, 343, 342, true);

	// hojo
	AddHighestAvailableSpell(PMob, 346, 344, true);

	// kurayami
	AddHighestAvailableSpell(PMob, 349, 347, true);

	// dokumori
	AddHighestAvailableSpell(PMob, 352, 350, true);

	// katon
	AddHighestAvailableSpell(PMob, 322, 320, true);

	// hyoton
	AddHighestAvailableSpell(PMob, 325, 323, true);

	// huton
	AddHighestAvailableSpell(PMob, 328, 326, true);

	// doton
	AddHighestAvailableSpell(PMob, 331, 329, true);

	// raiton
	AddHighestAvailableSpell(PMob, 334, 332, true);

	// suiton
	AddHighestAvailableSpell(PMob, 337, 335, true);
}

void AddBrdSpells(CMobEntity* PMob) {

	// armys paeon
	AddHighestAvailableSpell(PMob, 385, 378, true);

	// horde lullaby
	AddHighestAvailableSpell(PMob, 377, 376, true);

	// foe lullaby
	AddHighestAvailableSpell(PMob, 463, 463, true);

	// magic finale
	AddHighestAvailableSpell(PMob, 462, 462, true);
	AddHighestAvailableSpell(PMob, 462, 462, true);

	// foe requirem
	AddHighestAvailableSpell(PMob, 375, 369, true);

	// minne
	AddHighestAvailableSpell(PMob, 393, 389, true);

	// minuet
	AddHighestAvailableSpell(PMob, 398, 394, true);

	// elegy
	AddHighestAvailableSpell(PMob, 423, 421, true);
	AddHighestAvailableSpell(PMob, 423, 421, true);

	// mambo
	AddHighestAvailableSpell(PMob, 404, 403, true);

	// madrigal
	AddHighestAvailableSpell(PMob, 400, 399, true);

}

void AddWormSpells(CMobEntity* PMob) {

	// Stoneskin
	if (spell::CanUseSpellWith(54, JOB_WHM, PMob->GetMLevel())) {
		PMob->m_AvailableSpells.push_back(54);
	}

	// already added
	// Stonega
	AddHighestAvailableSpell(PMob, 193, 189, true);
	// Stones
	AddHighestAvailableSpell(PMob, 163, 159, true);

	// Bind
	if (spell::CanUseSpell(PMob, 258)) {
		PMob->m_AvailableSpells.push_back(258);
		PMob->m_AvailableSpells.push_back(258);
		PMob->m_AvailableSpells.push_back(258);
	}

	// Rasp
	if (spell::CanUseSpell(PMob, 238)) {
		PMob->m_AvailableSpells.push_back(238);
	}

	// Quake
	if (spell::CanUseSpell(PMob, 210)) {
		PMob->m_AvailableSpells.push_back(210);
	}

}

void AddPldSpells(CMobEntity* PMob) {

	// Cures
	AddHighestAvailableSpell(PMob, 4, 1, true);

	// Flash
	AddHighestAvailableSpell(PMob, 112, 112, true);
	AddHighestAvailableSpell(PMob, 112, 112, true);

	// Holy
	AddHighestAvailableSpell(PMob, 22, 21, true);
	AddHighestAvailableSpell(PMob, 22, 21, true);

	// Protect
	AddHighestAvailableSpell(PMob, 47, 43, true);

	// Banish
	AddHighestAvailableSpell(PMob, 32, 28, true);

	// Shell
	AddHighestAvailableSpell(PMob, 52, 48, true);

}

void AddDrkSpells(CMobEntity* PMob) {
	// Drain
	AddHighestAvailableSpell(PMob, 245, 245, true);

	// Stun
	AddHighestAvailableSpell(PMob, 252, 252, true);

	// Absorb-TP
	AddHighestAvailableSpell(PMob, 275, 275, true);

	// Absorb-Stats
	AddHighestAvailableSpell(PMob, 266, 272, true);

	// Bio
	if(PMob->GetMLevel() >= 68){
		// Bio III
		PMob->m_AvailableSpells.push_back(232);
	} else {
		AddHighestAvailableSpell(PMob, 231, 230, true);
	}

	// Poisonga
	AddHighestAvailableSpell(PMob, 226, 225, true);

	if (spell::CanUseSpell(PMob, 258)) {
		PMob->m_AvailableSpells.push_back(258);
	}

	// Poison
	AddHighestAvailableSpell(PMob, 224, 220, true);

	// Thunder
	AddHighestAvailableSpell(PMob, 168, 164, true);
	// Blizzard
	AddHighestAvailableSpell(PMob, 153, 149, true);
	// Water
	AddHighestAvailableSpell(PMob, 173, 169, true);
}

}; // namespace mobutils
