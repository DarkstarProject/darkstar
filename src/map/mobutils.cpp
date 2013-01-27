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

		if(PMob->m_Type & MOBTYPE_NOTORIOUS){
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
			if(PMob->m_Type & MOBTYPE_NOTORIOUS){
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

	PMob->setModifier(MOD_DEF, GetBase(PMob,3));
	PMob->setModifier(MOD_EVA, GetBase(PMob,3));

	uint16 BaseAttack = 0;

	if(PMob->GetMLevel() <= 30) {
		BaseAttack = (uint16)(PMob->GetMLevel() * 31 / 10);
	} else if(PMob->GetMLevel() <= 50) {
		BaseAttack = (uint16)(PMob->GetMLevel() * 30 / 10);
	} else if(PMob->GetMLevel() > 50) {
		BaseAttack = (uint16)(PMob->GetMLevel() * 37 / 10);
	}

	PMob->setModifier(MOD_ATT, BaseAttack);
	
	//MNK attack rate should be lower
	if(PMob->GetMJob() == JOB_MNK){
		BaseAttack = (float)BaseAttack*0.4;
	}

	PMob->setModifier(MOD_ACC, BaseAttack);

	PMob->m_Weapons[SLOT_MAIN]->setDamage(GetWeaponDamage(PMob));

	 
    //reduce weapon delay of MNK
    if(PMob->GetMJob()==JOB_MNK){
        uint16 delay = PMob->m_Weapons[SLOT_MAIN]->getDelay((CBattleEntity*)PMob);

	    //reduce delay based on level
	    //this will remove about 78 delay at level 75
	    delay -= (((float)PMob->GetMLevel() * 1.05) * 1000) / 60;

		PMob->m_Weapons[SLOT_MAIN]->setDelay(delay);
    }

	
	uint16 fSTR = GetBaseToRank(3, PMob->GetMLevel());
	uint16 fDEX = GetBaseToRank(3, PMob->GetMLevel());
	uint16 fAGI = GetBaseToRank(3, PMob->GetMLevel());
	uint16 fINT = GetBaseToRank(3, PMob->GetMLevel());
	uint16 fMND = GetBaseToRank(3, PMob->GetMLevel());
	uint16 fCHR = GetBaseToRank(3, PMob->GetMLevel());
	uint16 fVIT = GetBaseToRank(3, PMob->GetMLevel());

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

	if(PMob->m_Type & MOBTYPE_NOTORIOUS){
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
	}

	// TODO: Use enums rather than hardcode the spell ids...

	// map from PMob->m_SpellsBitmask to PMob->m_AvailableSpells
	// Single targe tier spells
	if (PMob->m_SpellsBitmask.fire.tiers) {
		AddHighestAvailableSpell(PMob, 148, 144);  // Fire V -> I
	}
	if (PMob->m_SpellsBitmask.earth.tiers) {
		AddHighestAvailableSpell(PMob, 163, 159); // Stone V -> I
	}
	if (PMob->m_SpellsBitmask.water.tiers) {
		AddHighestAvailableSpell(PMob, 173, 169); // Water V -> I
	}
	if (PMob->m_SpellsBitmask.wind.tiers) {
		AddHighestAvailableSpell(PMob, 158, 154); // Aero V -> I
	}
	if (PMob->m_SpellsBitmask.ice.tiers) {
		AddHighestAvailableSpell(PMob, 153, 149); // Blizzard V -> I
	}
	if (PMob->m_SpellsBitmask.lightning.tiers) {
		AddHighestAvailableSpell(PMob, 168, 164); // Thunder V -> I
	}
	if (PMob->m_SpellsBitmask.light.tiers) {
		AddHighestAvailableSpell(PMob, 30, 28); // Banish III -> I
	}
	//// AoE Spells
	if (PMob->m_SpellsBitmask.fire.aoe) {
		AddHighestAvailableSpell(PMob, 178, 174); // Firaga V -> I
	}
	if (PMob->m_SpellsBitmask.earth.aoe) {
		AddHighestAvailableSpell(PMob, 193, 189); // Stonega V -> I
	}
	if (PMob->m_SpellsBitmask.water.aoe) {
		AddHighestAvailableSpell(PMob, 203, 199); // Waterga V -> I
	}
	if (PMob->m_SpellsBitmask.wind.aoe) {
		AddHighestAvailableSpell(PMob, 188, 184); // Aeroga V -> I
	}
	if (PMob->m_SpellsBitmask.ice.aoe) {
		AddHighestAvailableSpell(PMob, 183, 179); // Blizzaga V -> I
	}
	if (PMob->m_SpellsBitmask.lightning.aoe) {
		AddHighestAvailableSpell(PMob, 198, 194); // Thundaga V -> I
	}
	if (PMob->m_SpellsBitmask.light.aoe) {
		AddHighestAvailableSpell(PMob, 42, 38); // Banishga V -> I
	}

	/* WHM spells may work but I haven't tested it.
	// TODO: Test this thoroughly
	if (PMob->m_SpellsBitmask.light.heal) {
		for (int i=6; i>=1; i--) {
			if (spell::CanUseSpell(PMob, i)) { // Cure VI -> I
				PMob->m_AvailableSpells.push_back(i);
				break; // we've got the highest level we can use, so stop looking for lower ones
			}
		}
	} */
}

void AddHighestAvailableSpell(CMobEntity* PMob, uint16 highestId, uint16 lowestId)
{
	for (int i=highestId; i>=lowestId; i--) {
		if (spell::CanUseSpell(PMob, i)) {
			PMob->m_AvailableSpells.push_back(i);
			break; // we've got the highest level we can use, so stop looking for lower ones
		}
	}
}

}; // namespace mobutils
