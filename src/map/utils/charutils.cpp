/*
===========================================================================

  Copyright (c) 2010-2014 Darkstar Dev Teams

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

#include "../../common/socket.h"
#include "../../common/showmsg.h"
#include "../../common/sql.h"
#include "../../common/strlib.h"
#include "../../common/timer.h"
#include "../../common/utils.h"

#include <math.h>
#include <stdio.h>
#include <string.h>

#include "../lua/luautils.h"

#include "../alliance.h"

#include "../packets/char_abilities.h"
#include "../packets/char_appearance.h"
#include "../packets/char_equip.h"
#include "../packets/char_jobs.h"
#include "../packets/char_job_extra.h"
#include "../packets/char_health.h"
#include "../packets/char_skills.h"
#include "../packets/char_stats.h"
#include "../packets/char_sync.h"
#include "../packets/char_update.h"
#include "../packets/inventory_item.h"
#include "../packets/inventory_assign.h"
#include "../packets/inventory_finish.h"
#include "../packets/inventory_modify.h"
#include "../packets/key_items.h"
#include "../packets/linkshell_equip.h"
#include "../packets/menu_merit.h"
#include "../packets/message_basic.h"
#include "../packets/message_debug.h"
#include "../packets/message_special.h"
#include "../packets/message_standard.h"
#include "../packets/send_box.h"
#include "../packets/quest_mission_log.h"
#include "../packets/conquest_map.h"

#include "../ability.h"
#include "../grades.h"
#include "../conquest_system.h"
#include "../map.h"
#include "../trait.h"
#include "../vana_time.h"
#include "../weapon_skill.h"

#include "../entities/charentity.h"
#include "../entities/petentity.h"
#include "../entities/mobentity.h"

#include "battleutils.h"
#include "charutils.h"
#include "itemutils.h"
#include "blueutils.h"
#include "puppetutils.h"
#include "petutils.h"
#include "zoneutils.h"

/************************************************************************
*																		*
*  Таблицы получаемого опыта											*
*																		*
************************************************************************/

uint16 g_ExpTable[50][20];
uint16 g_ExpPerLevel[100];

/************************************************************************
*																		*
*																		*
*																		*
************************************************************************/

namespace charutils
{

/************************************************************************
*																		*
*  Расчет характеристик персонажей										*
*																		*
************************************************************************/

void CalculateStats(CCharEntity* PChar)
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
	uint8 slvl = PChar->GetSLevel();
	JOBTYPE mjob = PChar->GetMJob();
	JOBTYPE sjob = PChar->GetSJob();

	uint8 race = 0;					//Human

	switch (PChar->look.race)
	{
		case 3:
		case 4: race = 1; break;	//Elvaan
		case 5:
		case 6: race = 2; break;	//Tarutaru
		case 7: race = 3; break;	//Mithra
		case 8: race = 4; break;	//Galka
	}

	// Расчет прироста HP от main job

	int32 mainLevelOver30 = dsp_cap(mlvl - 30, 0, 30);			// Расчет условия +1HP каждый лвл после 30 уровня
	int32 mainLevelUpTo60 = (mlvl < 60 ? mlvl - 1 : 59 );		// Первый режим рассчета до 60 уровня (Используется так же и для MP)
	int32 mainLevelOver60To75 = dsp_cap(mlvl - 60, 0, 15);		// Второй режим расчета после 60 уровня
	int32 mainLevelOver75 = (mlvl < 75 ? 0 : mlvl - 75);			// Третий режим расчета после 75 уровня

	//Расчет бонусного количества HP

	int32 mainLevelOver10 = (mlvl < 10 ? 0 : mlvl - 10);			// +2HP на каждом уровне после 10
	int32 mainLevelOver50andUnder60 = dsp_cap(mlvl - 50, 0, 10);	// +2HP на каждом уровне в промежутке от 50 до 60 уровня
	int32 mainLevelOver60 = (mlvl < 60 ? 0 : mlvl - 60);

	// Расчет прироста HP от дополнительной профессии

	int32 subLevelOver10 = dsp_cap(slvl - 10, 0, 20);				// +1HP на каждый уровень после 10 (/2)
	int32 subLevelOver30 = (slvl < 30 ? 0 : slvl - 30);				// +1HP на каждый уровень после 30

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

	// Расчет по support job
	if (slvl > 0)
	{
		grade = grade::GetJobGrade(sjob,0);

		sJobStat = grade::GetHPScale(grade,baseValueColumn) +
			(grade::GetHPScale(grade,scaleTo60Column) * (slvl - 1)) +
			(grade::GetHPScale(grade,scaleOver30Column) * subLevelOver30) +
			subLevelOver30 + subLevelOver10;
		sJobStat = sJobStat / 2;
	}


	uint16 MeritBonus = PChar->PMeritPoints->GetMeritValue(MERIT_MAX_HP, PChar);
	PChar->health.maxhp = (int16)(raceStat + jobStat + bonusStat + sJobStat + MeritBonus);

	//Начало расчера MP

	raceStat = 0;
	jobStat  = 0;
	sJobStat = 0;

	// Расчет MP расе.
	grade = grade::GetRaceGrades(race,1);

	//Если у main job нет МП рейтинга, расчитиваем расовый бонус на основе уровня subjob уровня(при условии, что у него есть МП рейтинг)
	if (grade::GetJobGrade(mjob,1) == 0)
	{
		if (grade::GetJobGrade(sjob,1) != 0 && slvl > 0)					// В этом выражении ошибка
		{
			raceStat = (grade::GetMPScale(grade,0) + grade::GetMPScale(grade,scaleTo60Column) * (slvl - 1)) / 2; 	// Вот здесь ошибка
		}
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

	//Для дополнительной профессии
	if (slvl > 0)
	{
		grade = grade::GetJobGrade(sjob,1);
		sJobStat = (grade::GetMPScale(grade,0) + grade::GetMPScale(grade,scaleTo60Column) * (slvl - 1)) / 2;
	}

	MeritBonus = PChar->PMeritPoints->GetMeritValue(MERIT_MAX_MP, PChar);
	PChar->health.maxmp = (int16)(raceStat + jobStat + sJobStat + MeritBonus); // результат расчета MP


	//add in evasion from skill
	int16 evaskill = (PChar->GetSkill(SKILL_EVA)); // << already has merit value added to it at this point

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

		// расчет по дополнительной профессии
		if (slvl > 0)
		{
			grade = grade::GetJobGrade(sjob,StatIndex);
			sJobStat = (grade::GetStatScale(grade,0) + grade::GetStatScale(grade,scaleTo60Column) * (slvl - 1)) / 2;
		}else{
			sJobStat = 0;
		}

		// get each merit bonus stat, str,dex,vit and so on...
		MeritBonus = PChar->PMeritPoints->GetMeritValue((Merit_t*)PChar->PMeritPoints->GetMeritByIndex(StatIndex), PChar);

		// Вывод значения
		WBUFW(&PChar->stats,counter) = (uint16)(raceStat + jobStat + sJobStat + MeritBonus);
		counter += 2;
	}
}

/************************************************************************
*																		*
*  Предварительная версия загрузки персонажа. Функция будет				*
*  оптимизирована после определения всех необходимых данных и таблиц	*
*																		*
************************************************************************/

void LoadChar(CCharEntity* PChar)
{
	uint8 meritPoints = 0;
	uint16 limitPoints = 0;

	LoadCharUnlockedWeapons(PChar);

	const int8* fmtQuery =
        "SELECT "
          "charname,"				//  0
          "pos_zone,"				//  1
          "pos_prevzone,"			//  2
          "pos_rot,"				//  3
          "pos_x,"					//  4
          "pos_y,"					//  5
          "pos_z,"					//  6
          "boundary,"				//  7
          "home_zone,"				//  8
          "home_rot,"				//  9
          "home_x,"					// 10
          "home_y,"					// 11
          "home_z,"					// 12
          "nation,"					// 13
		  "quests,"					// 14
          "keyitems,"				// 15
          "spells,"					// 16
		  "abilities,"				// 17
          "titles,"					// 18
          "zones,"					// 19
          "missions,"				// 20
		  "playtime,"				// 21
          "isnewplayer "            // 22
        "FROM chars "
        "WHERE charid = %u";

	int32 ret = Sql_Query(SqlHandle,fmtQuery,PChar->id);

	if (ret != SQL_ERROR &&
		Sql_NumRows(SqlHandle) != 0 &&
		Sql_NextRow(SqlHandle) == SQL_SUCCESS)
	{
        PChar->targid = 0x400;
		PChar->SetName(Sql_GetData(SqlHandle,0));

        PChar->loc.destination = (uint16)Sql_GetIntData(SqlHandle,1);
		PChar->loc.prevzone    = (uint16)Sql_GetIntData(SqlHandle,2);
		PChar->loc.p.rotation  = (uint8)Sql_GetIntData(SqlHandle,3);
		PChar->loc.p.x = Sql_GetFloatData(SqlHandle,4);
		PChar->loc.p.y = Sql_GetFloatData(SqlHandle,5);
		PChar->loc.p.z = Sql_GetFloatData(SqlHandle,6);
		PChar->loc.boundary = (uint16)Sql_GetIntData(SqlHandle,7);

        PChar->profile.home_point.destination = (uint16)Sql_GetIntData(SqlHandle,8);
		PChar->profile.home_point.p.rotation  = (uint8)Sql_GetIntData(SqlHandle,9);
		PChar->profile.home_point.p.x = Sql_GetFloatData(SqlHandle,10);
		PChar->profile.home_point.p.y = Sql_GetFloatData(SqlHandle,11);
		PChar->profile.home_point.p.z = Sql_GetFloatData(SqlHandle,12);

        PChar->profile.nation  = (uint8)Sql_GetIntData(SqlHandle,13);

		size_t length = 0;
		int8* quests = NULL;
		Sql_GetData(SqlHandle,14,&quests,&length);
		memcpy(PChar->m_questLog, quests, (length > sizeof(PChar->m_questLog) ? sizeof(PChar->m_questLog) : length));

		length = 0;
		int8* keyitems = NULL;
		Sql_GetData(SqlHandle,15,&keyitems,&length);
		memcpy(PChar->keys.keysList, keyitems, (length > sizeof(PChar->keys) ? sizeof(PChar->keys) : length));

		length = 0;
		int8* spells = NULL;
		Sql_GetData(SqlHandle,16,&spells,&length);
		memcpy(PChar->m_SpellList, spells, (length > sizeof(PChar->m_SpellList) ? sizeof(PChar->m_SpellList) : length));

		length = 0;
		int8* abilities = NULL;
		Sql_GetData(SqlHandle,17,&abilities,&length);
		memcpy(PChar->m_LearnedAbilities, abilities, (length > sizeof(PChar->m_LearnedAbilities) ? sizeof(PChar->m_LearnedAbilities) : length));

        length = 0;
		int8* titles = NULL;
		Sql_GetData(SqlHandle,18,&titles,&length);
		memcpy(PChar->m_TitleList, titles, (length > sizeof(PChar->m_TitleList) ? sizeof(PChar->m_TitleList) : length));

		length = 0;
		int8* zones = NULL;
		Sql_GetData(SqlHandle,19,&zones,&length);
		memcpy(PChar->m_ZonesList, zones, (length > sizeof(PChar->m_ZonesList) ? sizeof(PChar->m_ZonesList) : length));

        length = 0;
		int8* missions = NULL;
		Sql_GetData(SqlHandle,20,&missions,&length);
		memcpy(PChar->m_missionLog, missions, (length > sizeof(PChar->m_missionLog) ? sizeof(PChar->m_missionLog) : length));

		PChar->SetPlayTime(Sql_GetUIntData(SqlHandle, 21));
        PChar->m_isNewPlayer = Sql_GetIntData(SqlHandle, 22) == 1 ? true : false;
	}


    fmtQuery =
        "SELECT "
          "rank_points,"    // 0
          "rank_sandoria,"  // 1
          "rank_bastok,"    // 2
          "rank_windurst,"  // 3
          "fame_sandoria,"  // 4
          "fame_bastok,"    // 5
          "fame_windurst,"  // 6
          "fame_norg, "     // 7
          "fame_jeuno "     // 8
        "FROM char_profile "
		"WHERE charid = %u;";

	ret = Sql_Query(SqlHandle, fmtQuery, PChar->id);

	if (ret != SQL_ERROR &&
		Sql_NumRows(SqlHandle) != 0 &&
		Sql_NextRow(SqlHandle) == SQL_SUCCESS)
	{
        PChar->profile.rankpoints = Sql_GetUIntData(SqlHandle,0);

        PChar->profile.rank[0] = (uint8)Sql_GetIntData(SqlHandle,1);
		PChar->profile.rank[1] = (uint8)Sql_GetIntData(SqlHandle,2);
		PChar->profile.rank[2] = (uint8)Sql_GetIntData(SqlHandle,3);

		PChar->profile.fame[0] =  (uint16)Sql_GetIntData(SqlHandle,4);  //Sandoria
		PChar->profile.fame[1] =  (uint16)Sql_GetIntData(SqlHandle,5);  //Bastok
		PChar->profile.fame[2] =  (uint16)Sql_GetIntData(SqlHandle,6);  //Windurst
		PChar->profile.fame[3] =  (uint16)Sql_GetIntData(SqlHandle,7);  //Norg
        PChar->profile.fame[4] =  (uint16)Sql_GetIntData(SqlHandle,8);  //Jeuno
    }

    fmtQuery =
        "SELECT "
          "inventory,"  // 0
          "safe,"       // 1
          "locker,"     // 2
          "satchel,"    // 3
          "sack,"       // 4
          "`case` "     // 5
        "FROM char_storage "
		"WHERE charid = %u;";

	ret = Sql_Query(SqlHandle, fmtQuery, PChar->id);

	if (ret != SQL_ERROR &&
		Sql_NumRows(SqlHandle) != 0 &&
		Sql_NextRow(SqlHandle) == SQL_SUCCESS)
	{
		PChar->getStorage(LOC_INVENTORY)->AddBuff((uint8)Sql_GetIntData(SqlHandle,0));
		PChar->getStorage(LOC_MOGSAFE)->AddBuff((uint8)Sql_GetIntData(SqlHandle,1));
		PChar->getStorage(LOC_TEMPITEMS)->AddBuff(50);
		PChar->getStorage(LOC_MOGLOCKER)->AddBuff((uint8)Sql_GetIntData(SqlHandle,2));
		PChar->getStorage(LOC_MOGSATCHEL)->AddBuff((uint8)Sql_GetIntData(SqlHandle,3));
		PChar->getStorage(LOC_MOGSACK)->AddBuff((uint8)Sql_GetIntData(SqlHandle,4));
		PChar->getStorage(LOC_MOGCASE)->AddBuff((uint8)Sql_GetIntData(SqlHandle,5));
        
        PChar->getStorage(LOC_WARDROBE)->AddBuff(80); // Always 80..
	}

	fmtQuery = "SELECT face, race, size, head, body, hands, legs, feet, main, sub, ranged \
				FROM char_look \
				WHERE charid = %u;";

	ret = Sql_Query(SqlHandle,fmtQuery,PChar->id);

	if (ret != SQL_ERROR &&
		Sql_NumRows(SqlHandle) != 0 &&
		Sql_NextRow(SqlHandle) == SQL_SUCCESS)
	{
		PChar->look.face = (uint8)Sql_GetIntData(SqlHandle,0);
		PChar->look.race = (uint8)Sql_GetIntData(SqlHandle,1);
		PChar->look.size = (uint8)Sql_GetIntData(SqlHandle,2);

		PChar->look.head 	= (uint16)Sql_GetIntData(SqlHandle,3);
		PChar->look.body 	= (uint16)Sql_GetIntData(SqlHandle,4);
		PChar->look.hands	= (uint16)Sql_GetIntData(SqlHandle,5);
		PChar->look.legs 	= (uint16)Sql_GetIntData(SqlHandle,6);
		PChar->look.feet 	= (uint16)Sql_GetIntData(SqlHandle,7);
		PChar->look.main 	= (uint16)Sql_GetIntData(SqlHandle,8);
		PChar->look.sub		= (uint16)Sql_GetIntData(SqlHandle,9);
		PChar->look.ranged	= (uint16)Sql_GetIntData(SqlHandle,10);
	}

	fmtQuery = "SELECT unlocked, genkai, war, mnk, whm, blm, rdm, thf, pld, drk, bst, brd, rng, sam, nin, drg, smn, blu, cor, pup, dnc, sch, geo, run \
				FROM char_jobs \
				WHERE charid = %u;";

	ret = Sql_Query(SqlHandle,fmtQuery,PChar->id);

	if (ret != SQL_ERROR &&
		Sql_NumRows(SqlHandle) != 0 &&
		Sql_NextRow(SqlHandle) == SQL_SUCCESS)
	{
		PChar->jobs.unlocked = (uint32)Sql_GetUIntData(SqlHandle,0);
		PChar->jobs.genkai   = (uint8)Sql_GetUIntData(SqlHandle,1);

		PChar->jobs.job[JOB_WAR] = (uint8)Sql_GetIntData(SqlHandle, 2);
		PChar->jobs.job[JOB_MNK] = (uint8)Sql_GetIntData(SqlHandle, 3);
		PChar->jobs.job[JOB_WHM] = (uint8)Sql_GetIntData(SqlHandle, 4);
		PChar->jobs.job[JOB_BLM] = (uint8)Sql_GetIntData(SqlHandle, 5);
		PChar->jobs.job[JOB_RDM] = (uint8)Sql_GetIntData(SqlHandle, 6);
		PChar->jobs.job[JOB_THF] = (uint8)Sql_GetIntData(SqlHandle, 7);
		PChar->jobs.job[JOB_PLD] = (uint8)Sql_GetIntData(SqlHandle, 8);
		PChar->jobs.job[JOB_DRK] = (uint8)Sql_GetIntData(SqlHandle, 9);
		PChar->jobs.job[JOB_BST] = (uint8)Sql_GetIntData(SqlHandle,10);
		PChar->jobs.job[JOB_BRD] = (uint8)Sql_GetIntData(SqlHandle,11);
		PChar->jobs.job[JOB_RNG] = (uint8)Sql_GetIntData(SqlHandle,12);
		PChar->jobs.job[JOB_SAM] = (uint8)Sql_GetIntData(SqlHandle,13);
		PChar->jobs.job[JOB_NIN] = (uint8)Sql_GetIntData(SqlHandle,14);
		PChar->jobs.job[JOB_DRG] = (uint8)Sql_GetIntData(SqlHandle,15);
		PChar->jobs.job[JOB_SMN] = (uint8)Sql_GetIntData(SqlHandle,16);
		PChar->jobs.job[JOB_BLU] = (uint8)Sql_GetIntData(SqlHandle,17);
		PChar->jobs.job[JOB_COR] = (uint8)Sql_GetIntData(SqlHandle,18);
		PChar->jobs.job[JOB_PUP] = (uint8)Sql_GetIntData(SqlHandle,19);
		PChar->jobs.job[JOB_DNC] = (uint8)Sql_GetIntData(SqlHandle,20);
		PChar->jobs.job[JOB_SCH] = (uint8)Sql_GetIntData(SqlHandle,21);
		PChar->jobs.job[JOB_GEO] = (uint8)Sql_GetIntData(SqlHandle,22);
		PChar->jobs.job[JOB_RUN] = (uint8)Sql_GetIntData(SqlHandle,23);
	}



	fmtQuery = "SELECT mode, war, mnk, whm, blm, rdm, thf, pld, drk, bst, brd, rng, sam, nin, drg, smn, blu, cor, pup, dnc, sch, geo, run, merits, limits \
				FROM char_exp \
				WHERE charid = %u;";

	ret = Sql_Query(SqlHandle,fmtQuery,PChar->id);

	if (ret != SQL_ERROR &&
		Sql_NumRows(SqlHandle) != 0 &&
		Sql_NextRow(SqlHandle) == SQL_SUCCESS)
	{
		PChar->MeritMode = (uint8)Sql_GetIntData(SqlHandle,0);
		PChar->jobs.exp[JOB_WAR] = (uint16)Sql_GetIntData(SqlHandle, 1);
		PChar->jobs.exp[JOB_MNK] = (uint16)Sql_GetIntData(SqlHandle, 2);
		PChar->jobs.exp[JOB_WHM] = (uint16)Sql_GetIntData(SqlHandle, 3);
		PChar->jobs.exp[JOB_BLM] = (uint16)Sql_GetIntData(SqlHandle, 4);
		PChar->jobs.exp[JOB_RDM] = (uint16)Sql_GetIntData(SqlHandle, 5);
		PChar->jobs.exp[JOB_THF] = (uint16)Sql_GetIntData(SqlHandle, 6);
		PChar->jobs.exp[JOB_PLD] = (uint16)Sql_GetIntData(SqlHandle, 7);
		PChar->jobs.exp[JOB_DRK] = (uint16)Sql_GetIntData(SqlHandle, 8);
		PChar->jobs.exp[JOB_BST] = (uint16)Sql_GetIntData(SqlHandle, 9);
		PChar->jobs.exp[JOB_BRD] = (uint16)Sql_GetIntData(SqlHandle, 10);
		PChar->jobs.exp[JOB_RNG] = (uint16)Sql_GetIntData(SqlHandle, 11);
		PChar->jobs.exp[JOB_SAM] = (uint16)Sql_GetIntData(SqlHandle, 12);
		PChar->jobs.exp[JOB_NIN] = (uint16)Sql_GetIntData(SqlHandle, 13);
		PChar->jobs.exp[JOB_DRG] = (uint16)Sql_GetIntData(SqlHandle, 14);
		PChar->jobs.exp[JOB_SMN] = (uint16)Sql_GetIntData(SqlHandle, 15);
		PChar->jobs.exp[JOB_BLU] = (uint16)Sql_GetIntData(SqlHandle, 16);
		PChar->jobs.exp[JOB_COR] = (uint16)Sql_GetIntData(SqlHandle, 17);
		PChar->jobs.exp[JOB_PUP] = (uint16)Sql_GetIntData(SqlHandle, 18);
		PChar->jobs.exp[JOB_DNC] = (uint16)Sql_GetIntData(SqlHandle, 19);
		PChar->jobs.exp[JOB_SCH] = (uint16)Sql_GetIntData(SqlHandle, 20);
		PChar->jobs.exp[JOB_GEO] = (uint16)Sql_GetIntData(SqlHandle, 21);
		PChar->jobs.exp[JOB_RUN] = (uint16)Sql_GetIntData(SqlHandle, 22);
        meritPoints = (uint16)Sql_GetIntData(SqlHandle, 23);
		limitPoints = (uint16)Sql_GetIntData(SqlHandle, 24);
	}




	fmtQuery = "SELECT nameflags, mjob, sjob, hp, mp, mhflag, title, bazaar_message, 2h \
				FROM char_stats \
				WHERE charid = %u;";

	ret = Sql_Query(SqlHandle,fmtQuery,PChar->id);

	if (ret != SQL_ERROR &&
		Sql_NumRows(SqlHandle) != 0 &&
		Sql_NextRow(SqlHandle) == SQL_SUCCESS)
	{
		PChar->nameflags.flags = (uint32)Sql_GetUIntData(SqlHandle,0);

		PChar->SetMJob(Sql_GetUIntData(SqlHandle,1));
		PChar->SetSJob(Sql_GetUIntData(SqlHandle,2));

		PChar->SetMLevel(PChar->jobs.job[PChar->GetMJob()]);
		PChar->SetSLevel(PChar->jobs.job[PChar->GetSJob()]);

		PChar->health.hp = Sql_GetIntData(SqlHandle,3);
		PChar->health.mp = Sql_GetIntData(SqlHandle,4);

        PChar->profile.mhflag = (uint8) Sql_GetIntData(SqlHandle,5);
		PChar->profile.title  = (uint16)Sql_GetIntData(SqlHandle,6);

        int8* bazaarMessage = Sql_GetData(SqlHandle, 7);
        if (bazaarMessage != NULL)
            PChar->bazaar.message.insert(0, Sql_GetData(SqlHandle, 7));
        else
            PChar->bazaar.message = '\0';

        // 2H recast time

        CAbility* PAbility = ability::GetTwoHourAbility(PChar->GetMJob());

        uint32 RecastTime = (uint32)Sql_GetUIntData(SqlHandle, 8) + PAbility->getRecastTime() * 1000;

        if (RecastTime > gettick())
        {
            PChar->PRecastContainer->Add(RECAST_ABILITY, PAbility->getRecastId(), RecastTime - gettick());
        }
	}

	fmtQuery = "SELECT skillid, value, rank \
				FROM char_skills \
				WHERE charid = %u;";

	ret = Sql_Query(SqlHandle,fmtQuery,PChar->id);

	if (ret != SQL_ERROR && Sql_NumRows(SqlHandle) != 0)
	{
		while(Sql_NextRow(SqlHandle) == SQL_SUCCESS)
		{
			uint8 SkillID = (uint8)Sql_GetUIntData(SqlHandle,0);

			if (SkillID < MAX_SKILLTYPE)
			{
				PChar->RealSkills.skill[SkillID] = (uint16)Sql_GetUIntData(SqlHandle,1);
				if (SkillID >= SKILL_FSH)
				{
					PChar->RealSkills.rank[SkillID] = (uint8)Sql_GetUIntData(SqlHandle,2);
				}
			}
		}
	}

	fmtQuery = "SELECT sandoria_cp, bastok_cp, windurst_cp, sandoria_supply, bastok_supply, windurst_supply, \
                            beastman_seal, kindred_seal, kindred_crest, high_kindred_crest, sacred_kindred_crest, \
                            ancient_beastcoin, valor_point, scyld, guild_fishing, guild_woodworking, guild_smithing, \
                            guild_goldsmithing, guild_weaving, guild_leathercraft, guild_bonecraft, guild_alchemy, \
                            guild_cooking, cinder, fire_fewell, ice_fewell, wind_fewell, earth_fewell, \
                            lightning_fewell, water_fewell, light_fewell, dark_fewell, ballista_point, fellow_point, \
                            chocobuck_sandoria, chocobuck_bastok, chocobuck_windurst, research_mark, tunnel_worm, \
                            morion_worm, phantom_worm, moblin_marble, infamy, prestige, legion_point, \
                            spark_of_eminence, shining_star, imperial_standing, runic_portal, leujaoam_assault_point, \
                            mamool_assault_point, lebros_assault_point, periqia_assault_point, ilrusi_assault_point, \
							nyzul_isle_assault_point, zeni_point, jetton, therion_ichor, maw, past_sandoria_tp, \
							past_bastok_tp, past_windurst_tp, allied_notes, bayld, kinetic_unit, obsidian_fragment, \
                            lebondopt_wing, pulchridopt_wing, mweya_plasm, cruor, resistance_credit, dominion_note, \
                            fifth_echelon_trophy, fourth_echelon_trophy, third_echelon_trophy, second_echelon_trophy, \
                            first_echelon_trophy, cave_points, id_tags, op_credits, traverser_stones, voidstones, \
                            kupofried_corundums, imprimaturs, pheromone_sacks \
				FROM char_points \
				WHERE charid = %u;";

	ret = Sql_Query(SqlHandle,fmtQuery,PChar->id);

	if (ret != SQL_ERROR &&
		Sql_NumRows(SqlHandle) != 0 &&
		Sql_NextRow(SqlHandle) == SQL_SUCCESS)
	{
        PChar->m_currency.sandoriacp          = Sql_GetUIntData(SqlHandle, 0);
        PChar->m_currency.bastokcp            = Sql_GetUIntData(SqlHandle, 1);
        PChar->m_currency.windurstcp          = Sql_GetUIntData(SqlHandle, 2);
        PChar->nationtp.sandoria              = Sql_GetUIntData(SqlHandle, 3);
        PChar->nationtp.bastok                = Sql_GetUIntData(SqlHandle, 4);
        PChar->nationtp.windurst              = Sql_GetUIntData(SqlHandle, 5);
        PChar->m_currency.beastmanseal        = Sql_GetUIntData(SqlHandle, 6);
        PChar->m_currency.kindredseal         = Sql_GetUIntData(SqlHandle, 7);
        PChar->m_currency.kindredcrest        = Sql_GetUIntData(SqlHandle, 8);
        PChar->m_currency.hkindredcrest       = Sql_GetUIntData(SqlHandle, 9);
        PChar->m_currency.skindredcrest       = Sql_GetUIntData(SqlHandle, 10);
        PChar->m_currency.ancientbeastcoins   = Sql_GetUIntData(SqlHandle, 11);
        PChar->m_currency.valorpoints         = Sql_GetUIntData(SqlHandle, 12);
        PChar->m_currency.scylds              = Sql_GetUIntData(SqlHandle, 13);
        PChar->m_currency.fishingpoints       = Sql_GetUIntData(SqlHandle, 14);
        PChar->m_currency.woodworkingpoints   = Sql_GetUIntData(SqlHandle, 15);
        PChar->m_currency.smithingpoints      = Sql_GetUIntData(SqlHandle, 16);
        PChar->m_currency.goldsmithingpoints  = Sql_GetUIntData(SqlHandle, 17);
        PChar->m_currency.weavingpoints       = Sql_GetUIntData(SqlHandle, 18);
        PChar->m_currency.leatherpoints       = Sql_GetUIntData(SqlHandle, 19);
        PChar->m_currency.bonepoints          = Sql_GetUIntData(SqlHandle, 20);
        PChar->m_currency.alchemypoints       = Sql_GetUIntData(SqlHandle, 21);
        PChar->m_currency.cookingpoints       = Sql_GetUIntData(SqlHandle, 22);
        PChar->m_currency.cinders             = Sql_GetUIntData(SqlHandle, 23);
        PChar->m_currency.firefewell          = Sql_GetUIntData(SqlHandle, 24);
        PChar->m_currency.icefewell           = Sql_GetUIntData(SqlHandle, 25);
        PChar->m_currency.windfewell          = Sql_GetUIntData(SqlHandle, 26);
        PChar->m_currency.earthfewell         = Sql_GetUIntData(SqlHandle, 27);
        PChar->m_currency.lightningfewell     = Sql_GetUIntData(SqlHandle, 28);
        PChar->m_currency.waterfewell         = Sql_GetUIntData(SqlHandle, 29);
        PChar->m_currency.lightfewell         = Sql_GetUIntData(SqlHandle, 30);
        PChar->m_currency.darkfewell          = Sql_GetUIntData(SqlHandle, 31);
        PChar->m_currency.ballistapoints      = Sql_GetUIntData(SqlHandle, 32);
        PChar->m_currency.fellowpoints        = Sql_GetUIntData(SqlHandle, 33);
        PChar->m_currency.chocobuckssandoria  = Sql_GetUIntData(SqlHandle, 34);
        PChar->m_currency.chocobucksbastok    = Sql_GetUIntData(SqlHandle, 35);
        PChar->m_currency.chocobuckswindurst  = Sql_GetUIntData(SqlHandle, 36);
        PChar->m_currency.researchmarks       = Sql_GetUIntData(SqlHandle, 37);
        PChar->m_currency.tunnelworms         = Sql_GetUIntData(SqlHandle, 38);
        PChar->m_currency.morionworms         = Sql_GetUIntData(SqlHandle, 39);
        PChar->m_currency.phantomworms        = Sql_GetUIntData(SqlHandle, 40);
        PChar->m_currency.moblinmarbles       = Sql_GetUIntData(SqlHandle, 41);
        PChar->m_currency.infamy              = Sql_GetUIntData(SqlHandle, 42);
        PChar->m_currency.prestige            = Sql_GetUIntData(SqlHandle, 43);
        PChar->m_currency.legionpoints        = Sql_GetUIntData(SqlHandle, 44);
        PChar->m_currency.sparksofeminence    = Sql_GetUIntData(SqlHandle, 45);
        PChar->m_currency.shiningstars        = Sql_GetUIntData(SqlHandle, 46);
        PChar->m_currency.imperialstanding    = Sql_GetUIntData(SqlHandle, 47);
        PChar->nationtp.ahturhgan             = Sql_GetUIntData(SqlHandle, 48);
        PChar->m_currency.lsanctumassault     = Sql_GetUIntData(SqlHandle, 49);
        PChar->m_currency.mjtgassault         = Sql_GetUIntData(SqlHandle, 50);
        PChar->m_currency.lcavernassault      = Sql_GetUIntData(SqlHandle, 51);
        PChar->m_currency.periqiaassault      = Sql_GetUIntData(SqlHandle, 52);
        PChar->m_currency.ilrusiatollassault  = Sql_GetUIntData(SqlHandle, 53);
        PChar->m_currency.nyzultokens         = Sql_GetUIntData(SqlHandle, 54);
        PChar->m_currency.zeni                = Sql_GetUIntData(SqlHandle, 55);
        PChar->m_currency.jettons             = Sql_GetUIntData(SqlHandle, 56);
        PChar->m_currency.therionichor        = Sql_GetUIntData(SqlHandle, 57);
        PChar->nationtp.maw                   = Sql_GetUIntData(SqlHandle, 58);
        PChar->nationtp.pastsandoria          = Sql_GetUIntData(SqlHandle, 59);
        PChar->nationtp.pastbastok            = Sql_GetUIntData(SqlHandle, 60);
        PChar->nationtp.pastwindurst          = Sql_GetUIntData(SqlHandle, 61);
        PChar->m_currency.alliednotes         = Sql_GetUIntData(SqlHandle, 62);
        PChar->m_currency.bayld               = Sql_GetUIntData(SqlHandle, 63);
        PChar->m_currency.kineticunits        = Sql_GetUIntData(SqlHandle, 64);
        PChar->m_currency.obsidianfragments   = Sql_GetUIntData(SqlHandle, 65);
        PChar->m_currency.lebondoptwings      = Sql_GetUIntData(SqlHandle, 66);
		PChar->m_currency.pulchridoptwings    = Sql_GetUIntData(SqlHandle, 67);
        PChar->m_currency.mweyaplasm          = Sql_GetUIntData(SqlHandle, 68);
        PChar->m_currency.cruor               = Sql_GetUIntData(SqlHandle, 69);
        PChar->m_currency.resistancecredits   = Sql_GetUIntData(SqlHandle, 70);
        PChar->m_currency.dominionnotes       = Sql_GetUIntData(SqlHandle, 71);
        PChar->m_currency.fifthechtrophies    = Sql_GetUIntData(SqlHandle, 72);
        PChar->m_currency.fourthechtrophies   = Sql_GetUIntData(SqlHandle, 73);
        PChar->m_currency.thirdechtrophies    = Sql_GetUIntData(SqlHandle, 74);
        PChar->m_currency.secondechtrophies   = Sql_GetUIntData(SqlHandle, 75);
        PChar->m_currency.firstechtrophies    = Sql_GetUIntData(SqlHandle, 76);
        PChar->m_currency.cavepoints          = Sql_GetUIntData(SqlHandle, 77);
        PChar->m_currency.idtags              = Sql_GetUIntData(SqlHandle, 78);
        PChar->m_currency.opcredits           = Sql_GetUIntData(SqlHandle, 79);
        PChar->m_currency.traverserstones     = Sql_GetUIntData(SqlHandle, 80);
        PChar->m_currency.voidstones          = Sql_GetUIntData(SqlHandle, 81);
        PChar->m_currency.kupofriedcorundums  = Sql_GetUIntData(SqlHandle, 82);
        PChar->m_currency.imprimaturs         = Sql_GetUIntData(SqlHandle, 83);
        PChar->m_currency.pheromonesacks      = Sql_GetUIntData(SqlHandle, 84);
	}

	PChar->PMeritPoints = new CMeritPoints(PChar);
	PChar->PMeritPoints->SetMeritPoints(meritPoints);
	PChar->PMeritPoints->SetLimitPoints(limitPoints);

    blueutils::LoadSetSpells(PChar);
	BuildingCharSkillsTable(PChar);
    PChar->PRecastContainer->ResetAbilities();
	BuildingCharAbilityTable(PChar);
	BuildingCharTraitsTable(PChar);
	CalculateStats(PChar);
    puppetutils::LoadAutomaton(PChar);

	PChar->animation = (PChar->health.hp == 0 ? ANIMATION_DEATH : ANIMATION_NONE);

	fmtQuery = "SELECT gmlevel \
			FROM chars \
			WHERE charid = %u;";

	ret = Sql_Query(SqlHandle,fmtQuery,PChar->id);

	if (ret != SQL_ERROR &&
		Sql_NumRows(SqlHandle) != 0 &&
		Sql_NextRow(SqlHandle) == SQL_SUCCESS)
	{
		PChar->m_GMlevel = (uint8)Sql_GetUIntData(SqlHandle,0);
	}

}

/************************************************************************
*																		*
*  Загружаем инвентарь персонажа										*
*																		*
************************************************************************/

void LoadInventory(CCharEntity* PChar)
{
	const int8* Query =
        "SELECT "
          "itemid,"         // 0
          "location,"       // 1
          "slot,"           // 2
          "quantity,"       // 3
          "bazaar,"         // 4
          "signature,"      // 5
          "currCharges,"    // 6
          "lastUseTime,"    // 7
          "linkshellid,"    // 8
          "color,"          // 9
          "locked,"         // 10
          "col," 	        // 11
          "row,"            // 12
          "level,"          // 13
          "rotation,"       // 14
		  "worn,"			// 15
		  "augment0,"       // 16
		  "augment1,"       // 17
		  "augment2,"       // 18
		  "augment3,"       // 19
		  "trialNumber "    // 20
        "FROM char_inventory "
        "LEFT JOIN linkshells ON signature = name "
        "WHERE charid = %u "
        "ORDER BY location ASC";

	int32 ret = Sql_Query(SqlHandle, Query, PChar->id);

	if (ret != SQL_ERROR && Sql_NumRows(SqlHandle) != 0)
	{
		while(Sql_NextRow(SqlHandle) == SQL_SUCCESS)
		{
			CItem* PItem = itemutils::GetItem(Sql_GetIntData(SqlHandle,0));

			if (PItem != NULL)
			{
				PItem->setLocationID(Sql_GetUIntData(SqlHandle,1));
				PItem->setSlotID(Sql_GetUIntData(SqlHandle,2));
				PItem->setQuantity(Sql_GetUIntData(SqlHandle,3));
				PItem->setCharPrice(Sql_GetUIntData(SqlHandle,4));
				PItem->setWornItem(Sql_GetUIntData(SqlHandle,15));

				if (PItem->getCharPrice() != 0)
				{
					PItem->setSubType(ITEM_LOCKED);
				}
				if (PItem->isType(ITEM_USABLE) && PItem->isSubType(ITEM_CHARGED))
				{
					((CItemUsable*)PItem)->setCurrentCharges(Sql_GetUIntData(SqlHandle,6));
					((CItemUsable*)PItem)->setLastUseTime(Sql_GetUIntData(SqlHandle,7));
				}

                if (PItem->isType(ITEM_ARMOR))
                {
				    ((CItemArmor*)PItem)->LoadAugment(0, (uint16)Sql_GetUIntData(SqlHandle,16));
				    ((CItemArmor*)PItem)->LoadAugment(1, (uint16)Sql_GetUIntData(SqlHandle,17));
				    ((CItemArmor*)PItem)->LoadAugment(2, (uint16)Sql_GetUIntData(SqlHandle,18));
				    ((CItemArmor*)PItem)->LoadAugment(3, (uint16)Sql_GetUIntData(SqlHandle,19));

                    ((CItemArmor*)PItem)->setTrialNumber(Sql_GetUIntData(SqlHandle,20));
                }
                if (PItem->isType(ITEM_LINKSHELL))
                {
                    int8 EncodedString [16];
                    EncodeStringLinkshell(Sql_GetData(SqlHandle,5), EncodedString);
                    PItem->setSignature(EncodedString);
                    ((CItemLinkshell*)PItem)->SetLSID(Sql_GetUIntData(SqlHandle,8));
                    ((CItemLinkshell*)PItem)->SetLSColor(Sql_GetIntData(SqlHandle,9));
                }
                else if (PItem->getFlag() & ITEM_FLAG_INSCRIBABLE)
				{
                    int8 EncodedString [13];
                    EncodeStringSignature(Sql_GetData(SqlHandle,5), EncodedString);
					PItem->setSignature(EncodedString);
				}
                if (PItem->isType(ITEM_FURNISHING) && PItem->getLocationID() == LOC_MOGSAFE)
                {
                    if (Sql_GetIntData(SqlHandle,10) != 0) // способ узнать, что предмет действительно установлен
                    {
                        ((CItemFurnishing*)PItem)->setSubType(ITEM_LOCKED);

                        ((CItemFurnishing*)PItem)->setCol(Sql_GetIntData(SqlHandle,11));
		                ((CItemFurnishing*)PItem)->setRow(Sql_GetIntData(SqlHandle,12));
		                ((CItemFurnishing*)PItem)->setLevel(Sql_GetIntData(SqlHandle,13));
		                ((CItemFurnishing*)PItem)->setRotation(Sql_GetIntData(SqlHandle,14));

                        PChar->getStorage(LOC_STORAGE)->AddBuff(((CItemFurnishing*)PItem)->getStorage());
                    }
                }
				PChar->getStorage(PItem->getLocationID())->InsertItem(PItem, PItem->getSlotID());
			}
		}
	}
    
    // apply augments
    // loop over each container
    for (uint8 i = 0; i < MAX_CONTAINER_ID; ++i)
    {
        CItemContainer* PItemContainer = PChar->getStorage(i);

        if (PItemContainer != NULL)
        {
            // now find each item in the container
            for (uint8 y = 0; y < MAX_CONTAINER_SIZE; ++y)
            {
                CItem* PItem = (CItem*)PItemContainer->GetItem(y);

                // check if the item is valid and can have an augment applied to it
                if (PItem != NULL && (PItem->isType(ITEM_ARMOR) || PItem->isType(ITEM_WEAPON)))
                {
                    // check if there are any valid augments to be applied to the item
                    for (uint8 j = 0; j < AUGMENT_COUNT; ++j)
                    {
                        // found a match, apply the augment
                        if (((CItemArmor*)PItem)->getAugment(j) != 0)
                            ((CItemArmor*)PItem)->ApplyAugment(j);
                    }
                }
            }
        }
    }

	Query =
        "SELECT "
          "main,"
          "sub,"
          "ranged,"
          "ammo,"
          "head,"
          "body,"
          "hands,"
          "legs,"
          "feet,"
          "neck,"
          "waist,"
          "ear1,"
          "ear2,"
          "ring1,"
          "ring2,"
          "back,"
          "link "
        "FROM char_equip "
        "WHERE charid = %u;";

	ret = Sql_Query(SqlHandle, Query, PChar->id);

	if (ret != SQL_ERROR &&
		Sql_NumRows(SqlHandle) != 0 &&
		Sql_NextRow(SqlHandle) == SQL_SUCCESS)
	{
		for (int32 i = 0; i < 16; ++i)
		{
            EquipItem(PChar, (uint8)Sql_GetIntData(SqlHandle, i), i);
		}
        uint8 SlotID = (uint8)Sql_GetIntData(SqlHandle, SLOT_LINK);

		CItem* PItem = PChar->getStorage(LOC_INVENTORY)->GetItem(SlotID);

		if ((PItem != NULL) && PItem->isType(ITEM_LINKSHELL))
        {
		    PItem->setSubType(ITEM_LOCKED);
            PChar->equip[SLOT_LINK] = SlotID;
            linkshell::AddOnlineMember(PChar, (CItemLinkshell*)PItem);
        }
	}
    else
    {
		ShowError(CL_RED"Loading error from char_equip\n" CL_RESET);
	}
	PChar->StatusEffectContainer->LoadStatusEffects();
}

/************************************************************************
*																		*
*  Отправляем список текущих/завершенных квестов и миссий				*
*																		*
************************************************************************/

void SendQuestMissionLog(CCharEntity* PChar)
{
	// в нижележащем цикле загружаются все квесты, текущие и выполненные
	// в одном пакете с текущими квестами Aht Urhgan отправляется информация о текущих миссиях
	// Treasures of Aht Urhgan
	// Wings of the Goddess Missions
	// Assault Missions
	// Campaign Operations
	// пакет с завершенными квестами Aht Urhgan содержит завершенные миссии Assault Missions

	for (uint8 status = 0x01; status <= 0x02; ++status)
	{
		for (uint8 areaID = 0; areaID <= QUESTS_CRYSTALWAR ; ++areaID)
		{
			PChar->pushPacket(new CQuestMissionLogPacket(PChar, areaID, status));
		}
	}

	// Treasures of Aht Urhgan
	// Wings of the Goddess Missions
	PChar->pushPacket(new CQuestMissionLogPacket(PChar, MISSION_ZILART, 0x02));
	PChar->pushPacket(new CQuestMissionLogPacket(PChar, MISSION_TOAU, 0x02));

	// Campaign Operations
	PChar->pushPacket(new CQuestMissionLogPacket(PChar, MISSION_CAMPAIGN, 0x02));
	PChar->pushPacket(new CQuestMissionLogPacket(PChar, MISSION_CAMPAIGN2, 0x02));

	for (uint8 status = 0x01; status <= 0x02; ++status)
	{
		for (uint8 areaID = QUESTS_ABYSSEA; areaID < MAX_QUESTAREA ; ++areaID)
		{
			PChar->pushPacket(new CQuestMissionLogPacket(PChar, areaID, status));
		}
	}

	// обновляем статус миссий
	// National Missions
	// Rise of the Zilart and Chains of Promathia Missions
	// Add-on Scenarios
	// так как все эти миссии обновляются вместе,
	// то достаточно выполнить обновление для MISSION_ZILART

	PChar->pushPacket(new CQuestMissionLogPacket(PChar, MISSION_ZILART, 0x01));


}

/************************************************************************
*																		*
*  Отправляем списки ключевых предметов персонажа						*
*																		*
************************************************************************/

void SendKeyItems(CCharEntity* PChar)
{
    for (uint8 table = 0; table < MAX_KEYS_TABLE; table++)
    {
        PChar->pushPacket(new CKeyItemsPacket(PChar,(KEYS_TABLE)table));
    }
}

/************************************************************************
*                                                                       *
*  Отправляем персонажу весь его инвентарь                              *
*                                                                       *
************************************************************************/

void SendInventory(CCharEntity* PChar)
{
	for(uint8 LocationID = 0; LocationID < MAX_CONTAINER_ID; ++LocationID)
	{
        CItemContainer* container = PChar->getStorage(LocationID);
        if (container == NULL)
            continue;

		uint8 size = container->GetSize();
		for(uint8 slotID = 0; slotID <= size; ++slotID)
		{
			CItem* PItem = PChar->getStorage(LocationID)->GetItem(slotID);
			if(PItem != NULL)
			{
				PChar->pushPacket(new CInventoryItemPacket(PItem, LocationID, slotID));
			}
		}
	}

	for(int32 i = 0; i < 16; ++i)
	{
		CItem* PItem = PChar->getEquip((SLOTTYPE)i);
		if(PItem != NULL)
		{
			PItem->setSubType(ITEM_LOCKED);
			PChar->pushPacket(new CInventoryAssignPacket(PItem, INV_NODROP));
		}
	}

    CItem* PItem = PChar->getEquip(SLOT_LINK);
    if (PItem != NULL)
    {
        PItem->setSubType(ITEM_LOCKED);

        PChar->nameflags.flags |= FLAG_LINKSHELL;
        PChar->pushPacket(new CInventoryItemPacket(PItem, LOC_INVENTORY, PChar->equip[SLOT_LINK]));
		PChar->pushPacket(new CInventoryAssignPacket(PItem, INV_LINKSHELL));
        PChar->pushPacket(new CLinkshellEquipPacket(PChar));
    }
	PChar->pushPacket(new CInventoryFinishPacket());
}

/************************************************************************
*																		*
*  Добавляем новый предмет персонажу в выбранный контейнер				*
*																		*
************************************************************************/

// TODO: мне не нравится параметр silens, нужно придумать что-нибудь более элегантное

uint8 AddItem(CCharEntity* PChar, uint8 LocationID, uint16 ItemID, uint32 quantity, bool silence)
{
    if (PChar->getStorage(LocationID)->GetFreeSlotsCount() == 0 || quantity == 0)
    {
        return ERROR_SLOTID;
    }

	CItem* PItem = itemutils::GetItem(ItemID);

	if (PItem != NULL)
	{
		PItem->setQuantity(quantity);
        return AddItem(PChar, LocationID, PItem, silence);
	}
	ShowWarning(CL_YELLOW"charplugin::AddItem: Item <%i> is not found in a database\n" CL_RESET, ItemID);
	return ERROR_SLOTID;
}

/************************************************************************
*																		*
*  Добавляем новый предмет персонажу в выбранный контейнер				*
*																		*
************************************************************************/

uint8 AddItem(CCharEntity* PChar, uint8 LocationID, CItem* PItem, bool silence)
{
    if (PItem->isType(ITEM_CURRENCY))
    {
        UpdateItem(PChar, LocationID, 0, PItem->getQuantity());
        delete PItem;
        return 0;
    }
    if (PItem->getFlag() & ITEM_FLAG_RARE)
    {
        if (HasItem(PChar, PItem->getID()))
        {
            if (!silence)
                PChar->pushPacket(new CMessageStandardPacket(PChar, PItem->getID(), 0, 220));
            delete PItem;
            return ERROR_SLOTID;
        }
    }

    uint8 SlotID = PChar->getStorage(LocationID)->InsertItem(PItem);

    if (SlotID != ERROR_SLOTID)
    {
        uint8 charges = (PItem->isType(ITEM_USABLE) ? ((CItemUsable*)PItem)->getCurrentCharges() : 0);

        const int8* Query =
            "INSERT INTO char_inventory("
                "charid,"
                "location,"
                "slot,"
                "itemId,"
                "quantity,"
                "signature,"
                "currCharges,"
                "augment0,"
                "augment1,"
                "augment2,"
                "augment3,"
                "trialNumber) "
            "VALUES(%u,%u,%u,%u,%u,'%s',%u,%u,%u,%u,%u,%u)";

        int8 signature[21];
        if (PItem->isType(ITEM_LINKSHELL))
        {
            DecodeStringLinkshell((int8*)PItem->getSignature(), signature);
        }
        else
        {
            DecodeStringSignature((int8*)PItem->getSignature(), signature);
        }

        if( Sql_Query(SqlHandle, Query,
            PChar->id,
            LocationID,
            SlotID,
            PItem->getID(),
            PItem->getQuantity(),
            signature,
            charges,
            PItem->isType(ITEM_ARMOR) ? ((CItemArmor*)PItem)->getAugment(0) : 0,
            PItem->isType(ITEM_ARMOR) ? ((CItemArmor*)PItem)->getAugment(1) : 0,
            PItem->isType(ITEM_ARMOR) ? ((CItemArmor*)PItem)->getAugment(2) : 0,
            PItem->isType(ITEM_ARMOR) ? ((CItemArmor*)PItem)->getAugment(3) : 0,
            PItem->isType(ITEM_ARMOR) ? ((CItemArmor*)PItem)->getTrialNumber() : 0 ) == SQL_ERROR )
        {
            ShowError(CL_RED"charplugin::AddItem: Cannot insert item to database\n" CL_RESET);
            PChar->getStorage(LocationID)->InsertItem(NULL, SlotID);
            delete PItem;
            return ERROR_SLOTID;
        }
        PChar->pushPacket(new CInventoryItemPacket(PItem, LocationID, SlotID));
	    PChar->pushPacket(new CInventoryFinishPacket());
    }
    else
    {
        ShowDebug(CL_CYAN"charplugin::AddItem: Location %i is full\n" CL_RESET, LocationID);
        delete PItem;
    }
    return SlotID;
}

/************************************************************************
*                                                                       *
*  Проверяем наличие предмета у персонажа                               *
*                                                                       *
************************************************************************/

bool HasItem(CCharEntity* PChar, uint16 ItemID)
{
    for (uint8 LocID = 0; LocID < MAX_CONTAINER_ID; ++LocID)
	{
		if (PChar->getStorage(LocID)->SearchItem(ItemID) != ERROR_SLOTID)
		{
			return true;
		}
	}
    return false;
}

void UpdateSubJob(CCharEntity* PChar)
{
    charutils::BuildingCharSkillsTable(PChar);
    charutils::CalculateStats(PChar);
    charutils::CheckValidEquipment(PChar);
    PChar->PRecastContainer->ResetAbilities();
    charutils::BuildingCharAbilityTable(PChar);
    charutils::BuildingCharTraitsTable(PChar);
    charutils::BuildingCharWeaponSkills(PChar);

    PChar->UpdateHealth();
    PChar->health.hp = PChar->GetMaxHP();
    PChar->health.mp = PChar->GetMaxMP();

    charutils::SaveCharStats(PChar);
    charutils::SaveCharJob(PChar, PChar->GetMJob());
    charutils::SaveCharExp(PChar, PChar->GetMJob());
    charutils::UpdateHealth(PChar);

    PChar->pushPacket(new CCharJobsPacket(PChar));
    PChar->pushPacket(new CCharStatsPacket(PChar));
    PChar->pushPacket(new CCharSkillsPacket(PChar));
    PChar->pushPacket(new CCharAbilitiesPacket(PChar));
    PChar->pushPacket(new CCharUpdatePacket(PChar));
    PChar->pushPacket(new CMenuMeritPacket(PChar));
    PChar->pushPacket(new CCharSyncPacket(PChar));
}

/************************************************************************
*                                                                       *
*  Перемещаем предмет в указанную ячейки или первую пустую              *
*                                                                       *
************************************************************************/

uint8 MoveItem(CCharEntity* PChar, uint8 LocationID, uint8 SlotID, uint8 NewSlotID)
{
    CItemContainer* PItemContainer = PChar->getStorage(LocationID);

    if (PItemContainer->GetFreeSlotsCount() != 0)
    {
        if (NewSlotID == ERROR_SLOTID)
	    {
            NewSlotID = PItemContainer->InsertItem(PItemContainer->GetItem(SlotID));
        }
        else
        {
            if (PItemContainer->GetItem(NewSlotID) != NULL) NewSlotID = ERROR_SLOTID;
        }
	    if (NewSlotID != ERROR_SLOTID)
	    {
		    const int8* Query =
                "UPDATE char_inventory "
                "SET slot = %u "
                "WHERE charid = %u AND location = %u AND slot = %u";

		    if (Sql_Query(SqlHandle, Query, NewSlotID, PChar->id, LocationID, SlotID) != SQL_ERROR &&
			    Sql_AffectedRows(SqlHandle) != 0)
		    {
			    PItemContainer->InsertItem(NULL, SlotID);

			    PChar->pushPacket(new CInventoryItemPacket(NULL, LocationID, SlotID));
			    PChar->pushPacket(new CInventoryItemPacket(PItemContainer->GetItem(NewSlotID), LocationID, NewSlotID));
                return NewSlotID;
		    }
            PItemContainer->InsertItem(NULL, NewSlotID); // отменяем все изменения контейнера
        }
    }
    ShowError(CL_RED"charutils::MoveItem: item can't be moved\n" CL_RESET);
    return ERROR_SLOTID;
}

/************************************************************************
*																		*
*  Обновляем количество предметов в указанных контейнере и ячейке		*
*																		*
************************************************************************/

uint32 UpdateItem(CCharEntity* PChar, uint8 LocationID, uint8 slotID, int32 quantity)
{
	CItem* PItem = PChar->getStorage(LocationID)->GetItem(slotID);

	if(PItem == NULL)
    {
		ShowDebug("UpdateItem: No item in slot %u\n", slotID);
		PChar->pushPacket(new CInventoryItemPacket(NULL, LocationID, slotID));
		return 0;
	}
	if ((int32)PItem->getQuantity() + quantity < 0)
	{
		ShowDebug("UpdateItem: Trying to move too much quantity\n");
		return 0;
	}

	uint32 ItemID = PItem->getID();
	uint32 newQuantity = PItem->getQuantity() + quantity;

	if (newQuantity > PItem->getStackSize()) newQuantity = PItem->getStackSize();

	if (newQuantity > 0 || PItem->isType(ITEM_CURRENCY))
    {
		const int8* Query =
            "UPDATE char_inventory "
            "SET quantity = %u "
            "WHERE charid = %u AND location = %u AND slot = %u;";

		if (Sql_Query(SqlHandle, Query, newQuantity, PChar->id, LocationID, slotID) != SQL_ERROR)
		{
			PItem->setQuantity(newQuantity);
			PChar->pushPacket(new CInventoryModifyPacket(LocationID,slotID,newQuantity));
		}
	}
    else if (newQuantity == 0)
    {
		const int8* Query = "DELETE FROM char_inventory WHERE charid = %u AND location = %u AND slot = %u;";

		if (Sql_Query(SqlHandle, Query, PChar->id, LocationID, slotID) != SQL_ERROR)
		{
			PChar->getStorage(LocationID)->InsertItem(NULL, slotID);
			PChar->pushPacket(new CInventoryItemPacket(NULL, LocationID, slotID));
            delete PItem;
		}
	}
	return ItemID;
}

/************************************************************************
*                                                                       *
*  Проверяем возможность обмена между персонажами                       *
*                                                                       *
************************************************************************/

bool CanTrade(CCharEntity* PChar, CCharEntity* PTarget)
{
    if (PTarget->getStorage(LOC_INVENTORY)->GetFreeSlotsCount() < PChar->UContainer->GetItemsCount())
    {
        return false;
    }
    for (uint8 slotid = 0; slotid <= 8; ++slotid)
    {
        CItem* PItem = PChar->UContainer->GetItem(slotid);

	    if (PItem != NULL && PItem->getFlag() & ITEM_FLAG_RARE)
	    {
            if (HasItem(PTarget, PItem->getID()))
		    {
			    return false;
		    }
	    }
    }
    return true;
}

/************************************************************************
*                                                                       *
*  Совершаем обмен между персонажами                                    *
*                                                                       *
************************************************************************/

void DoTrade(CCharEntity* PChar, CCharEntity* PTarget)
{
    for (uint8 slotid = 0; slotid <= 8; ++slotid)
    {
        CItem* PItem = PChar->UContainer->GetItem(slotid);

	    if (PItem != NULL)
        {
            if (PItem->getStackSize() == 1)
            {
                AddItem(PTarget, LOC_INVENTORY, itemutils::GetItem(PItem));
            } else {
                AddItem(PTarget, LOC_INVENTORY, PItem->getID(), PItem->getReserve());
            }
            UpdateItem(PChar, LOC_INVENTORY, PItem->getSlotID(), -PItem->getReserve());
        }
    }
}

/************************************************************************
*																		*
*  Снимаем с персонажа экипированный предмет без обновления внешного	*
*  вида. Используется как вспомогательная функция в связке с другими	*
*																		*
************************************************************************/

void UnequipItem(CCharEntity* PChar, uint8 equipSlotID)
{
	CItem* PItem = PChar->getEquip((SLOTTYPE)equipSlotID);

	if((PItem != NULL) && PItem->isType(ITEM_ARMOR))
	{
		switch(((CItemArmor*)PItem)->getRemoveSlotId())
		{
			case SLOT_HEAD:  PChar->look.head  = 0; break;
			case SLOT_HANDS: PChar->look.hands = 0; break;
			case SLOT_FEET:  PChar->look.feet  = 0; break;
		}

		uint8 slotID = PChar->equip[equipSlotID];
		//todo: issues as item 0 reference is being handled as a real equipment piece
		//      thought to be source of nin bug
		PChar->equip[equipSlotID] = 0;

		if (((CItemArmor*)PItem)->getScriptType() & SCRIPT_EQUIP)
		{
			PChar->m_EquipFlag = 0;
			luautils::OnItemCheck(PChar, PItem);

			for(uint8 i = 0; i < 16; ++i)
			{
				CItem* PItem = PChar->getEquip((SLOTTYPE)i);

				if ((PItem != NULL) && PItem->isType(ITEM_ARMOR))
				{
					PChar->m_EquipFlag |= ((CItemArmor*)PItem)->getScriptType();
				}
			}
		}
        if (PItem->isSubType(ITEM_CHARGED))
		{
            PChar->PRecastContainer->Del(RECAST_ITEM, PItem->getSlotID()); // при снятии предмета с таймером удаляем запись о нем из RecastList
		}
		PItem->setSubType(ITEM_UNLOCKED);

		if( equipSlotID == SLOT_SUB ){
			// Removed sub item, if main hand is empty, then possibly eligible for H2H weapon
			if (!PChar->getEquip(SLOT_MAIN) || !PChar->getEquip(SLOT_MAIN)->isType(ITEM_ARMOR))
			{
				CheckUnarmedWeapon(PChar);
			}
		}
		PChar->delEquipModifiers(&((CItemArmor*)PItem)->modList, ((CItemArmor*)PItem)->getReqLvl(), equipSlotID);
        PChar->PLatentEffectContainer->DelLatentEffects(((CItemArmor*)PItem)->getReqLvl(), equipSlotID);

		PChar->pushPacket(new CInventoryAssignPacket(PItem, INV_NORMAL));
		PChar->pushPacket(new CEquipPacket(0, equipSlotID));

		switch(equipSlotID)
		{
			case SLOT_HEAD:   PChar->look.head  = 0; break;
			case SLOT_BODY:   PChar->look.body  = 0; break;
			case SLOT_HANDS:  PChar->look.hands = 0; break;
			case SLOT_LEGS:   PChar->look.legs  = 0; break;
			case SLOT_FEET:   PChar->look.feet  = 0; break;
			case SLOT_SUB:
            {
				PChar->look.sub = 0;
				PChar->m_Weapons[SLOT_SUB] = itemutils::GetUnarmedItem();			// << equips "nothing" in the sub slot to prevent multi attack exploit
				PChar->health.tp = 0;
				BuildingCharWeaponSkills(PChar);
            }
			break;
			case SLOT_AMMO:
			{
				if (PChar->equip[SLOT_RANGED] == 0)
				{
					PChar->look.ranged = 0;
				}
				PChar->PBattleAI->SetCurrentAction(ACTION_RANGED_INTERRUPT);
			}
			break;
			case SLOT_RANGED:
			{
				if (PChar->equip[SLOT_RANGED] == 0)
				{
					PChar->look.ranged = 0;
				}
				PChar->PBattleAI->SetCurrentAction(ACTION_RANGED_INTERRUPT);
				PChar->health.tp = 0;
				BuildingCharWeaponSkills(PChar);
			}
		    break;
			case SLOT_MAIN:
			{
				if (PItem->isType(ITEM_WEAPON))
				{
					if (((CItemWeapon*)PItem)->getSkillType() == SKILL_H2H)
					{
						PChar->look.sub = 0;
					}
				}

				if (PChar->PBattleAI->GetCurrentAction() == ACTION_ATTACK)
				{
					PChar->PBattleAI->SetLastActionTime(gettick());
				}

				// If main hand is empty, figure out which UnarmedItem to give the player.
				if (!PChar->getEquip(SLOT_MAIN) || !PChar->getEquip(SLOT_MAIN)->isType(ITEM_ARMOR))
				{
					CheckUnarmedWeapon(PChar);
				}

				PChar->health.tp = 0;
				BuildingCharWeaponSkills(PChar);
			}
			break;
		}
        charutils::BuildingCharSkillsTable(PChar);
        charutils::CalculateStats(PChar);

        PChar->UpdateHealth();
		PChar->m_EquipSwap = true;
	}
}

void RemoveSub(CCharEntity* PChar)
{
    CItemArmor* PItem = (CItemArmor*)PChar->getEquip(SLOT_SUB);

    if (PItem != NULL && PItem->isType(ITEM_ARMOR))
    {
         UnequipItem(PChar, SLOT_SUB);
    }
}

/************************************************************************
*																		*
*  Пытаемся экипировать предмет с соблюдением всех условий	 			*
*																		*
************************************************************************/

bool EquipArmor(CCharEntity* PChar, uint8 slotID, uint8 equipSlotID)
{
	CItemArmor* PItem = (CItemArmor*)PChar->getStorage(LOC_INVENTORY)->GetItem(slotID);

	if (PItem == NULL)
	{
		ShowDebug("No item in inventory slot %u\n", slotID);
		return false;
	}

    if ((PChar->m_EquipBlock & (1 << equipSlotID)) ||
       !(PItem->getJobs() & (1 << (PChar->GetMJob() - 1))) ||
        (PItem->getReqLvl() > PChar->jobs.job[PChar->GetMJob()]))
        return false;

    if (equipSlotID == SLOT_MAIN)
    {
        CItemArmor* oldItem = PChar->getEquip((SLOTTYPE)equipSlotID);

        if (!(slotID == PItem->getSlotID() && oldItem && 
            (oldItem->isType(ITEM_WEAPON) && PItem->isType(ITEM_WEAPON)) &&
            ((((CItemWeapon*)PItem)->isTwoHanded() == true) && (((CItemWeapon*)oldItem)->isTwoHanded() == true))))
        {
            CItemArmor* PSubItem = PChar->getEquip(SLOT_SUB);

            if (PSubItem != NULL && PSubItem->isType(ITEM_ARMOR) && (PSubItem->IsShield() != true))
                 RemoveSub(PChar);
        }
    }

    UnequipItem(PChar, equipSlotID);

    if (PItem->getEquipSlotId() & (1 << equipSlotID))
    {
		uint8 removeSlotID = PItem->getRemoveSlotId();

		if(removeSlotID > 0)
		{
			UnequipItem(PChar,removeSlotID);
		}

		switch(equipSlotID)
		{
			case SLOT_MAIN:
			{
				if (PItem->isType(ITEM_WEAPON))
				{
					switch (((CItemWeapon*)PItem)->getSkillType())
					{
						case SKILL_H2H:
						case SKILL_GSD:
						case SKILL_GAX:
						case SKILL_SYH:
						case SKILL_POL:
						case SKILL_GKT:
						case SKILL_STF:
						{
							CItemArmor* armor = (CItemArmor*)PChar->getEquip(SLOT_SUB);
							if ((armor != NULL) && armor->isType(ITEM_ARMOR))
							{
                                if (armor->isType(ITEM_WEAPON))
                                {
                                    CItemWeapon* PWeapon = (CItemWeapon*)armor;
                                    if (PWeapon->getSkillType() != SKILL_NON || ((CItemWeapon*)PItem)->getSkillType() == SKILL_H2H)
                                    {
                                        UnequipItem(PChar,SLOT_SUB);
                                    }
                                }
                                else
                                {
								    UnequipItem(PChar,SLOT_SUB);
                                }
							}
							if (((CItemWeapon*)PItem)->getSkillType() == SKILL_H2H)
							{
								PChar->look.sub = PItem->getModelId() + 0x1000;
							}
						}
						break;
					}
					if (PChar->PBattleAI->GetCurrentAction() == ACTION_ATTACK)
					{
						PChar->PBattleAI->SetLastActionTime(gettick());
					}
                    PChar->m_Weapons[SLOT_MAIN] = (CItemWeapon*)PItem;

					if (!PChar->m_Weapons[SLOT_MAIN]->isTwoHanded())
                    {
						PChar->StatusEffectContainer->DelStatusEffect(EFFECT_HASSO);
						PChar->StatusEffectContainer->DelStatusEffect(EFFECT_SEIGAN);
					}

				}
				PChar->look.main = PItem->getModelId();
			}
			break;
			case SLOT_SUB:
			{
                CItemWeapon* weapon = (CItemWeapon*)PChar->getEquip(SLOT_MAIN);
                if (weapon == NULL || !weapon->isType(ITEM_WEAPON))
                {
                    if (PItem->isType(ITEM_WEAPON))
                    {
                        return false;
                    }
                }
                else
                {
					switch (weapon->getSkillType())
					{
						case SKILL_H2H:
						{
							if (!PItem->isType(ITEM_WEAPON))
							{
                                UnequipItem(PChar,SLOT_MAIN);
                            }
                        }
                        case SKILL_DAG:
                        case SKILL_SWD:
                        case SKILL_AXE:
                        case SKILL_KAT:
                        case SKILL_CLB:
                        {
                            if (PItem->isType(ITEM_WEAPON) && (!charutils::hasTrait(PChar, TRAIT_DUAL_WIELD) || ((CItemWeapon*)PItem)->getSkillType() == SKILL_NON))
                            {
                                return false;
                            }
							PChar->m_Weapons[SLOT_SUB] = (CItemWeapon*)PItem;
						}
						break;
						default:
						{
							if (!PItem->isType(ITEM_WEAPON))
							{
								UnequipItem(PChar,SLOT_MAIN);
							}
						}
					}
				}
				PChar->look.sub = PItem->getModelId();
			}
			break;
			case SLOT_RANGED:
			{
				if (PItem->isType(ITEM_WEAPON))
				{
					CItemWeapon* weapon = (CItemWeapon*)PChar->getEquip(SLOT_AMMO);
					if ((weapon != NULL) && weapon->isType(ITEM_WEAPON))
					{
						if (((CItemWeapon*)PItem)->getSkillType() != weapon->getSkillType() ||
							((CItemWeapon*)PItem)->getSubSkillType() != weapon->getSubSkillType())
						{
							UnequipItem(PChar,SLOT_AMMO);
						}
					}
                    PChar->m_Weapons[SLOT_RANGED] = (CItemWeapon*)PItem;
				}
				PChar->look.ranged = PItem->getModelId();
			}
			break;
			case SLOT_AMMO:
			{
				if (PItem->isType(ITEM_WEAPON))
				{
					CItemWeapon* weapon = (CItemWeapon*)PChar->getEquip(SLOT_RANGED);
					if ((weapon != NULL) && weapon->isType(ITEM_WEAPON))
					{
						if (((CItemWeapon*)PItem)->getSkillType() != weapon->getSkillType() ||
							((CItemWeapon*)PItem)->getSubSkillType() != weapon->getSubSkillType())
						{
							UnequipItem(PChar,SLOT_RANGED);
						}
					}
					if (PChar->equip[SLOT_RANGED] == 0)
					{
						PChar->look.ranged = PItem->getModelId();
					}
					PChar->m_Weapons[SLOT_AMMO] = (CItemWeapon*)PItem;
				}
			}
			break;
			case SLOT_HEAD:
			{
				CItemArmor* armor = PChar->getEquip(SLOT_BODY);
				if ((armor != NULL) && armor->isType(ITEM_ARMOR))
				{
					uint8 removeSlotID = armor->getRemoveSlotId();
					if(removeSlotID == SLOT_HEAD) {
						UnequipItem(PChar, SLOT_BODY);
					}
				}
				PChar->look.head = PItem->getModelId();
			}
			break;
			case SLOT_BODY:
			{
				if (PItem->getRemoveSlotId() == SLOT_HANDS)
                {
					PChar->look.hands = 157;
				}
				PChar->look.body = PItem->getModelId();
			}
			break;
			case SLOT_HANDS:
			{
				CItemArmor* armor = PChar->getEquip(SLOT_BODY);
				if ((armor != NULL) && armor->isType(ITEM_ARMOR))
				{
					uint8 removeSlotID = armor->getRemoveSlotId();
					if(removeSlotID == SLOT_HANDS)
                    {
						UnequipItem(PChar,SLOT_BODY);
					}
				}
				PChar->look.hands = PItem->getModelId();
			}
			break;
			case SLOT_LEGS:
			{
				if(PItem->getRemoveSlotId() == SLOT_FEET)
                {
					PChar->look.feet = 157;
				}
				PChar->look.legs = PItem->getModelId();
			}
			break;
			case SLOT_FEET:
			{
				CItemArmor* armor = PChar->getEquip(SLOT_LEGS);
				if ((armor != NULL) && armor->isType(ITEM_ARMOR))
				{
					uint8 removeSlotID = armor->getRemoveSlotId();
					if (removeSlotID == SLOT_FEET)
                    {
						UnequipItem(PChar, SLOT_LEGS);
					}
				}
				PChar->look.feet = PItem->getModelId();
			}
			break;
		}
		PChar->equip[equipSlotID] = slotID;
	}
    else
    {
		ShowWarning(CL_YELLOW"Item %i is not equipable in equip slot %i\n" CL_RESET, PItem->getID(), equipSlotID);
		return false;
	}
	return true;
}

/************************************************************************
*																		*
*																		*
*																		*
************************************************************************/

void EquipItem(CCharEntity* PChar, uint8 slotID, uint8 equipSlotID)
{
	if (slotID == 0)
	{
        CItemArmor* PSubItem = PChar->getEquip(SLOT_SUB);

		UnequipItem(PChar,equipSlotID);

        if (equipSlotID == 0 && PSubItem && !PSubItem->IsShield())
            RemoveSub(PChar);

		PChar->status = STATUS_UPDATE;
		PChar->m_EquipSwap = true;
		PChar->pushPacket(new CEquipPacket(slotID, equipSlotID));
	}
	else
    {
        CItemArmor* PItem = (CItemArmor*)PChar->getStorage(LOC_INVENTORY)->GetItem(slotID);

        if ((PItem != NULL) && PItem->isType(ITEM_ARMOR))
        {

			if (!PItem->isSubType(ITEM_LOCKED) && EquipArmor(PChar, slotID, equipSlotID))
			{
				if (PItem->getScriptType() & SCRIPT_EQUIP)
				{
					luautils::OnItemCheck(PChar, PItem);
					PChar->m_EquipFlag |= PItem->getScriptType();
				}
                if (PItem->isType(ITEM_USABLE) && ((CItemUsable*)PItem)->getCurrentCharges() != 0)
		        {
                    PItem->setAssignTime(CVanaTime::getInstance()->getVanaTime());
                    PChar->PRecastContainer->Add(RECAST_ITEM, slotID, PItem->getReuseTime());

                    // не забываем обновить таймер при экипировке предмета

			        PChar->pushPacket(new CInventoryItemPacket(PItem, LOC_INVENTORY, slotID));
	                PChar->pushPacket(new CInventoryFinishPacket());
		        }
				PItem->setSubType(ITEM_LOCKED);

                if (equipSlotID == SLOT_SUB){
                    // If main hand is empty, check which UnarmedItem to use.
					if (!PChar->getEquip(SLOT_MAIN) || !PChar->getEquip(SLOT_MAIN)->isType(ITEM_ARMOR))
                    {
                        CheckUnarmedWeapon(PChar);
                    }
                }

				PChar->addEquipModifiers(&PItem->modList, ((CItemArmor*)PItem)->getReqLvl(), equipSlotID);
                PChar->PLatentEffectContainer->AddLatentEffects(&PItem->latentList, ((CItemArmor*)PItem)->getReqLvl(), equipSlotID);
				PChar->PLatentEffectContainer->CheckLatentsEquip(equipSlotID);

				PChar->status = STATUS_UPDATE;
				PChar->pushPacket(new CEquipPacket(slotID, equipSlotID));
				PChar->pushPacket(new CInventoryAssignPacket(PItem, INV_NODROP));
			}
        }
	}
    if (equipSlotID == SLOT_MAIN || equipSlotID == SLOT_RANGED)
    {
        PChar->health.tp = 0;
        /*// fixes logging in with no h2h
        if(PChar->m_Weapons[SLOT_MAIN]->getDmgType() == DAMAGE_NONE && PChar->GetMJob() == JOB_MNK){
            PChar->m_Weapons[SLOT_MAIN] = itemutils::GetUnarmedH2HItem();
        } else if(PChar->m_Weapons[SLOT_MAIN] == itemutils::GetUnarmedH2HItem() && PChar->GetMJob() != JOB_MNK) {
            // return back to normal if changed jobs
            PChar->m_Weapons[SLOT_MAIN] = itemutils::GetUnarmedItem();
        }*/
		if (!PChar->getEquip(SLOT_MAIN) || !PChar->getEquip(SLOT_MAIN)->isType(ITEM_ARMOR) || PChar->m_Weapons[SLOT_MAIN] == itemutils::GetUnarmedH2HItem())
		{
			CheckUnarmedWeapon(PChar);
		}

        BuildingCharWeaponSkills(PChar);
    }

    charutils::BuildingCharSkillsTable(PChar);
    charutils::CalculateStats(PChar);

    PChar->UpdateHealth();
	PChar->m_EquipSwap = true;
}

/************************************************************************
*																		*
*  Проверяем возможность персонажа носить экипированные на нем предметы	*
*																		*
************************************************************************/

void CheckValidEquipment(CCharEntity* PChar)
{
    CItemArmor* PItem  = NULL;

    for(uint8 slotID = 0; slotID < 16; ++slotID)
    {
        PItem = PChar->getEquip((SLOTTYPE)slotID);

        if ((PItem != NULL) && PItem->isType(ITEM_ARMOR))
        {
            if(slotID == SLOT_SUB && !charutils::hasTrait(PChar, TRAIT_DUAL_WIELD))
            {
                // don't unequip shields
                if (PItem->IsShield())
                    continue;

                // if the item isn't a grip, unequip it
                if (!((CItemWeapon*)PItem)->getSkillType() == SKILL_NON)
                    RemoveSub(PChar);

                continue;
            }

            if ((PItem->getJobs() & (1 << (PChar->GetMJob() - 1))) &&
                (PItem->getReqLvl() <= PChar->jobs.job[PChar->GetMJob()]) &&
                (PItem->getEquipSlotId() & (1 << slotID)))
            {
                continue;
            }
            
            UnequipItem(PChar, slotID);
        }
    }
    // Unarmed H2H weapon check
	if (!PChar->getEquip(SLOT_MAIN) || !PChar->getEquip(SLOT_MAIN)->isType(ITEM_ARMOR) || PChar->m_Weapons[SLOT_MAIN] == itemutils::GetUnarmedH2HItem())
	{
        CheckUnarmedWeapon(PChar);
    }

    PChar->pushPacket(new CCharAppearancePacket(PChar));


    BuildingCharWeaponSkills(PChar);
    SaveCharEquip(PChar);
}

void RemoveAllEquipment(CCharEntity* PChar)
{
    CItemArmor* PItem  = NULL;

    for(uint8 slotID = 0; slotID < 16; ++slotID)
    {
        PItem = PChar->getEquip((SLOTTYPE)slotID);

        if ((PItem != NULL) && PItem->isType(ITEM_ARMOR))
        {
            UnequipItem(PChar, slotID);
        }
    }
	// Determines the UnarmedItem to use, since all slots are empty now.
	CheckUnarmedWeapon(PChar);
    PChar->pushPacket(new CCharAppearancePacket(PChar));

    BuildingCharWeaponSkills(PChar);
    SaveCharEquip(PChar);
}

/************************************************************************
*																		*
*  Проверяем логику всей экипировки персонажа							*
*																		*
************************************************************************/

// позднее нужно будет сделать экипировку в структуре,
// куда добавить битовое поле, указывающее, в какой ячейке находится экипировка с условием
// для начала это поле избавит нас от проверки ячеек у персонажей без экипировки с условием

void CheckEquipLogic(CCharEntity* PChar, SCRIPTTYPE ScriptType, uint32 param)
{
	if (!(PChar->m_EquipFlag & ScriptType))
		return;

	for(uint8 slotID = 0; slotID < 16; ++slotID)
	{
		CItem* PItem = PChar->getEquip((SLOTTYPE)slotID);

		if ((PItem != NULL) && PItem->isType(ITEM_ARMOR))
		{
			if (((CItemArmor*)PItem)->getScriptType() & ScriptType)
			{
				luautils::OnItemCheck(PChar, PItem, param);
			}
		}
	}
}

/************************************************************************
*																		*
*  Load the Characters weapon skill list								*
*																		*
************************************************************************/

void BuildingCharWeaponSkills(CCharEntity* PChar)
{
	memset(& PChar->m_WeaponSkills, 0, sizeof(PChar->m_WeaponSkills));

	JOBTYPE curMainJob = PChar->GetMJob();
	JOBTYPE curSubJob  = PChar->GetSJob();

	CItemWeapon* PItem;
	int16 wsIDs[3] = { 0 };
	int16 wsDynIDs[3] = { 0 };

	bool isInDynamis = PChar->isInDynamis();

	for (int i = 0; i < 3; ++i)
	{
		if (PChar->equip[i])
		{
			PItem = (CItemWeapon*)PChar->getEquip((SLOTTYPE)i);

			for(std::vector<CModifier*>::iterator it = PItem->modList.begin(); it !=  PItem->modList.end(); ++it)
			{
				if((*it)->getModID() == MOD_ADDS_WEAPONSKILL)
				{
					wsIDs[i] = (*it)->getModAmount();
					break;
				}
				if((*it)->getModID() == MOD_ADDS_WEAPONSKILL_DYN)
				{
					wsDynIDs[i] = (*it)->getModAmount();
					break;
				}
			}
		}
	}

	//add in melee ws
	uint8 skill = PChar->m_Weapons[SLOT_MAIN]->getSkillType();
	std::list<CWeaponSkill*>&& WeaponSkillList = battleutils::GetWeaponSkills(skill);
	for (std::list<CWeaponSkill*>::iterator it = WeaponSkillList.begin(); it != WeaponSkillList.end(); ++it)
	{
		CWeaponSkill* PSkill = *it;
		if (PChar->GetSkill(skill) >=  PSkill->getSkillLevel() && (PSkill->getJob(curMainJob) > 0 || PSkill->getJob(curSubJob) > 0 && !PSkill->mainOnly())
			|| PSkill->getID() == wsIDs[SLOT_MAIN] || PSkill->getID() == wsIDs[SLOT_SUB]
			|| isInDynamis && (PSkill->getID() == wsDynIDs[SLOT_MAIN] || PSkill->getID() == wsDynIDs[SLOT_SUB]))
		{
			addWeaponSkill(PChar, PSkill->getID());
		}
	}

	//add in ranged ws
	PItem = (CItemWeapon*)PChar->getEquip(SLOT_RANGED);
	if(PItem != NULL && PItem->isType(ITEM_WEAPON) && PItem->getSkillType()!=SKILL_THR)
	{
		skill = PChar->m_Weapons[SLOT_RANGED]->getSkillType();
		std::list<CWeaponSkill*>&& WeaponSkillList = battleutils::GetWeaponSkills(skill);
		for (std::list<CWeaponSkill*>::iterator it = WeaponSkillList.begin(); it != WeaponSkillList.end(); ++it)
		{
			CWeaponSkill* PSkill = *it;
			if (PChar->GetSkill(skill) >=  PSkill->getSkillLevel() && (PSkill->getJob(curMainJob) > 0 || PSkill->getJob (curSubJob) > 0 && !PSkill->mainOnly())
				|| PSkill->getID() == wsIDs[SLOT_RANGED]
				|| isInDynamis && (PSkill->getID() == wsDynIDs[SLOT_RANGED]))
			{
				addWeaponSkill(PChar, PSkill->getID());
			}
		}
	}
	PChar->pushPacket(new CCharAbilitiesPacket(PChar));
}

void BuildingCharPetAbilityTable(CCharEntity* PChar, CPetEntity* PPet, uint32 PetID){
	DSP_DEBUG_BREAK_IF(PPet==NULL || PChar==NULL);

	memset(& PChar->m_PetCommands, 0, sizeof(PChar->m_PetCommands));

	if(PetID==0){//technically Fire Spirit but we're using this to null the abilities shown
		PChar->pushPacket(new CCharAbilitiesPacket(PChar));
		return;
	}

	if(PChar->GetMJob() == JOB_SMN || PChar->GetSJob() == JOB_SMN)
    {
		std::vector<CAbility*> AbilitiesList = ability::GetAbilities(JOB_SMN);

        for (int32 i = 0; i < AbilitiesList.size(); ++i)
		{
			CAbility* PAbility = AbilitiesList.at(i);

			if (PPet->GetMLevel() >= PAbility->getLevel() && PetID>=8 && PetID<=15 && CheckAbilityAddtype(PChar, PAbility)) //carby/fen/ele avatars NOT diabolos
			{
				//16 IDs per avatar starting from 496
				if(PAbility->getID()>= (496+((PetID-8)*16)) && PAbility->getID() < (496+((PetID-7)*16))){ //pet ability
					addPetAbility(PChar,PAbility->getID()-496);
				}
			}
		}
	}
	PChar->pushPacket(new CCharAbilitiesPacket(PChar));
}

/************************************************************************
*																		*
*  Собираем рабочую таблицу способностей персонажа. С нулевым уровнем	*
*  должны быть 2h способности. По этому условию отсеиваем их для sjob	*
*																		*
************************************************************************/

void BuildingCharAbilityTable(CCharEntity* PChar)
{
	std::vector<CAbility*> AbilitiesList;

	memset(& PChar->m_Abilities, 0, sizeof(PChar->m_Abilities));

	AbilitiesList = ability::GetAbilities(PChar->GetMJob());

    for (int32 i = 0; i < AbilitiesList.size(); ++i)
	{
		CAbility* PAbility = AbilitiesList.at(i);

		if (PChar->GetMLevel() >= PAbility->getLevel() &&  PAbility->getID() < 496 )
		{
			if (PAbility->getID() != ABILITY_PET_COMMANDS && CheckAbilityAddtype(PChar, PAbility))
            {
                addAbility(PChar, PAbility->getID());
                if (!PChar->PRecastContainer->Has(RECAST_ABILITY, PAbility->getRecastId()))
                {
                    PChar->PRecastContainer->Add(RECAST_ABILITY, PAbility->getRecastId(), 0);
                }
			}
		}else{
			break;
		}
	}

	//To stop a character with no SJob to receive the traits with job = 0 in the DB.
	if (PChar->GetSJob() == JOB_NON){
		return;
	}

	AbilitiesList = ability::GetAbilities(PChar->GetSJob());

	for (int32 i = 0; i < AbilitiesList.size(); ++i)
	{
		CAbility* PAbility = AbilitiesList.at(i);

		if (PChar->GetSLevel() >= PAbility->getLevel() &&  PAbility->getID() < 496)
		{
			if (PAbility->getLevel() != 0 )
			{
				if (PAbility->getID() != ABILITY_PET_COMMANDS && CheckAbilityAddtype(PChar, PAbility) && !(PAbility->getAddType() & ADDTYPE_MAIN_ONLY))
				{
					addAbility(PChar, PAbility->getID());
                    if (!PChar->PRecastContainer->Has(RECAST_ABILITY, PAbility->getRecastId()))
                    {
                        PChar->PRecastContainer->Add(RECAST_ABILITY, PAbility->getRecastId(), 0);
                    }
				}
			}
		}else{
			break;
		}
	}
}

/************************************************************************
*																		*
*  Собираем рабочую таблицу умений персонажа на основе реальной.		*
*  Добавляем ограничения, отмечаем умения основной профессии (rank != 0)*
*																		*
************************************************************************/

void BuildingCharSkillsTable(CCharEntity* PChar)
{
	uint16 meritIndex = 8;		// h2h merit index starts at 8

	for (int32 i = 0; i < 48; ++i)
	{
        uint16 MaxMSkill = battleutils::GetMaxSkill((SKILLTYPE)i,PChar->GetMJob(),PChar->GetMLevel());
        uint16 MaxSSkill = battleutils::GetMaxSkill((SKILLTYPE)i,PChar->GetSJob(),PChar->GetSLevel());
        uint16 skillBonus = 0;

        // apply arts bonuses
        if ((i >= 32 && i <= 35 && (PChar->StatusEffectContainer->HasStatusEffect(EFFECT_LIGHT_ARTS) ||
            PChar->StatusEffectContainer->HasStatusEffect(EFFECT_ADDENDUM_WHITE))) 
            ||
            (i >= 35 && i <= 37 && (PChar->StatusEffectContainer->HasStatusEffect(EFFECT_DARK_ARTS) ||
            PChar->StatusEffectContainer->HasStatusEffect(EFFECT_ADDENDUM_BLACK))))
        {
            uint16 artsSkill = battleutils::GetMaxSkill(SKILL_ENH,JOB_RDM,PChar->GetMLevel()); //B+ skill
            uint16 skillCapD = battleutils::GetMaxSkill((SKILLTYPE)i, JOB_SCH, PChar->GetMLevel()); // D skill cap
            uint16 skillCapE = battleutils::GetMaxSkill(SKILL_DRK, JOB_RDM, PChar->GetMLevel()); // E skill cap
            uint16 currentSkill = dsp_cap((PChar->RealSkills.skill[i] / 10), 0, std::max(MaxMSkill, MaxSSkill)); // working skill before bonuses
            uint16 artsBaseline = 0; // Level based baseline to which to raise skills
            if(PChar->GetMJob() < 51)
            {
                artsBaseline = 5 + 2.7 * (PChar->GetMJob() - 1);
            }
            else if ((PChar->GetMJob() > 50) && (PChar->GetMJob() < 61))
            {
                artsBaseline = 137 + 4.7 * (PChar->GetMJob() - 50);
            }
            else if ((PChar->GetMJob() > 60) && (PChar->GetMJob() < 71))
            {
                artsBaseline = 184 + 3.7 * (PChar->GetMJob() - 60);
            }
            else if ((PChar->GetMJob() > 70) && (PChar->GetMJob() < 75))
            {
                artsBaseline = 221 + 5.0 * (PChar->GetMJob() - 70);
            }
            else if (PChar->GetMJob() >= 75)
            {
                artsBaseline = skillCapD+36;
            }
            if (currentSkill < skillCapE)
            {
                // If the player's skill is below the E cap
                // give enough bonus points to raise it to the arts baseline
                skillBonus += std::max(artsBaseline - currentSkill, 0);
            }
            else if (currentSkill < skillCapD)
            {
                //if the skill is at or above the E cap but below the D cap
                // raise it up to the B+ skill cap minus the difference between the current skill rank and the scholar base skill cap (D)
                // i.e. give a bonus of the difference between the B+ skill cap and the D skill cap
                skillBonus += std::max((artsSkill - skillCapD), 0);
            }
            else if (currentSkill < artsSkill)
            {
                // If the player's skill is at or above the D cap but below the B+ cap
                // give enough bonus points to raise it to the B+ cap
                skillBonus += std::max(artsSkill - currentSkill, 0);
            }

            if (PChar->StatusEffectContainer->HasStatusEffect(EFFECT_LIGHT_ARTS) ||
                PChar->StatusEffectContainer->HasStatusEffect(EFFECT_ADDENDUM_WHITE))
            {
                skillBonus += PChar->getMod(MOD_LIGHT_ARTS_SKILL);
            }
            else
            {
                skillBonus += PChar->getMod(MOD_DARK_ARTS_SKILL);
            }
        }

		//ignore these indexes when calculating merits
		if (i < 13 || i > 24)
		{
			skillBonus += PChar->PMeritPoints->GetMeritValue((Merit_t*)PChar->PMeritPoints->GetMeritByIndex(meritIndex), PChar);
			meritIndex++;
		}

        skillBonus += PChar->getMod(i+79);

		PChar->WorkingSkills.rank[i] = battleutils::GetSkillRank((SKILLTYPE)i,PChar->GetMJob());

		if (MaxMSkill != 0)
		{
			PChar->WorkingSkills.skill[i] = skillBonus + (PChar->RealSkills.skill[i]/10 >= MaxMSkill ? MaxMSkill + 0x8000 : PChar->RealSkills.skill[i]/10);
		}
		else if (MaxSSkill != 0)
		{
			PChar->WorkingSkills.skill[i] =  skillBonus + (PChar->RealSkills.skill[i]/10 >= MaxSSkill ? MaxSSkill + 0x8000 : PChar->RealSkills.skill[i]/10);
		}
		else
		{
			PChar->WorkingSkills.skill[i] =  skillBonus + 0x8000;
		}
	}

	for (int32 i = 48; i < 58; ++i)
	{
		PChar->WorkingSkills.skill[i] = (PChar->RealSkills.skill[i]/10) * 0x20 + PChar->RealSkills.rank[i];

		if ((PChar->RealSkills.rank[i]+1)*100 <= PChar->RealSkills.skill[i])
		{
			PChar->WorkingSkills.skill[i] += 0x8000;
		}
	}

	for (int32 i = 58; i < 64; ++i)
	{
		PChar->WorkingSkills.skill[i] = 0xFFFF;
	}
}

/************************************************************************
*                                                                       *
*                                                                       *
*                                                                       *
************************************************************************/

void BuildingCharTraitsTable(CCharEntity* PChar)
{
    for (uint8 i = 0; i < PChar->TraitList.size(); ++i)
    {
        CTrait* PTrait = PChar->TraitList.at(i);
        PChar->delModifier(PTrait->getMod(), PTrait->getValue());
    }
    PChar->TraitList.clear();
	memset(&PChar->m_TraitList, 0, sizeof(PChar->m_TraitList));

    TraitList_t* PTraitsList;

	PTraitsList = traits::GetTraits(PChar->GetMJob());
    for (uint8 i = 0; i <  PTraitsList->size(); ++i)
	{
		CTrait* PTrait = PTraitsList->at(i);

        if (PChar->GetMLevel() >= PTrait->getLevel() && PTrait->getLevel() > 0 )
        {

            bool add = true;

            for (uint8 j = 0; j < PChar->TraitList.size(); ++j)
	        {
		        CTrait* PExistingTrait = PChar->TraitList.at(j);

                if (PExistingTrait->getID() == PTrait->getID())
                {
                    if (PExistingTrait->getRank() < PTrait->getRank())
                    {
                        PChar->delModifier(PExistingTrait->getMod(), PExistingTrait->getValue());
                        delTrait(PChar, PExistingTrait->getID());
                        PChar->TraitList.erase(PChar->TraitList.begin()+j);
                        break;
                    }
                    else if (PExistingTrait->getRank() > PTrait->getRank())
                    {
                        add = false;
                        break;
                    }
                    else
                    {
                        if (PExistingTrait->getMod() == PTrait->getMod())
                        {
                            add = false;
                            break;
                        }
                    }
                }

            }
            if ( add)
		    {
                addTrait(PChar, PTrait->getID());

                PChar->TraitList.push_back(PTrait);
                PChar->addModifier(PTrait->getMod(), PTrait->getValue());
		    }
        }
	}
	PTraitsList = traits::GetTraits(PChar->GetSJob());
	for (uint8 i = 0; i <  PTraitsList->size(); ++i)
	{
		CTrait* PTrait = PTraitsList->at(i);

        if (PChar->GetSLevel() >= PTrait->getLevel() && PTrait->getLevel() > 0)
        {

            bool add = true;

            for (uint8 j = 0; j < PChar->TraitList.size(); ++j)
	        {
		        CTrait* PExistingTrait = PChar->TraitList.at(j);

                if (PExistingTrait->getID() == PTrait->getID())
                {
                    if (PExistingTrait->getRank() < PTrait->getRank())
                    {
                        PChar->delModifier(PExistingTrait->getMod(), PExistingTrait->getValue());
                        delTrait(PChar, PExistingTrait->getID());
                        PChar->TraitList.erase(PChar->TraitList.begin()+j);
                        break;
                    }
                    else if (PExistingTrait->getRank() > PTrait->getRank())
                    {
                        add = false;
                        break;
                    }
                    else
                    {
                        if (PExistingTrait->getMod() == PTrait->getMod())
                        {
                            add = false;
                            break;
                        }
                    }
                }
            }

		    if (add)
		    {
			    addTrait(PChar, PTrait->getID());

                PChar->TraitList.push_back(PTrait);
                PChar->addModifier(PTrait->getMod(), PTrait->getValue());
		    }
        }
    }

    if (PChar->GetMJob() == JOB_BLU || PChar->GetSJob() == JOB_BLU)
    {
        blueutils::CalculateTraits(PChar);
    }

    PChar->delModifier(MOD_MEVA, PChar->m_magicEvasion);

    PChar->m_magicEvasion = battleutils::GetMaxSkill(SKILL_ELE, JOB_RDM, PChar->GetMLevel());
	PChar->addModifier(MOD_MEVA, PChar->m_magicEvasion);
	PChar->pushPacket(new CCharAbilitiesPacket(PChar));
}

/************************************************************************
*																		*
*  Пытаемся увеличить значение умения									*
*																		*
************************************************************************/

void TrySkillUP(CCharEntity* PChar, SKILLTYPE SkillID, uint8 lvl)
{

    // This usually happens after a crash
    DSP_DEBUG_BREAK_IF(SkillID >= MAX_SKILLTYPE);   // выход за пределы допустимых умений

    // can't skill up if in pvp
    if(PChar->m_PVPFlag)
    {
        return;
    }

	if ((PChar->WorkingSkills.rank[SkillID] != 0) && !(PChar->WorkingSkills.skill[SkillID] & 0x8000))
	{
		uint16 CurSkill = PChar->RealSkills.skill[SkillID];
        uint16 MaxSkill = battleutils::GetMaxSkill(SkillID, PChar->GetMJob(), dsp_min(PChar->GetMLevel(),lvl));

		int16  Diff = MaxSkill - CurSkill/10;
        double SkillUpChance = Diff/5.0 + map_config.skillup_chance_multiplier * (2.0 - log10(1.0 + CurSkill /100));

		double random = WELL512::drand();

		if(SkillUpChance > 0.5)
		{
			SkillUpChance = 0.5;
		}

		if(Diff > 0 && random < SkillUpChance)
		{
			double chance = 0;
			uint8  SkillAmount = 1;
			uint8  tier = dsp_min(1 + (Diff/5), 5);

			for(uint8 i = 0; i < 4; ++i) // 1 + 4 возможных дополнительных (максимум 5)
			{
				random = WELL512::drand();

				switch(tier)
				{
					case 5:  chance = 0.900; break;
					case 4:  chance = 0.700; break;
					case 3:  chance = 0.500; break;
					case 2:  chance = 0.300; break;
					case 1:  chance = 0.200; break;
					default: chance = 0.000; break;
				}

				if (chance < random || SkillAmount == 5) break;

				tier -= 1;
				SkillAmount += 1;
			}
            MaxSkill = MaxSkill * 10;

			// Do skill amount multiplier (Will only be applied if default setting is changed)
			if (map_config.skillup_amount_multiplier > 1)
			{
				SkillAmount += SkillAmount * map_config.skillup_amount_multiplier;
				if (SkillAmount > 9)
				{
					SkillAmount = 9;
				}
			}

			if (SkillAmount + CurSkill >= MaxSkill)
			{
				SkillAmount = MaxSkill - CurSkill;
                PChar->WorkingSkills.skill[SkillID] |= 0x8000;
			}

			PChar->RealSkills.skill[SkillID] += SkillAmount;
			PChar->pushPacket(new CMessageBasicPacket(PChar, PChar, SkillID, SkillAmount, 38));

			if((CurSkill/10) < (CurSkill + SkillAmount)/10) //if gone up a level
			{
				PChar->WorkingSkills.skill[SkillID] += 1;
				PChar->pushPacket(new CCharSkillsPacket(PChar));
				PChar->pushPacket(new CMessageBasicPacket(PChar, PChar, SkillID, (CurSkill + SkillAmount)/10, 53));

				CheckWeaponSkill(PChar, SkillID);
				/* ignoring this for now
				if (SkillID >= 1 && SkillID <= 12)
				{
					PChar->addModifier(MOD_ATT, 1);
					PChar->addModifier(MOD_ACC, 1);
				}
				*/
			}
			SaveCharSkills(PChar, SkillID);
		}
	}
}

/************************************************************************
*																		*
*  When skill level gained check for weapon skill						*
*																		*
************************************************************************/

void CheckWeaponSkill(CCharEntity* PChar, uint8 skill)
{
	if (PChar->m_Weapons[SLOT_MAIN]->getSkillType() != skill)
	{
		return;
	}
	std::list<CWeaponSkill*> WeaponSkillList;
	WeaponSkillList = battleutils::GetWeaponSkills(skill);
	uint16 curSkill = PChar->RealSkills.skill[skill]/10;
	JOBTYPE curMainJob = PChar->GetMJob();
	JOBTYPE curSubJob = PChar->GetSJob();

	for (std::list<CWeaponSkill*>::iterator it = WeaponSkillList.begin(); it != WeaponSkillList.end(); ++it)
	{
		CWeaponSkill* PSkill = *it;

		if (curSkill == PSkill->getSkillLevel() && (PSkill->getJob(curMainJob) > 0 || PSkill->getJob(curSubJob) > 0))
		{
			addWeaponSkill(PChar,PSkill->getID());
			PChar->pushPacket(new CMessageBasicPacket(PChar, PChar, PSkill->getID(), PSkill->getID(), 45));
			PChar->pushPacket(new CCharAbilitiesPacket(PChar));
		}
	}
}

/************************************************************************
*																		*
*  Методы для работы с ключевыми предметами								*
*																		*
************************************************************************/

int32 hasKeyItem(CCharEntity* PChar, uint16 KeyItemID)
{
	return hasBit(KeyItemID, PChar->keys.keysList, sizeof(PChar->keys.keysList));
}

int32 seenKeyItem(CCharEntity* PChar, uint16 KeyItemID)
{
	return hasBit(KeyItemID, PChar->keys.seenList, sizeof(PChar->keys.seenList));
}

int32 unseenKeyItem(CCharEntity* PChar, uint16 KeyItemID)
{
	return delBit(KeyItemID, PChar->keys.seenList, sizeof(PChar->keys.seenList));
}

int32 addKeyItem(CCharEntity* PChar, uint16 KeyItemID)
{
	return addBit(KeyItemID, PChar->keys.keysList, sizeof(PChar->keys.keysList));
}

int32 delKeyItem(CCharEntity* PChar, uint16 KeyItemID)
{
	return delBit(KeyItemID, PChar->keys.keysList, sizeof(PChar->keys.keysList));
}

/************************************************************************
*																		*
*  Методы для работы с заклинаниями										*
*																		*
************************************************************************/

int32 hasSpell(CCharEntity* PChar, uint16 SpellID)
{
	return hasBit(SpellID, PChar->m_SpellList, sizeof(PChar->m_SpellList));
}

int32 addSpell(CCharEntity* PChar, uint16 SpellID)
{
	return addBit(SpellID, PChar->m_SpellList, sizeof(PChar->m_SpellList));
}

int32 delSpell(CCharEntity* PChar, uint16 SpellID)
{
	return delBit(SpellID, PChar->m_SpellList, sizeof(PChar->m_SpellList));
}

/************************************************************************
*																		*
*  Learned abilities (corsair rolls)									*
*																		*
************************************************************************/

int32 hasLearnedAbility(CCharEntity* PChar, uint16 AbilityID)
{
	return hasBit(AbilityID, PChar->m_LearnedAbilities, sizeof(PChar->m_LearnedAbilities));
}

int32 addLearnedAbility(CCharEntity* PChar, uint16 AbilityID)
{
	return addBit(AbilityID, PChar->m_LearnedAbilities, sizeof(PChar->m_LearnedAbilities));
}

int32 delLearnedAbility(CCharEntity* PChar, uint16 AbilityID)
{
	return delBit(AbilityID, PChar->m_LearnedAbilities, sizeof(PChar->m_LearnedAbilities));
}

/************************************************************************
*                                                                       *
*  Методы для работы со званиями                                        *
*                                                                       *
************************************************************************/

int32 hasTitle(CCharEntity* PChar, uint16 Title)
{
	return hasBit(Title, PChar->m_TitleList, sizeof(PChar->m_TitleList));
}

int32 addTitle(CCharEntity* PChar, uint16 Title)
{
	return addBit(Title, PChar->m_TitleList, sizeof(PChar->m_TitleList));
}

int32 delTitle(CCharEntity* PChar, uint16 Title)
{
	return delBit(Title, PChar->m_TitleList, sizeof(PChar->m_TitleList));
}

void setTitle(CCharEntity* PChar, uint16 Title)
{
    PChar->profile.title = Title;
    PChar->pushPacket(new CCharStatsPacket(PChar));

    addTitle(PChar, Title);
    SaveTitles(PChar);
}

/************************************************************************
*																		*
*  Методы для работы с основными способностями							*
*																		*
************************************************************************/

int32 hasAbility(CCharEntity* PChar, uint16 AbilityID)
{
	return hasBit(AbilityID, PChar->m_Abilities, sizeof(PChar->m_Abilities));
}

int32 addAbility(CCharEntity* PChar, uint16 AbilityID)
{
	return addBit(AbilityID, PChar->m_Abilities, sizeof(PChar->m_Abilities));
}

int32 delAbility(CCharEntity* PChar, uint16 AbilityID)
{
	return delBit(AbilityID, PChar->m_Abilities, sizeof(PChar->m_Abilities));
}

/************************************************************************
*																		*
*  Weapon Skill functions												*
*																		*
************************************************************************/

int32 hasWeaponSkill(CCharEntity* PChar, uint16 WeaponSkillID)
{
	return hasBit(WeaponSkillID, PChar->m_WeaponSkills, sizeof(PChar->m_WeaponSkills));
}

int32 addWeaponSkill(CCharEntity* PChar, uint16 WeaponSkillID)
{
	return addBit(WeaponSkillID, PChar->m_WeaponSkills, sizeof(PChar->m_WeaponSkills));
}

int32 delWeaponSkill(CCharEntity* PChar, uint16 WeaponSkillID)
{
	return delBit(WeaponSkillID, PChar->m_WeaponSkills, sizeof(PChar->m_WeaponSkills));
}

/************************************************************************
*																		*
*  Trait Functions														*
*																		*
************************************************************************/

int32 hasTrait(CCharEntity* PChar, uint8 TraitID)
{
	if (PChar->objtype != TYPE_PC)
	{
		ShowError("charutils::hasTrait Attempt to reference a trait from a non-character entity: %s %i", PChar->name.c_str(), PChar->id);
		return 0;
	}
	return hasBit(TraitID, PChar->m_TraitList, sizeof(PChar->m_TraitList));
}

int32 addTrait(CCharEntity* PChar, uint8 TraitID)
{
	if (PChar->objtype != TYPE_PC)
	{
		ShowError("charutils::addTrait Attempt to reference a trait from a non-character entity: %s %i", PChar->name.c_str(), PChar->id);
		return 0;
	}
	return addBit(TraitID, PChar->m_TraitList, sizeof(PChar->m_TraitList));
}

int32 delTrait(CCharEntity* PChar, uint8 TraitID)
{
	if (PChar->objtype != TYPE_PC)
	{
		ShowError("charutils::delTrait Attempt to reference a trait from a non-character entity: %s %i", PChar->name.c_str(), PChar->id);
		return 0;
	}
	return delBit(TraitID, PChar->m_TraitList, sizeof(PChar->m_TraitList));
}

/************************************************************************
*
*		Pet Command Functions
*
*************************************************************************/
int32 hasPetAbility(CCharEntity* PChar, uint16 AbilityID)
{
	return hasBit(AbilityID, PChar->m_PetCommands, sizeof(PChar->m_PetCommands));
}

int32 addPetAbility(CCharEntity* PChar, uint16 AbilityID)
{
	return addBit(AbilityID, PChar->m_PetCommands, sizeof(PChar->m_PetCommands));
}

int32 delPetAbility(CCharEntity* PChar, uint16 AbilityID)
{
	return delBit(AbilityID, PChar->m_PetCommands, sizeof(PChar->m_PetCommands));
}

/************************************************************************
*                                                                       *
*  Обновляем MP, HP и TP персонажа                                      *
*                                                                       *
************************************************************************/

void UpdateHealth(CCharEntity* PChar)
{
    DSP_DEBUG_BREAK_IF(PChar->objtype != TYPE_PC);

    if (PChar->status == STATUS_NORMAL) PChar->status = STATUS_UPDATE;

	if (PChar->PParty != NULL)
	{
		if (PChar->PParty->m_PAlliance == NULL)
		{
			PChar->PParty->PushPacket(PChar, PChar->getZone(), new CCharHealthPacket(PChar));

		}else if (PChar->PParty->m_PAlliance != NULL)
				{
					for (uint8 i = 0; i < PChar->PParty->m_PAlliance->partyList.size(); ++i)
					{
						((CParty*)PChar->PParty->m_PAlliance->partyList.at(i))->PushPacket(PChar, PChar->getZone(), new CCharHealthPacket(PChar));
					}
				}
	}

    PChar->pushPacket(new CCharHealthPacket(PChar));
}

/************************************************************************
*																		*
*  Инициализируем таблицу опыта											*
*																		*
************************************************************************/

void LoadExpTable()
{
	memset(g_ExpTable,0, sizeof(g_ExpTable));
	memset(g_ExpPerLevel,0, sizeof(g_ExpPerLevel));

	const int8* fmtQuery = "SELECT r1,r2,r3,r4,r5,r6,r7,r8,r9,r10,r11,r12,r13,r14,r15,r16,r17,r18,r19,r20 \
						    FROM exp_table \
							ORDER BY level ASC \
							LIMIT 50";

	int32 ret = Sql_Query(SqlHandle,fmtQuery);

	if (ret != SQL_ERROR && Sql_NumRows(SqlHandle) != 0)
	{
		for (uint32 x = 0; x < 50 && Sql_NextRow(SqlHandle) == SQL_SUCCESS; ++x)
		{
			for (uint32 y = 0; y < 20; ++y)
			{
				g_ExpTable[x][y] = (uint16)Sql_GetIntData(SqlHandle,y);
			}
		}
	}

	ret = Sql_Query(SqlHandle,"SELECT level, exp FROM exp_base LIMIT 100;");

	if (ret != SQL_ERROR && Sql_NumRows(SqlHandle) != 0)
	{
		while(Sql_NextRow(SqlHandle) == SQL_SUCCESS)
		{
			uint8 level = (uint8)Sql_GetIntData(SqlHandle,0) - 1;

			if (level < 100)
			{
				g_ExpPerLevel[level] = (uint16)Sql_GetIntData(SqlHandle,1);
			}
		}
	}
}

/************************************************************************
*																		*
*  Узнаем реальное количество опыта, который персонаж получит с цели	*
*																		*
************************************************************************/

uint32 GetRealExp(uint8 charlvl, uint8 moblvl)
{
	int32 levelDif =  moblvl - charlvl + 34;

	if ((charlvl > 0) && (charlvl < 100))
	{
		return g_ExpTable[dsp_cap(levelDif,0,49)][(charlvl-1)/5];
	}
	return 0;
}

/************************************************************************
*																		*
*  Узнаем количество опыта, необходимое для получения следующего уровня	*
*																		*
************************************************************************/

uint32 GetExpNEXTLevel(uint8 charlvl)
{
	if ((charlvl > 0) && (charlvl < 100))
	{
		return g_ExpPerLevel[charlvl];
	}
	return 0;
}

/************************************************************************
*																		*
*  Distributes gil to party members.                                    *
*																		*
************************************************************************/

// TODO: REALISATION MUST BE IN TREASUREPOOL

void DistributeGil(CCharEntity* PChar, CMobEntity* PMob)
{
    //work out the amount of gil to give (guessed; replace with testing)
    uint32 gil = PMob->GetRandomGil();


	//distribute to said members (perhaps store pointers to each member in first loop?)
	if (PChar->PParty != NULL)
	{
        // TODO: плохая реализация - два раза проверяем дистанцию, два раза проверяем один и тот же массив

        uint8 count = 0;
        //work out how many pt members should get the gil
        for (uint8 i = 0; i < PChar->PParty->members.size(); i++)
		{
            CBattleEntity* PMember = PChar->PParty->members[i];
            if (PMember->getZone() == PMob->getZone() && distance(PMember->loc.p, PMob->loc.p) < 100)
			{
                count++;
			}
		}

        uint32 gilperperson = count == 0 ? gil : (gil / count);

		for (uint8 i = 0; i < PChar->PParty->members.size(); i++)
		{
            CCharEntity* PMember = (CCharEntity*)PChar->PParty->members[i];
			if (PMember->getZone() == PMob->getZone() && distance(PMember->loc.p, PMob->loc.p) < 100)
			{
                UpdateItem(PMember, LOC_INVENTORY, 0, gilperperson);
                PMember->pushPacket(new CMessageBasicPacket(PMember,PMember,gilperperson,0,565));
            }
        }
    }
    else if (distance(PChar->loc.p, PMob->loc.p) < 100)
    {
        UpdateItem(PChar, LOC_INVENTORY, 0, gil);
        PChar->pushPacket(new CMessageBasicPacket(PChar,PChar,gil,0,565));
	}
}

/************************************************************************
*																		*
*  Allocate experience points											*
*																		*
************************************************************************/

void DistributeExperiencePoints(CCharEntity* PChar, CMobEntity* PMob)
{
    uint8 pcinzone = 0, minlevel = 0, maxlevel = PChar->GetMLevel();
    uint32 baseexp = 0, exp = 0, dedication = 0;
    float permonstercap, monsterbonus = 1.0f;
    bool chainactive = false;
    if (PChar->PParty != NULL)
    {
        if (PChar->PParty->GetSyncTarget() != NULL)
        {
            if (distance(PMob->loc.p, PChar->PParty->GetSyncTarget()->loc.p) >= 100 || PChar->PParty->GetSyncTarget()->health.hp == 0)
            {
                for (uint8 i = 0; i < PChar->PParty->members.size(); i++)
                {
                    CCharEntity* PMember = (CCharEntity*)PChar->PParty->members.at(i);
                    if (PMember->getZone() == PMob->getZone() && distance(PMember->loc.p, PMob->loc.p) < 100)
                    {
                        PMember->pushPacket(new CMessageBasicPacket(PMember, PMember, 0, 0, 545));
                    }
                }
                return;
            }
        }
        for (uint8 i = 0; i < PChar->PParty->members.size(); i++)
        {
            CBattleEntity* PBattle = PChar->PParty->members[i];
            if (PBattle->getZone() == PMob->getZone() && distance(PBattle->loc.p, PMob->loc.p) < 100)
            {
                if (PBattle->PPet != NULL && PBattle->PPet->GetMLevel() > maxlevel) maxlevel = PBattle->PPet->GetMLevel();
                if (PBattle->GetMLevel() > maxlevel) maxlevel = PBattle->GetMLevel();
                else if (PBattle->GetMLevel() < minlevel) minlevel = PBattle->GetMLevel();
                pcinzone++;
            }
        }
		if (PMob->m_HiPCLvl > maxlevel) maxlevel = PMob->m_HiPCLvl;
        baseexp = GetRealExp(maxlevel, PMob->GetMLevel());
        if (baseexp != 0)
        {
            for (uint8 i = 0; i < PChar->PParty->members.size(); ++i)
            {
                exp = 0;
                monsterbonus = 1.0f;
                chainactive = false;
                CCharEntity* PMember = (CCharEntity*)PChar->PParty->members[i];
                if(PMember->getZone() == PMob->getZone())
                {
                    if (map_config.exp_party_gap_penalties == 1)
					{
						if (maxlevel > 50 || maxlevel > (PMember->GetMLevel()+7))
						{
							exp = (float)baseexp*(float)((float)(PMember->GetMLevel())/(float)(maxlevel));
						}
						else
						{
							exp = (float)baseexp*(float)((float)(GetExpNEXTLevel(PMember->GetMLevel()))/(float)(GetExpNEXTLevel(maxlevel)));
						}
					}
					else exp = baseexp;
                    if (PMember->StatusEffectContainer->HasStatusEffect(EFFECT_SIGNET) || PMember->StatusEffectContainer->HasStatusEffect(EFFECT_SANCTION))
                    {
                        switch(pcinzone)
                        {
                        case 1: exp *= 1.00f; break;
                        case 2:	exp *= 0.75f; break;
                        case 3: exp *= 0.55f; break;
                        case 4: exp *= 0.45f; break;
                        case 5:	exp *= 0.39f; break;
                        case 6: exp *= 0.35f; break;
                        default: break;
                        }
                    }
                    else
                    {
                        switch(pcinzone)
                        {
                        case 1:	exp *= 1.00f; break;
                        case 2: exp *= 0.60f; break;
                        case 3: exp *= 0.45f; break;
                        case 4: exp *= 0.40f; break;
                        case 5: exp *= 0.37f; break;
                        case 6: exp *= 0.35f; break;
                        default: break;
                        }
                    }

                    if(PMob->getMobMod(MOBMOD_EXP_BONUS))
                    {
                    	monsterbonus = (float)PMob->getMobMod(MOBMOD_EXP_BONUS)/100.0f;
                    }

                    if (monsterbonus > 1.00f) exp *= monsterbonus;
                    permonstercap = ((PMember->PParty != NULL && pcinzone > 1) ? 1.35f : 1.15f);
                    if (PMember->GetMLevel() <= 50)
                    {
                        if (exp > (200*permonstercap)) exp = 200*permonstercap;
                    }
                    else if (PMember->GetMLevel() <= 60)
                    {
                        if (exp > (250*permonstercap)) exp = 250*permonstercap;
                    }
                    else if (exp > (300*permonstercap))
                    {
                        exp = 300*permonstercap;
                    }
                    if (PMember->expChain.chainTime > gettick() || PMember->expChain.chainTime == 0)
                    {
                        chainactive = true;
                        switch(PMember->expChain.chainNumber)
                        {
                        case 0: exp *= 1.0f; break;
                        case 1: exp *= 1.2f; break;
                        case 2: exp *= 1.25f; break;
                        case 3: exp *= 1.3f; break;
                        case 4: exp *= 1.4f; break;
                        case 5: exp *= 1.5f; break;
                        default: exp *= 1.55f; break;
                        }
                    }
                    else
                    {
                        if (PMember->GetMLevel() <=10) PMember->expChain.chainTime = gettick()+50000;
                        else if (PMember->GetMLevel() <=20) PMember->expChain.chainTime = gettick()+100000;
                        else if (PMember->GetMLevel() <=30) PMember->expChain.chainTime = gettick()+150000;
                        else if (PMember->GetMLevel() <=40) PMember->expChain.chainTime = gettick()+200000;
                        else if (PMember->GetMLevel() <=50) PMember->expChain.chainTime = gettick()+250000;
                        else if (PMember->GetMLevel() <=60) PMember->expChain.chainTime = gettick()+300000;
                        else PMember->expChain.chainTime = gettick()+360000;
                        chainactive = false;
                        PMember->expChain.chainNumber = 1;
                    }
                    if(chainactive && PMember->GetMLevel() <= 10)
                    {
                        switch(PMember->expChain.chainNumber)
                        {
                        case 0: PMember->expChain.chainTime = gettick()+50000; break;
                        case 1:	PMember->expChain.chainTime = gettick()+40000; break;
                        case 2: PMember->expChain.chainTime = gettick()+30000; break;
                        case 3: PMember->expChain.chainTime = gettick()+20000; break;
                        case 4: PMember->expChain.chainTime = gettick()+10000; break;
                        case 5: PMember->expChain.chainTime = gettick()+6000; break;
                        default: PMember->expChain.chainTime = gettick()+2000; break;
                        }
                    } else if(chainactive && PMember->GetMLevel() <= 20)
                    {
                        switch(PMember->expChain.chainNumber)
                        {
                        case 0: PMember->expChain.chainTime = gettick()+100000; break;
                        case 1:	PMember->expChain.chainTime = gettick()+80000; break;
                        case 2: PMember->expChain.chainTime = gettick()+60000; break;
                        case 3: PMember->expChain.chainTime = gettick()+40000; break;
                        case 4: PMember->expChain.chainTime = gettick()+20000; break;
                        case 5: PMember->expChain.chainTime = gettick()+8000; break;
                        default: PMember->expChain.chainTime = gettick()+4000; break;
                        }
                    } else if(chainactive && PMember->GetMLevel() <= 30)
                    {
                        switch(PMember->expChain.chainNumber)
                        {
                        case 0: PMember->expChain.chainTime = gettick()+150000; break;
                        case 1:	PMember->expChain.chainTime = gettick()+120000; break;
                        case 2: PMember->expChain.chainTime = gettick()+90000; break;
                        case 3: PMember->expChain.chainTime = gettick()+60000; break;
                        case 4: PMember->expChain.chainTime = gettick()+30000; break;
                        case 5: PMember->expChain.chainTime = gettick()+10000; break;
                        default: PMember->expChain.chainTime = gettick()+5000; break;
                        }
                    } else if(chainactive && PMember->GetMLevel() <= 40)
                    {
                        switch(PMember->expChain.chainNumber)
                        {
                        case 0: PMember->expChain.chainTime = gettick()+200000; break;
                        case 1:	PMember->expChain.chainTime = gettick()+160000; break;
                        case 2: PMember->expChain.chainTime = gettick()+120000; break;
                        case 3: PMember->expChain.chainTime = gettick()+80000; break;
                        case 4: PMember->expChain.chainTime = gettick()+40000; break;
                        case 5: PMember->expChain.chainTime = gettick()+40000; break;
                        default: PMember->expChain.chainTime = gettick()+30000; break;
                        }
                    } else if(chainactive && PMember->GetMLevel() <= 50)
                    {
                        switch(PMember->expChain.chainNumber)
                        {
                        case 0: PMember->expChain.chainTime = gettick()+250000; break;
                        case 1:	PMember->expChain.chainTime = gettick()+200000; break;
                        case 2: PMember->expChain.chainTime = gettick()+150000; break;
                        case 3: PMember->expChain.chainTime = gettick()+100000; break;
                        case 4: PMember->expChain.chainTime = gettick()+50000; break;
                        case 5: PMember->expChain.chainTime = gettick()+50000; break;
                        default: PMember->expChain.chainTime = gettick()+50000; break;
                        }
                    } else if(chainactive && PMember->GetMLevel() <= 60)
                    {
                        switch(PMember->expChain.chainNumber)
                        {
                        case 0: PMember->expChain.chainTime = gettick()+300000; break;
                        case 1:	PMember->expChain.chainTime = gettick()+240000; break;
                        case 2: PMember->expChain.chainTime = gettick()+180000; break;
                        case 3: PMember->expChain.chainTime = gettick()+120000; break;
                        case 4: PMember->expChain.chainTime = gettick()+90000; break;
                        case 5: PMember->expChain.chainTime = gettick()+60000; break;
                        default: PMember->expChain.chainTime = gettick()+60000; break;
                        }
                    } else if (chainactive)
                    {
                        switch(PMember->expChain.chainNumber)
                        {
                        case 0: PMember->expChain.chainTime = gettick()+360000; break;
                        case 1:	PMember->expChain.chainTime = gettick()+300000; break;
                        case 2: PMember->expChain.chainTime = gettick()+240000; break;
                        case 3: PMember->expChain.chainTime = gettick()+165000; break;
                        case 4: PMember->expChain.chainTime = gettick()+105000; break;
                        case 5: PMember->expChain.chainTime = gettick()+60000; break;
                        default: PMember->expChain.chainTime = gettick()+60000; break;
                        }
                    }
                    exp = charutils::AddExpBonus(PMember, exp);

                    // pet or companion exp penalty needs to be added here

                    if (distance(PMember->loc.p, PMob->loc.p) > 100)
                    {
                        PMember->pushPacket(new CMessageBasicPacket(PMember,PMember,0,0,37));
                        continue;
                    }
					uint8 Pzone = PMember->getZone();
                    if (PMob->m_Type == MOBTYPE_NORMAL && ((Pzone > 0 && Pzone < 39) || (Pzone > 42 && Pzone < 134) || (Pzone > 135 && Pzone < 185) || (Pzone > 188 && Pzone < 255)))
					{
						if (PMember->StatusEffectContainer->HasStatusEffect(EFFECT_SIGNET) && PMob->m_Element > 0 && WELL512::irand()%100 < 20 &&
                        PMember->loc.zone == PMob->loc.zone) // Need to move to SIGNET_CHANCE constant
						{
							PMember->PTreasurePool->AddItem(4095 + PMob->m_Element, PMob);
						}
					}
					if (PChar->PParty != NULL && PChar->PParty->m_PAlliance != NULL && PMob->m_Type == MOBTYPE_NORMAL)
					{
						if ((Pzone > 38 && Pzone < 43) || (Pzone > 133 && Pzone < 136) || (Pzone > 184 && Pzone < 189)) AddExperiencePoints(false, PMember, PMob, exp, 1, false);
						else AddExperiencePoints(false, PMember, PMob, 1, 1, false);
					}
                    else AddExperiencePoints(false, PMember, PMob, exp, baseexp, chainactive);
                }
            }
        }
    }
    else
    {
        if (PChar->PPet != NULL && PChar->PPet->GetMLevel() > maxlevel) maxlevel = PChar->PPet->GetMLevel();
        baseexp  = GetRealExp(maxlevel, PMob->GetMLevel());
        exp = baseexp;
        permonstercap = 1.15f;
        if(PMob->getMobMod(MOBMOD_EXP_BONUS))
        {
           	monsterbonus = (float)PMob->getMobMod(MOBMOD_EXP_BONUS)/100.0f;
        }
        if (monsterbonus > 1.00f) exp *= monsterbonus;
        if (PChar->GetMLevel() <= 50)
        {
            if (exp > (200*permonstercap)) exp = 200*permonstercap;
        }
        else if (PChar->GetMLevel() <= 60)
        {
            if (exp > (250*permonstercap)) exp = 250*permonstercap;
        }
        else if (exp > (300*permonstercap))
        {
            exp = 300*permonstercap;
        }
        if (PChar->expChain.chainTime > gettick() || PChar->expChain.chainTime == 0)
        {
            chainactive = true;
            switch(PChar->expChain.chainNumber)
            {
            case 0: exp *= 1.0f; break;
            case 1: exp *= 1.2f; break;
            case 2: exp *= 1.25f; break;
            case 3: exp *= 1.3f; break;
            case 4: exp *= 1.4f; break;
            case 5: exp *= 1.5f; break;
            default: exp *= 1.55f; break;
            }
        }
        else
        {
            if (PChar->GetMLevel() <=10) PChar->expChain.chainTime = gettick()+50000;
            else if (PChar->GetMLevel() <=20) PChar->expChain.chainTime = gettick()+100000;
            else if (PChar->GetMLevel() <=30) PChar->expChain.chainTime = gettick()+150000;
            else if (PChar->GetMLevel() <=40) PChar->expChain.chainTime = gettick()+200000;
            else if (PChar->GetMLevel() <=50) PChar->expChain.chainTime = gettick()+250000;
            else if (PChar->GetMLevel() <=60) PChar->expChain.chainTime = gettick()+300000;
            else PChar->expChain.chainTime = gettick()+360000;
            chainactive = false;
            PChar->expChain.chainNumber = 1;
        }
        if(chainactive && PChar->GetMLevel() <= 10)
        {
            switch(PChar->expChain.chainNumber)
            {
            case 0: PChar->expChain.chainTime = gettick()+50000; break;
            case 1:	PChar->expChain.chainTime = gettick()+40000; break;
            case 2: PChar->expChain.chainTime = gettick()+30000; break;
            case 3: PChar->expChain.chainTime = gettick()+20000; break;
            case 4: PChar->expChain.chainTime = gettick()+10000; break;
            case 5: PChar->expChain.chainTime = gettick()+6000; break;
            default: PChar->expChain.chainTime = gettick()+2000; break;
            }
        } else if(chainactive && PChar->GetMLevel() <= 20)
        {
            switch(PChar->expChain.chainNumber)
            {
            case 0: PChar->expChain.chainTime = gettick()+100000; break;
            case 1:	PChar->expChain.chainTime = gettick()+80000; break;
            case 2: PChar->expChain.chainTime = gettick()+60000; break;
            case 3: PChar->expChain.chainTime = gettick()+40000; break;
            case 4: PChar->expChain.chainTime = gettick()+20000; break;
            case 5: PChar->expChain.chainTime = gettick()+8000; break;
            default: PChar->expChain.chainTime = gettick()+4000; break;
            }
        } else if(chainactive && PChar->GetMLevel() <= 30)
        {
            switch(PChar->expChain.chainNumber)
            {
            case 0: PChar->expChain.chainTime = gettick()+150000; break;
            case 1:	PChar->expChain.chainTime = gettick()+120000; break;
            case 2: PChar->expChain.chainTime = gettick()+90000; break;
            case 3: PChar->expChain.chainTime = gettick()+60000; break;
            case 4: PChar->expChain.chainTime = gettick()+30000; break;
            case 5: PChar->expChain.chainTime = gettick()+10000; break;
            default: PChar->expChain.chainTime = gettick()+5000; break;
            }
        } else if(chainactive && PChar->GetMLevel() <= 40)
        {
            switch(PChar->expChain.chainNumber)
            {
            case 0: PChar->expChain.chainTime = gettick()+200000; break;
            case 1:	PChar->expChain.chainTime = gettick()+160000; break;
            case 2: PChar->expChain.chainTime = gettick()+120000; break;
            case 3: PChar->expChain.chainTime = gettick()+80000; break;
            case 4: PChar->expChain.chainTime = gettick()+40000; break;
            case 5: PChar->expChain.chainTime = gettick()+40000; break;
            default: PChar->expChain.chainTime = gettick()+30000; break;
            }
        } else if(chainactive && PChar->GetMLevel() <= 50)
        {
            switch(PChar->expChain.chainNumber)
            {
            case 0: PChar->expChain.chainTime = gettick()+250000; break;
            case 1:	PChar->expChain.chainTime = gettick()+200000; break;
            case 2: PChar->expChain.chainTime = gettick()+150000; break;
            case 3: PChar->expChain.chainTime = gettick()+100000; break;
            case 4: PChar->expChain.chainTime = gettick()+50000; break;
            case 5: PChar->expChain.chainTime = gettick()+50000; break;
            default: PChar->expChain.chainTime = gettick()+50000; break;
            }
        } else if(chainactive && PChar->GetMLevel() <= 60)
        {
            switch(PChar->expChain.chainNumber)
            {
            case 0: PChar->expChain.chainTime = gettick()+300000; break;
            case 1:	PChar->expChain.chainTime = gettick()+240000; break;
            case 2: PChar->expChain.chainTime = gettick()+180000; break;
            case 3: PChar->expChain.chainTime = gettick()+120000; break;
            case 4: PChar->expChain.chainTime = gettick()+90000; break;
            case 5: PChar->expChain.chainTime = gettick()+60000; break;
            default: PChar->expChain.chainTime = gettick()+60000; break;
            }
        } else if (chainactive)
        {
            switch(PChar->expChain.chainNumber)
            {
            case 0: PChar->expChain.chainTime = gettick()+360000; break;
            case 1:	PChar->expChain.chainTime = gettick()+300000; break;
            case 2: PChar->expChain.chainTime = gettick()+240000; break;
            case 3: PChar->expChain.chainTime = gettick()+165000; break;
            case 4: PChar->expChain.chainTime = gettick()+105000; break;
            case 5: PChar->expChain.chainTime = gettick()+60000; break;
            default: PChar->expChain.chainTime = gettick()+60000; break;
            }
        }
        exp = charutils::AddExpBonus(PChar, exp);

        // pet or companion exp penalty needs to be added here

        if (distance(PChar->loc.p, PMob->loc.p) > 100)
        {
            PChar->pushPacket(new CMessageBasicPacket(PChar,PChar,0,0,37));
            return;
        }
        AddExperiencePoints(false, PChar, PMob, exp, baseexp, chainactive);
    }
}

/************************************************************************
*                                                                       *
*  Losing exp on death. retainPercent is the amount of exp to be        *
*  saved on death, e.g. 0.05 = retain 5% of lost exp. A value of        *
*  1 means no exp loss. A value of 0 means full exp loss.               *
*                                                                       *
************************************************************************/
void DelExperiencePoints(CCharEntity* PChar, float retainPercent)
{
	DSP_DEBUG_BREAK_IF(retainPercent > 1.0f || retainPercent < 0.0f);
	DSP_DEBUG_BREAK_IF(map_config.exp_loss_level > 99 || map_config.exp_loss_level < 1);

	if(PChar->GetMLevel() < map_config.exp_loss_level)
    {
		return;
	}

	uint8 mLevel = (PChar->m_LevelRestriction != 0 && PChar->m_LevelRestriction < PChar->GetMLevel()) ? PChar->m_LevelRestriction : PChar->GetMLevel();
	uint16 exploss = mLevel <= 67 ? (GetExpNEXTLevel(mLevel) * 8 ) / 100 : 2400;

	//apply retention percent
	exploss = exploss*(1-retainPercent);
	exploss = exploss * map_config.exp_loss_rate;

	if( PChar->jobs.exp[PChar->GetMJob()] < exploss)
    {
		//de-level!
		int32 diff = abs(PChar->jobs.exp[PChar->GetMJob()] - exploss);
		PChar->jobs.exp[PChar->GetMJob()] = GetExpNEXTLevel(PChar->jobs.job[PChar->GetMJob()]-1) - diff;
		PChar->jobs.job[PChar->GetMJob()] -= 1;

		if (PChar->m_LevelRestriction == 0 || PChar->jobs.job[PChar->GetMJob()] < PChar->m_LevelRestriction)
		{
			PChar->SetMLevel(PChar->jobs.job[PChar->GetMJob()]);
			PChar->SetSLevel(PChar->jobs.job[PChar->GetSJob()]);
		}

        BuildingCharSkillsTable(PChar);
        CalculateStats(PChar);
        CheckValidEquipment(PChar);

        BuildingCharAbilityTable(PChar);
        BuildingCharTraitsTable(PChar);
        BuildingCharWeaponSkills(PChar);

        PChar->UpdateHealth();

        PChar->pushPacket(new CCharJobsPacket(PChar));
        PChar->pushPacket(new CCharUpdatePacket(PChar));
        PChar->pushPacket(new CCharSkillsPacket(PChar));
        PChar->pushPacket(new CCharAbilitiesPacket(PChar));
        PChar->pushPacket(new CMenuMeritPacket(PChar));
        PChar->pushPacket(new CCharJobExtraPacket(PChar, true));
        PChar->pushPacket(new CCharJobExtraPacket(PChar, false));
        PChar->pushPacket(new CCharSyncPacket(PChar));

        SaveCharStats(PChar);
        SaveCharJob(PChar, PChar->GetMJob());

        if (PChar->PParty != NULL)
        {
            if (PChar->PParty->GetSyncTarget() == PChar)
            {
                PChar->PParty->RefreshSync();
            }
        }

		PChar->loc.zone->PushPacket(PChar, CHAR_INRANGE_SELF, new CMessageDebugPacket(PChar, PChar, PChar->jobs.job[PChar->GetMJob()], 0, 11));
	}
	else
    {
		PChar->jobs.exp[PChar->GetMJob()] -= exploss;
	}

    SaveCharExp(PChar, PChar->GetMJob());
	PChar->pushPacket(new CCharStatsPacket(PChar));
}

/************************************************************************
*                                                                       *
*  Добавляем очки опытка указанному персонажу                           *
*                                                                       *
************************************************************************/

void AddExperiencePoints(bool expFromRaise, CCharEntity* PChar, CBaseEntity* PMob, uint32 exp, uint32 baseexp, bool isexpchain)
{
	if (PChar->isDead())
		return;
	
	if (!expFromRaise) 
	{
		exp = exp * map_config.exp_rate;
	}
	uint16 currentExp = PChar->jobs.exp[PChar->GetMJob()];
	bool onLimitMode = false;

	// Incase player de-levels to 74 on the field
    if (PChar->MeritMode == true && PChar->jobs.job[PChar->GetMJob()] > 74 && expFromRaise == false)
        onLimitMode = true;

    //we check if the player is level capped and max exp..
    if (PChar->jobs.job[PChar->GetMJob()] > 74 && PChar->jobs.job[PChar->GetMJob()] >= PChar->jobs.genkai && PChar->jobs.exp[PChar->GetMJob()] == GetExpNEXTLevel(PChar->jobs.job[PChar->GetMJob()]) - 1)
        onLimitMode = true;

	// exp added from raise shouldn't display a message
	if(!expFromRaise)
	{
	    if (baseexp >= 100 && isexpchain)
		{
			if (PChar->expChain.chainNumber != 0)
			{
				if (onLimitMode)
					PChar->pushPacket(new CMessageDebugPacket(PChar, PChar, exp, PChar->expChain.chainNumber, 372));
				else
					PChar->pushPacket(new CMessageDebugPacket(PChar, PChar, exp, PChar->expChain.chainNumber, 253));
			}
			else
			{
				if (onLimitMode)
				{
					PChar->pushPacket(new CMessageDebugPacket(PChar, PChar, exp, 0, 371));
				}
				else
				{
					PChar->pushPacket(new CMessageDebugPacket(PChar, PChar, exp, 0, 8));
				}
			}
			PChar->expChain.chainNumber++;
		}
		else if(exp > 0)
		{
			if (onLimitMode)
				PChar->pushPacket(new CMessageDebugPacket(PChar, PChar, exp, 0, 371));
			else
				PChar->pushPacket(new CMessageDebugPacket(PChar, PChar, exp, 0, 8));
		}
	}

	if (onLimitMode == true)
	{
		//add limit points
		if (PChar->PMeritPoints->AddLimitPoints(exp))
        {
			PChar->loc.zone->PushPacket(PChar, CHAR_INRANGE_SELF, new CMessageDebugPacket(PChar, PMob, PChar->PMeritPoints->GetMeritPoints(), 0, 368));
		}
	}
	else
	{
		//add normal exp
		PChar->jobs.exp[PChar->GetMJob()] += exp;
	}

    if (!expFromRaise)
    {
        REGIONTYPE region = PChar->loc.zone->GetRegionID();

        // Should this user be awarded conquest points..
        if (PChar->StatusEffectContainer->HasStatusEffect(EFFECT_SIGNET) &&
            (region >= 0 && region <= 22))
        {
            // Add influence for the players region..
            conquest::GainInfluencePoints(PChar);
            conquest::AddConquestPoints(PChar, exp);
        }

        // Should this user be awarded imperial standing..
        if (PChar->StatusEffectContainer->HasStatusEffect(EFFECT_SANCTION) &&
            (region >= 28 && region <= 32))
        {
            PChar->m_currency.imperialstanding += (exp * 0.1f);
            PChar->pushPacket(new CConquestPacket(PChar));
        }
    }

    // Cruor Drops in Abyssea zones.
    uint16 Pzone = PChar->getZone();
    if (zoneutils::GetCurrentRegion(Pzone) == REGION_ABYSSEA)
    {
        uint16 TextID = luautils::GetTextIDVariable(Pzone, "CRUOR_OBTAINED");
        uint32 Total = PChar->m_currency.cruor;
        uint32 Cruor = 0; // Need to work out how to do cruor chains, until then no cruor will drop unless this line is customized for non retail play.

        if (TextID == 0)
        {
            ShowWarning(CL_YELLOW"Failed to fetch Cruor Message ID for zone: %i\n" CL_RESET, Pzone);
        }

        if (Cruor >= 1)
        {
            PChar->pushPacket(new CMessageSpecialPacket(PChar, TextID, Cruor, Total, 0, 0));
            PChar->m_currency.cruor += Cruor;
        }
    }

    // Player levels up
    if ((currentExp + exp) >= GetExpNEXTLevel(PChar->jobs.job[PChar->GetMJob()]) && onLimitMode == false)
    {
        if (PChar->jobs.job[PChar->GetMJob()] >= PChar->jobs.genkai)
        {
            PChar->jobs.exp[PChar->GetMJob()]  = GetExpNEXTLevel(PChar->jobs.job[PChar->GetMJob()]) - 1;
            if (PChar->PParty && PChar->PParty->GetSyncTarget() == PChar)
            {
                PChar->PParty->SetSyncTarget(NULL,556);
            }
        }
        else
        {
            PChar->jobs.exp[PChar->GetMJob()] -= GetExpNEXTLevel(PChar->jobs.job[PChar->GetMJob()]);
            if (PChar->jobs.exp[PChar->GetMJob()] >= GetExpNEXTLevel(PChar->jobs.job[PChar->GetMJob()]+1))
            {
                PChar->jobs.exp[PChar->GetMJob()] = GetExpNEXTLevel(PChar->jobs.job[PChar->GetMJob()] + 1) - 1;
            }
            PChar->jobs.job[PChar->GetMJob()] += 1;

            if (PChar->m_LevelRestriction == 0 ||
                PChar->m_LevelRestriction > PChar->GetMLevel())
            {
                PChar->SetMLevel(PChar->jobs.job[PChar->GetMJob()]);
                PChar->SetSLevel(PChar->jobs.job[PChar->GetSJob()]);

                BuildingCharSkillsTable(PChar);
                CalculateStats(PChar);
                BuildingCharAbilityTable(PChar);
                BuildingCharTraitsTable(PChar);
                BuildingCharWeaponSkills(PChar);
                if (PChar->PAutomaton != NULL && PChar->PAutomaton != PChar->PPet)
                {
                    puppetutils::LoadAutomatonStats(PChar);
                }
            }
			PChar->PLatentEffectContainer->CheckLatentsJobLevel();
            PChar->UpdateHealth();

            PChar->health.hp = PChar->GetMaxHP();
            PChar->health.mp = PChar->GetMaxMP();

            SaveCharStats(PChar);
            SaveCharJob(PChar, PChar->GetMJob());
            SaveCharExp(PChar, PChar->GetMJob());
			SaveCharPoints(PChar);

            PChar->pushPacket(new CCharJobsPacket(PChar));
            PChar->pushPacket(new CCharUpdatePacket(PChar));
            PChar->pushPacket(new CCharSkillsPacket(PChar));
            PChar->pushPacket(new CCharAbilitiesPacket(PChar));
            PChar->pushPacket(new CMenuMeritPacket(PChar));
            PChar->pushPacket(new CCharJobExtraPacket(PChar, true));
            PChar->pushPacket(new CCharJobExtraPacket(PChar, true));
            PChar->pushPacket(new CCharSyncPacket(PChar));

            PChar->loc.zone->PushPacket(PChar, CHAR_INRANGE_SELF, new CMessageDebugPacket(PChar, PMob, PChar->jobs.job[PChar->GetMJob()], 0, 9));
			PChar->pushPacket(new CCharStatsPacket(PChar));

            if (PChar->PParty != NULL)
            {
                if (PChar->PParty->GetSyncTarget() == PChar)
                {
                    PChar->PParty->RefreshSync();
                }
            }
			return;
        }
    }

	SaveCharStats(PChar);
    SaveCharJob(PChar, PChar->GetMJob());
    SaveCharExp(PChar, PChar->GetMJob());
	SaveCharPoints(PChar);
    PChar->pushPacket(new CCharStatsPacket(PChar));

	if(onLimitMode)
	{
		PChar->pushPacket(new CMenuMeritPacket(PChar));
	}
}

/************************************************************************
*																		*
*  Устанавливаем ограничение уровня персонажа							*
*																		*
************************************************************************/

void SetLevelRestriction(CCharEntity* PChar, uint8 lvl)
{

}


/************************************************************************
*																		*
*  save char unlocked weapons											*
*																		*
************************************************************************/

void SaveCharUnlockedWeapons(CCharEntity* PChar)
{
	const int8* Query =  "UPDATE chars SET unlocked_weapons = '%s' WHERE charid = %u";

	int8 points[MAX_UNLOCKABLE_WEAPONS*2+1];
    int8 UnlockedWeapons[MAX_UNLOCKABLE_WEAPONS];

    for (uint16 i = 0; i < MAX_UNLOCKABLE_WEAPONS; ++i)
    {
		UnlockedWeapons[i] = PChar->unlockedWeapons[i].unlocked;
    }

	Sql_EscapeStringLen(SqlHandle, points, (const int8*)UnlockedWeapons, MAX_UNLOCKABLE_WEAPONS);
	Sql_Query(SqlHandle, Query, points, PChar->id);

}


/************************************************************************
*																		*
*  load char unlocked weapons											*
*																		*
************************************************************************/

void LoadCharUnlockedWeapons(CCharEntity* PChar)
{
	memcpy(PChar->unlockedWeapons, nameSpaceUnlockableWeapons::g_pWeaponUnlockable, sizeof(PChar->unlockedWeapons));

    const int8* Query = "SELECT unlocked_weapons FROM chars WHERE charid = %u";

	if (Sql_Query(SqlHandle, Query, PChar->id) != SQL_ERROR && Sql_NumRows(SqlHandle) != 0 && Sql_NextRow(SqlHandle) == SQL_SUCCESS)
	{
		size_t length = 0;
        int8*  unlocked = 0;

        Sql_GetData(SqlHandle, 0, &unlocked, &length);

        if (length == MAX_UNLOCKABLE_WEAPONS)
        {
			for (uint16 i = 0; i < MAX_UNLOCKABLE_WEAPONS; ++i)
		    {
				PChar->unlockedWeapons[i].unlocked = unlocked[i];
            }
        }

		loadCharWsPoints(PChar);
	}

}


/************************************************************************
*																		*
*  Сохраняем позицию													*
*																		*
************************************************************************/

void SaveCharPosition(CCharEntity* PChar)
{
	const int8* Query =
        "UPDATE chars "
        "SET "
          "pos_zone = %u,"
          "pos_prevzone = %u,"
          "pos_rot = %u,"
          "pos_x = %.3f,"
          "pos_y = %.3f,"
          "pos_z = %.3f,"
          "boundary = %u "
        "WHERE charid = %u;";

    Sql_Query(SqlHandle, Query,
        PChar->getZone(),
        PChar->loc.prevzone,
        PChar->loc.p.rotation,
        PChar->loc.p.x,
        PChar->loc.p.y,
		PChar->loc.p.z,
        PChar->loc.boundary,
        PChar->id);
}

/************************************************************************
*																		*
*  Сохраняем список квестов												*
*																		*
************************************************************************/

void SaveQuestsList(CCharEntity* PChar)
{
	const int8* Query =
        "UPDATE chars "
        "SET "
          "quests = '%s' "
        "WHERE charid = %u;";

	int8 questslist[sizeof(PChar->m_questLog)*2+1];
	Sql_EscapeStringLen(SqlHandle,questslist,(const int8*)PChar->m_questLog,sizeof(PChar->m_questLog));

	Sql_Query(SqlHandle, Query,
        questslist,
        PChar->id);
}

/************************************************************************
*																		*
*  Сохраняем список квестов												*
*																		*
************************************************************************/

void SaveFame(CCharEntity* PChar)
{
	const int8* Query =
        "UPDATE char_profile "
        "SET "
          "fame_sandoria = %u,"
          "fame_bastok = %u,"
          "fame_windurst = %u,"
          "fame_norg = %u,"
          "fame_jeuno = %u "
        "WHERE charid = %u;";

	Sql_Query(SqlHandle, Query,
        PChar->profile.fame[0],
        PChar->profile.fame[1],
        PChar->profile.fame[2],
        PChar->profile.fame[3],
        PChar->profile.fame[4],
        PChar->id);
}


/************************************************************************
*																		*
*  Save Character Missions												*
*																		*
************************************************************************/

void SaveMissionsList(CCharEntity* PChar)
{
	const int8* Query =
        "UPDATE chars "
        "LEFT JOIN char_profile USING(charid) "
        "SET "
          "missions = '%s',"
          "rank_points = %u,"
          "rank_sandoria = %u,"
          "rank_bastok = %u,"
          "rank_windurst = %u "
        "WHERE charid = %u;";

	int8 missionslist[sizeof(PChar->m_missionLog)*2+1];
	Sql_EscapeStringLen(SqlHandle,missionslist,(const int8*)PChar->m_missionLog,sizeof(PChar->m_missionLog));

	Sql_Query(SqlHandle,Query,
        missionslist,
        PChar->profile.rankpoints,
		PChar->profile.rank[0],
        PChar->profile.rank[1],
        PChar->profile.rank[2],
        PChar->id);
}

/************************************************************************
*																		*
*  Cохраняем список колючевых предметов									*
*																		*
************************************************************************/

void SaveCharInventoryCapacity(CCharEntity* PChar)
{
	const int8* Query =
        "UPDATE char_storage "
        "SET "
          "inventory = %u,"
          "safe = %u,"
          "locker = %u,"
          "satchel = %u,"
          "sack = %u, "
          "`case` = %u "
        "WHERE charid = %u";

	Sql_Query(SqlHandle, Query,
        PChar->getStorage(LOC_INVENTORY)->GetSize(),
        PChar->getStorage(LOC_MOGSAFE)->GetSize(),
        PChar->getStorage(LOC_MOGLOCKER)->GetSize(),
        PChar->getStorage(LOC_MOGSATCHEL)->GetSize(),
		PChar->getStorage(LOC_MOGSACK)->GetSize(),
		PChar->getStorage(LOC_MOGCASE)->GetSize(),
        PChar->id);
}

/************************************************************************
*																		*
*  Cохраняем список колючевых предметов									*
*																		*
************************************************************************/

void SaveKeyItems(CCharEntity* PChar)
{
	const int8* fmtQuery = "UPDATE chars SET keyitems = '%s' WHERE charid = %u;";

	int8 keyitems[sizeof(PChar->keys)*2+1];
	Sql_EscapeStringLen(SqlHandle,keyitems,(const int8*)PChar->keys.keysList,sizeof(PChar->keys));

	Sql_Query(SqlHandle,fmtQuery,keyitems,PChar->id);
}

/************************************************************************
*																		*
*  Сохраняем список выученных заклинаний								*
*																		*
************************************************************************/

void SaveSpells(CCharEntity* PChar)
{
	const int8* Query =
        "UPDATE chars SET "
          "spells = '%s' "
        "WHERE charid = %u;";

	int8 spells[sizeof(PChar->m_SpellList)*2+1];
	Sql_EscapeStringLen(SqlHandle,spells,(const int8*)PChar->m_SpellList,sizeof(PChar->m_SpellList));

	Sql_Query(SqlHandle,Query,
        spells,
        PChar->id);
}


/************************************************************************
*																		*
*  Сохраняем список выученных заклинаний								*
*																		*
************************************************************************/

void SaveLearnedAbilities(CCharEntity* PChar)
{
	const int8* Query =
        "UPDATE chars SET "
          "abilities = '%s' "
        "WHERE charid = %u;";

	int8 abilities[sizeof(PChar->m_LearnedAbilities)*2+1];
	Sql_EscapeStringLen(SqlHandle,abilities,(const int8*)PChar->m_LearnedAbilities,sizeof(PChar->m_LearnedAbilities));

	Sql_Query(SqlHandle,Query,
        abilities,
        PChar->id);
}

/************************************************************************
*                                                                       *
*  Сохраняем список званий                                              *
*                                                                       *
************************************************************************/

void SaveTitles(CCharEntity* PChar)
{
	const int8* Query =
        "UPDATE chars "
        "LEFT JOIN char_stats USING(charid) "
        "SET "
          "titles = '%s',"
          "title = %u "
        "WHERE charid = %u";

	int8 titles[sizeof(PChar->m_TitleList)*2+1];
	Sql_EscapeStringLen(SqlHandle,titles,(const int8*)PChar->m_TitleList,sizeof(PChar->m_TitleList));

    Sql_Query(SqlHandle,Query,
        titles,
        PChar->profile.title,
        PChar->id);
}

/************************************************************************
*																		*
*  Сохраняем список посещенных зон										*
*																		*
************************************************************************/

void SaveZonesVisited(CCharEntity* PChar)
{
	const int8* fmtQuery = "UPDATE chars SET zones = '%s' WHERE charid = %u;";

	int8 zones[sizeof(PChar->m_ZonesList)*2+1];
	Sql_EscapeStringLen(SqlHandle,zones, (const int8*)PChar->m_ZonesList, sizeof(PChar->m_ZonesList));

	Sql_Query(SqlHandle,fmtQuery,zones,PChar->id);
}

/************************************************************************
*																		*
*  Сохраняем экипировку и внешний вид персонажа.						*
*																		*
************************************************************************/

void SaveCharEquip(CCharEntity* PChar)
{
	const int8* Query = "UPDATE char_equip \
						 SET main  = %u, sub   = %u, ranged = %u, ammo = %u, head  = %u, body = %u, \
							 hands = %u, legs  = %u, feet   = %u, neck = %u, waist = %u, ear1 = %u, \
							 ear2  = %u, ring1 = %u, ring2  = %u, back = %u, link  = %u \
						 WHERE charid = %u;";

	Sql_Query(SqlHandle,
        Query,
		PChar->equip[0],
        PChar->equip[1],
        PChar->equip[2],
        PChar->equip[3],
        PChar->equip[4],
        PChar->equip[5],
        PChar->equip[6],
		PChar->equip[7],
        PChar->equip[8],
        PChar->equip[9],
        PChar->equip[10],
        PChar->equip[11],
        PChar->equip[12],
        PChar->equip[13],
		PChar->equip[14],
        PChar->equip[15],
        PChar->equip[16],
        PChar->id);

	Query = "UPDATE char_look \
			 SET head = %u, body = %u, hands = %u, legs = %u, feet = %u, main = %u, sub = %u, ranged = %u \
			 WHERE charid = %u;";

	Sql_Query(SqlHandle,
        Query,
        PChar->look.head,
        PChar->look.body,
        PChar->look.hands,
        PChar->look.legs,
		PChar->look.feet,
        PChar->look.main,
        PChar->look.sub,
        PChar->look.ranged,
        PChar->id);
}

/************************************************************************
*																		*
*  Сохраняем часть текущих характеристик персонажа						*
*																		*
************************************************************************/

void SaveCharStats(CCharEntity* PChar)
{
	const int8* Query = "UPDATE char_stats \
				  		 SET hp = %u, mp = %u, nameflags = %u, mhflag = %u, mjob = %u, sjob = %u \
						 WHERE charid = %u;";

	Sql_Query(SqlHandle,
        Query,
        PChar->health.hp,
        PChar->health.mp,
        PChar->nameflags.flags,
        PChar->profile.mhflag,
        PChar->GetMJob(),
        PChar->GetSJob(),
        PChar->id);
}

/************************************************************************
*																		*
*  Save the char's GM level and nameflags       						*
*																		*
************************************************************************/

void SaveCharGMLevel(CCharEntity* PChar)
{
	const int8* Query = "UPDATE %s SET %s %u WHERE charid = %u;";

	Sql_Query(SqlHandle,Query,"chars","gmlevel =",PChar->m_GMlevel,PChar->id);
	Sql_Query(SqlHandle,Query,"char_stats","nameflags =",PChar->nameflags.flags,PChar->id);
}

/************************************************************************
*																		*
*  Saves character nation changes										*
*																		*
************************************************************************/

void SaveCharNation(CCharEntity* PChar)
{
	const int8* Query =
        "UPDATE chars "
        "SET nation = %u "
        "WHERE charid = %u;";

	Sql_Query(SqlHandle,
        Query,
        PChar->profile.nation,
        PChar->id);
}

/************************************************************************
*																		*
*  Сохраняем текущие уровни профессий персонажа							*
*																		*
************************************************************************/

void SaveCharJob(CCharEntity* PChar, JOBTYPE job)
{
    DSP_DEBUG_BREAK_IF(job == JOB_NON || job >= MAX_JOBTYPE);

    const int8* fmtQuery;

    switch (job)
	{
		case JOB_WAR: fmtQuery = "UPDATE char_jobs SET unlocked = %u, war = %u WHERE charid = %u LIMIT 1"; break;
		case JOB_MNK: fmtQuery = "UPDATE char_jobs SET unlocked = %u, mnk = %u WHERE charid = %u LIMIT 1"; break;
		case JOB_WHM: fmtQuery = "UPDATE char_jobs SET unlocked = %u, whm = %u WHERE charid = %u LIMIT 1"; break;
		case JOB_BLM: fmtQuery = "UPDATE char_jobs SET unlocked = %u, blm = %u WHERE charid = %u LIMIT 1"; break;
		case JOB_RDM: fmtQuery = "UPDATE char_jobs SET unlocked = %u, rdm = %u WHERE charid = %u LIMIT 1"; break;
		case JOB_THF: fmtQuery = "UPDATE char_jobs SET unlocked = %u, thf = %u WHERE charid = %u LIMIT 1"; break;
		case JOB_PLD: fmtQuery = "UPDATE char_jobs SET unlocked = %u, pld = %u WHERE charid = %u LIMIT 1"; break;
		case JOB_DRK: fmtQuery = "UPDATE char_jobs SET unlocked = %u, drk = %u WHERE charid = %u LIMIT 1"; break;
		case JOB_BST: fmtQuery = "UPDATE char_jobs SET unlocked = %u, bst = %u WHERE charid = %u LIMIT 1"; break;
		case JOB_BRD: fmtQuery = "UPDATE char_jobs SET unlocked = %u, brd = %u WHERE charid = %u LIMIT 1"; break;
		case JOB_RNG: fmtQuery = "UPDATE char_jobs SET unlocked = %u, rng = %u WHERE charid = %u LIMIT 1"; break;
		case JOB_SAM: fmtQuery = "UPDATE char_jobs SET unlocked = %u, sam = %u WHERE charid = %u LIMIT 1"; break;
		case JOB_NIN: fmtQuery = "UPDATE char_jobs SET unlocked = %u, nin = %u WHERE charid = %u LIMIT 1"; break;
		case JOB_DRG: fmtQuery = "UPDATE char_jobs SET unlocked = %u, drg = %u WHERE charid = %u LIMIT 1"; break;
		case JOB_SMN: fmtQuery = "UPDATE char_jobs SET unlocked = %u, smn = %u WHERE charid = %u LIMIT 1"; break;
		case JOB_BLU: fmtQuery = "UPDATE char_jobs SET unlocked = %u, blu = %u WHERE charid = %u LIMIT 1"; break;
		case JOB_COR: fmtQuery = "UPDATE char_jobs SET unlocked = %u, cor = %u WHERE charid = %u LIMIT 1"; break;
		case JOB_PUP: fmtQuery = "UPDATE char_jobs SET unlocked = %u, pup = %u WHERE charid = %u LIMIT 1"; break;
		case JOB_DNC: fmtQuery = "UPDATE char_jobs SET unlocked = %u, dnc = %u WHERE charid = %u LIMIT 1"; break;
		case JOB_SCH: fmtQuery = "UPDATE char_jobs SET unlocked = %u, sch = %u WHERE charid = %u LIMIT 1"; break;
        case JOB_GEO: fmtQuery = "UPDATE char_jobs SET unlocked = %u, geo = %u WHERE charid = %u LIMIT 1"; break;
        case JOB_RUN: fmtQuery = "UPDATE char_jobs SET unlocked = %u, run = %u WHERE charid = %u LIMIT 1"; break;
	}
    Sql_Query(SqlHandle, fmtQuery, PChar->jobs.unlocked, PChar->jobs.job[job], PChar->id);

    // Remove the new player flag if we have reached level 10..
    if (PChar->m_isNewPlayer && PChar->jobs.job[job] >= 10)
    {
        PChar->m_isNewPlayer = false;
        Sql_Query(SqlHandle, "UPDATE chars SET isnewplayer = 0 WHERE charid = %u LIMIT 1", PChar->id);
    }
}

/************************************************************************
*																		*
*  Сохраняем текущий опыт персонажа										*
*																		*
************************************************************************/

void SaveCharExp(CCharEntity* PChar, JOBTYPE job)
{
    DSP_DEBUG_BREAK_IF(job == JOB_NON || job >= MAX_JOBTYPE);

	const int8* Query;

    switch (job)
	{
		case JOB_WAR: Query = "UPDATE char_exp SET war = %u, merits = %u, limits = %u WHERE charid = %u"; break;
		case JOB_MNK: Query = "UPDATE char_exp SET mnk = %u, merits = %u, limits = %u WHERE charid = %u"; break;
		case JOB_WHM: Query = "UPDATE char_exp SET whm = %u, merits = %u, limits = %u WHERE charid = %u"; break;
		case JOB_BLM: Query = "UPDATE char_exp SET blm = %u, merits = %u, limits = %u WHERE charid = %u"; break;
		case JOB_RDM: Query = "UPDATE char_exp SET rdm = %u, merits = %u, limits = %u WHERE charid = %u"; break;
		case JOB_THF: Query = "UPDATE char_exp SET thf = %u, merits = %u, limits = %u WHERE charid = %u"; break;
		case JOB_PLD: Query = "UPDATE char_exp SET pld = %u, merits = %u, limits = %u WHERE charid = %u"; break;
		case JOB_DRK: Query = "UPDATE char_exp SET drk = %u, merits = %u, limits = %u WHERE charid = %u"; break;
		case JOB_BST: Query = "UPDATE char_exp SET bst = %u, merits = %u, limits = %u WHERE charid = %u"; break;
		case JOB_BRD: Query = "UPDATE char_exp SET brd = %u, merits = %u, limits = %u WHERE charid = %u"; break;
		case JOB_RNG: Query = "UPDATE char_exp SET rng = %u, merits = %u, limits = %u WHERE charid = %u"; break;
		case JOB_SAM: Query = "UPDATE char_exp SET sam = %u, merits = %u, limits = %u WHERE charid = %u"; break;
		case JOB_NIN: Query = "UPDATE char_exp SET nin = %u, merits = %u, limits = %u WHERE charid = %u"; break;
		case JOB_DRG: Query = "UPDATE char_exp SET drg = %u, merits = %u, limits = %u WHERE charid = %u"; break;
		case JOB_SMN: Query = "UPDATE char_exp SET smn = %u, merits = %u, limits = %u WHERE charid = %u"; break;
		case JOB_BLU: Query = "UPDATE char_exp SET blu = %u, merits = %u, limits = %u WHERE charid = %u"; break;
		case JOB_COR: Query = "UPDATE char_exp SET cor = %u, merits = %u, limits = %u WHERE charid = %u"; break;
		case JOB_PUP: Query = "UPDATE char_exp SET pup = %u, merits = %u, limits = %u WHERE charid = %u"; break;
		case JOB_DNC: Query = "UPDATE char_exp SET dnc = %u, merits = %u, limits = %u WHERE charid = %u"; break;
		case JOB_SCH: Query = "UPDATE char_exp SET sch = %u, merits = %u, limits = %u WHERE charid = %u"; break;
        case JOB_GEO: Query = "UPDATE char_exp SET geo = %u, merits = %u, limits = %u WHERE charid = %u"; break;
        case JOB_RUN: Query = "UPDATE char_exp SET run = %u, merits = %u, limits = %u WHERE charid = %u"; break;
	}
    Sql_Query(SqlHandle, Query,
        PChar->jobs.exp[job],
        PChar->PMeritPoints->GetMeritPoints(),
        PChar->PMeritPoints->GetLimitPoints(),
        PChar->id);
}

/************************************************************************
*																		*
*  Сохраняем значение выбранного умения персонажа						*
*																		*
************************************************************************/

void SaveCharSkills(CCharEntity* PChar, uint8 SkillID)
{
	DSP_DEBUG_BREAK_IF(SkillID >= MAX_SKILLTYPE);

	const int8* Query =
        "INSERT INTO char_skills "
        "SET "
          "charid = %u,"
          "skillid = %u,"
          "value = %u,"
          "rank = %u "
        "ON DUPLICATE KEY UPDATE value = %u, rank = %u;";

	Sql_Query(SqlHandle, Query,
        PChar->id,
        SkillID,
        PChar->RealSkills.skill[SkillID],
        PChar->RealSkills.rank[SkillID],
		PChar->RealSkills.skill[SkillID],
        PChar->RealSkills.rank[SkillID]);
}

/************************************************************************
*																		*
*  Conquest Point / Nation TP, ...										*
*																		*
************************************************************************/

void SaveCharPoints(CCharEntity* PChar)
{
	const int8* Query = "UPDATE char_points \
				  		SET sandoria_cp = %u, bastok_cp = %u, windurst_cp = %u, sandoria_supply = %u, bastok_supply = %u, windurst_supply = %u, \
                            beastman_seal = %u, kindred_seal = %u, kindred_crest = %u, high_kindred_crest = %u, sacred_kindred_crest = %u, \
                            ancient_beastcoin = %u, valor_point = %u, scyld = %u, guild_fishing = %u, guild_woodworking = %u, guild_smithing = %u, \
                            guild_goldsmithing = %u, guild_weaving = %u, guild_leathercraft = %u, guild_bonecraft = %u, guild_alchemy = %u, \
                            guild_cooking = %u, cinder = %u, fire_fewell = %u, ice_fewell = %u, wind_fewell = %u, earth_fewell = %u, \
                            lightning_fewell = %u, water_fewell = %u, light_fewell = %u, dark_fewell = %u, ballista_point = %u, fellow_point = %u, \
                            chocobuck_sandoria = %u, chocobuck_bastok = %u, chocobuck_windurst = %u, research_mark = %u, tunnel_worm = %u, \
                            morion_worm = %u, phantom_worm = %u, moblin_marble = %u, infamy = %u, prestige = %u, legion_point = %u, \
                            spark_of_eminence = %u, shining_star = %u, imperial_standing = %u, runic_portal = %u, leujaoam_assault_point = %u, \
                            mamool_assault_point = %u, lebros_assault_point = %u, periqia_assault_point = %u, ilrusi_assault_point = %u, \
							nyzul_isle_assault_point = %u, zeni_point = %u, jetton = %u, therion_ichor = %u, maw = %u, past_sandoria_tp = %u, \
							past_bastok_tp = %u, past_windurst_tp = %u, allied_notes = %u, bayld = %u, kinetic_unit = %u, obsidian_fragment = %u, \
                            lebondopt_wing = %u, pulchridopt_wing = %u, mweya_plasm = %u, cruor = %u, resistance_credit = %u, dominion_note = %u, \
                            fifth_echelon_trophy = %u, fourth_echelon_trophy = %u, third_echelon_trophy = %u, second_echelon_trophy = %u, \
                            first_echelon_trophy = %u, cave_points = %u, id_tags = %u, op_credits = %u, traverser_stones = %u, voidstones = %u, \
                            kupofried_corundums = %u, imprimaturs = %u, pheromone_sacks = %u \
						WHERE charid = %u;";

	Sql_Query(SqlHandle,
        Query,
        PChar->m_currency.sandoriacp,
        PChar->m_currency.bastokcp,
        PChar->m_currency.windurstcp,
        PChar->nationtp.sandoria,
		PChar->nationtp.bastok,
		PChar->nationtp.windurst,
        PChar->m_currency.beastmanseal,
        PChar->m_currency.kindredseal,
        PChar->m_currency.kindredcrest,
        PChar->m_currency.hkindredcrest,
        PChar->m_currency.skindredcrest,
        PChar->m_currency.ancientbeastcoins,
        PChar->m_currency.valorpoints,
        PChar->m_currency.scylds,
        PChar->m_currency.fishingpoints,
        PChar->m_currency.woodworkingpoints,
        PChar->m_currency.smithingpoints,
        PChar->m_currency.goldsmithingpoints,
        PChar->m_currency.weavingpoints,
        PChar->m_currency.leatherpoints,
        PChar->m_currency.bonepoints,
        PChar->m_currency.alchemypoints,
        PChar->m_currency.cookingpoints,
        PChar->m_currency.cinders,
        PChar->m_currency.firefewell,
        PChar->m_currency.icefewell,
        PChar->m_currency.windfewell,
        PChar->m_currency.earthfewell,
        PChar->m_currency.lightningfewell,
        PChar->m_currency.waterfewell,
        PChar->m_currency.lightfewell,
        PChar->m_currency.darkfewell,
        PChar->m_currency.ballistapoints,
        PChar->m_currency.fellowpoints,
        PChar->m_currency.chocobuckssandoria,
        PChar->m_currency.chocobucksbastok,
        PChar->m_currency.chocobuckswindurst,
        PChar->m_currency.researchmarks,
        PChar->m_currency.tunnelworms,
        PChar->m_currency.morionworms,
        PChar->m_currency.phantomworms,
        PChar->m_currency.moblinmarbles,
        PChar->m_currency.infamy,
        PChar->m_currency.prestige,
        PChar->m_currency.legionpoints,
        PChar->m_currency.sparksofeminence,
        PChar->m_currency.shiningstars,
		PChar->m_currency.imperialstanding,
		PChar->nationtp.ahturhgan,
        PChar->m_currency.lsanctumassault,
        PChar->m_currency.mjtgassault,
        PChar->m_currency.lcavernassault,
        PChar->m_currency.periqiaassault,
        PChar->m_currency.ilrusiatollassault,
        PChar->m_currency.nyzultokens,
        PChar->m_currency.zeni,
        PChar->m_currency.jettons,
        PChar->m_currency.therionichor,
		PChar->nationtp.maw,
		PChar->nationtp.pastsandoria,
		PChar->nationtp.pastbastok,
		PChar->nationtp.pastwindurst,
        PChar->m_currency.alliednotes,
        PChar->m_currency.bayld,
        PChar->m_currency.kineticunits,
        PChar->m_currency.obsidianfragments,
        PChar->m_currency.lebondoptwings,
		PChar->m_currency.pulchridoptwings,
        PChar->m_currency.mweyaplasm,
        PChar->m_currency.cruor,
        PChar->m_currency.resistancecredits,
        PChar->m_currency.dominionnotes,
        PChar->m_currency.fifthechtrophies,
        PChar->m_currency.fourthechtrophies,
        PChar->m_currency.thirdechtrophies,
        PChar->m_currency.secondechtrophies,
        PChar->m_currency.firstechtrophies,
        PChar->m_currency.cavepoints,
        PChar->m_currency.idtags,
        PChar->m_currency.opcredits,
        PChar->m_currency.traverserstones,
        PChar->m_currency.voidstones,
        PChar->m_currency.kupofriedcorundums,
        PChar->m_currency.imprimaturs,
        PChar->m_currency.pheromonesacks,
		PChar->id);
}

uint32  AddExpBonus(CCharEntity* PChar, uint32 exp)
{
    int32 bonus = 0;
    if (PChar->StatusEffectContainer->GetStatusEffect(EFFECT_DEDICATION))
    {
    	CStatusEffect* dedication = PChar->StatusEffectContainer->GetStatusEffect(EFFECT_DEDICATION);
    	int16 percentage = dedication->GetPower();
    	int16 cap = dedication->GetSubPower();
    	bonus += dsp_cap((exp * percentage)/100, 0, cap);
    	dedication->SetSubPower(cap -= bonus);

        if (cap <= 0)
        {
            PChar->StatusEffectContainer->DelStatusEffect(EFFECT_DEDICATION);
        }

    }

    bonus += exp * (PChar->getMod(MOD_EXP_BONUS) / 100.0f);

    if (bonus + (int32)exp < 0)
        exp = 0;
    else
        exp = exp + bonus;

    return exp;
}

void ResetAllTwoHours()
{
    Sql_Query(SqlHandle, "UPDATE char_stats SET 2h = 0");
}

bool hasMogLockerAccess(CCharEntity* PChar) {
	int8 fmtQuery[] = "SELECT value FROM char_vars WHERE charid = %u AND varname = '%s' ";
	int32 ret = Sql_Query(SqlHandle,fmtQuery, PChar->id, "mog-locker-expiry-timestamp");

	if(Sql_NextRow(SqlHandle) == SQL_SUCCESS)
	{
		int32 tstamp  = (int32)Sql_GetIntData(SqlHandle,0);
		if (CVanaTime::getInstance()->getVanaTime() < tstamp) {
			return true;
		}
	}
	return false;
}

/************************************************************************
*                                                                       *
*                                                                       *
*                                                                       *
************************************************************************/

uint8 AvatarPerpetuationReduction(CCharEntity* PChar)
{
	uint8 reduction = PChar->getMod(MOD_PERPETUATION_REDUCTION);

	static const MODIFIER strong[8] = {
        MOD_FIRE_AFFINITY,
        MOD_EARTH_AFFINITY,
        MOD_WATER_AFFINITY,
        MOD_WIND_AFFINITY,
        MOD_ICE_AFFINITY,
        MOD_THUNDER_AFFINITY,
        MOD_LIGHT_AFFINITY,
        MOD_DARK_AFFINITY};

	static const MODIFIER weak[8] = {
        MOD_WATER_AFFINITY,
        MOD_WIND_AFFINITY,
        MOD_THUNDER_AFFINITY,
        MOD_ICE_AFFINITY,
        MOD_FIRE_AFFINITY,
        MOD_EARTH_AFFINITY,
        MOD_DARK_AFFINITY,
        MOD_LIGHT_AFFINITY};

    static const WEATHER weatherStrong[8] = {
        WEATHER_HOT_SPELL,
        WEATHER_DUST_STORM,
        WEATHER_RAIN,
        WEATHER_WIND,
        WEATHER_SNOW,
        WEATHER_THUNDER,
        WEATHER_AURORAS,
        WEATHER_GLOOM};

	uint8 element = ((CPetEntity*)(PChar->PPet))->m_Element - 1;

    DSP_DEBUG_BREAK_IF(element > 7);

	int8 affinity = PChar->getMod(strong[element]);

    // TODO: don't use ItemIDs in CORE. it must be MOD

    CItemWeapon* mainHand = (CItemWeapon*)PChar->getEquip(SLOT_MAIN);

	if( mainHand && mainHand->getID() == 18632 )
		affinity = affinity + 1;
	else if( mainHand && mainHand->getID() == 18633 )
		affinity = affinity + 2;

    //-----------------------------------------------

	if( affinity > 0 )
		reduction = reduction + affinity + 1;
	else if( affinity < 0 )
		reduction = reduction - affinity - 1;

	if( CVanaTime::getInstance()->getWeekday() == element )
		reduction = reduction + PChar->getMod(MOD_DAY_REDUCTION);

	WEATHER weather = battleutils::GetWeather(PChar,false);

	if( weather == weatherStrong[element] || weather == weatherStrong[element]+1 )
		reduction = reduction + PChar->getMod(MOD_WEATHER_REDUCTION);

	return reduction;
}

/************************************************************************
*																		*
*  get player weapon points	for 1 weapon								*
*																		*
************************************************************************/

void loadCharWsPoints(CCharEntity* PChar)
{
	int8 fmtQuery[] = "SELECT itemindex, points "
					 "FROM char_weapon_skill_points "
					 "WHERE charid = %u "
					 "ORDER BY itemindex ASC;";

	int32 ret = Sql_Query(SqlHandle,fmtQuery, PChar->id);

	uint8 index = 0;

	while(Sql_NextRow(SqlHandle) == SQL_SUCCESS)
	{
		index  = (uint16)Sql_GetUIntData(SqlHandle,0)-1;

        if(index < MAX_UNLOCKABLE_WEAPONS && index >= 0){
    		PChar->unlockedWeapons[index].points = (uint16)Sql_GetUIntData(SqlHandle,1);
        } else {
            ShowWarning("charutils::loadCharWsPoints Warning bad index from database. Index = %d", index);
        }
	}

}

/************************************************************************
*																		*
*  set char weapon points, set to zero to delete						*
*																		*
************************************************************************/

void saveCharWsPoints(CCharEntity* PChar, uint16 indexid, int32 points)
{
	DSP_DEBUG_BREAK_IF(indexid > MAX_UNLOCKABLE_WEAPONS);
	if (points == 0)
	{
		Sql_Query(SqlHandle,"DELETE FROM char_weapon_skill_points WHERE itemindex = %u AND charid = '%u' LIMIT 1;", indexid+1, PChar->id);
		return;
	}

	const int8* fmtQuery = "INSERT INTO char_weapon_skill_points SET itemindex = %u, charid = %u, points = %u ON DUPLICATE KEY UPDATE points = %u;";

	Sql_Query(SqlHandle,fmtQuery, indexid+1, PChar->id, points, points);
}

/************************************************************************
*																		*
*  Record now as when the character has died and save it to the db.		*
*																		*
************************************************************************/

void SaveDeathTime(CCharEntity* PChar)
{
    uint32 currentTime = (uint32)time(NULL);
    PChar->m_DeathCounter += (currentTime - PChar->m_DeathTimestamp);
    PChar->m_DeathTimestamp = currentTime;

    const int8* fmtQuery = "UPDATE char_stats SET death = %u WHERE charid = %u LIMIT 1;";
    Sql_Query(SqlHandle, fmtQuery, PChar->m_DeathCounter, PChar->id);
}

void SavePlayTime(CCharEntity* PChar)
{
	Sql_Query(SqlHandle, "UPDATE chars SET playtime = '%u' WHERE charid = '%u' LIMIT 1;", PChar->GetPlayTime(), PChar->id);
}

/************************************************************************
*																		*
*  Checks which UnarmedItem to grant when SLOT_MAIN is empty.			*
*																		*
************************************************************************/

void CheckUnarmedWeapon(CCharEntity* PChar)
{
	CItem* PSubslot = PChar->getEquip(SLOT_SUB);

	// Main or sub job provides H2H skill, and sub slot is empty.
	if ((battleutils::GetSkillRank(SKILL_H2H,PChar->GetMJob()) > 0 || battleutils::GetSkillRank(SKILL_H2H,PChar->GetSJob()) > 0) &&
		(!PSubslot || !PSubslot->isType(ITEM_ARMOR)))
	{
		PChar->m_Weapons[SLOT_MAIN] = itemutils::GetUnarmedH2HItem();
		PChar->look.main = 21;											// The secret to H2H animations.  setModelId for UnarmedH2H didn't work.
	} else {
		PChar->m_Weapons[SLOT_MAIN] = itemutils::GetUnarmedItem();
		PChar->look.main = 0;
	}
	BuildingCharWeaponSkills(PChar);
}

/************************************************************************
*																		*
*  Opens the characters send box                            			*
*																		*
************************************************************************/

void OpenSendBox(CCharEntity* PChar)
{
    PChar->UContainer->Clean();
    PChar->UContainer->SetType(UCONTAINER_DELIVERYBOX);

	const int8* fmtQuery = "SELECT itemid, itemsubid, slot, quantity, sender, charname \
                            FROM delivery_box \
							WHERE senderid = %u \
                            AND box = 2 \
                            AND slot < 8 \
                            AND sent = 1 \
							ORDER BY slot;";

	int32 ret = Sql_Query(SqlHandle, fmtQuery, PChar->id);

	if (ret != SQL_ERROR)
	{
        if (Sql_NumRows(SqlHandle) != 0)
        {
		    while(Sql_NextRow(SqlHandle) == SQL_SUCCESS)
		    {
                CItem* PItem = itemutils::GetItem(Sql_GetIntData(SqlHandle,0));

                if(PItem != NULL) // Prevent an access violation in the event that an item doesn't exist for an ID
                {
                    PItem->setSubID(Sql_GetIntData(SqlHandle,1));
                    PItem->setSlotID(Sql_GetIntData(SqlHandle,2));
                    PItem->setQuantity(Sql_GetUIntData(SqlHandle,3));
                    PItem->setSender(Sql_GetData(SqlHandle,4));
                    PItem->setReceiver(Sql_GetData(SqlHandle,5));
                    PItem->setSent(true);
                    PChar->UContainer->SetItem(PItem->getSlotID(), PItem);
                }
            }
		}
    }
	PChar->pushPacket(new CSendBoxPacket(0x0D, 0, 0x01));
    return;
}

/************************************************************************
*																		*
*  Recovers items that were inserted into send box but were not			*
*  successfully delivered or retrieved                                  *
*																		*
************************************************************************/

void RecoverFailedSendBox(CCharEntity* PChar)
{
	const int8* fmtQuery = "SELECT itemid, quantity \
                            FROM delivery_box \
							WHERE senderid = %u \
                            AND box = 2 \
                            AND slot < 8 \
                            AND sent = 0 \
							ORDER BY slot;";

	int32 ret = Sql_Query(SqlHandle, fmtQuery, PChar->id);

    if (ret != SQL_ERROR && Sql_NumRows(SqlHandle) > 0)
    {
        while (Sql_NextRow(SqlHandle) == SQL_SUCCESS)
        {
            uint8 loc = PChar->getStorage(LOC_INVENTORY)->SearchItemWithSpace(Sql_GetIntData(SqlHandle,0), Sql_GetIntData(SqlHandle,1));
            if(loc != ERROR_SLOTID)
            {
                UpdateItem(PChar, LOC_INVENTORY, loc, Sql_GetIntData(SqlHandle,1));
            }
            else
            {
                uint8 add = AddItem(PChar, LOC_INVENTORY, Sql_GetIntData(SqlHandle,0), Sql_GetIntData(SqlHandle,1), true);
                DSP_DEBUG_BREAK_IF(add == ERROR_SLOTID);
            }
        }
        fmtQuery = "DELETE FROM delivery_box \
							WHERE senderid = %u \
                            AND box = 2 \
                            AND slot < 8 \
                            AND sent = 0 \
							ORDER BY slot;";
        ret = Sql_Query(SqlHandle, fmtQuery, PChar->id);
        DSP_DEBUG_BREAK_IF(ret == SQL_ERROR);
    }
}

bool CheckAbilityAddtype(CCharEntity* PChar, CAbility* PAbility)
{
    if (PAbility->getAddType() & ADDTYPE_MERIT)
    {
        if (!(PChar->PMeritPoints->GetMerit((MERIT_TYPE)PAbility->getMeritModID())->count > 0))
        {
            return false;
        }
    }
    if (PAbility->getAddType() & ADDTYPE_ASTRAL_FLOW)
    {
        if (!PChar->StatusEffectContainer->HasStatusEffect(EFFECT_ASTRAL_FLOW))
        {
            return false;
        }
    }
    if (PAbility->getAddType() & ADDTYPE_LEARNED)
    {
        if(!hasLearnedAbility(PChar, PAbility->getID()))
        {
            return false;
        }
    }
    if (PAbility->getAddType() & ADDTYPE_LIGHT_ARTS)
    {
        if(!PChar->StatusEffectContainer->HasStatusEffect(EFFECT_LIGHT_ARTS) && !PChar->StatusEffectContainer->HasStatusEffect(EFFECT_ADDENDUM_WHITE))
        {
            return false;
        }
    }
    if (PAbility->getAddType() & ADDTYPE_DARK_ARTS)
    {
        if(!PChar->StatusEffectContainer->HasStatusEffect(EFFECT_DARK_ARTS) && !PChar->StatusEffectContainer->HasStatusEffect(EFFECT_ADDENDUM_BLACK))
        {
            return false;
        }
    }
    return true;
}

void RemoveStratagems(CCharEntity* PChar, CSpell* PSpell)
{
    if (PSpell->getSpellGroup() == SPELLGROUP_WHITE)
    {
        //rapture to be deleted in applicable scripts
        PChar->StatusEffectContainer->DelStatusEffect(EFFECT_PENURY);
        PChar->StatusEffectContainer->DelStatusEffect(EFFECT_CELERITY);
        PChar->StatusEffectContainer->DelStatusEffect(EFFECT_ENLIGHTENMENT);
        PChar->StatusEffectContainer->DelStatusEffect(EFFECT_ALTRUISM);
        PChar->StatusEffectContainer->DelStatusEffect(EFFECT_TRANQUILITY);
        if (PSpell->getAOE() == SPELLAOE_RADIAL_ACCE)
        {
            PChar->StatusEffectContainer->DelStatusEffect(EFFECT_ACCESSION);
        }
    }
    else if (PSpell->getSpellGroup() == SPELLGROUP_BLACK)
    {
        //ebullience to be deleted in applicable scripts
        PChar->StatusEffectContainer->DelStatusEffect(EFFECT_PARSIMONY);
        PChar->StatusEffectContainer->DelStatusEffect(EFFECT_ALACRITY);
        PChar->StatusEffectContainer->DelStatusEffect(EFFECT_ENLIGHTENMENT);
        PChar->StatusEffectContainer->DelStatusEffect(EFFECT_FOCALIZATION);
        PChar->StatusEffectContainer->DelStatusEffect(EFFECT_EQUANIMITY);
        if (PSpell->getAOE() == SPELLAOE_RADIAL_MANI)
        {
            PChar->StatusEffectContainer->DelStatusEffect(EFFECT_MANIFESTATION);
        }
    }
}

void RemoveAllEquipMods(CCharEntity* PChar)
{
    for(uint8 slotID = 0; slotID < 16; ++slotID)
    {
        CItemArmor* PItem = PChar->getEquip((SLOTTYPE)slotID);
        if (PItem)
        {
            PChar->delEquipModifiers(&PItem->modList, PItem->getReqLvl(), slotID);
            if (PItem->getReqLvl() <= PChar->GetMLevel())
            {
                PChar->PLatentEffectContainer->DelLatentEffects(PItem->getReqLvl(), slotID);
                PChar->PLatentEffectContainer->CheckLatentsEquip(slotID);
            }
        }
    }
}

void ApplyAllEquipMods(CCharEntity* PChar)
{
    for(uint8 slotID = 0; slotID < 16; ++slotID)
    {
        CItemArmor* PItem = (CItemArmor*)PChar->getEquip((SLOTTYPE)slotID);
        if (PItem)
        {
            PChar->addEquipModifiers(&PItem->modList, PItem->getReqLvl(), slotID);
            if (PItem->getReqLvl() <= PChar->GetMLevel())
            {
                PChar->PLatentEffectContainer->AddLatentEffects(&PItem->latentList, PItem->getReqLvl(), slotID);
				PChar->PLatentEffectContainer->CheckLatentsEquip(slotID);
            }
        }
    }
}

void ClearTempItems(CCharEntity* PChar)
{
	CItemContainer* Temp = PChar->getStorage(LOC_TEMPITEMS);

	const int8* Query = "DELETE FROM char_inventory WHERE charid = %u AND location = 3;";

	if (Sql_Query(SqlHandle, Query, PChar->id) != SQL_ERROR)
	{
		Temp->Clear();
	}
}

}; // namespace charutils
