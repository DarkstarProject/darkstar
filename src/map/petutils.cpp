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

#include <string.h>
#include <vector>
#include <math.h>

#include "battleutils.h"
#include "charutils.h"
#include "grades.h"
#include "map.h"
#include "petutils.h"
#include "zoneutils.h"
#include "mobentity.h"
#include "ability.h"

#include "ai/ai_pet_dummy.h"
#include "ai/ai_mob_dummy.h"

#include "packets/char_sync.h"
#include "packets/char_update.h"
#include "packets/entity_update.h"
#include "packets/pet_sync.h"

struct Pet_t
{
	look_t		look;		// внешний вид
	string_t	name;		// имя
	ECOSYSTEM	EcoSystem;	// эко-система

	uint8		minLevel;	// минимально-возможный  уровень
	uint8		maxLevel;	// максимально-возможный уровень

	uint8		size;		// размер модели
	uint16		m_Family;
	uint32		time;		// время существования (будет использоваться для задания длительности статус эффекта)

	uint8		mJob;
	uint8		m_Element;
  float       HPscale;                             // HP boost percentage
    float       MPscale;                             // MP boost percentage

    uint8 		speed;
    // stat ranks
     uint8        strRank;
    uint8        dexRank;
    uint8        vitRank;
    uint8        agiRank;
    uint8        intRank;
    uint8        mndRank;
    uint8        chrRank;
    uint8        attRank;
    uint8        defRank;
    uint8        accRank;

    // magic stuff
    bool hasSpellScript;
    uint16 spellList;

    // resists
    int16 slashres;
    int16 pierceres;
    int16 hthres;
    int16 impactres;

    int16 firedef;
    int16 icedef;
    int16 winddef;
    int16 earthdef;
    int16 thunderdef;
    int16 waterdef;
    int16 lightdef;
    int16 darkdef;

    int16 fireres;
    int16 iceres;
    int16 windres;
    int16 earthres;
    int16 thunderres;
    int16 waterres;
    int16 lightres;
    int16 darkres;

};

std::vector<Pet_t*> g_PPetList;

namespace petutils
{

/************************************************************************
*																		*
*  Загружаем список прототипов питомцев									*
*																		*
************************************************************************/

void LoadPetList()
{
	FreePetList();

	const int8* Query =
        "SELECT\
          pet_list.name,\
          modelid,\
          minLevel,\
          maxLevel,\
          time,\
          mobsize,\
          systemid,\
          mob_pools.familyid,\
          mob_pools.mJob,\
          pet_list.element,\
          (mob_family_system.HP / 100),\
          (mob_family_system.MP / 100),\
          mob_family_system.speed,\
          mob_family_system.STR,\
          mob_family_system.DEX,\
          mob_family_system.VIT,\
          mob_family_system.AGI,\
          mob_family_system.INT,\
          mob_family_system.MND,\
          mob_family_system.CHR,\
          mob_family_system.DEF,\
          mob_family_system.ATT,\
          mob_family_system.ACC, \
          hasSpellScript, spellList, \
          Slash, Pierce, H2H, Impact, \
		  Fire, Ice, Wind, Earth, Lightning, Water, Light, Dark \
        FROM pet_list, mob_pools, mob_family_system \
        WHERE pet_list.poolid = mob_pools.poolid AND mob_pools.familyid = mob_family_system.familyid";

	if( Sql_Query(SqlHandle, Query) != SQL_ERROR && Sql_NumRows(SqlHandle) != 0)
	{
		while(Sql_NextRow(SqlHandle) == SQL_SUCCESS)
		{
			Pet_t* Pet = new Pet_t();

			Pet->name.insert(0,Sql_GetData(SqlHandle,0));

			memcpy(&Pet->look,Sql_GetData(SqlHandle,1),20);
			Pet->minLevel = (uint8)Sql_GetIntData(SqlHandle,2);
			Pet->maxLevel = (uint8)Sql_GetIntData(SqlHandle,3);
			Pet->time = Sql_GetUIntData(SqlHandle,4);
			Pet->size = Sql_GetUIntData(SqlHandle,5);
			Pet->EcoSystem = (ECOSYSTEM)Sql_GetIntData(SqlHandle,6);
			Pet->m_Family = (uint16)Sql_GetIntData(SqlHandle,7);
			Pet->mJob = (uint8)Sql_GetIntData(SqlHandle,8);
			Pet->m_Element = (uint8)Sql_GetIntData(SqlHandle, 9);

			Pet->HPscale = Sql_GetFloatData(SqlHandle, 10);
			Pet->MPscale = Sql_GetFloatData(SqlHandle, 11);

			Pet->speed = (uint8)Sql_GetIntData(SqlHandle,12);

			Pet->strRank = (uint8)Sql_GetIntData(SqlHandle,13);
			Pet->dexRank = (uint8)Sql_GetIntData(SqlHandle,14);
			Pet->vitRank = (uint8)Sql_GetIntData(SqlHandle,15);
			Pet->agiRank = (uint8)Sql_GetIntData(SqlHandle,16);
			Pet->intRank = (uint8)Sql_GetIntData(SqlHandle,17);
			Pet->mndRank = (uint8)Sql_GetIntData(SqlHandle,18);
			Pet->chrRank = (uint8)Sql_GetIntData(SqlHandle,19);
			Pet->defRank = (uint8)Sql_GetIntData(SqlHandle,20);
			Pet->attRank = (uint8)Sql_GetIntData(SqlHandle,21);
			Pet->accRank = (uint8)Sql_GetIntData(SqlHandle,22);

			Pet->hasSpellScript = (bool)Sql_GetIntData(SqlHandle,23);

			Pet->spellList = (uint8)Sql_GetIntData(SqlHandle,24);

			// resistances
			Pet->slashres = (uint16)(Sql_GetFloatData(SqlHandle,25) * 1000);
			Pet->pierceres = (uint16)(Sql_GetFloatData(SqlHandle,26) * 1000);
			Pet->hthres = (uint16)(Sql_GetFloatData(SqlHandle,27) * 1000);
			Pet->impactres = (uint16)(Sql_GetFloatData(SqlHandle,28) * 1000);

			Pet->firedef = (uint16)((Sql_GetFloatData(SqlHandle, 29) - 1) * -1000);
			Pet->icedef = (uint16)((Sql_GetFloatData(SqlHandle, 30) - 1) * -1000);
			Pet->winddef = (uint16)((Sql_GetFloatData(SqlHandle, 31) - 1) * -1000);
			Pet->earthdef = (uint16)((Sql_GetFloatData(SqlHandle, 32) - 1) * -1000);
			Pet->thunderdef = (uint16)((Sql_GetFloatData(SqlHandle, 33) - 1) * -1000);
			Pet->waterdef = (uint16)((Sql_GetFloatData(SqlHandle, 34) - 1) * -1000);
			Pet->lightdef = (uint16)((Sql_GetFloatData(SqlHandle, 35) - 1) * -1000);
			Pet->darkdef = (uint16)((Sql_GetFloatData(SqlHandle, 36) - 1) * -1000);

			Pet->fireres = (uint16)((Sql_GetFloatData(SqlHandle, 29) - 1) * -100);
			Pet->iceres = (uint16)((Sql_GetFloatData(SqlHandle, 30) - 1) * -100);
			Pet->windres = (uint16)((Sql_GetFloatData(SqlHandle, 31) - 1) * -100);
			Pet->earthres = (uint16)((Sql_GetFloatData(SqlHandle, 32) - 1) * -100);
			Pet->thunderres = (uint16)((Sql_GetFloatData(SqlHandle, 33) - 1) * -100);
			Pet->waterres = (uint16)((Sql_GetFloatData(SqlHandle, 34) - 1) * -100);
			Pet->lightres = (uint16)((Sql_GetFloatData(SqlHandle, 35) - 1) * -100);
			Pet->darkres = (uint16)((Sql_GetFloatData(SqlHandle, 36) - 1) * -100);

			g_PPetList.push_back(Pet);
		}
	}
}

/************************************************************************
*																		*
*  Освобождаем список прототипов питомцев								*
*																		*
************************************************************************/

void FreePetList()
{
	while(!g_PPetList.empty())
	{
		delete *g_PPetList.begin();
		g_PPetList.erase(g_PPetList.begin());
	}
}

void AttackTarget(CBattleEntity* PMaster, CBattleEntity* PTarget){
	DSP_DEBUG_BREAK_IF(PMaster->PPet==NULL);

	CPetEntity* PPet = (CPetEntity*)PMaster->PPet;
	PPet->PBattleAI->SetBattleTarget(PTarget);
	PPet->PBattleAI->SetCurrentAction(ACTION_ATTACK);
}

void RetreatToMaster(CBattleEntity* PMaster){
	DSP_DEBUG_BREAK_IF(PMaster->PPet==NULL);

	CPetEntity* PPet = (CPetEntity*)PMaster->PPet;
	PPet->PBattleAI->SetCurrentAction(ACTION_DISENGAGE);
}

uint16 GetJugWeaponDamage(CPetEntity* PPet)
{
	float MainLevel = PPet->GetMLevel();
	return (uint16)(MainLevel * (MainLevel < 40 ? 1.4 - MainLevel/100 : 1));
}
uint16 GetJugBase(CPetEntity * PMob, uint8 rank)
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

void LoadJugStats(CPetEntity* PMob, Pet_t* petStats){
	//follows monster formulas but jugs have no subjob

	float growth = 1.0;
	uint8 lvl = PMob->GetMLevel();

	//give hp boost every 10 levels after 25
	//special boosts at 25 and 50
	if(lvl > 75){
		growth = 1.25;
	}else if(lvl > 65){
		growth = 1.24;
	} else if(lvl > 55){
		growth = 1.22;
	} else if(lvl > 50){
		growth = 1.18;
	} else if(lvl > 45){
		growth = 1.14;
	} else if(lvl > 35){
		growth = 1.11;
	} else if(lvl > 25){
		growth = 1.07;
	}

	PMob->health.maxhp = (int16)(18.0 * pow(lvl, growth) * petStats->HPscale);

	switch(PMob->GetMJob()){
	case JOB_PLD:
	case JOB_WHM:
	case JOB_BLM:
	case JOB_RDM:
	case JOB_DRK:
	case JOB_BLU:
	case JOB_SCH:
		PMob->health.maxmp = (int16)(18.2 * pow(lvl,1.1075) * petStats->MPscale);
		break;
	}

	PMob->speed = petStats->speed;
	PMob->speedsub = petStats->speed;

    PMob->UpdateHealth();
	PMob->health.tp = 0;
    PMob->health.hp = PMob->GetMaxHP();
    PMob->health.mp = PMob->GetMaxMP();

    uint16 evaRank = battleutils::GetSkillRank(SKILL_EVA, PMob->GetMJob());

	PMob->setModifier(MOD_DEF, GetJugBase(PMob, petStats->defRank));
	PMob->setModifier(MOD_EVA, GetJugBase(PMob, evaRank));
	PMob->setModifier(MOD_ATT, GetJugBase(PMob, petStats->attRank));
	PMob->setModifier(MOD_ACC, GetJugBase(PMob, petStats->accRank));

	PMob->m_Weapons[SLOT_MAIN]->setDamage(GetJugWeaponDamage(PMob));

    //reduce weapon delay of MNK
    if(PMob->GetMJob()==JOB_MNK){
		PMob->m_Weapons[SLOT_MAIN]->resetDelay();
    }

	uint16 fSTR = GetBaseToRank(petStats->strRank, PMob->GetMLevel());
	uint16 fDEX = GetBaseToRank(petStats->dexRank, PMob->GetMLevel());
	uint16 fAGI = GetBaseToRank(petStats->vitRank, PMob->GetMLevel());
	uint16 fINT = GetBaseToRank(petStats->agiRank, PMob->GetMLevel());
	uint16 fMND = GetBaseToRank(petStats->intRank, PMob->GetMLevel());
	uint16 fCHR = GetBaseToRank(petStats->mndRank, PMob->GetMLevel());
	uint16 fVIT = GetBaseToRank(petStats->chrRank, PMob->GetMLevel());

	uint16 mSTR = GetBaseToRank(grade::GetJobGrade(PMob->GetMJob(),2), PMob->GetMLevel());
	uint16 mDEX = GetBaseToRank(grade::GetJobGrade(PMob->GetMJob(),3), PMob->GetMLevel());
	uint16 mVIT = GetBaseToRank(grade::GetJobGrade(PMob->GetMJob(),4), PMob->GetMLevel());
	uint16 mAGI = GetBaseToRank(grade::GetJobGrade(PMob->GetMJob(),5), PMob->GetMLevel());
	uint16 mINT = GetBaseToRank(grade::GetJobGrade(PMob->GetMJob(),6), PMob->GetMLevel());
	uint16 mMND = GetBaseToRank(grade::GetJobGrade(PMob->GetMJob(),7), PMob->GetMLevel());
	uint16 mCHR = GetBaseToRank(grade::GetJobGrade(PMob->GetMJob(),8), PMob->GetMLevel());

	PMob->stats.STR = fSTR + mSTR;
	PMob->stats.DEX = fDEX + mDEX;
	PMob->stats.VIT = fVIT + mVIT;
	PMob->stats.AGI = fAGI + mAGI;
	PMob->stats.INT = fINT + mINT;
	PMob->stats.MND = fMND + mMND;
	PMob->stats.CHR = fCHR + mCHR;

}

void LoadAvatarStats(CPetEntity* PChar)
{
	// Объявление переменных, нужных для рассчета.
	float raceStat  = 0;			// конечное число HP для уровня на основе расы.
	float jobStat   = 0;			// конечное число HP для уровня на основе первичной профессии.
	float sJobStat  = 0;			// коенчное число HP для уровня на основе вторичной профессии.
	int32 bonusStat = 0;			// бонусное число HP которое добавляется при соблюдении некоторых условий.
	int32 baseValueColumn   = 0;	// номер колонки с базовым количеством HP
	int32 scaleTo60Column   = 1;	// номер колонки с модификатором до 60 уровня
	int32 scaleOver30Column = 2;	// номер колонки с модификатором после 30 уровня
	int32 scaleOver60Column = 3;	// номер колонки с модификатором после 60 уровня
	int32 scaleOver75Column = 4;	// номер колонки с модификатором после 75 уровня
	int32 scaleOver60 = 2;			// номер колонки с модификатором для расчета MP после 60 уровня
	int32 scaleOver75 = 3;			// номер колонки с модификатором для расчета Статов после 75-го уровня

	uint8 grade;

	uint8 mlvl = PChar->GetMLevel();
	JOBTYPE mjob = PChar->GetMJob();
	uint8 race = 3;					//Tarutaru

	// Расчет прироста HP от main job
	int32 mainLevelOver30 = dsp_cap(mlvl - 30, 0, 30);			// Расчет условия +1HP каждый лвл после 30 уровня
	int32 mainLevelUpTo60 = (mlvl < 60 ? mlvl - 1 : 59 );			// Первый режим рассчета до 60 уровня (Используется так же и для MP)
	int32 mainLevelOver60To75 = dsp_cap(mlvl - 60, 0, 15);		// Второй режим расчета после 60 уровня
	int32 mainLevelOver75 = (mlvl < 75 ? 0 : mlvl - 75);			// Третий режим расчета после 75 уровня

	//Расчет бонусного количества HP
	int32 mainLevelOver10 = (mlvl < 10 ? 0 : mlvl - 10);			// +2HP на каждом уровне после 10
	int32 mainLevelOver50andUnder60 = dsp_cap(mlvl - 50, 0, 10);	// +2HP на каждом уровне в промежутке от 50 до 60 уровня
	int32 mainLevelOver60 = (mlvl < 60 ? 0 : mlvl - 60);

	// Расчет raceStat jobStat bonusStat sJobStat
	// Расчет по расе

	grade = grade::GetRaceGrades(race,0);

	raceStat = grade::GetHPScale(grade,baseValueColumn) +
		(grade::GetHPScale(grade,scaleTo60Column) * mainLevelUpTo60) +
		(grade::GetHPScale(grade,scaleOver30Column) * mainLevelOver30) +
		(grade::GetHPScale(grade,scaleOver60Column) * mainLevelOver60To75) +
		(grade::GetHPScale(grade,scaleOver75Column) * mainLevelOver75);

	// raceStat = (int32)(statScale[grade][baseValueColumn] + statScale[grade][scaleTo60Column] * (mlvl - 1));

	// Расчет по main job
	grade = grade::GetJobGrade(mjob,0);

	jobStat = grade::GetHPScale(grade,baseValueColumn) +
		(grade::GetHPScale(grade,scaleTo60Column) * mainLevelUpTo60) +
		(grade::GetHPScale(grade,scaleOver30Column) * mainLevelOver30) +
		(grade::GetHPScale(grade,scaleOver60Column) * mainLevelOver60To75) +
		(grade::GetHPScale(grade,scaleOver75Column) * mainLevelOver75);

	// Расчет бонусных HP
	bonusStat = (mainLevelOver10 + mainLevelOver50andUnder60) * 2;
	PChar->health.maxhp = (int16)(raceStat + jobStat + bonusStat + sJobStat);
	PChar->health.hp = PChar->health.maxhp;

	//Начало расчера MP
	raceStat = 0;
	jobStat  = 0;
	sJobStat = 0;

	// Расчет MP расе.
	grade = grade::GetRaceGrades(race,1);

	//Если у main job нет МП рейтинга, расчитиваем расовый бонус на основе уровня subjob уровня(при условии, что у него есть МП рейтинг)
	if (grade::GetJobGrade(mjob,1) == 0)
	{
	}else{
		//Расчет нормального расового бонуса
		raceStat = grade::GetMPScale(grade,0) +
			grade::GetMPScale(grade,scaleTo60Column) * mainLevelUpTo60 +
			grade::GetMPScale(grade,scaleOver60) * mainLevelOver60;
	}

	//Для главной профессии
	grade = grade::GetJobGrade(mjob,1);
	if (grade > 0)
	{
		jobStat = grade::GetMPScale(grade,0) +
			grade::GetMPScale(grade,scaleTo60Column) * mainLevelUpTo60 +
			grade::GetMPScale(grade,scaleOver60) * mainLevelOver60;
	}

	PChar->health.maxmp = (int16)(raceStat + jobStat + sJobStat); // результат расчета MP
	//add in evasion from skill
	int16 evaskill = PChar->GetSkill(SKILL_EVA);
	int16 eva = evaskill;
	if(evaskill>200){ //Evasion skill is 0.9 evasion post-200
		eva = 200 + (evaskill-200)*0.9;
	}
	PChar->setModifier(MOD_EVA,eva);

	//Начало расчета характеристик
	uint8 counter = 0;
	for (uint8 StatIndex = 2; StatIndex <=8; ++StatIndex)
	{
		// расчет по расе
		grade = grade::GetRaceGrades(race,StatIndex);
		raceStat = grade::GetStatScale(grade,0) + grade::GetStatScale(grade,scaleTo60Column) * mainLevelUpTo60;

		if (mainLevelOver60 > 0)
		{
			raceStat += grade::GetStatScale(grade,scaleOver60) * mainLevelOver60;
			if (mainLevelOver75 > 0)
			{
				raceStat += grade::GetStatScale(grade,scaleOver75) * mainLevelOver75  - (mlvl >= 75 ? 0.01f : 0);
			}
		}

		// расчет по профессии
		grade = grade::GetJobGrade(mjob,StatIndex);
		jobStat = grade::GetStatScale(grade,0) + grade::GetStatScale(grade,scaleTo60Column) * mainLevelUpTo60;

		if (mainLevelOver60 > 0)
		{
			jobStat += grade::GetStatScale(grade,scaleOver60) * mainLevelOver60;

			if (mainLevelOver75 > 0)
			{
				jobStat += grade::GetStatScale(grade,scaleOver75) * mainLevelOver75  - (mlvl >= 75 ? 0.01f : 0);
			}
		}

		jobStat = jobStat * 1.5; //stats from subjob (assuming BLM/BLM for avatars)

		// Вывод значения
		WBUFW(&PChar->stats,counter) = (uint16)(raceStat + jobStat);
		counter += 2;
	}
}

/************************************************************************
*																		*
*																		*
*																		*
************************************************************************/

void SpawnPet(CBattleEntity* PMaster, uint32 PetID, bool spawningFromZone)
{
	DSP_DEBUG_BREAK_IF(PetID >= g_PPetList.size());
	if(PMaster->GetMJob()!=JOB_DRG && PetID == PETID_WYVERN) {
		return;
	}

	if (PMaster->objtype == TYPE_PC)
		((CCharEntity*)PMaster)->petZoningInfo.petID = PetID;

	PETTYPE petType = PETTYPE_JUGPET;
	if(PetID<=20){
		petType = PETTYPE_AVATAR;
	}
	else if(PetID==PETID_WYVERN){
		petType = PETTYPE_WYVERN;
	}
	CPetEntity* PPet = new CPetEntity(petType);

    PPet->loc = PMaster->loc;

    // spawn me randomly around master
	PPet->loc.p = nearPosition(PMaster->loc.p, 2.1f, M_PI);

	PPet->look = g_PPetList.at(PetID)->look;
	PPet->name = g_PPetList.at(PetID)->name;
	PPet->m_Family = g_PPetList.at(PetID)->m_Family;
	PPet->SetMJob(g_PPetList.at(PetID)->mJob);
	PPet->m_Element = g_PPetList.at(PetID)->m_Element;
	PPet->m_PetID = PetID;

	if(PPet->getPetType()==PETTYPE_AVATAR){
		if(PMaster->GetMJob()==JOB_SMN){
			PPet->SetMLevel(PMaster->GetMLevel());
		}
		else if(PMaster->GetSJob()==JOB_SMN){
			PPet->SetMLevel(PMaster->GetSLevel());
		}
		else{ //should never happen
			ShowDebug("%s summoned an avatar but is not SMN main or SMN sub! Please report. \n",PMaster->GetName());
			PPet->SetMLevel(1);
		}
		LoadAvatarStats(PPet); //follows PC calcs (w/o SJ)
		PPet->setModifier(MOD_DMGPHYS,-50); //-50% PDT
		if(PPet->GetMLevel() >= 70){
			PPet->setModifier(MOD_MATT, 32);
		} else if (PPet->GetMLevel() >= 50){
			PPet->setModifier(MOD_MATT, 28);
		} else if (PPet->GetMLevel() >= 30){
			PPet->setModifier(MOD_MATT, 24);
		} else if (PPet->GetMLevel() >= 10){
			PPet->setModifier(MOD_MATT, 20);
		}
		PPet->m_Weapons[SLOT_MAIN]->setDelay(floor(1000.0f*(320.0f/60.0f)));
		if(PetID==PETID_FENRIR){
			PPet->m_Weapons[SLOT_MAIN]->setDelay(floor(1000.0*(280.0f/60.0f)));
		}
		PPet->m_Weapons[SLOT_MAIN]->setDamage(floor(PPet->GetMLevel()*0.74f));
		if(PetID==PETID_CARBUNCLE){
			PPet->m_Weapons[SLOT_MAIN]->setDamage(floor(PPet->GetMLevel()*0.67f));
		}
		//Set B+ weapon skill (assumed capped for level derp)
		//attack is madly high for avatars (roughly x2)
		PPet->setModifier(MOD_ATT, 2*battleutils::GetMaxSkill(SKILL_CLB,JOB_WHM,PPet->GetMLevel()));
		PPet->setModifier(MOD_ACC, battleutils::GetMaxSkill(SKILL_CLB,JOB_WHM,PPet->GetMLevel()));
		//Set E evasion and def
		PPet->setModifier(MOD_EVA, battleutils::GetMaxSkill(SKILL_THR,JOB_WHM,PPet->GetMLevel()));
		PPet->setModifier(MOD_DEF, battleutils::GetMaxSkill(SKILL_THR,JOB_WHM,PPet->GetMLevel()));
		// cap all magic skills so they play nice with spell scripts
		for (int i=SKILL_DIV; i <=SKILL_BLU; i++) {
			uint16 maxSkill = battleutils::GetMaxSkill((SKILLTYPE)i,PPet->GetMJob(),PPet->GetMLevel());
			if (maxSkill != 0) {
				PPet->WorkingSkills.skill[i] = maxSkill;
			}
			else //if the mob is WAR/BLM and can cast spell
			{
				// set skill as high as main level, so their spells won't get resisted
				uint16 maxSubSkill = battleutils::GetMaxSkill((SKILLTYPE)i,PPet->GetSJob(),PPet->GetMLevel());

				if (maxSubSkill != 0)
				{
					PPet->WorkingSkills.skill[i] = maxSubSkill;
				}
			}
		}

		PMaster->addModifier(MOD_AVATAR_PERPETUATION, PerpetuationCost(PetID, PPet->GetMLevel()));
	}
	else if(PPet->getPetType()==PETTYPE_JUGPET){
		PPet->m_Weapons[SLOT_MAIN]->setDelay(floor(1000.0f*(240.0f/60.0f)));
		//TODO: Base off the caps + merits depending on jug type
		PPet->SetMLevel(PMaster->GetMLevel());
		LoadJugStats(PPet, g_PPetList.at(PetID)); //follow monster calcs (w/o SJ)
	}
	else if(PPet->getPetType()==PETTYPE_WYVERN){
		//set the wyvern job based on master's SJ
		if(PMaster->GetSJob()!=NULL){
			// I don't think this is correct
			switch(PMaster->GetSJob()){
				//defensive
			case JOB_WHM:
			case JOB_BLM:
			case JOB_RDM:
			case JOB_BLU:
			case JOB_SMN:
			case JOB_SCH:
				PPet->SetMJob(JOB_WHM);
				break;
				//multipurpose
			case JOB_BRD:
			case JOB_DRK:
			case JOB_PLD:
			case JOB_NIN:
				PPet->SetMJob(JOB_RDM);
				break;
			}
		}
		PPet->SetMJob(JOB_DRG);
		PPet->SetMLevel(PMaster->GetMLevel());

		LoadAvatarStats(PPet); //follows PC calcs (w/o SJ)
		PPet->m_Weapons[SLOT_MAIN]->setDelay(floor(1000.0f*(320.0f/60.0f))); //320 delay
		PPet->m_Weapons[SLOT_MAIN]->setDamage(1+floor(PPet->GetMLevel()*0.9f));
		//Set A+ weapon skill
		PPet->setModifier(MOD_ATT, battleutils::GetMaxSkill(SKILL_GAX,JOB_WAR,PPet->GetMLevel()));
		PPet->setModifier(MOD_ACC, battleutils::GetMaxSkill(SKILL_GAX,JOB_WAR,PPet->GetMLevel()));
		//Set D evasion and def
		PPet->setModifier(MOD_EVA, battleutils::GetMaxSkill(SKILL_H2H,JOB_WAR,PPet->GetMLevel()));
		PPet->setModifier(MOD_DEF, battleutils::GetMaxSkill(SKILL_H2H,JOB_WAR,PPet->GetMLevel()));
	}
	//set C magic evasion
	PPet->setModifier(MOD_MEVA, battleutils::GetMaxSkill(SKILL_ELE,JOB_RDM,PPet->GetMLevel()));
	PPet->health.tp = 0;
    PPet->UpdateHealth();
	PPet->PetSkills = battleutils::GetMobSkillsByFamily(PPet->m_Family);
	PPet->status = STATUS_NORMAL;
	PPet->m_ModelSize += g_PPetList.at(PetID)->size;
	PPet->m_EcoSystem  = g_PPetList.at(PetID)->EcoSystem;

	PPet->PBattleAI = new CAIPetDummy(PPet);
	PPet->PBattleAI->SetLastActionTime(gettick());
	PPet->PBattleAI->SetCurrentAction(ACTION_SPAWN);

    PMaster->PPet = PPet;
	PPet->PMaster = PMaster;

    PMaster->loc.zone->InsertPET(PPet);
	if (PMaster->objtype == TYPE_PC)
	{
		charutils::BuildingCharPetAbilityTable((CCharEntity*)PMaster,PPet,PetID);
		((CCharEntity*)PMaster)->pushPacket(new CCharUpdatePacket((CCharEntity*)PMaster));
		((CCharEntity*)PMaster)->pushPacket(new CPetSyncPacket((CCharEntity*)PMaster));
	}


	// apply stats from previous zone if this pet is being transfered
	if (spawningFromZone == true)
	{
		PPet->health.tp = ((CCharEntity*)PMaster)->petZoningInfo.petTP;
		PPet->health.hp = ((CCharEntity*)PMaster)->petZoningInfo.petHP;
	}

}

void SpawnMobPet(CBattleEntity* PMaster, uint32 PetID)
{
	/*
	This should eventually be merged into one big spawn pet method.
	At the moment player pets and mob pets are totally different. We need a central place
	to manage pet families and spawn them.
	*/

	// grab pet info
	Pet_t* petData = g_PPetList.at(PetID);
	CMobEntity* PPet = (CMobEntity*)PMaster->PPet;

	PPet->look = petData->look;
	PPet->name = petData->name;
	PPet->m_EcoSystem = petData->EcoSystem;
	PPet->m_Family = petData->m_Family;
	PPet->m_Element = petData->m_Element;
	PPet->HPscale = petData->HPscale;
	PPet->MPscale = petData->MPscale;
	PPet->m_HasSpellScript = petData->hasSpellScript;

    // assuming elemental spawn
    PPet->setModifier(MOD_DMGPHYS,-50); //-50% PDT

	PPet->m_SpellListContainer = mobSpellList::GetMobSpellList(petData->spellList);

	PPet->setModifier(MOD_SLASHRES, petData->slashres);
	PPet->setModifier(MOD_PIERCERES,petData->pierceres);
	PPet->setModifier(MOD_HTHRES, petData->hthres);
	PPet->setModifier(MOD_IMPACTRES, petData->impactres);

    PPet->setModifier(MOD_FIREDEF,    petData->firedef); // These are stored as floating percentages
    PPet->setModifier(MOD_ICEDEF,     petData->icedef); // and need to be adjusted into modifier units.
    PPet->setModifier(MOD_WINDDEF,    petData->winddef); // Higher DEF = lower damage.
    PPet->setModifier(MOD_EARTHDEF,   petData->earthdef); // Negatives signify increased damage.
    PPet->setModifier(MOD_THUNDERDEF, petData->thunderdef); // Positives signify reduced damage.
    PPet->setModifier(MOD_WATERDEF,   petData->waterdef); // Ex: 125% damage would be 1.25, 50% damage would be 0.50
    PPet->setModifier(MOD_LIGHTDEF,   petData->lightdef); // (1.25 - 1) * -1000 = -250 DEF
    PPet->setModifier(MOD_DARKDEF,    petData->darkdef); // (0.50 - 1) * -1000 = 500 DEF

    PPet->setModifier(MOD_FIRERES,    petData->fireres); // These are stored as floating percentages
    PPet->setModifier(MOD_ICERES,     petData->iceres); // and need to be adjusted into modifier units.
    PPet->setModifier(MOD_WINDRES,    petData->windres); // Higher RES = lower damage.
    PPet->setModifier(MOD_EARTHRES,   petData->earthres); // Negatives signify lower resist chance.
    PPet->setModifier(MOD_THUNDERRES, petData->thunderres); // Positives signify increased resist chance.
    PPet->setModifier(MOD_WATERRES,   petData->waterres);
    PPet->setModifier(MOD_LIGHTRES,   petData->lightres);
    PPet->setModifier(MOD_DARKRES,    petData->darkres);

}

/************************************************************************
*																		*
*																		*
*																		*
************************************************************************/

void DespawnPet(CBattleEntity* PMaster)
{
	DSP_DEBUG_BREAK_IF(PMaster->PPet == NULL);

	CBattleEntity* PPet = PMaster->PPet;


	// mob was not reset properly on death/uncharm
	// reset manually
	if (PPet->isCharmed && PMaster->objtype == TYPE_MOB)
	{
		PPet->isCharmed = false;
		PMaster->charmTime = 0;

		delete PPet->PBattleAI;
		PPet->PBattleAI = new CAIMobDummy((CMobEntity*)PMaster);
		PPet->PBattleAI->SetLastActionTime(gettick());
		PPet->PBattleAI->SetCurrentAction(ACTION_FALL);

		ShowDebug("An ex charmed mob was not reset properly, Manually resetting it.\n");
		return;
	}



	switch (PPet->objtype)
	{
		case TYPE_PET:
		{
			PPet->PBattleAI->SetCurrentAction(ACTION_FALL);
			if( ((CPetEntity*)PPet)->getPetType() == PETTYPE_AVATAR )
				PMaster->setModifier(MOD_AVATAR_PERPETUATION, 0);
		}
		break;
		case TYPE_MOB:
		{
				if(PMaster->objtype == TYPE_PC)
				{

					CMobEntity* PMob = (CMobEntity*)PMaster->PPet;
					CCharEntity* PChar = (CCharEntity*)PMaster;


					// mobs charm wears off whist fighting another mob. Both mobs now attack player since mobs are no longer enemies
					if(PMob->PBattleAI != NULL && PMob->PBattleAI->GetBattleTarget() != NULL && PMob->PBattleAI->GetBattleTarget()->objtype == TYPE_MOB){
						((CMobEntity*)PMob->PBattleAI->GetBattleTarget())->PEnmityContainer->Clear();
						((CMobEntity*)PMob->PBattleAI->GetBattleTarget())->PEnmityContainer->UpdateEnmity(PChar, 0, 0);
					}

					//clear the ex-charmed mobs enmity
					PMob->PEnmityContainer->Clear();

					// charm time is up, mob attacks player now
					if (!PMob->GetHPP() == 0 && !PMob->PMaster->GetHPP() == 0)
					{
						PMob->PEnmityContainer->UpdateEnmity(PChar, 0, 0);
						PMob->health.tp = 0;// reset tp to 0 to stop mobAi using tp move on player as soon as charm wears
					}
					else
					{
						PMob->m_OwnerID.clean();
					}

					//master using leave command
					if (PMaster->PBattleAI->GetCurrentAction() == ACTION_JOBABILITY_FINISH && PMaster->PBattleAI->GetCurrentJobAbility()->getID() == 55 || PChar->loc.zoning)
					{
						PMob->PEnmityContainer->Clear();
						PMob->m_OwnerID.clean();
					}

					PMob->isCharmed = false;
					PMob->charmTime = NULL;
					PMob->PMaster = NULL;

					delete PMob->PBattleAI;
					PMob->PBattleAI = new CAIMobDummy(PMob);

					PMob->PBattleAI->SetLastActionTime(gettick());

					if (PMob->GetHPP() == 0)
						PMob->PBattleAI->SetCurrentAction(ACTION_FALL);
					else
						PMob->PBattleAI->SetCurrentAction(ACTION_ROAMING);


					PChar->PPet = NULL;
					PChar->pushPacket(new CCharUpdatePacket(PChar));
					PMob->loc.zone->PushPacket(PMob, CHAR_INRANGE, new CEntityUpdatePacket(PMob, ENTITY_UPDATE));
				}

		}
		break;
		case TYPE_PC:
		{
			// освобождаем персонажа из под контроля
		}
		break;
	}
}



void MakePetStay(CBattleEntity* PMaster)
{
	if(PMaster->PPet != NULL)
		PMaster->PPet->PBattleAI->SetCurrentAction(ACTION_NONE);
}

int16 PerpetuationCost(uint32 id, uint8 level)
{
	int16 cost = 0;
	if (id >= 0 && id <= 7)
	{
		if( level < 19 )
			cost = 1;
		else if (level < 38 )
			cost = 2;
		else if (level < 57 )
			cost = 3;
		else if (level < 75 )
			cost = 4;
		else if (level < 81 )
			cost = 5;
		else if (level < 91 )
			cost = 6;
		else
			cost = 7;
	}
	else if (id == 8 )
	{
		if (level < 10 )
			cost = 1;
		else if (level < 18 )
			cost = 2;
		else if (level < 27 )
			cost = 3;
		else if (level < 36 )
			cost = 4;
		else if (level < 45 )
			cost = 5;
		else if (level < 54 )
			cost = 6;
		else if (level < 63 )
			cost = 7;
		else if (level < 72 )
			cost = 8;
		else if (level < 81 )
			cost = 9;
		else if (level < 91 )
			cost = 10;
		else
			cost = 11;
	}
	else if (id == 9 )
	{
		if (level < 8 )
			cost = 1;
		else if (level < 15 )
			cost = 2;
		else if (level < 22 )
			cost = 3;
		else if (level < 30 )
			cost = 4;
		else if (level < 37 )
			cost = 5;
		else if (level < 45 )
			cost = 6;
		else if (level < 51 )
			cost = 7;
		else if (level < 59 )
			cost = 8;
		else if (level < 66 )
			cost = 9;
		else if (level < 73 )
			cost = 10;
		else if (level < 81 )
			cost = 11;
		else if (level < 91 )
			cost = 12;
		else
			cost = 13;
	}
	else if (id <= 15 )
	{
		if (level < 10 )
			cost = 3;
		else if (level < 19 )
			cost = 4;
		else if (level < 28 )
			cost = 5;
		else if (level < 38 )
			cost = 6;
		else if (level < 47 )
			cost = 7;
		else if (level < 56 )
			cost = 8;
		else if (level < 65 )
			cost = 9;
		else if (level < 68 )
			cost = 10;
		else if (level < 71 )
			cost = 11;
		else if (level < 74 )
			cost = 12;
		else if (level < 81 )
			cost = 13;
		else if (level < 91 )
			cost = 14;
		else
			cost = 15;
	}

	return cost;
}

/*
Familiars a pet.
*/
void Familiar(CBattleEntity* PPet)
{

    /*
        Boost HP by 10%
        Increase charm duration up to 30 mins
        boost all stats by 5%
    */

    if(PPet->objtype == TYPE_MOB && PPet->isCharmed)
    {
        // increase charm duration
        PPet->charmTime += 108000 - rand()%18000;
    }

    // boost hp by 10%
    uint16 boost = (float)PPet->health.maxhp * 0.10;

    PPet->health.maxhp += boost;
    PPet->health.hp += boost;
    PPet->UpdateHealth();

    // boost stats by 10%
    PPet->addModifier(MOD_ATTP, 10);
    PPet->addModifier(MOD_ACCP, 10);
    PPet->addModifier(MOD_EVAP, 10);
    PPet->addModifier(MOD_DEFP, 10);

}

}; // namespace petutils
