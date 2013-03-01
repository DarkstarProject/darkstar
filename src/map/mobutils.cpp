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
#include "trait.h"
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
 	uint8 lvl = PMob->GetMLevel();
 	if(lvl > 50){
 		switch(rank){
 			case 1:
 				return (float)153+(lvl-50)*5.0;
 			case 2:
 				return (float)147+(lvl-50)*4.9;
 			case 3:
 				return (float)136+(lvl-50)*4.8;
 			case 4:
 				return (float)126+(lvl-50)*4.7;
 			case 5:
 				return (float)116+(lvl-50)*4.5;
 			case 6:
 				return (float)106+(lvl-50)*4.4;
 			case 7:
 				return (float)96+(lvl-50)*4.3;
 		}
 	} else {
 		switch(rank){
 			case 1:
 				return (float)6+(lvl-1)*3.0;
 			case 2:
 				return (float)5+(lvl-1)*2.9;
 			case 3:
 				return (float)5+(lvl-1)*2.8;
 			case 4:
 				return (float)4+(lvl-1)*2.7;
 			case 5:
 				return (float)4+(lvl-1)*2.5;
 			case 6:
 				return (float)3+(lvl-1)*2.4;
 			case 7:
 				return (float)3+(lvl-1)*2.3;
 		}
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

		float growth = 1.06;
		uint8 lvl = PMob->GetMLevel();

		//give hp boost every 10 levels after 25
		//special boosts at 25 and 50
		if(lvl > 75){
			growth = 1.28;
		}else if(lvl > 65){
			growth = 1.27;
		} else if(lvl > 55){
			growth = 1.25;
		} else if(lvl > 50){
			growth = 1.21;
		} else if(lvl > 45){
			growth = 1.17;
		} else if(lvl > 35){
			growth = 1.14;
		} else if(lvl > 25){
			growth = 1.1;
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

	uint16 evaRank = battleutils::GetSkillRank(SKILL_EVA, PMob->GetMJob());

	PMob->setModifier(MOD_DEF, GetBase(PMob,PMob->defRank));
	PMob->setModifier(MOD_EVA, GetBase(PMob,evaRank));
	PMob->setModifier(MOD_ATT, GetBase(PMob,PMob->attRank));
	PMob->setModifier(MOD_ACC, GetBase(PMob,PMob->accRank));

	PMob->m_Weapons[SLOT_MAIN]->setDamage(GetWeaponDamage(PMob));

    //reduce weapon delay of MNK
    if(PMob->GetMJob()==JOB_MNK){
        uint16 delay = PMob->m_Weapons[SLOT_MAIN]->getBaseDelay();
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

	// clear current traits first
    for (uint8 i = 0; i < PMob->TraitList.size(); ++i)
    {
        CTrait* PTrait = PMob->TraitList.at(i);
        PMob->delModifier(PTrait->getMod(), PTrait->getValue());
    }
    PMob->TraitList.clear();

    // add double attack bonus 50+
    if(PMob->GetMLevel() >= 50 && PMob->GetMJob() == JOB_WAR){
    	PMob->delModifier(MOD_DOUBLE_ATTACK, 10);
    	PMob->addModifier(MOD_DOUBLE_ATTACK, 10);
    }

	// add traits for sub and main
	AddTraits(PMob, PMob->GetMJob(), PMob->GetMLevel());
	AddTraits(PMob, PMob->GetSJob(), PMob->GetSLevel());

	PMob->delModifier(MOD_MEVA, PMob->m_magicEvasion);
	//natural magic evasion
	if(PMob->GetMLevel()<=83){
	    PMob->m_magicEvasion = battleutils::GetMaxSkill(SKILL_ELE, JOB_RDM, PMob->GetMLevel());
		PMob->setModifier(MOD_MEVA, PMob->m_magicEvasion);
	} else {
	    PMob->m_magicEvasion = battleutils::GetMaxSkill(SKILL_SWD, JOB_RDM, PMob->GetMLevel());
		PMob->setModifier(MOD_MEVA, PMob->m_magicEvasion);
	}

	// cap all magic skills so they play nice with spell scripts
	for (int i=SKILL_DIV; i <=SKILL_BLU; i++) {
		uint16 maxSkill = battleutils::GetMaxSkill((SKILLTYPE)i,PMob->GetMJob(),PMob->GetMLevel());
		if (maxSkill != 0) {
			PMob->WorkingSkills.skill[i] = maxSkill;
		}
		else //if the mob is WAR/BLM and can cast spell
		{
			// set skill as high as main level, so their spells won't get resisted
			uint16 maxSubSkill = battleutils::GetMaxSkill((SKILLTYPE)i,PMob->GetSJob(),PMob->GetMLevel());

			if (maxSubSkill != 0)
			{
				PMob->WorkingSkills.skill[i] = maxSubSkill;
			}
		}
	}
}

void AddTraits(CMobEntity* PMob, JOBTYPE jobID, uint8 lvl)
{
	TraitList_t* PTraitsList = traits::GetTraits(jobID);
    for (uint8 i = 0; i <  PTraitsList->size(); ++i)
	{
		CTrait* PTrait = PTraitsList->at(i);
		if (lvl >= PTrait->getLevel() && PTrait->getLevel() > 0)
		{
            PMob->addModifier(PTrait->getMod(), PTrait->getValue());
		PMob->TraitList.push_back(PTrait);
		}
	}
}

/* Gets the available spells for the specified monster. This looks up the types of spells the monster
 * can cast based on the bitmask in mob_pools (which has been preloaded into memory). It then resolves
 * the list of actual spell IDs based on the bits set. This mapping from bitmask > spellids is based
 * on numerous factors including the type of mob, the level of the mob, etc. The list of spells are
 * then stored in PMob->PSpellContainer
 */
void GetAvailableSpells(CMobEntity* PMob) {
	//make sure the mob actually has a spell list
	if (PMob->m_SpellListContainer == NULL)
	{
		return;
	}

	// setup recast times
	switch(PMob->GetMJob())
	{
		case JOB_BLM:
		case JOB_BRD:
			PMob->m_MagicRecastTime = 15000;
		break;
		case JOB_NIN:
		case JOB_BLU:
			PMob->m_MagicRecastTime = 25000;
		break;
		case JOB_WHM:
		case JOB_RDM:
			PMob->m_MagicRecastTime = 20000;
		break;
		default:
			PMob->m_MagicRecastTime = 30000;
		break;

	}

	uint16 gaChance = 45;
	uint16 buffChance = 35;
	// change spell chances
	switch(PMob->GetMJob())
	{
		case JOB_BLM:
			gaChance = 60;
			buffChance = 30;
		break;
		case JOB_RDM:
			gaChance = 20;
			buffChance = 40;
		break;
		case JOB_NIN:
			buffChance = 50;
		break;
		case JOB_BRD:
			gaChance = 30;
			buffChance = 40;
		break;
	}

	PMob->SpellContainer->m_gaChance = gaChance;
	PMob->SpellContainer->m_buffChance = buffChance;

	// clear spell list
	PMob->SpellContainer->ClearSpells();

	//insert the rest of the spells
	for (std::vector<MobSpell_t>::iterator it = PMob->m_SpellListContainer->m_spellList.begin(); it != PMob->m_SpellListContainer->m_spellList.end() ; ++it)
	{
		if (PMob->GetMLevel() >= (*it).min_level && PMob->GetMLevel() <= (*it).max_level)
		{
			PMob->SpellContainer->AddSpell((*it).spellId);
		}
	}
}

}; // namespace mobutils
