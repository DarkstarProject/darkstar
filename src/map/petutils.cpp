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
          pet_list.element\
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

void LoadJugStats(CPetEntity* PMob){
	//follows monster formulas but jugs have no subjob

	PMob->health.maxhp = (int16)(18.2 * pow(PMob->GetMLevel(),1.2675));
    
	switch(PMob->GetMJob()){
	case JOB_PLD:
	case JOB_WHM:
	case JOB_BLM:
	case JOB_RDM:
	case JOB_DRK:
	case JOB_BLU:
	case JOB_SCH:
		PMob->health.maxmp = (int16)(18.2 * pow(PMob->GetMLevel(),1.2675));
		break;
	}

    PMob->UpdateHealth();
	PMob->health.tp = 0;
    PMob->health.hp = PMob->GetMaxHP();
    PMob->health.mp = PMob->GetMaxMP();
	PMob->setModifier(MOD_DEF, GetJugBase(PMob,3));
	PMob->setModifier(MOD_EVA, GetJugBase(PMob,3));
	uint16 BaseAttack = 0;

	if(PMob->GetMLevel() <= 30) {
		BaseAttack = (uint16)(PMob->GetMLevel() * 31 / 10); 
	} else if(PMob->GetMLevel() <= 50) {
		BaseAttack = (uint16)(PMob->GetMLevel() * 30 / 10); 
	} else if(PMob->GetMLevel() > 50) {
		BaseAttack = (uint16)(PMob->GetMLevel() * 37 / 10); 
	}

	PMob->setModifier(MOD_ATT, BaseAttack);
	PMob->setModifier(MOD_ACC, BaseAttack);

	PMob->m_Weapons[SLOT_MAIN]->setDamage(GetJugWeaponDamage(PMob));

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
	uint8 race = 0;					//Human
	
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

void SpawnPet(CBattleEntity* PMaster, uint32 PetID)
{
	DSP_DEBUG_BREAK_IF(PetID >= g_PPetList.size());
	if(PMaster->GetMJob()!=JOB_DRG && PetID == PETID_WYVERN) {
		return;
	}

	PETTYPE petType = PETTYPE_JUGPET;
	if(PetID<=20){
		petType = PETTYPE_AVATAR;
	}
	else if(PetID==PETID_WYVERN){
		petType = PETTYPE_WYVERN; 
	}
	CPetEntity* PPet = new CPetEntity(petType);

	PPet->loc = PMaster->loc;
	PPet->look = g_PPetList.at(PetID)->look;
	PPet->name = g_PPetList.at(PetID)->name;
	PPet->m_Family = g_PPetList.at(PetID)->m_Family;
	PPet->SetMJob(g_PPetList.at(PetID)->mJob);
	PPet->m_Element = g_PPetList.at(PetID)->m_Element;

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
	}
	else if(PPet->getPetType()==PETTYPE_JUGPET){
		PPet->m_Weapons[SLOT_MAIN]->setDelay(floor(1000.0f*(240.0f/60.0f)));
		//TODO: Base off the caps + merits depending on jug type
		PPet->SetMLevel(PMaster->GetMLevel());
		LoadJugStats(PPet); //follow monster calcs (w/o SJ)
	}
	else if(PPet->getPetType()==PETTYPE_WYVERN){
		//set the wyvern job based on master's SJ
		if(PMaster->GetSJob()!=NULL){
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

	switch (PPet->objtype)
	{
		case TYPE_PET:
		{
			PPet->PBattleAI->SetCurrentAction(ACTION_FALL);
		}
		break;
		case TYPE_MOB:
		{
				if(PMaster->objtype == TYPE_PC){

					CMobEntity* PMob = (CMobEntity*)PMaster->PPet;
					CCharEntity* PChar = (CCharEntity*)PMaster;

					if(PMob->PBattleAI != NULL && PMob->PBattleAI->GetBattleTarget() != NULL && PMob->PBattleAI->GetBattleTarget()->objtype == TYPE_MOB){
						((CMobEntity*)PMob->PBattleAI->GetBattleTarget())->PEnmityContainer->Clear();
						((CMobEntity*)PMob->PBattleAI->GetBattleTarget())->PEnmityContainer->UpdateEnmity(PChar, 0, 0);
					}

					//clear the ex-charmed mobs enmity and 
					PMob->PEnmityContainer->Clear();

					// charm time is up, mob attacks player now
					if (!PMob->GetHPP() == 0 && !PMob->PMaster->GetHPP() == 0)
						PMob->PEnmityContainer->UpdateEnmity(PChar, 0, 0);

					PMob->isCharmed = false;
					PMob->charmTime = NULL;
					PMob->PMaster = NULL;
					PMob->PBattleAI = NULL;
					PMob->PBattleAI = new CAIMobDummy(PMob);
					PMob->m_OwnerID.clean();
					PMob->PBattleAI->SetLastActionTime(gettick());
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


}; // namespace petutils
