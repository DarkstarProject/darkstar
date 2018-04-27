﻿/*
===========================================================================

Copyright (c) 2010-2015 Darkstar Dev Teams

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
#include "../../common/timer.h"
#include "../../common/utils.h"

#include <math.h>
#include <stdio.h>
#include <string.h>
#include <array>

#include "../lua/luautils.h"

#include "../ai/ai_container.h"
#include "../ai/states/attack_state.h"
#include "../ai/states/item_state.h"

#include "../packets/char_abilities.h"
#include "../packets/char_appearance.h"
#include "../packets/char_equip.h"
#include "../packets/char_jobs.h"
#include "../packets/char_job_extra.h"
#include "../packets/char_health.h"
#include "../packets/char_recast.h"
#include "../packets/char_skills.h"
#include "../packets/char_stats.h"
#include "../packets/char_sync.h"
#include "../packets/char_update.h"
#include "../packets/conquest_map.h"
#include "../packets/delivery_box.h"
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
#include "../packets/quest_mission_log.h"
#include "../packets/server_ip.h"

#include "../ability.h"
#include "../alliance.h"
#include "../grades.h"
#include "../conquest_system.h"
#include "../map.h"
#include "../spell.h"
#include "../trait.h"
#include "../vana_time.h"
#include "../weapon_skill.h"
#include "../item_container.h"
#include "../recast_container.h"
#include "../status_effect_container.h"
#include "../linkshell.h"
#include "../universal_container.h"
#include "../latent_effect_container.h"
#include "../treasure_pool.h"
#include "../mob_modifier.h"

#include "../entities/charentity.h"
#include "../entities/petentity.h"
#include "../entities/mobentity.h"
#include "../entities/automatonentity.h"

#include "battleutils.h"
#include "charutils.h"
#include "itemutils.h"
#include "blueutils.h"
#include "puppetutils.h"
#include "petutils.h"
#include "zoneutils.h"

/************************************************************************
*                                                                       *
*  Таблицы получаемого опыта                                            *
*                                                                       *
************************************************************************/

std::array<std::array<uint16, 20>, 50> g_ExpTable;
std::array<uint16, 100> g_ExpPerLevel;

/************************************************************************
*                                                                       *
*                                                                       *
*                                                                       *
************************************************************************/

namespace charutils
{

    /************************************************************************
    *                                                                       *
    *  Расчет характеристик персонажей                                      *
    *                                                                       *
    ************************************************************************/

    void CalculateStats(CCharEntity* PChar)
    {
        // Объявление переменных, нужных для рассчета.

        float raceStat = 0;         // конечное число HP для уровня на основе расы.
        float jobStat = 0;          // конечное число HP для уровня на основе первичной профессии.
        float sJobStat = 0;         // коенчное число HP для уровня на основе вторичной профессии.
        int32 bonusStat = 0;            // бонусное число HP которое добавляется при соблюдении некоторых условий.

        int32 baseValueColumn = 0;  // номер колонки с базовым количеством HP
        int32 scaleTo60Column = 1;  // номер колонки с модификатором до 60 уровня
        int32 scaleOver30Column = 2;    // номер колонки с модификатором после 30 уровня
        int32 scaleOver60Column = 3;    // номер колонки с модификатором после 60 уровня
        int32 scaleOver75Column = 4;    // номер колонки с модификатором после 75 уровня
        int32 scaleOver60 = 2;          // номер колонки с модификатором для расчета MP после 60 уровня
        int32 scaleOver75 = 3;          // номер колонки с модификатором для расчета Статов после 75-го уровня

        uint8 grade;

        uint8 mlvl = PChar->GetMLevel();
        uint8 slvl = PChar->GetSLevel();
        JOBTYPE mjob = PChar->GetMJob();
        JOBTYPE sjob = PChar->GetSJob();
        MERIT_TYPE statMerit[] = {MERIT_STR, MERIT_DEX, MERIT_VIT, MERIT_AGI, MERIT_INT, MERIT_MND, MERIT_CHR};

        uint8 race = 0;                 //Human

        switch (PChar->look.race)
        {
            case 3:
            case 4: race = 1; break;    //Elvaan
            case 5:
            case 6: race = 2; break;    //Tarutaru
            case 7: race = 3; break;    //Mithra
            case 8: race = 4; break;    //Galka
        }

        // Расчет прироста HP от main job

        int32 mainLevelOver30 = std::clamp(mlvl - 30, 0, 30);          // Расчет условия +1HP каждый лвл после 30 уровня
        int32 mainLevelUpTo60 = (mlvl < 60 ? mlvl - 1 : 59);        // Первый режим рассчета до 60 уровня (Используется так же и для MP)
        int32 mainLevelOver60To75 = std::clamp(mlvl - 60, 0, 15);      // Второй режим расчета после 60 уровня
        int32 mainLevelOver75 = (mlvl < 75 ? 0 : mlvl - 75);            // Третий режим расчета после 75 уровня

        //Расчет бонусного количества HP

        int32 mainLevelOver10 = (mlvl < 10 ? 0 : mlvl - 10);            // +2HP на каждом уровне после 10
        int32 mainLevelOver50andUnder60 = std::clamp(mlvl - 50, 0, 10);    // +2HP на каждом уровне в промежутке от 50 до 60 уровня
        int32 mainLevelOver60 = (mlvl < 60 ? 0 : mlvl - 60);

        // Расчет прироста HP от дополнительной профессии

        int32 subLevelOver10 = std::clamp(slvl - 10, 0, 20);               // +1HP на каждый уровень после 10 (/2)
        int32 subLevelOver30 = (slvl < 30 ? 0 : slvl - 30);             // +1HP на каждый уровень после 30

        // Расчет raceStat jobStat bonusStat sJobStat
        // Расчет по расе

        grade = grade::GetRaceGrades(race, 0);

        raceStat = grade::GetHPScale(grade, baseValueColumn) +
            (grade::GetHPScale(grade, scaleTo60Column) * mainLevelUpTo60) +
            (grade::GetHPScale(grade, scaleOver30Column) * mainLevelOver30) +
            (grade::GetHPScale(grade, scaleOver60Column) * mainLevelOver60To75) +
            (grade::GetHPScale(grade, scaleOver75Column) * mainLevelOver75);

        // raceStat = (int32)(statScale[grade][baseValueColumn] + statScale[grade][scaleTo60Column] * (mlvl - 1));

        // Расчет по main job
        grade = grade::GetJobGrade(mjob, 0);

        jobStat = grade::GetHPScale(grade, baseValueColumn) +
            (grade::GetHPScale(grade, scaleTo60Column) * mainLevelUpTo60) +
            (grade::GetHPScale(grade, scaleOver30Column) * mainLevelOver30) +
            (grade::GetHPScale(grade, scaleOver60Column) * mainLevelOver60To75) +
            (grade::GetHPScale(grade, scaleOver75Column) * mainLevelOver75);

        // Расчет бонусных HP
        bonusStat = (mainLevelOver10 + mainLevelOver50andUnder60) * 2;

        // Расчет по support job
        if (slvl > 0)
        {
            grade = grade::GetJobGrade(sjob, 0);

            sJobStat = grade::GetHPScale(grade, baseValueColumn) +
                (grade::GetHPScale(grade, scaleTo60Column) * (slvl - 1)) +
                (grade::GetHPScale(grade, scaleOver30Column) * subLevelOver30) +
                subLevelOver30 + subLevelOver10;
            sJobStat = sJobStat / 2;
        }


        uint16 MeritBonus = PChar->PMeritPoints->GetMeritValue(MERIT_MAX_HP, PChar);
        PChar->health.maxhp = (int16)(map_config.player_hp_multiplier * (raceStat + jobStat + bonusStat + sJobStat) + MeritBonus);

        //Начало расчера MP

        raceStat = 0;
        jobStat = 0;
        sJobStat = 0;

        // Расчет MP расе.
        grade = grade::GetRaceGrades(race, 1);

        //Если у main job нет МП рейтинга, расчитиваем расовый бонус на основе уровня subjob уровня(при условии, что у него есть МП рейтинг)
        if (grade::GetJobGrade(mjob, 1) == 0)
        {
            if (grade::GetJobGrade(sjob, 1) != 0 && slvl > 0)                   // В этом выражении ошибка
            {
                raceStat = (grade::GetMPScale(grade, 0) + grade::GetMPScale(grade, scaleTo60Column) * (slvl - 1)) / map_config.sj_mp_divisor;   // Вот здесь ошибка
            }
        }
        else {
            //Расчет нормального расового бонуса
            raceStat = grade::GetMPScale(grade, 0) +
                grade::GetMPScale(grade, scaleTo60Column) * mainLevelUpTo60 +
                grade::GetMPScale(grade, scaleOver60) * mainLevelOver60;
        }

        //Для главной профессии
        grade = grade::GetJobGrade(mjob, 1);
        if (grade > 0)
        {
            jobStat = grade::GetMPScale(grade, 0) +
                grade::GetMPScale(grade, scaleTo60Column) * mainLevelUpTo60 +
                grade::GetMPScale(grade, scaleOver60) * mainLevelOver60;
        }

        //Для дополнительной профессии
        if (slvl > 0)
        {
            grade = grade::GetJobGrade(sjob, 1);
            sJobStat = (grade::GetMPScale(grade, 0) + grade::GetMPScale(grade, scaleTo60Column) * (slvl - 1)) / map_config.sj_mp_divisor;
        }

        MeritBonus = PChar->PMeritPoints->GetMeritValue(MERIT_MAX_MP, PChar);
        PChar->health.maxmp = (int16)(map_config.player_mp_multiplier * (raceStat + jobStat + sJobStat) + MeritBonus); // результат расчета MP

        //Начало расчета характеристик

        uint8 counter = 0;

        for (uint8 StatIndex = 2; StatIndex <= 8; ++StatIndex)
        {
            // расчет по расе
            grade = grade::GetRaceGrades(race, StatIndex);
            raceStat = grade::GetStatScale(grade, 0) + grade::GetStatScale(grade, scaleTo60Column) * mainLevelUpTo60;

            if (mainLevelOver60 > 0)
            {
                raceStat += grade::GetStatScale(grade, scaleOver60) * mainLevelOver60;

                if (mainLevelOver75 > 0)
                {
                    raceStat += grade::GetStatScale(grade, scaleOver75) * mainLevelOver75 - (mlvl >= 75 ? 0.01f : 0);
                }
            }

            // расчет по профессии
            grade = grade::GetJobGrade(mjob, StatIndex);
            jobStat = grade::GetStatScale(grade, 0) + grade::GetStatScale(grade, scaleTo60Column) * mainLevelUpTo60;

            if (mainLevelOver60 > 0)
            {
                jobStat += grade::GetStatScale(grade, scaleOver60) * mainLevelOver60;

                if (mainLevelOver75 > 0)
                {
                    jobStat += grade::GetStatScale(grade, scaleOver75) * mainLevelOver75 - (mlvl >= 75 ? 0.01f : 0);
                }
            }

            // расчет по дополнительной профессии
            if (slvl > 0)
            {
                grade = grade::GetJobGrade(sjob, StatIndex);
                sJobStat = (grade::GetStatScale(grade, 0) + grade::GetStatScale(grade, scaleTo60Column) * (slvl - 1)) / 2;
            }
            else {
                sJobStat = 0;
            }

            // get each merit bonus stat, str,dex,vit and so on...
            MeritBonus = PChar->PMeritPoints->GetMeritValue(statMerit[StatIndex - 2], PChar);

            // Вывод значения
            ref<uint16>(&PChar->stats, counter) = (uint16)(map_config.player_stat_multiplier * (raceStat + jobStat + sJobStat) + MeritBonus);
            counter += 2;
        }
    }

    /************************************************************************
    *                                                                       *
    *  Предварительная версия загрузки персонажа. Функция будет             *
    *  оптимизирована после определения всех необходимых данных и таблиц    *
    *                                                                       *
    ************************************************************************/

    void LoadChar(CCharEntity* PChar)
    {
        uint8 meritPoints = 0;
        uint16 limitPoints = 0;
        int32 HP = 0;
        int32 MP = 0;

        const char* fmtQuery =
            "SELECT "
            "charname,"             //  0
            "pos_zone,"             //  1
            "pos_prevzone,"         //  2
            "pos_rot,"              //  3
            "pos_x,"                //  4
            "pos_y,"                //  5
            "pos_z,"                //  6
            "moghouse,"             //  7
            "boundary,"             //  8
            "home_zone,"            //  9
            "home_rot,"             // 10
            "home_x,"               // 11
            "home_y,"               // 12
            "home_z,"               // 13
            "nation,"               // 14
            "quests,"               // 15
            "keyitems,"             // 16
            "abilities,"            // 17
            "weaponskills,"         // 18
            "titles,"               // 19
            "zones,"                // 20
            "missions,"             // 21
            "assault,"              // 22
            "campaign,"             // 23
            "playtime,"             // 24
            "campaign_allegiance,"  // 25
            "isstylelocked "        // 26
            "FROM chars "
            "WHERE charid = %u";

        int32 ret = Sql_Query(SqlHandle, fmtQuery, PChar->id);

        if (ret != SQL_ERROR &&
            Sql_NumRows(SqlHandle) != 0 &&
            Sql_NextRow(SqlHandle) == SQL_SUCCESS)
        {
            PChar->targid = 0x400;
            PChar->SetName(Sql_GetData(SqlHandle, 0));

            PChar->loc.destination = (uint16)Sql_GetIntData(SqlHandle, 1);
            PChar->loc.prevzone = (uint16)Sql_GetIntData(SqlHandle, 2);
            PChar->loc.p.rotation = (uint8)Sql_GetIntData(SqlHandle, 3);
            PChar->loc.p.x = Sql_GetFloatData(SqlHandle, 4);
            PChar->loc.p.y = Sql_GetFloatData(SqlHandle, 5);
            PChar->loc.p.z = Sql_GetFloatData(SqlHandle, 6);
            PChar->m_moghouseID = Sql_GetIntData(SqlHandle, 7);
            PChar->loc.boundary = (uint16)Sql_GetIntData(SqlHandle, 8);

            PChar->profile.home_point.destination = (uint16)Sql_GetIntData(SqlHandle, 9);
            PChar->profile.home_point.p.rotation = (uint8)Sql_GetIntData(SqlHandle, 10);
            PChar->profile.home_point.p.x = Sql_GetFloatData(SqlHandle, 11);
            PChar->profile.home_point.p.y = Sql_GetFloatData(SqlHandle, 12);
            PChar->profile.home_point.p.z = Sql_GetFloatData(SqlHandle, 13);

            PChar->profile.nation = (uint8)Sql_GetIntData(SqlHandle, 14);

            size_t length = 0;
            char* quests = nullptr;
            Sql_GetData(SqlHandle, 15, &quests, &length);
            memcpy(PChar->m_questLog, quests, (length > sizeof(PChar->m_questLog) ? sizeof(PChar->m_questLog) : length));

            length = 0;
            char* keyitems = nullptr;
            Sql_GetData(SqlHandle, 16, &keyitems, &length);
            memcpy((void*)&PChar->keys, keyitems, (length > sizeof(PChar->keys) ? sizeof(PChar->keys) : length));

            length = 0;
            char* abilities = nullptr;
            Sql_GetData(SqlHandle, 17, &abilities, &length);
            memcpy(PChar->m_LearnedAbilities, abilities, (length > sizeof(PChar->m_LearnedAbilities) ? sizeof(PChar->m_LearnedAbilities) : length));

            length = 0;
            char* weaponskills = nullptr;
            Sql_GetData(SqlHandle, 18, &weaponskills, &length);
            memcpy(&PChar->m_LearnedWeaponskills, weaponskills, (length > sizeof(PChar->m_LearnedWeaponskills) ? sizeof(PChar->m_LearnedWeaponskills) : length));

            length = 0;
            char* titles = nullptr;
            Sql_GetData(SqlHandle, 19, &titles, &length);
            memcpy(PChar->m_TitleList, titles, (length > sizeof(PChar->m_TitleList) ? sizeof(PChar->m_TitleList) : length));

            length = 0;
            char* zones = nullptr;
            Sql_GetData(SqlHandle, 20, &zones, &length);
            memcpy(PChar->m_ZonesList, zones, (length > sizeof(PChar->m_ZonesList) ? sizeof(PChar->m_ZonesList) : length));

            length = 0;
            char* missions = nullptr;
            Sql_GetData(SqlHandle, 21, &missions, &length);
            memcpy(PChar->m_missionLog, missions, (length > sizeof(PChar->m_missionLog) ? sizeof(PChar->m_missionLog) : length));

            length = 0;
            char* assault = nullptr;
            Sql_GetData(SqlHandle, 22, &assault, &length);
            memcpy(&PChar->m_assaultLog, assault, (length > sizeof(PChar->m_assaultLog) ? sizeof(PChar->m_assaultLog) : length));

            length = 0;
            char* campaign = nullptr;
            Sql_GetData(SqlHandle, 23, &campaign, &length);
            memcpy(&PChar->m_campaignLog, campaign, (length > sizeof(PChar->m_campaignLog) ? sizeof(PChar->m_campaignLog) : length));

            PChar->SetPlayTime(Sql_GetUIntData(SqlHandle, 24));
            PChar->profile.campaign_allegiance = (uint8)Sql_GetIntData(SqlHandle, 25);
            PChar->setStyleLocked(Sql_GetIntData(SqlHandle, 26) == 1 ? true : false);
        }

        LoadSpells(PChar);

        fmtQuery =
            "SELECT "
            "rank_points,"          // 0
            "rank_sandoria,"        // 1
            "rank_bastok,"          // 2
            "rank_windurst,"        // 3
            "fame_sandoria,"        // 4
            "fame_bastok,"          // 5
            "fame_windurst,"        // 6
            "fame_norg, "           // 7
            "fame_jeuno, "          // 8
            "fame_aby_konschtat, "  // 9
            "fame_aby_tahrongi, "   // 10
            "fame_aby_latheine, "   // 11
            "fame_aby_misareaux, "  // 12
            "fame_aby_vunkerl, "    // 13
            "fame_aby_attohwa, "    // 14
            "fame_aby_altepa, "     // 15
            "fame_aby_grauberg, "   // 16
            "fame_aby_uleguerand, " // 17
            "fame_adoulin "         // 18
            "FROM char_profile "
            "WHERE charid = %u;";

        ret = Sql_Query(SqlHandle, fmtQuery, PChar->id);

        if (ret != SQL_ERROR &&
            Sql_NumRows(SqlHandle) != 0 &&
            Sql_NextRow(SqlHandle) == SQL_SUCCESS)
        {
            PChar->profile.rankpoints = Sql_GetUIntData(SqlHandle, 0);

            PChar->profile.rank[0] = (uint8)Sql_GetIntData(SqlHandle, 1);
            PChar->profile.rank[1] = (uint8)Sql_GetIntData(SqlHandle, 2);
            PChar->profile.rank[2] = (uint8)Sql_GetIntData(SqlHandle, 3);

            PChar->profile.fame[0] = (uint16)Sql_GetIntData(SqlHandle, 4);    //Sandoria
            PChar->profile.fame[1] = (uint16)Sql_GetIntData(SqlHandle, 5);    //Bastok
            PChar->profile.fame[2] = (uint16)Sql_GetIntData(SqlHandle, 6);    //Windurst
            PChar->profile.fame[3] = (uint16)Sql_GetIntData(SqlHandle, 7);    //Norg
            PChar->profile.fame[4] = (uint16)Sql_GetIntData(SqlHandle, 8);    //Jeuno
            PChar->profile.fame[5] = (uint16)Sql_GetIntData(SqlHandle, 9);    //AbysseaKonschtat
            PChar->profile.fame[6] = (uint16)Sql_GetIntData(SqlHandle, 10);   //AbysseaTahrongi
            PChar->profile.fame[7] = (uint16)Sql_GetIntData(SqlHandle, 11);   //AbysseaLaTheine
            PChar->profile.fame[8] = (uint16)Sql_GetIntData(SqlHandle, 12);   //AbysseaMisareaux
            PChar->profile.fame[9] = (uint16)Sql_GetIntData(SqlHandle, 13);   //AbysseaVunkerl
            PChar->profile.fame[10] = (uint16)Sql_GetIntData(SqlHandle, 14);  //AbysseaAttohwa
            PChar->profile.fame[11] = (uint16)Sql_GetIntData(SqlHandle, 15);  //AbysseaAltepa
            PChar->profile.fame[12] = (uint16)Sql_GetIntData(SqlHandle, 16);  //AbysseaGrauberg
            PChar->profile.fame[13] = (uint16)Sql_GetIntData(SqlHandle, 17);  //AbysseaUleguerand
            PChar->profile.fame[14] = (uint16)Sql_GetIntData(SqlHandle, 18);  //Adoulin
        }

        fmtQuery =
            "SELECT "
            "inventory,"  // 0
            "safe,"       // 1
            "locker,"     // 2
            "satchel,"    // 3
            "sack,"       // 4
            "`case`,"     // 5
            "wardrobe,"     // 6
            "wardrobe2,"     // 7
            "wardrobe3,"     // 8
            "wardrobe4 "     // 9
            "FROM char_storage "
            "WHERE charid = %u;";

        ret = Sql_Query(SqlHandle, fmtQuery, PChar->id);

        if (ret != SQL_ERROR &&
            Sql_NumRows(SqlHandle) != 0 &&
            Sql_NextRow(SqlHandle) == SQL_SUCCESS)
        {
            PChar->getStorage(LOC_INVENTORY)->AddBuff((uint8)Sql_GetIntData(SqlHandle, 0));
            PChar->getStorage(LOC_MOGSAFE)->AddBuff((uint8)Sql_GetIntData(SqlHandle, 1));
            PChar->getStorage(LOC_MOGSAFE2)->AddBuff((uint8)Sql_GetIntData(SqlHandle, 1));
            PChar->getStorage(LOC_TEMPITEMS)->AddBuff(50);
            PChar->getStorage(LOC_MOGLOCKER)->AddBuff((uint8)Sql_GetIntData(SqlHandle, 2));
            PChar->getStorage(LOC_MOGSATCHEL)->AddBuff((uint8)Sql_GetIntData(SqlHandle, 3));
            PChar->getStorage(LOC_MOGSACK)->AddBuff((uint8)Sql_GetIntData(SqlHandle, 4));
            PChar->getStorage(LOC_MOGCASE)->AddBuff((uint8)Sql_GetIntData(SqlHandle, 5));

            PChar->getStorage(LOC_WARDROBE)->AddBuff((uint8)Sql_GetIntData(SqlHandle, 6));
            PChar->getStorage(LOC_WARDROBE2)->AddBuff((uint8)Sql_GetIntData(SqlHandle, 7));
            PChar->getStorage(LOC_WARDROBE3)->AddBuff((uint8)Sql_GetIntData(SqlHandle, 8));
            PChar->getStorage(LOC_WARDROBE4)->AddBuff((uint8)Sql_GetIntData(SqlHandle, 9));
        }

        fmtQuery = "SELECT face, race, size, head, body, hands, legs, feet, main, sub, ranged "
            "FROM char_look "
            "WHERE charid = %u;";

        ret = Sql_Query(SqlHandle, fmtQuery, PChar->id);

        if (ret != SQL_ERROR &&
            Sql_NumRows(SqlHandle) != 0 &&
            Sql_NextRow(SqlHandle) == SQL_SUCCESS)
        {
            PChar->look.face = (uint8)Sql_GetIntData(SqlHandle, 0);
            PChar->look.race = (uint8)Sql_GetIntData(SqlHandle, 1);
            PChar->look.size = (uint8)Sql_GetIntData(SqlHandle, 2);

            PChar->look.head = (uint16)Sql_GetIntData(SqlHandle, 3);
            PChar->look.body = (uint16)Sql_GetIntData(SqlHandle, 4);
            PChar->look.hands = (uint16)Sql_GetIntData(SqlHandle, 5);
            PChar->look.legs = (uint16)Sql_GetIntData(SqlHandle, 6);
            PChar->look.feet = (uint16)Sql_GetIntData(SqlHandle, 7);
            PChar->look.main = (uint16)Sql_GetIntData(SqlHandle, 8);
            PChar->look.sub = (uint16)Sql_GetIntData(SqlHandle, 9);
            PChar->look.ranged = (uint16)Sql_GetIntData(SqlHandle, 10);
            memcpy(&PChar->mainlook, &PChar->look, sizeof(PChar->look));
        }

        fmtQuery = "SELECT head, body, hands, legs, feet, main, sub, ranged FROM char_style WHERE charid = %u;";
        ret = Sql_Query(SqlHandle, fmtQuery, PChar->id);

        if (ret != SQL_ERROR
            && Sql_NumRows(SqlHandle) != 0
            && Sql_NextRow(SqlHandle) == SQL_SUCCESS) {
            PChar->styleItems[SLOT_HEAD] = (uint16)Sql_GetIntData(SqlHandle, 0);
            PChar->styleItems[SLOT_BODY] = (uint16)Sql_GetIntData(SqlHandle, 1);
            PChar->styleItems[SLOT_HANDS] = (uint16)Sql_GetIntData(SqlHandle, 2);
            PChar->styleItems[SLOT_LEGS] = (uint16)Sql_GetIntData(SqlHandle, 3);
            PChar->styleItems[SLOT_FEET] = (uint16)Sql_GetIntData(SqlHandle, 4);
            PChar->styleItems[SLOT_MAIN] = (uint16)Sql_GetIntData(SqlHandle, 5);
            PChar->styleItems[SLOT_SUB] = (uint16)Sql_GetIntData(SqlHandle, 6);
            PChar->styleItems[SLOT_RANGED] = (uint16)Sql_GetIntData(SqlHandle, 7);
        }

        fmtQuery = "SELECT unlocked, genkai, war, mnk, whm, blm, rdm, thf, pld, drk, bst, brd, rng, sam, nin, drg, smn, blu, cor, pup, dnc, sch, geo, run "
            "FROM char_jobs "
            "WHERE charid = %u;";

        ret = Sql_Query(SqlHandle, fmtQuery, PChar->id);

        if (ret != SQL_ERROR &&
            Sql_NumRows(SqlHandle) != 0 &&
            Sql_NextRow(SqlHandle) == SQL_SUCCESS)
        {
            PChar->jobs.unlocked = (uint32)Sql_GetUIntData(SqlHandle, 0);
            PChar->jobs.genkai = (uint8)Sql_GetUIntData(SqlHandle, 1);

            PChar->jobs.job[JOB_WAR] = (uint8)Sql_GetIntData(SqlHandle, 2);
            PChar->jobs.job[JOB_MNK] = (uint8)Sql_GetIntData(SqlHandle, 3);
            PChar->jobs.job[JOB_WHM] = (uint8)Sql_GetIntData(SqlHandle, 4);
            PChar->jobs.job[JOB_BLM] = (uint8)Sql_GetIntData(SqlHandle, 5);
            PChar->jobs.job[JOB_RDM] = (uint8)Sql_GetIntData(SqlHandle, 6);
            PChar->jobs.job[JOB_THF] = (uint8)Sql_GetIntData(SqlHandle, 7);
            PChar->jobs.job[JOB_PLD] = (uint8)Sql_GetIntData(SqlHandle, 8);
            PChar->jobs.job[JOB_DRK] = (uint8)Sql_GetIntData(SqlHandle, 9);
            PChar->jobs.job[JOB_BST] = (uint8)Sql_GetIntData(SqlHandle, 10);
            PChar->jobs.job[JOB_BRD] = (uint8)Sql_GetIntData(SqlHandle, 11);
            PChar->jobs.job[JOB_RNG] = (uint8)Sql_GetIntData(SqlHandle, 12);
            PChar->jobs.job[JOB_SAM] = (uint8)Sql_GetIntData(SqlHandle, 13);
            PChar->jobs.job[JOB_NIN] = (uint8)Sql_GetIntData(SqlHandle, 14);
            PChar->jobs.job[JOB_DRG] = (uint8)Sql_GetIntData(SqlHandle, 15);
            PChar->jobs.job[JOB_SMN] = (uint8)Sql_GetIntData(SqlHandle, 16);
            PChar->jobs.job[JOB_BLU] = (uint8)Sql_GetIntData(SqlHandle, 17);
            PChar->jobs.job[JOB_COR] = (uint8)Sql_GetIntData(SqlHandle, 18);
            PChar->jobs.job[JOB_PUP] = (uint8)Sql_GetIntData(SqlHandle, 19);
            PChar->jobs.job[JOB_DNC] = (uint8)Sql_GetIntData(SqlHandle, 20);
            PChar->jobs.job[JOB_SCH] = (uint8)Sql_GetIntData(SqlHandle, 21);
            PChar->jobs.job[JOB_GEO] = (uint8)Sql_GetIntData(SqlHandle, 22);
            PChar->jobs.job[JOB_RUN] = (uint8)Sql_GetIntData(SqlHandle, 23);
        }

        fmtQuery = "SELECT mode, war, mnk, whm, blm, rdm, thf, pld, drk, bst, brd, rng, sam, nin, drg, smn, blu, cor, pup, dnc, sch, geo, run, merits, limits "
            "FROM char_exp "
            "WHERE charid = %u;";

        ret = Sql_Query(SqlHandle, fmtQuery, PChar->id);

        if (ret != SQL_ERROR &&
            Sql_NumRows(SqlHandle) != 0 &&
            Sql_NextRow(SqlHandle) == SQL_SUCCESS)
        {
            PChar->MeritMode = (uint8)Sql_GetIntData(SqlHandle, 0);
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
            meritPoints = (uint8)Sql_GetIntData(SqlHandle, 23);
            limitPoints = (uint16)Sql_GetIntData(SqlHandle, 24);
        }

        fmtQuery = "SELECT nameflags, mjob, sjob, hp, mp, mhflag, title, bazaar_message, zoning, "
            "pet_id, pet_type, pet_hp, pet_mp "
            "FROM char_stats WHERE charid = %u;";

        ret = Sql_Query(SqlHandle, fmtQuery, PChar->id);
        uint8 zoning = 0;

        if (ret != SQL_ERROR &&
            Sql_NumRows(SqlHandle) != 0 &&
            Sql_NextRow(SqlHandle) == SQL_SUCCESS)
        {
            PChar->nameflags.flags = (uint32)Sql_GetUIntData(SqlHandle, 0);

            PChar->SetMJob(Sql_GetUIntData(SqlHandle, 1));
            PChar->SetSJob(Sql_GetUIntData(SqlHandle, 2));

            HP = Sql_GetIntData(SqlHandle, 3);
            MP = Sql_GetIntData(SqlHandle, 4);

            PChar->profile.mhflag = (uint8)Sql_GetIntData(SqlHandle, 5);
            PChar->profile.title = (uint16)Sql_GetIntData(SqlHandle, 6);

            int8* bazaarMessage = Sql_GetData(SqlHandle, 7);
            if (bazaarMessage != nullptr)
                PChar->bazaar.message.insert(0, (char*)Sql_GetData(SqlHandle, 7));
            else
                PChar->bazaar.message = '\0';

            zoning = Sql_GetUIntData(SqlHandle, 8);

            // Determine if the pet should be respawned.
            int16 petHP = Sql_GetUIntData(SqlHandle, 11);
            if (petHP) {
                PChar->petZoningInfo.petHP = petHP;
                PChar->petZoningInfo.petID = Sql_GetUIntData(SqlHandle, 9);
                PChar->petZoningInfo.petMP = Sql_GetIntData(SqlHandle, 12);
                PChar->petZoningInfo.petType = (PETTYPE)Sql_GetUIntData(SqlHandle, 10);
                PChar->petZoningInfo.respawnPet = true;
            }
        }


        Sql_Query(SqlHandle, "UPDATE char_stats SET zoning = 0 WHERE charid = %u", PChar->id);

        if (zoning == 2)
            ShowDebug("Player <%s> logging in to zone <%u>\n", PChar->name.c_str(), PChar->getZone());


        PChar->SetMLevel(PChar->jobs.job[PChar->GetMJob()]);
        PChar->SetSLevel(PChar->jobs.job[PChar->GetSJob()]);

        fmtQuery = "SELECT id, time, recast FROM char_recast WHERE charid = %u;";

        ret = Sql_Query(SqlHandle, fmtQuery, PChar->id);
        if (ret != SQL_ERROR && Sql_NumRows(SqlHandle) != 0)
        {
            while (Sql_NextRow(SqlHandle) == SQL_SUCCESS)
            {
                uint32 cast_time = Sql_GetUIntData(SqlHandle, 1);
                uint32 recast = Sql_GetUIntData(SqlHandle, 2);
                time_t now = time(nullptr);
                uint32 chargeTime = 0;
                uint8 maxCharges = 0;
                Charge_t* charge = ability::GetCharge(PChar, Sql_GetUIntData(SqlHandle, 0));
                if (charge != nullptr)
                {
                    chargeTime = charge->chargeTime;
                    maxCharges = charge->maxCharges;
                }
                if (now < cast_time + recast)
                {
                    PChar->PRecastContainer->Load(RECAST_ABILITY, Sql_GetUIntData(SqlHandle, 0), (cast_time + recast - (uint32)now), chargeTime, maxCharges);
                }
            }
        }

        fmtQuery = "SELECT skillid, value, rank "
            "FROM char_skills "
            "WHERE charid = %u;";

        ret = Sql_Query(SqlHandle, fmtQuery, PChar->id);

        if (ret != SQL_ERROR && Sql_NumRows(SqlHandle) != 0)
        {
            while (Sql_NextRow(SqlHandle) == SQL_SUCCESS)
            {
                uint8 SkillID = (uint8)Sql_GetUIntData(SqlHandle, 0);

                if (SkillID < MAX_SKILLTYPE)
                {
                    PChar->RealSkills.skill[SkillID] = (uint16)Sql_GetUIntData(SqlHandle, 1);
                    if (SkillID >= SKILL_FISHING)
                    {
                        PChar->RealSkills.rank[SkillID] = (uint8)Sql_GetUIntData(SqlHandle, 2);
                    }
                }
            }
        }

        fmtQuery = "SELECT sandoria_supply, bastok_supply, windurst_supply, "
            "runic_portal, maw, past_sandoria_tp, "
            "past_bastok_tp, past_windurst_tp "
            "FROM char_points "
            "WHERE charid = %u;";

        ret = Sql_Query(SqlHandle, fmtQuery, PChar->id);

        if (ret != SQL_ERROR &&
            Sql_NumRows(SqlHandle) != 0 &&
            Sql_NextRow(SqlHandle) == SQL_SUCCESS)
        {
            PChar->nationtp.sandoria = Sql_GetUIntData(SqlHandle, 0);
            PChar->nationtp.bastok = Sql_GetUIntData(SqlHandle, 1);
            PChar->nationtp.windurst = Sql_GetUIntData(SqlHandle, 2);
            PChar->nationtp.ahturhgan = Sql_GetUIntData(SqlHandle, 3);
            PChar->nationtp.maw = Sql_GetUIntData(SqlHandle, 4);
            PChar->nationtp.pastsandoria = Sql_GetUIntData(SqlHandle, 5);
            PChar->nationtp.pastbastok = Sql_GetUIntData(SqlHandle, 6);
            PChar->nationtp.pastwindurst = Sql_GetUIntData(SqlHandle, 7);
        }

        PChar->PMeritPoints = new CMeritPoints(PChar);
        PChar->PMeritPoints->SetMeritPoints(meritPoints);
        PChar->PMeritPoints->SetLimitPoints(limitPoints);

        fmtQuery =
            "SELECT "
            "gmlevel, "    // 0
            "mentor, "     // 1
            "nnameflags "  // 2
            "FROM chars "
            "WHERE charid = %u;";

        ret = Sql_Query(SqlHandle, fmtQuery, PChar->id);

        if (ret != SQL_ERROR &&
            Sql_NumRows(SqlHandle) != 0 &&
            Sql_NextRow(SqlHandle) == SQL_SUCCESS)
        {
            PChar->m_GMlevel = (uint8)Sql_GetUIntData(SqlHandle, 0);
            PChar->m_mentorUnlocked = Sql_GetUIntData(SqlHandle, 1) > 0;
            PChar->menuConfigFlags.flags = (uint32)Sql_GetUIntData(SqlHandle, 2);
        }

        charutils::LoadInventory(PChar);
        PChar->m_event.EventID = luautils::OnZoneIn(PChar);

        CalculateStats(PChar);
        blueutils::LoadSetSpells(PChar);
        puppetutils::LoadAutomaton(PChar);
        BuildingCharSkillsTable(PChar);
        BuildingCharAbilityTable(PChar);
        BuildingCharTraitsTable(PChar);

        PChar->animation = (HP == 0 ? ANIMATION_DEATH : ANIMATION_NONE);

        PChar->StatusEffectContainer->LoadStatusEffects();

        charutils::LoadEquip(PChar);
        PChar->health.hp = zoneutils::IsResidentialArea(PChar) ? PChar->GetMaxHP() : HP;
        PChar->health.mp = zoneutils::IsResidentialArea(PChar) ? PChar->GetMaxMP() : MP;
        PChar->UpdateHealth();
        luautils::OnGameIn(PChar, zoning == 1);
    }

    void LoadSpells(CCharEntity* PChar)
    {
        // disable all spells
        PChar->m_SpellList.reset();

        std::string enabledContent = "\"\"";

        // Compile a string of all enabled expansions
        for (auto&& expan : {"COP", "TOAU", "WOTG", "ACP", "AMK", "ASA", "ABYSSEA", "SOA"})
        {
            if (luautils::IsContentEnabled(expan))
            {
                enabledContent += ",\"";
                enabledContent += expan;
                enabledContent += "\"";
            }
        }

        // Select all player spells from enabled expansions
        const char* fmtQuery =
            "SELECT char_spells.spellid "
            "FROM char_spells "
            "JOIN spell_list "
            "ON spell_list.spellid = char_spells.spellid "
            "WHERE charid = %u AND "
            "(spell_list.content_tag IN (%s) OR "
            "spell_list.content_tag IS NULL);";

        int32 ret = Sql_Query(SqlHandle, fmtQuery, PChar->id, enabledContent.c_str());

        if (ret != SQL_ERROR &&
            Sql_NumRows(SqlHandle) != 0)
        {
            while (Sql_NextRow(SqlHandle) == SQL_SUCCESS)
            {
                uint16 spellId = Sql_GetUIntData(SqlHandle, 0);

                if (spell::GetSpell(static_cast<SpellID>(spellId)) != nullptr)
                {
                    PChar->m_SpellList.set(spellId);
                }
            }
        }

    }

    /************************************************************************
    *                                                                       *
    *  Загружаем инвентарь персонажа                                        *
    *                                                                       *
    ************************************************************************/

    void LoadInventory(CCharEntity* PChar)
    {
        const char* Query =
            "SELECT "
            "itemid,"         // 0
            "location,"       // 1
            "slot,"           // 2
            "quantity,"       // 3
            "bazaar,"         // 4
            "signature, "     // 5
            "extra "          // 6
            "FROM char_inventory "
            "WHERE charid = %u "
            "ORDER BY location ASC";

        int32 ret = Sql_Query(SqlHandle, Query, PChar->id);

        if (ret != SQL_ERROR && Sql_NumRows(SqlHandle) != 0)
        {
            while (Sql_NextRow(SqlHandle) == SQL_SUCCESS)
            {
                CItem* PItem = itemutils::GetItem(Sql_GetIntData(SqlHandle, 0));

                if (PItem != nullptr)
                {
                    PItem->setLocationID((uint8)Sql_GetUIntData(SqlHandle, 1));
                    PItem->setSlotID(Sql_GetUIntData(SqlHandle, 2));
                    PItem->setQuantity(Sql_GetUIntData(SqlHandle, 3));
                    PItem->setCharPrice(Sql_GetUIntData(SqlHandle, 4));

                    size_t length = 0;
                    char* extra = nullptr;
                    Sql_GetData(SqlHandle, 6, &extra, &length);
                    memcpy(PItem->m_extra, extra, (length > sizeof(PItem->m_extra) ? sizeof(PItem->m_extra) : length));

                    if (PItem->getCharPrice() != 0)
                    {
                        PItem->setSubType(ITEM_LOCKED);
                    }

                    if (PItem->isType(ITEM_LINKSHELL))
                    {
                        int8 EncodedString[16];
                        EncodeStringLinkshell(Sql_GetData(SqlHandle, 5), EncodedString);
                        PItem->setSignature(EncodedString);
                    }
                    else if (PItem->getFlag() & (ITEM_FLAG_INSCRIBABLE))
                    {
                        int8 EncodedString[13];
                        EncodeStringSignature(Sql_GetData(SqlHandle, 5), EncodedString);
                        PItem->setSignature(EncodedString);
                    }

                    if (PItem->isType(ITEM_FURNISHING) && PItem->getLocationID() == LOC_MOGSAFE)
                    {
                        if (((CItemFurnishing*)PItem)->isInstalled()) // способ узнать, что предмет действительно установлен
                        {
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

            if (PItemContainer != nullptr)
            {
                // now find each item in the container
                for (uint8 y = 0; y < MAX_CONTAINER_SIZE; ++y)
                {
                    CItem* PItem = (CItem*)PItemContainer->GetItem(y);

                    // check if the item is valid and can have an augment applied to it
                    if (PItem != nullptr && ((PItem->isType(ITEM_ARMOR) || PItem->isType(ITEM_WEAPON)) && !PItem->isSubType(ITEM_CHARGED)))
                    {
                        // check if there are any valid augments to be applied to the item
                        for (uint8 j = 0; j < 4; ++j)
                        {
                            // found a match, apply the augment
                            if (((CItemArmor*)PItem)->getAugment(j) != 0)
                                ((CItemArmor*)PItem)->ApplyAugment(j);
                        }
                    }
                }
            }
        }
    }

    void LoadEquip(CCharEntity* PChar)
    {
        const char* Query =
            "SELECT "
            "slotid,"
            "equipslotid,"
            "containerid "
            "FROM char_equip "
            "WHERE charid = %u;";

        int ret = Sql_Query(SqlHandle, Query, PChar->id);

        if (ret != SQL_ERROR)
        {
            CItemLinkshell* PLinkshell1 = nullptr;
            CItemLinkshell* PLinkshell2 = nullptr;
            bool hasMainWeapon = false;

            while (Sql_NextRow(SqlHandle) == SQL_SUCCESS)
            {
                if (Sql_GetUIntData(SqlHandle, 1) < 16)
                {
                    if (Sql_GetUIntData(SqlHandle, 1) == SLOT_MAIN)
                    {
                        hasMainWeapon = true;
                    }

                    EquipItem(PChar, Sql_GetUIntData(SqlHandle, 0), Sql_GetUIntData(SqlHandle, 1), Sql_GetUIntData(SqlHandle, 2));
                }
                else
                {
                    uint8 SlotID = Sql_GetUIntData(SqlHandle, 0);
                    uint8 equipSlot = Sql_GetUIntData(SqlHandle, 1);
                    CItem* PItem = PChar->getStorage(LOC_INVENTORY)->GetItem(SlotID);

                    if ((PItem != nullptr) && PItem->isType(ITEM_LINKSHELL))
                    {
                        PItem->setSubType(ITEM_LOCKED);
                        PChar->equip[equipSlot] = SlotID;
                        PChar->equipLoc[equipSlot] = LOC_INVENTORY;
                        if (equipSlot == SLOT_LINK1)
                            PLinkshell1 = (CItemLinkshell*)PItem;
                        else if (equipSlot == SLOT_LINK2)
                        {
                            PLinkshell2 = (CItemLinkshell*)PItem;
                        }
                    }
                }
            }

            // If no weapon is equipped, equip the appropriate unarmed weapon item
            if (!hasMainWeapon)
            {
                CheckUnarmedWeapon(PChar);
            }

            if (PLinkshell1)
            {
                linkshell::AddOnlineMember(PChar, PLinkshell1, 1);
            }
            if (PLinkshell2)
            {
                linkshell::AddOnlineMember(PChar, PLinkshell2, 2);
            }
        }
        else
        {
            ShowError(CL_RED"Loading error from char_equip\n" CL_RESET);
        }
    }

    /************************************************************************
    *                                                                       *
    *  Отправляем список текущих/завершенных квестов и миссий               *
    *                                                                       *
    ************************************************************************/

    void SendQuestMissionLog(CCharEntity* PChar)
    {
        // Quests (Current + Completed):
        // --------------------------------
        for (int8 areaID = 0; areaID <= QUESTS_COALITION; areaID++)
        {
            PChar->pushPacket(new CQuestMissionLogPacket(PChar, areaID, LOG_QUEST_CURRENT));
            PChar->pushPacket(new CQuestMissionLogPacket(PChar, areaID, LOG_QUEST_COMPLETE));
        }

        // Completed Missions:
        // --------------------------------
        // Completed missions for Nation + Zilart Missions are all sent in single packet
        PChar->pushPacket(new CQuestMissionLogPacket(PChar, MISSION_ZILART, LOG_MISSION_COMPLETE));

        // Completed missions for TOAU and WOTG are sent in the same packet
        PChar->pushPacket(new CQuestMissionLogPacket(PChar, MISSION_TOAU, LOG_MISSION_COMPLETE));

        // Completed Assaults were sent in the same packet as completed TOAU quests

        // Completed Campaign Operations
        PChar->pushPacket(new CQuestMissionLogPacket(PChar, MISSION_CAMPAIGN, LOG_MISSION_COMPLETE));
        PChar->pushPacket(new CQuestMissionLogPacket(PChar, MISSION_CAMPAIGN, LOG_CAMPAIGN_TWO));

        // Current Missions:
        // --------------------------------
        // Current TOAU, Assault, WOTG, and Campaign mission were sent in the same packet as current TOAU quests

        // Current Nation, Zilart, COP, Add-On, SOA, and ROV missions are all sent in a shared, single packet.
        // So sending this packet updates multiple Mission logs at once.
        PChar->pushPacket(new CQuestMissionLogPacket(PChar, MISSION_ZILART, LOG_MISSION_CURRENT));
    }

    /************************************************************************
    *                                                                       *
    *  Отправляем списки ключевых предметов персонажа                       *
    *                                                                       *
    ************************************************************************/

    void SendKeyItems(CCharEntity* PChar)
    {
        for (uint8 table = 0; table < MAX_KEYS_TABLE; table++)
        {
            PChar->pushPacket(new CKeyItemsPacket(PChar, (KEYS_TABLE)table));
        }
    }

    /************************************************************************
    *                                                                       *
    *  Отправляем персонажу весь его инвентарь                              *
    *                                                                       *
    ************************************************************************/

    void SendInventory(CCharEntity* PChar)
    {
        auto pushContainer = [&](auto LocationID)
        {
            CItemContainer* container = PChar->getStorage(LocationID);
            if (container == nullptr)
                return;

            uint8 size = container->GetSize();
            for (uint8 slotID = 0; slotID <= size; ++slotID)
            {
                CItem* PItem = PChar->getStorage(LocationID)->GetItem(slotID);
                if (PItem != nullptr)
                {
                    PChar->pushPacket(new CInventoryItemPacket(PItem, LocationID, slotID));
                }
            }
        };

        //Send important items first
        //Note: it's possible that non-essential inventory items are sent in response to another packet
        for (auto&& containerID : {LOC_INVENTORY, LOC_TEMPITEMS, LOC_WARDROBE, LOC_WARDROBE2, LOC_WARDROBE3, LOC_WARDROBE4, LOC_MOGSAFE,
            LOC_STORAGE, LOC_MOGLOCKER, LOC_MOGSATCHEL, LOC_MOGSACK, LOC_MOGCASE, LOC_MOGSAFE2})
        {
            pushContainer(containerID);
        }

        for (int32 i = 0; i < 16; ++i)
        {
            CItem* PItem = PChar->getEquip((SLOTTYPE)i);
            if (PItem != nullptr)
            {
                PItem->setSubType(ITEM_LOCKED);
                PChar->pushPacket(new CInventoryAssignPacket(PItem, INV_NODROP));
            }
        }

        CItem* PItem = PChar->getEquip(SLOT_LINK1);
        if (PItem != nullptr)
        {
            PItem->setSubType(ITEM_LOCKED);

            PChar->nameflags.flags |= FLAG_LINKSHELL;
            PChar->pushPacket(new CInventoryItemPacket(PItem, LOC_INVENTORY, PChar->equip[SLOT_LINK1]));
            PChar->pushPacket(new CInventoryAssignPacket(PItem, INV_LINKSHELL));
            PChar->pushPacket(new CLinkshellEquipPacket(PChar, 1));
        }
        else
        {
            PChar->nameflags.flags &= ~FLAG_LINKSHELL;
        }

        PItem = PChar->getEquip(SLOT_LINK2);
        if (PItem != nullptr)
        {
            PItem->setSubType(ITEM_LOCKED);

            PChar->pushPacket(new CInventoryItemPacket(PItem, LOC_INVENTORY, PChar->equip[SLOT_LINK2]));
            PChar->pushPacket(new CInventoryAssignPacket(PItem, INV_LINKSHELL));
            PChar->pushPacket(new CLinkshellEquipPacket(PChar, 2));
        }
        PChar->pushPacket(new CInventoryFinishPacket());
    }

    /************************************************************************
    *                                                                       *
    *  Добавляем новый предмет персонажу в выбранный контейнер              *
    *                                                                       *
    ************************************************************************/

    // TODO: мне не нравится параметр silens, нужно придумать что-нибудь более элегантное

    uint8 AddItem(CCharEntity* PChar, uint8 LocationID, uint16 ItemID, uint32 quantity, bool silence)
    {
        if (PChar->getStorage(LocationID)->GetFreeSlotsCount() == 0 || quantity == 0)
        {
            return ERROR_SLOTID;
        }

        CItem* PItem = itemutils::GetItem(ItemID);

        if (PItem != nullptr)
        {
            PItem->setQuantity(quantity);
            return AddItem(PChar, LocationID, PItem, silence);
        }
        ShowWarning(CL_YELLOW"charplugin::AddItem: Item <%i> is not found in a database\n" CL_RESET, ItemID);
        return ERROR_SLOTID;
    }

    /************************************************************************
    *                                                                       *
    *  Добавляем новый предмет персонажу в выбранный контейнер              *
    *                                                                       *
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
            // uint8 charges = (PItem->isType(ITEM_USABLE) ? ((CItemUsable*)PItem)->getCurrentCharges() : 0);

            const char* Query =
                "INSERT INTO char_inventory("
                "charid,"
                "location,"
                "slot,"
                "itemId,"
                "quantity,"
                "signature,"
                "extra) "
                "VALUES(%u,%u,%u,%u,%u,'%s','%s')";

            int8 signature[21];
            if (PItem->isType(ITEM_LINKSHELL))
            {
                DecodeStringLinkshell((int8*)PItem->getSignature(), signature);
            }
            else
            {
                DecodeStringSignature((int8*)PItem->getSignature(), signature);
            }

            char extra[sizeof(PItem->m_extra) * 2 + 1];
            Sql_EscapeStringLen(SqlHandle, extra, (const char*)PItem->m_extra, sizeof(PItem->m_extra));

            if (Sql_Query(SqlHandle, Query,
                PChar->id,
                LocationID,
                SlotID,
                PItem->getID(),
                PItem->getQuantity(),
                signature,
                extra) == SQL_ERROR)
            {
                ShowError(CL_RED"charplugin::AddItem: Cannot insert item to database\n" CL_RESET);
                PChar->getStorage(LocationID)->InsertItem(nullptr, SlotID);
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
        PChar->PRecastContainer->ChangeJob();
        charutils::BuildingCharAbilityTable(PChar);
        charutils::BuildingCharTraitsTable(PChar);

        PChar->UpdateHealth();
        PChar->health.hp = PChar->GetMaxHP();
        PChar->health.mp = PChar->GetMaxMP();

        charutils::SaveCharStats(PChar);
        charutils::SaveCharJob(PChar, PChar->GetMJob());
        charutils::SaveCharExp(PChar, PChar->GetMJob());
        PChar->updatemask |= UPDATE_HP;

        PChar->pushPacket(new CCharJobsPacket(PChar));
        PChar->pushPacket(new CCharStatsPacket(PChar));
        PChar->pushPacket(new CCharSkillsPacket(PChar));
        PChar->pushPacket(new CCharRecastPacket(PChar));
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
                if (PItemContainer->GetItem(NewSlotID) != nullptr) NewSlotID = ERROR_SLOTID;
            }
            if (NewSlotID != ERROR_SLOTID)
            {
                const char* Query =
                    "UPDATE char_inventory "
                    "SET slot = %u "
                    "WHERE charid = %u AND location = %u AND slot = %u";

                if (Sql_Query(SqlHandle, Query, NewSlotID, PChar->id, LocationID, SlotID) != SQL_ERROR &&
                    Sql_AffectedRows(SqlHandle) != 0)
                {
                    PItemContainer->InsertItem(nullptr, SlotID);

                    PChar->pushPacket(new CInventoryItemPacket(nullptr, LocationID, SlotID));
                    PChar->pushPacket(new CInventoryItemPacket(PItemContainer->GetItem(NewSlotID), LocationID, NewSlotID));
                    return NewSlotID;
                }
                PItemContainer->InsertItem(nullptr, NewSlotID); // отменяем все изменения контейнера
            }
        }
        ShowError(CL_RED"charutils::MoveItem: item can't be moved\n" CL_RESET);
        return ERROR_SLOTID;
    }

    /************************************************************************
    *                                                                       *
    *  Обновляем количество предметов в указанных контейнере и ячейке       *
    *                                                                       *
    ************************************************************************/

    uint32 UpdateItem(CCharEntity* PChar, uint8 LocationID, uint8 slotID, int32 quantity, bool force)
    {
        CItem* PItem = PChar->getStorage(LocationID)->GetItem(slotID);

        if (PItem == nullptr)
        {
            ShowDebug("UpdateItem: No item in slot %u\n", slotID);
            PChar->pushPacket(new CInventoryItemPacket(nullptr, LocationID, slotID));
            return 0;
        }
        if ((int32)(PItem->getQuantity() - PItem->getReserve() + quantity) < 0)
        {
            ShowDebug("UpdateItem: Trying to move too much quantity\n");
            return 0;
        }

        auto PState = dynamic_cast<CItemState*>(PChar->PAI->GetCurrentState());
        if (PState)
        {
            CItem* item = PState->GetItem();

            if (item && item->getSlotID() == PItem->getSlotID() && item->getLocationID() == PItem->getLocationID() && !force)
                return 0;
        }

        uint32 ItemID = PItem->getID();
        uint32 newQuantity = PItem->getQuantity() + quantity;

        if (newQuantity > PItem->getStackSize()) newQuantity = PItem->getStackSize();

        if (newQuantity > 0 || PItem->isType(ITEM_CURRENCY))
        {
            const char* Query =
                "UPDATE char_inventory "
                "SET quantity = %u "
                "WHERE charid = %u AND location = %u AND slot = %u;";

            if (Sql_Query(SqlHandle, Query, newQuantity, PChar->id, LocationID, slotID) != SQL_ERROR)
            {
                PItem->setQuantity(newQuantity);
                PChar->pushPacket(new CInventoryModifyPacket(LocationID, slotID, newQuantity));
            }
        }
        else if (newQuantity == 0)
        {
            const char* Query = "DELETE FROM char_inventory WHERE charid = %u AND location = %u AND slot = %u;";

            if (Sql_Query(SqlHandle, Query, PChar->id, LocationID, slotID) != SQL_ERROR)
            {
                PChar->getStorage(LocationID)->InsertItem(nullptr, slotID);
                PChar->pushPacket(new CInventoryItemPacket(nullptr, LocationID, slotID));

                if (PChar->getStyleLocked() && !HasItem(PChar, ItemID))
                {
                    if (PItem->isType(ITEM_WEAPON)) {
                        if (PChar->styleItems[SLOT_MAIN] == ItemID) {
                            charutils::UpdateWeaponStyle(PChar, SLOT_MAIN, (CItemWeapon*)PChar->getEquip(SLOT_MAIN));
                        }
                        else if (PChar->styleItems[SLOT_SUB] == ItemID) {
                            charutils::UpdateWeaponStyle(PChar, SLOT_SUB, (CItemWeapon*)PChar->getEquip(SLOT_SUB));
                        }
                    }
                    else if (PItem->isType(ITEM_ARMOR)) {
                        auto equipSlotID = ((CItemArmor*)PItem)->getSlotType();
                        if (PChar->styleItems[equipSlotID] == ItemID) {
                            switch (equipSlotID)
                            {
                                case SLOT_HEAD:
                                case SLOT_BODY:
                                case SLOT_HANDS:
                                case SLOT_LEGS:
                                case SLOT_FEET:
                                    charutils::UpdateArmorStyle(PChar, equipSlotID);
                                    break;
                            }
                        }
                    }
                }

                delete PItem;
            }
        }
        return ItemID;
    }

    /************************************************************************
    *                                                                       *
    *  Check the possibility of trade between the characters             *
    *                                                                       *
    ************************************************************************/

    bool CanTrade(CCharEntity* PChar, CCharEntity* PTarget)
    {
        if ((PTarget->getStorage(LOC_INVENTORY)->GetFreeSlotsCount() + PTarget->UContainer->GetItemsCount()) < PChar->UContainer->GetItemsCount())
        {
            ShowDebug(CL_CYAN"Unable to trade, %s doesn't have enough inventory space\n" CL_RESET, PTarget->GetName());
            return false;
        }
        for (uint8 slotid = 0; slotid <= 8; ++slotid)
        {
            CItem* PItem = PChar->UContainer->GetItem(slotid);

            if (PItem != nullptr && PItem->getFlag() & ITEM_FLAG_RARE)
            {
                if (HasItem(PTarget, PItem->getID()))
                {
                    ShowDebug(CL_CYAN"Unable to trade, %s has the rare item already (%s)\n" CL_RESET, PTarget->GetName(), PItem->getName());
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
        ShowDebug(CL_CYAN"%s->%s trade item movement started\n" CL_RESET, PChar->GetName(), PTarget->GetName());
        for (uint8 slotid = 0; slotid <= 8; ++slotid)
        {
            CItem* PItem = PChar->UContainer->GetItem(slotid);

            if (PItem != nullptr)
            {
                if (PItem->getStackSize() == 1 && PItem->getReserve() == 1)
                {
                    CItem* PNewItem = itemutils::GetItem(PItem);
                    ShowDebug(CL_CYAN"Adding %s to %s inventory stacksize 1\n" CL_RESET, PNewItem->getName(), PTarget->GetName());
                    PNewItem->setReserve(0);
                    AddItem(PTarget, LOC_INVENTORY, PNewItem);
                }
                else
                {
                    ShowDebug(CL_CYAN"Adding %s to %s inventory\n" CL_RESET, PItem->getName(), PTarget->GetName());
                    AddItem(PTarget, LOC_INVENTORY, PItem->getID(), PItem->getReserve());
                }
                ShowDebug(CL_CYAN"Removing %s from %s's inventory\n" CL_RESET, PItem->getName(), PChar->GetName());
                auto amount = PItem->getReserve();
                PItem->setReserve(0);
                UpdateItem(PChar, LOC_INVENTORY, PItem->getSlotID(), (int32)(0 - amount));
                PChar->UContainer->ClearSlot(slotid);
            }
        }
    }

    /************************************************************************
    *                                                                       *
    *  Снимаем с персонажа экипированный предмет без обновления внешного    *
    *  вида. Используется как вспомогательная функция в связке с другими    *
    *                                                                       *
    ************************************************************************/

    void UnequipItem(CCharEntity* PChar, uint8 equipSlotID, bool update)
    {
        CItem* PItem = PChar->getEquip((SLOTTYPE)equipSlotID);

        if ((PItem != nullptr) && PItem->isType(ITEM_ARMOR))
        {
            auto removeSlotID = ((CItemArmor*)PItem)->getRemoveSlotId();

            for (auto i = 0u; i < sizeof(removeSlotID) * 8; ++i)
            {
                if (removeSlotID & (1 << i))
                {
                    if (i >= SLOT_HEAD && i <= SLOT_FEET)
                    {
                        switch (i)
                        {
                        case SLOT_HEAD:
                            PChar->look.head = 0;
                            break;
                        case SLOT_BODY:
                            PChar->look.body = 0;
                            break;
                        case SLOT_HANDS:
                            PChar->look.hands = 0;
                            break;
                        case SLOT_LEGS:
                            PChar->look.legs = 0;
                            break;
                        case SLOT_FEET:
                            PChar->look.feet = 0;
                            break;
                        }
                    }
                }
            }

            // Call the LUA event before actually "unequipping" the item so the script can do stuff with it first
            if (((CItemArmor*)PItem)->getScriptType() & SCRIPT_EQUIP)
            {
                luautils::OnItemCheck(PChar, PItem, ITEMCHECK::UNEQUIP, nullptr);
            }

            //todo: issues as item 0 reference is being handled as a real equipment piece
            //      thought to be source of nin bug
            PChar->equip[equipSlotID] = 0;
            PChar->equipLoc[equipSlotID] = 0;

            if (((CItemArmor*)PItem)->getScriptType() & SCRIPT_EQUIP)
            {
                PChar->m_EquipFlag = 0;
                for (uint8 i = 0; i < 16; ++i)
                {
                    CItem* PItem = PChar->getEquip((SLOTTYPE)i);

                    if ((PItem != nullptr) && PItem->isType(ITEM_ARMOR))
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

            if (equipSlotID == SLOT_SUB) {
                // Removed sub item, if main hand is empty, then possibly eligible for H2H weapon
                if (!PChar->getEquip(SLOT_MAIN) || !PChar->getEquip(SLOT_MAIN)->isType(ITEM_ARMOR))
                {
                    CheckUnarmedWeapon(PChar);
                }
            }
            PChar->delEquipModifiers(&((CItemArmor*)PItem)->modList, ((CItemArmor*)PItem)->getReqLvl(), equipSlotID);
            PChar->PLatentEffectContainer->DelLatentEffects(((CItemArmor*)PItem)->getReqLvl(), equipSlotID);
            PChar->delPetModifiers(&((CItemArmor*)PItem)->petModList);

            PChar->pushPacket(new CInventoryAssignPacket(PItem, INV_NORMAL)); //???
            PChar->pushPacket(new CEquipPacket(0, equipSlotID, LOC_INVENTORY));

            switch (equipSlotID)
            {
                case SLOT_HEAD:   PChar->look.head = 0; break;
                case SLOT_BODY:   PChar->look.body = 0; break;
                case SLOT_HANDS:  PChar->look.hands = 0; break;
                case SLOT_LEGS:   PChar->look.legs = 0; break;
                case SLOT_FEET:   PChar->look.feet = 0; break;
                case SLOT_SUB:
                {
                    PChar->look.sub = 0;
                    PChar->m_Weapons[SLOT_SUB] = itemutils::GetUnarmedItem();           // << equips "nothing" in the sub slot to prevent multi attack exploit
                    PChar->health.tp = 0;
                    PChar->StatusEffectContainer->DelStatusEffect(EFFECT_AFTERMATH);
                    BuildingCharWeaponSkills(PChar);
                    UpdateWeaponStyle(PChar, equipSlotID, nullptr);
                }
                break;
                case SLOT_AMMO:
                {
                    if (PChar->equip[SLOT_RANGED] == 0)
                    {
                        PChar->look.ranged = 0;
                    }
                    PChar->m_Weapons[SLOT_AMMO] = nullptr;
                    UpdateWeaponStyle(PChar, equipSlotID, nullptr);
                }
                break;
                case SLOT_RANGED:
                {
                    if (PChar->equip[SLOT_RANGED] == 0)
                    {
                        PChar->look.ranged = 0;
                    }
                    PChar->m_Weapons[SLOT_RANGED] = nullptr;
                    PChar->health.tp = 0;
                    PChar->StatusEffectContainer->DelStatusEffect(EFFECT_AFTERMATH);
                    BuildingCharWeaponSkills(PChar);
                    UpdateWeaponStyle(PChar, equipSlotID, nullptr);
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

                    if (PChar->PAI->IsEngaged())
                    {
                        auto state = dynamic_cast<CAttackState*>(PChar->PAI->GetCurrentState());
                        if (state) state->ResetAttackTimer();
                    }

                    // If main hand is empty, figure out which UnarmedItem to give the player.
                    if (!PChar->getEquip(SLOT_MAIN) || !PChar->getEquip(SLOT_MAIN)->isType(ITEM_ARMOR))
                    {
                        CheckUnarmedWeapon(PChar);
                    }

                    PChar->health.tp = 0;
                    PChar->StatusEffectContainer->DelStatusEffect(EFFECT_AFTERMATH);
                    BuildingCharWeaponSkills(PChar);
                    UpdateWeaponStyle(PChar, equipSlotID, nullptr);
                }
                break;
            }

            if (update)
            {
                charutils::BuildingCharSkillsTable(PChar);
                PChar->UpdateHealth();
                PChar->m_EquipSwap = true;
                PChar->updatemask |= UPDATE_LOOK;
            }
        }
    }

    void RemoveSub(CCharEntity* PChar)
    {
        CItemArmor* PItem = (CItemArmor*)PChar->getEquip(SLOT_SUB);

        if (PItem != nullptr && PItem->isType(ITEM_ARMOR))
        {
            UnequipItem(PChar, SLOT_SUB);
        }
    }

    /************************************************************************
    *                                                                       *
    *  Пытаемся экипировать предмет с соблюдением всех условий              *
    *                                                                       *
    ************************************************************************/

    bool EquipArmor(CCharEntity* PChar, uint8 slotID, uint8 equipSlotID, uint8 containerID)
    {
        CItemArmor* PItem = (CItemArmor*)PChar->getStorage(containerID)->GetItem(slotID);
        CItemArmor* oldItem = PChar->getEquip((SLOTTYPE)equipSlotID);

        if (PItem == nullptr)
        {
            ShowDebug("No item in inventory slot %u\n", slotID);
            return false;
        }

        if ((PChar->m_EquipBlock & (1 << equipSlotID)) ||
            !(PItem->getJobs() & (1 << (PChar->GetMJob() - 1))) ||
            (PItem->getReqLvl() > (map_config.disable_gear_scaling ?
            PChar->GetMLevel() : PChar->jobs.job[PChar->GetMJob()])))
        {
            return false;
        }

        if (equipSlotID == SLOT_MAIN)
        {
            if (!(slotID == PItem->getSlotID() && oldItem &&
                (oldItem->isType(ITEM_WEAPON) && PItem->isType(ITEM_WEAPON)) &&
                ((((CItemWeapon*)PItem)->isTwoHanded() == true) && (((CItemWeapon*)oldItem)->isTwoHanded() == true))))
            {
                CItemArmor* PSubItem = PChar->getEquip(SLOT_SUB);

                if (PSubItem != nullptr && PSubItem->isType(ITEM_ARMOR) && (PSubItem->IsShield() != true))
                    RemoveSub(PChar);
            }
        }

        UnequipItem(PChar, equipSlotID, false);

        if (PItem->getEquipSlotId() & (1 << equipSlotID))
        {
            auto removeSlotID = PItem->getRemoveSlotId();

            for (auto i = 0u; i < sizeof(removeSlotID) * 8; ++i)
            {
                if (removeSlotID & (1 << i))
                {
                    UnequipItem(PChar, i, false);
                    if (i >= SLOT_HEAD && i <= SLOT_FEET)
                    {
                        switch (i)
                        {
                            case SLOT_HEAD:
                                PChar->look.head = PItem->getModelId();
                                break;
                            case SLOT_BODY:
                                PChar->look.body = PItem->getModelId();
                                break;
                            case SLOT_HANDS:
                                PChar->look.hands = PItem->getModelId();
                                break;
                            case SLOT_LEGS:
                                PChar->look.legs = PItem->getModelId();
                                break;
                            case SLOT_FEET:
                                PChar->look.feet = PItem->getModelId();
                                break;
                        }
                    }
                }
            }

            for (uint8 i = 0; i < SLOT_BACK; ++i)
            {
                CItemArmor* armor = PChar->getEquip((SLOTTYPE)i);
                if (armor && armor->isType(ITEM_ARMOR) && armor->getRemoveSlotId() & PItem->getEquipSlotId())
                {
                    UnequipItem(PChar, i, false);
                }
            }

            switch (equipSlotID)
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
                                if ((armor != nullptr) && armor->isType(ITEM_ARMOR))
                                {
                                    if (armor->isType(ITEM_WEAPON))
                                    {
                                        CItemWeapon* PWeapon = (CItemWeapon*)armor;
                                        if (PWeapon->getSkillType() != SKILL_NON || ((CItemWeapon*)PItem)->getSkillType() == SKILL_H2H)
                                        {
                                            UnequipItem(PChar, SLOT_SUB, false);
                                        }
                                    }
                                    else
                                    {
                                        UnequipItem(PChar, SLOT_SUB, false);
                                    }
                                }
                                if (((CItemWeapon*)PItem)->getSkillType() == SKILL_H2H)
                                {
                                    PChar->look.sub = PItem->getModelId() + 0x1000;
                                }
                            }
                            break;
                        }
                        if (PChar->PAI->IsEngaged())
                        {
                            auto state = dynamic_cast<CAttackState*>(PChar->PAI->GetCurrentState());
                            if (state) state->ResetAttackTimer();
                        }
                        PChar->m_Weapons[SLOT_MAIN] = (CItemWeapon*)PItem;

                        if (!PChar->m_Weapons[SLOT_MAIN]->isTwoHanded())
                        {
                            PChar->StatusEffectContainer->DelStatusEffect(EFFECT_HASSO);
                            PChar->StatusEffectContainer->DelStatusEffect(EFFECT_SEIGAN);
                        }

                    }
                    PChar->look.main = PItem->getModelId();
                    UpdateWeaponStyle(PChar, equipSlotID, (CItemWeapon*)PItem);
                }
                break;
                case SLOT_SUB:
                {
                    CItemWeapon* weapon = (CItemWeapon*)PChar->getEquip(SLOT_MAIN);
                    if (weapon == nullptr || !weapon->isType(ITEM_WEAPON))
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
                                    UnequipItem(PChar, SLOT_MAIN, false);
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
                                    UnequipItem(PChar, SLOT_MAIN, false);
                                }
                                else if (!((CItemWeapon*)PItem)->getSkillType() == SKILL_NON)
                                {
                                    //allow Grips to be equipped
                                    return false;
                                }
                            }
                        }
                    }
                    PChar->look.sub = PItem->getModelId();
                    UpdateWeaponStyle(PChar, equipSlotID, (CItemWeapon*)PItem);
                }
                break;
                case SLOT_RANGED:
                {
                    if (PItem->isType(ITEM_WEAPON))
                    {
                        CItemWeapon* weapon = (CItemWeapon*)PChar->getEquip(SLOT_AMMO);
                        if ((weapon != nullptr) && weapon->isType(ITEM_WEAPON))
                        {
                            if (((CItemWeapon*)PItem)->getSkillType() != weapon->getSkillType() ||
                                ((CItemWeapon*)PItem)->getSubSkillType() != weapon->getSubSkillType())
                            {
                                UnequipItem(PChar, SLOT_AMMO, false);
                            }
                        }
                        PChar->m_Weapons[SLOT_RANGED] = (CItemWeapon*)PItem;
                    }
                    PChar->look.ranged = PItem->getModelId();
                    UpdateWeaponStyle(PChar, equipSlotID, (CItemWeapon*)PItem);
                }
                break;
                case SLOT_AMMO:
                {
                    if (PItem->isType(ITEM_WEAPON))
                    {
                        CItemWeapon* weapon = (CItemWeapon*)PChar->getEquip(SLOT_RANGED);
                        if ((weapon != nullptr) && weapon->isType(ITEM_WEAPON))
                        {
                            if (((CItemWeapon*)PItem)->getSkillType() != weapon->getSkillType() ||
                                ((CItemWeapon*)PItem)->getSubSkillType() != weapon->getSubSkillType())
                            {
                                UnequipItem(PChar, SLOT_RANGED, false);
                            }
                        }
                        if (PChar->equip[SLOT_RANGED] == 0)
                        {
                            PChar->look.ranged = PItem->getModelId();
                        }
                        PChar->m_Weapons[SLOT_AMMO] = (CItemWeapon*)PItem;
                        UpdateWeaponStyle(PChar, equipSlotID, (CItemWeapon*)PItem);
                    }
                }
                break;
                case SLOT_HEAD:
                {
                    PChar->look.head = PItem->getModelId();
                }
                break;
                case SLOT_BODY:
                {
                    PChar->look.body = PItem->getModelId();
                }
                break;
                case SLOT_HANDS:
                {
                    PChar->look.hands = PItem->getModelId();
                }
                break;
                case SLOT_LEGS:
                {
                    PChar->look.legs = PItem->getModelId();
                }
                break;
                case SLOT_FEET:
                {
                    PChar->look.feet = PItem->getModelId();
                }
                break;
            }
            PChar->equip[equipSlotID] = slotID;
            PChar->equipLoc[equipSlotID] = containerID;
        }
        else
        {
            ShowWarning(CL_YELLOW"Item %i is not equipable in equip slot %i\n" CL_RESET, PItem->getID(), equipSlotID);
            return false;
        }
        return true;
    }

    bool canEquipItemOnAnyJob(CCharEntity* PChar, CItemArmor* PItem)
    {
        if (PItem == nullptr)
            return true;

        for (uint8 i = 1; i < MAX_JOBTYPE; i++)
            if (PItem->getJobs() & (1 << (i - 1)) && PItem->getReqLvl() <= PChar->jobs.job[i])
                return true;
        return false;
    }

    bool hasValidStyle(CCharEntity* PChar, CItemArmor* PItem, CItemArmor* AItem)
    {
        return (PItem != nullptr && AItem != nullptr
            && (((CItemWeapon*)AItem)->getSkillType() == ((CItemWeapon*)PItem)->getSkillType())
            && HasItem(PChar, AItem->getID())
            && canEquipItemOnAnyJob(PChar, AItem));
    }

    void SetStyleLock(CCharEntity* PChar, bool isStyleLocked)
    {
        if (isStyleLocked)
        {
            for (uint8 i = 0; i < SLOT_LINK1; i++)
            {
                auto PItem = PChar->getEquip((SLOTTYPE)i);
                PChar->styleItems[i] = (PItem == nullptr) ? 0 : PItem->getID();
            }
            memcpy(&PChar->mainlook, &PChar->look, sizeof(PChar->look));
        }
        else
            for (uint8 i = 0; i < SLOT_LINK1; i++)
                PChar->styleItems[i] = 0;

        if (PChar->getStyleLocked() != isStyleLocked)
            PChar->pushPacket(new CMessageStandardPacket(isStyleLocked ? 0x10B : 0x10C));
        PChar->setStyleLocked(isStyleLocked);
    }

    void UpdateWeaponStyle(CCharEntity* PChar, uint8 equipSlotID, CItemWeapon* PItem)
    {
        if (!PChar->getStyleLocked())
            return;

        auto appearance = (CItemArmor*)itemutils::GetItem(PChar->styleItems[equipSlotID]);
        auto appearanceModel = (appearance == nullptr) ? 0 : appearance->getModelId();

        switch (equipSlotID)
        {
            case SLOT_MAIN:
                if (hasValidStyle(PChar, PItem, appearance))
                    PChar->mainlook.main = appearanceModel;
                else
                    PChar->mainlook.main = PChar->look.main;

                if (PItem == nullptr)
                    PChar->mainlook.sub = PChar->look.sub;
                else
                    switch (((CItemWeapon*)PItem)->getSkillType())
                    {
                        case SKILL_H2H:
                            PChar->mainlook.sub = appearanceModel + 0x1000;
                            break;
                        case SKILL_GSD:
                        case SKILL_GAX:
                        case SKILL_SYH:
                        case SKILL_POL:
                        case SKILL_GKT:
                        case SKILL_STF:
                            PChar->mainlook.sub = PChar->look.sub;
                            break;
                    }
                break;
            case SLOT_SUB:
                if (hasValidStyle(PChar, PItem, appearance))
                    PChar->mainlook.sub = appearanceModel;
                else
                    PChar->mainlook.sub = PChar->look.sub;
                break;
            case SLOT_RANGED:
            case SLOT_AMMO:
                // Appears as though these aren't implemented by SE.
                break;
        }
    }

    void UpdateArmorStyle(CCharEntity* PChar, uint8 equipSlotID)
    {
        if (!PChar->getStyleLocked())
            return;

        auto itemID = PChar->styleItems[equipSlotID];
        auto appearance = (CItemArmor*)itemutils::GetItem(itemID);
        auto appearanceModel = (appearance == nullptr || !HasItem(PChar, itemID)) ? 0 : appearance->getModelId();

        if (!canEquipItemOnAnyJob(PChar, appearance))
            return;

        switch (equipSlotID)
        {
            case SLOT_HEAD:
                PChar->mainlook.head = appearanceModel;
                break;
            case SLOT_BODY:
                PChar->mainlook.body = appearanceModel;
                break;
            case SLOT_HANDS:
                PChar->mainlook.hands = appearanceModel;
                break;
            case SLOT_LEGS:
                PChar->mainlook.legs = appearanceModel;
                break;
            case SLOT_FEET:
                PChar->mainlook.feet = appearanceModel;
                break;
        }
    }

    /************************************************************************
    *                                                                       *
    *                                                                       *
    *                                                                       *
    ************************************************************************/

    void EquipItem(CCharEntity* PChar, uint8 slotID, uint8 equipSlotID, uint8 containerID)
    {
        CItemArmor* PItem = (CItemArmor*)PChar->getStorage(containerID)->GetItem(slotID);

        if (PItem && PItem == PChar->getEquip((SLOTTYPE)equipSlotID))
            return;

        if (slotID == 0)
        {
            CItemArmor* PSubItem = PChar->getEquip(SLOT_SUB);

            UnequipItem(PChar, equipSlotID);

            if (equipSlotID == 0 && PSubItem && !PSubItem->IsShield())
                RemoveSub(PChar);

            PChar->pushPacket(new CEquipPacket(slotID, equipSlotID, containerID));
        }
        else
        {

            if ((PItem != nullptr) && PItem->isType(ITEM_ARMOR))
            {

                if (!PItem->isSubType(ITEM_LOCKED) && EquipArmor(PChar, slotID, equipSlotID, containerID))
                {
                    if (PItem->getScriptType() & SCRIPT_EQUIP)
                    {
                        luautils::OnItemCheck(PChar, PItem, ITEMCHECK::EQUIP, nullptr);
                        PChar->m_EquipFlag |= PItem->getScriptType();
                    }
                    if (PItem->isType(ITEM_USABLE) && ((CItemUsable*)PItem)->getCurrentCharges() != 0)
                    {
                        PItem->setAssignTime(CVanaTime::getInstance()->getVanaTime());
                        PChar->PRecastContainer->Add(RECAST_ITEM, slotID, PItem->getReuseTime() / 1000);

                        // не забываем обновить таймер при экипировке предмета

                        PChar->pushPacket(new CInventoryItemPacket(PItem, containerID, slotID));
                        PChar->pushPacket(new CInventoryFinishPacket());
                    }
                    PItem->setSubType(ITEM_LOCKED);

                    if (equipSlotID == SLOT_SUB) {
                        // If main hand is empty, check which UnarmedItem to use.
                        if (!PChar->getEquip(SLOT_MAIN) || !PChar->getEquip(SLOT_MAIN)->isType(ITEM_ARMOR))
                        {
                            CheckUnarmedWeapon(PChar);
                        }
                    }

                    PChar->addEquipModifiers(&PItem->modList, ((CItemArmor*)PItem)->getReqLvl(), equipSlotID);
                    PChar->PLatentEffectContainer->AddLatentEffects(PItem->latentList, ((CItemArmor*)PItem)->getReqLvl(), equipSlotID);
                    PChar->PLatentEffectContainer->CheckLatentsEquip(equipSlotID);
                    PChar->addPetModifiers(&PItem->petModList);

                    PChar->pushPacket(new CEquipPacket(slotID, equipSlotID, containerID));
                    PChar->pushPacket(new CInventoryAssignPacket(PItem, INV_NODROP));
                }
            }
        }
        if (equipSlotID == SLOT_MAIN || equipSlotID == SLOT_RANGED || equipSlotID == SLOT_SUB)
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

            PChar->StatusEffectContainer->DelStatusEffect(EFFECT_AFTERMATH);
            BuildingCharWeaponSkills(PChar);
            PChar->pushPacket(new CCharAbilitiesPacket(PChar));
        }

        charutils::BuildingCharSkillsTable(PChar);

        PChar->UpdateHealth();
        PChar->m_EquipSwap = true;
        PChar->updatemask |= UPDATE_LOOK;
    }

    /************************************************************************
    *                                                                       *
    *  Проверяем возможность персонажа носить экипированные на нем предметы *
    *                                                                       *
    ************************************************************************/

    void CheckValidEquipment(CCharEntity* PChar)
    {
        CItemArmor* PItem = nullptr;

        for (uint8 slotID = 0; slotID < 16; ++slotID)
        {
            PItem = PChar->getEquip((SLOTTYPE)slotID);

            if ((PItem != nullptr) && PItem->isType(ITEM_ARMOR))
            {
                if (slotID == SLOT_SUB && !charutils::hasTrait(PChar, TRAIT_DUAL_WIELD))
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
                    (PItem->getReqLvl() <= (map_config.disable_gear_scaling ?
                    PChar->GetMLevel() : PChar->jobs.job[PChar->GetMJob()])) &&
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
        SaveCharLook(PChar);
    }

    void RemoveAllEquipment(CCharEntity* PChar)
    {
        CItemArmor* PItem = nullptr;

        for (uint8 slotID = 0; slotID < 16; ++slotID)
        {
            PItem = PChar->getEquip((SLOTTYPE)slotID);

            if ((PItem != nullptr) && PItem->isType(ITEM_ARMOR))
            {
                UnequipItem(PChar, slotID);
            }
        }
        // Determines the UnarmedItem to use, since all slots are empty now.
        CheckUnarmedWeapon(PChar);

        BuildingCharWeaponSkills(PChar);
        SaveCharEquip(PChar);
        SaveCharLook(PChar);
    }

    /************************************************************************
    *                                                                       *
    *  Проверяем логику всей экипировки персонажа                           *
    *                                                                       *
    ************************************************************************/

    // позднее нужно будет сделать экипировку в структуре,
    // куда добавить битовое поле, указывающее, в какой ячейке находится экипировка с условием
    // для начала это поле избавит нас от проверки ячеек у персонажей без экипировки с условием

    void CheckEquipLogic(CCharEntity* PChar, SCRIPTTYPE ScriptType, uint32 param)
    {
        if (!(PChar->m_EquipFlag & ScriptType))
            return;

        for (uint8 slotID = 0; slotID < 16; ++slotID)
        {
            CItem* PItem = PChar->getEquip((SLOTTYPE)slotID);

            if ((PItem != nullptr) && PItem->isType(ITEM_ARMOR))
            {
                if (((CItemArmor*)PItem)->getScriptType() & ScriptType)
                {
                    luautils::OnItemCheck(PChar, PItem, static_cast<ITEMCHECK>(param), nullptr);
                }
            }
        }
    }

    /************************************************************************
    *                                                                       *
    *  Load the Characters weapon skill list                                *
    *                                                                       *
    ************************************************************************/

    void BuildingCharWeaponSkills(CCharEntity* PChar)
    {
        memset(&PChar->m_WeaponSkills, 0, sizeof(PChar->m_WeaponSkills));

        JOBTYPE curMainJob = PChar->GetMJob();
        JOBTYPE curSubJob = PChar->GetSJob();

        CItemWeapon* PItem;
        int main_ws = 0;
        int range_ws = 0;
        int main_ws_dyn = 0;
        int range_ws_dyn = 0;

        bool isInDynamis = PChar->isInDynamis();

        for (auto&& slot : {std::make_tuple(SLOT_MAIN, std::ref(main_ws), std::ref(main_ws_dyn)),
            std::make_tuple(SLOT_RANGED, std::ref(range_ws), std::ref(range_ws_dyn))})
        {
            if (PChar->m_Weapons[std::get<0>(slot)])
            {
                PItem = PChar->m_Weapons[std::get<0>(slot)];

                std::get<1>(slot) = battleutils::GetScaledItemModifier(PChar, PItem, Mod::ADDS_WEAPONSKILL);
                std::get<2>(slot) = battleutils::GetScaledItemModifier(PChar, PItem, Mod::ADDS_WEAPONSKILL_DYN);
            }
        }

        //add in melee ws
        uint8 skill = PChar->m_Weapons[SLOT_MAIN]->getSkillType();
        auto& WeaponSkillList = battleutils::GetWeaponSkills(skill);
        for (auto&& PSkill : WeaponSkillList)
        {
            if (battleutils::CanUseWeaponskill(PChar, PSkill) ||
                PSkill->getID() == main_ws ||
                (isInDynamis && (PSkill->getID() == main_ws_dyn)))
            {
                addWeaponSkill(PChar, PSkill->getID());
            }
        }

        //add in ranged ws
        PItem = (CItemWeapon*)PChar->getEquip(SLOT_RANGED);
        if (PItem != nullptr && PItem->isType(ITEM_WEAPON) && PItem->getSkillType() != SKILL_THR)
        {
            skill = PChar->m_Weapons[SLOT_RANGED]->getSkillType();
            auto& WeaponSkillList = battleutils::GetWeaponSkills(skill);
            for (auto&& PSkill : WeaponSkillList)
            {
                if ((battleutils::CanUseWeaponskill(PChar, PSkill)) ||
                    PSkill->getID() == range_ws ||
                    (isInDynamis && (PSkill->getID() == range_ws_dyn)))
                {
                    addWeaponSkill(PChar, PSkill->getID());
                }
            }
        }
    }

    void BuildingCharPetAbilityTable(CCharEntity* PChar, CPetEntity* PPet, uint32 PetID) {
        DSP_DEBUG_BREAK_IF(PPet == nullptr || PChar == nullptr);

        memset(&PChar->m_PetCommands, 0, sizeof(PChar->m_PetCommands));

        if (PetID == 0) {//technically Fire Spirit but we're using this to null the abilities shown
            PChar->pushPacket(new CCharAbilitiesPacket(PChar));
            return;
        }

        if (PChar->GetMJob() == JOB_SMN || PChar->GetSJob() == JOB_SMN)
        {
            std::vector<CAbility*> AbilitiesList = ability::GetAbilities(JOB_SMN);

            for (size_t i = 0; i < AbilitiesList.size(); ++i)
            {
                CAbility* PAbility = AbilitiesList.at(i);

                if (PPet->GetMLevel() >= PAbility->getLevel() && PetID >= 8 && PetID <= 20 && CheckAbilityAddtype(PChar, PAbility))
                {
                    if (PetID == 8)
                    {
                        if (PAbility->getID() >= 496 && PAbility->getID() < 505)
                        {
                            addPetAbility(PChar, PAbility->getID() - 496);
                        }
                    }
                    else if (PetID >= 9 && PetID <= 15)
                    {
                        if (PAbility->getID() >= (496 + ((PetID - 8) * 16)) && PAbility->getID() < (496 + ((PetID - 7) * 16)))
                        {
                            addPetAbility(PChar, PAbility->getID() - 496);
                        }
                    }
                    else if (PetID == 16)
                    {
                        if (PAbility->getID() >= 640 && PAbility->getID() <= 656)
                        {
                            addPetAbility(PChar, PAbility->getID() - 496);
                        }
                    }
                    else if (PetID == 20)
                    {
                        if (PAbility->getID() >= 505 && PAbility->getID() <= 512)
                        {
                            addPetAbility(PChar, PAbility->getID() - 496);
                        }
                    }
                }
            }
        }
        if (PPet->getPetType() == PETTYPE_JUG_PET)
        {
            auto skillList {battleutils::GetMobSkillList(PPet->m_MobSkillList)};
            for (auto&& abilityid : skillList)
            {
                addPetAbility(PChar, abilityid - 496);
            }
        }
        PChar->pushPacket(new CCharAbilitiesPacket(PChar));
    }

    /************************************************************************
    *                                                                       *
    *  Собираем рабочую таблицу способностей персонажа. С нулевым уровнем   *
    *  должны быть 2h способности. По этому условию отсеиваем их для sjob   *
    *                                                                       *
    ************************************************************************/

    void BuildingCharAbilityTable(CCharEntity* PChar)
    {
        std::vector<CAbility*> AbilitiesList;

        memset(&PChar->m_Abilities, 0, sizeof(PChar->m_Abilities));

        AbilitiesList = ability::GetAbilities(PChar->GetMJob());

        for (size_t i = 0; i < AbilitiesList.size(); ++i)
        {
            CAbility* PAbility = AbilitiesList.at(i);

            if (PAbility == nullptr) {
                continue;
            }

            if (PChar->GetMLevel() >= PAbility->getLevel())
            {
                if (PAbility->getID() < 496 && PAbility->getID() != ABILITY_PET_COMMANDS && CheckAbilityAddtype(PChar, PAbility))
                {
                    addAbility(PChar, PAbility->getID());
                    Charge_t* charge = ability::GetCharge(PChar, PAbility->getRecastId());
                    auto chargeTime = 0;
                    auto maxCharges = 0;
                    if (charge)
                    {
                        chargeTime = charge->chargeTime - PChar->PMeritPoints->GetMeritValue((MERIT_TYPE)charge->merit, PChar);
                        maxCharges = charge->maxCharges;
                    }
                    if (!PChar->PRecastContainer->Has(RECAST_ABILITY, PAbility->getRecastId()))
                    {
                        PChar->PRecastContainer->Add(RECAST_ABILITY, PAbility->getRecastId(), 0, chargeTime, maxCharges);
                    }
                }
            }
            else {
                break;
            }
        }

        //To stop a character with no SJob to receive the traits with job = 0 in the DB.
        if (PChar->GetSJob() == JOB_NON) {
            return;
        }

        AbilitiesList = ability::GetAbilities(PChar->GetSJob());

        for (size_t i = 0; i < AbilitiesList.size(); ++i)
        {
            CAbility* PAbility = AbilitiesList.at(i);

            if (PChar->GetSLevel() >= PAbility->getLevel())
            {
                if (PAbility == nullptr) {
                    continue;
                }

                if (PAbility->getLevel() != 0 && PAbility->getID() < 496)
                {
                    if (PAbility->getID() != ABILITY_PET_COMMANDS && CheckAbilityAddtype(PChar, PAbility) && !(PAbility->getAddType() & ADDTYPE_MAIN_ONLY))
                    {
                        addAbility(PChar, PAbility->getID());
                        Charge_t* charge = ability::GetCharge(PChar, PAbility->getRecastId());
                        auto chargeTime = 0;
                        auto maxCharges = 0;
                        if (charge)
                        {
                            chargeTime = charge->chargeTime - PChar->PMeritPoints->GetMeritValue((MERIT_TYPE)charge->merit, PChar);
                            maxCharges = charge->maxCharges;
                        }
                        if (!PChar->PRecastContainer->Has(RECAST_ABILITY, PAbility->getRecastId()))
                        {
                            PChar->PRecastContainer->Add(RECAST_ABILITY, PAbility->getRecastId(), 0, chargeTime, maxCharges);
                        }
                    }
                }
            }
            else {
                break;
            }
        }
    }

    /************************************************************************
    *                                                                       *
    *  Собираем рабочую таблицу умений персонажа на основе реальной.        *
    *  Добавляем ограничения, отмечаем умения основной профессии (rank != 0)*
    *                                                                       *
    ************************************************************************/

    void BuildingCharSkillsTable(CCharEntity* PChar)
    {
        MERIT_TYPE skillMerit[] = {MERIT_H2H, MERIT_DAGGER, MERIT_SWORD, MERIT_GSWORD, MERIT_AXE, MERIT_GAXE, MERIT_SCYTHE, MERIT_POLEARM, MERIT_KATANA, MERIT_GKATANA, MERIT_CLUB,
            MERIT_STAFF, MERIT_AUTOMATON_SKILLS, MERIT_AUTOMATON_SKILLS, MERIT_AUTOMATON_SKILLS, MERIT_ARCHERY, MERIT_MARKSMANSHIP, MERIT_THROWING, MERIT_GUARDING, MERIT_EVASION,
            MERIT_SHIELD, MERIT_PARRYING, MERIT_DIVINE, MERIT_HEALING, MERIT_ENHANCING, MERIT_ENFEEBLING, MERIT_ELEMENTAL, MERIT_DARK, MERIT_SUMMONING, MERIT_NINJITSU, MERIT_SINGING,
            MERIT_STRING, MERIT_WIND, MERIT_BLUE, MERIT_GEO, MERIT_HANDBELL};

        uint8 meritIndex = 0;

        for (int32 i = 1; i < 48; ++i)
        {
            //ignore unused skills
            if((i >= 13 && i <= 21) || (i >= 46 && i <= 47))
            {
                PChar->WorkingSkills.skill[i] = 0x8000;
                continue;
            }
            uint16 MaxMSkill = battleutils::GetMaxSkill((SKILLTYPE)i, PChar->GetMJob(), PChar->GetMLevel());
            uint16 MaxSSkill = battleutils::GetMaxSkill((SKILLTYPE)i, PChar->GetSJob(), PChar->GetSLevel());
            uint16 skillBonus = 0;

            // apply arts bonuses
            if ((i >= 32 && i <= 35 && PChar->StatusEffectContainer->HasStatusEffect({EFFECT_LIGHT_ARTS, EFFECT_ADDENDUM_WHITE})) ||
                (i >= 35 && i <= 37 && PChar->StatusEffectContainer->HasStatusEffect({EFFECT_DARK_ARTS, EFFECT_ADDENDUM_BLACK})))
            {
                uint16 artsSkill = battleutils::GetMaxSkill(SKILL_ENH, JOB_RDM, PChar->GetMLevel()); //B+ skill
                uint16 skillCapD = battleutils::GetMaxSkill((SKILLTYPE)i, JOB_SCH, PChar->GetMLevel()); // D skill cap
                uint16 skillCapE = battleutils::GetMaxSkill(SKILL_DRK, JOB_RDM, PChar->GetMLevel()); // E skill cap
                auto currentSkill = std::clamp<uint16>((PChar->RealSkills.skill[i] / 10), 0, std::max(MaxMSkill, MaxSSkill)); // working skill before bonuses
                uint16 artsBaseline = 0; // Level based baseline to which to raise skills
                uint8 mLevel = PChar->GetMLevel();
                if (mLevel < 51)
                {
                    artsBaseline = (uint16)(5 + 2.7 * (mLevel - 1));
                }
                else if ((mLevel > 50) && (mLevel < 61))
                {
                    artsBaseline = (uint16)(137 + 4.7 * (mLevel - 50));
                }
                else if ((mLevel > 60) && (mLevel < 71))
                {
                    artsBaseline = (uint16)(184 + 3.7 * (mLevel - 60));
                }
                else if ((mLevel > 70) && (mLevel < 75))
                {
                    artsBaseline = (uint16)(221 + 5.0 * (mLevel - 70));
                }
                else if (mLevel >= 75)
                {
                    artsBaseline = skillCapD + 36;
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

                if (PChar->StatusEffectContainer->HasStatusEffect({EFFECT_LIGHT_ARTS, EFFECT_ADDENDUM_WHITE}))
                {
                    skillBonus += PChar->getMod(Mod::LIGHT_ARTS_SKILL);
                }
                else
                {
                    skillBonus += PChar->getMod(Mod::DARK_ARTS_SKILL);
                }
            }
            else if (i >= 22 && i <= 24)
            {
                if (PChar->PAutomaton)
                {
                    MaxMSkill = battleutils::GetMaxSkill(1, PChar->GetMLevel()); // A+ capped down to the Automaton's rating
                }
            }

            skillBonus += PChar->PMeritPoints->GetMeritValue(skillMerit[meritIndex], PChar);
            meritIndex++;

            skillBonus += PChar->getMod(static_cast<Mod>(i + 79));

            PChar->WorkingSkills.rank[i] = battleutils::GetSkillRank((SKILLTYPE)i, PChar->GetMJob());

            if (MaxMSkill != 0)
            {
                auto cap {PChar->RealSkills.skill[i] / 10 >= MaxMSkill};
                PChar->WorkingSkills.skill[i] = std::max(0, cap ? skillBonus + MaxMSkill : skillBonus + PChar->RealSkills.skill[i] / 10);
                if (cap) PChar->WorkingSkills.skill[i] |= 0x8000;
            }
            else if (MaxSSkill != 0)
            {
                auto cap {PChar->RealSkills.skill[i] / 10 >= MaxSSkill};
                PChar->WorkingSkills.skill[i] = std::max(0, cap ? skillBonus + MaxSSkill : skillBonus + PChar->RealSkills.skill[i] / 10);
                if (cap) PChar->WorkingSkills.skill[i] |= 0x8000;
            }
            else
            {
                PChar->WorkingSkills.skill[i] = std::max<uint16>(0, skillBonus) | 0x8000;
            }
        }

        for (int32 i = 48; i < 58; ++i)
        {
            PChar->WorkingSkills.skill[i] = (PChar->RealSkills.skill[i] / 10) * 0x20 + PChar->RealSkills.rank[i];

            if ((PChar->RealSkills.rank[i] + 1) * 100 <= PChar->RealSkills.skill[i])
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

        battleutils::AddTraits(PChar, traits::GetTraits(PChar->GetMJob()), PChar->GetMLevel());
        battleutils::AddTraits(PChar, traits::GetTraits(PChar->GetSJob()), PChar->GetSLevel());

        if (PChar->GetMJob() == JOB_BLU || PChar->GetSJob() == JOB_BLU)
        {
            blueutils::CalculateTraits(PChar);
        }

        PChar->delModifier(Mod::MEVA, PChar->m_magicEvasion);

        PChar->m_magicEvasion = battleutils::GetMaxSkill(SKILL_ELE, JOB_RDM, PChar->GetMLevel());
        PChar->addModifier(Mod::MEVA, PChar->m_magicEvasion);
    }

    /************************************************************************
    *                                                                       *
    *  Пытаемся увеличить значение умения                                   *
    *                                                                       *
    ************************************************************************/

    void TrySkillUP(CCharEntity* PChar, SKILLTYPE SkillID, uint8 lvl)
    {

        // This usually happens after a crash
        DSP_DEBUG_BREAK_IF(SkillID >= MAX_SKILLTYPE);   // выход за пределы допустимых умений

        if ((PChar->WorkingSkills.rank[SkillID] != 0) && !(PChar->WorkingSkills.skill[SkillID] & 0x8000))
        {
            uint16 CurSkill = PChar->RealSkills.skill[SkillID];
            uint16 MaxSkill = battleutils::GetMaxSkill(SkillID, PChar->GetMJob(), std::min(PChar->GetMLevel(), lvl));

            int16  Diff = MaxSkill - CurSkill / 10;
            double SkillUpChance = Diff / 5.0 + map_config.skillup_chance_multiplier * (2.0 - log10(1.0 + CurSkill / 100));

            double random = dsprand::GetRandomNumber(1.);

            if (SkillUpChance > 0.5)
            {
                SkillUpChance = 0.5;
            }

            // Check for skillup% bonus. https://www.bg-wiki.com/bg/Category:Skill_Up_Food
            // Assuming multiplicative even though rate is already a % because 0.5 + 0.8 would be > 1.
            if ((SkillID >= 1 && SkillID <= 12) || (SkillID >= 25 && SkillID <= 31))
            // if should effect automaton replace the above with: (SkillID >= 1 && SkillID <= 31)
            {
                SkillUpChance *= ((100.f + PChar->getMod(Mod::COMBAT_SKILLUP_RATE)) / 100.f);
            }
            else if (SkillID >= 32 && SkillID <= 44)
            {
                SkillUpChance *= ((100.f + PChar->getMod(Mod::MAGIC_SKILLUP_RATE)) / 100.f);
            }

            if (Diff > 0 && random < SkillUpChance)
            {
                double chance = 0;
                uint8  SkillAmount = 1;
                uint8  tier = std::min(1 + (Diff / 5), 5);

                for (uint8 i = 0; i < 4; ++i) // 1 + 4 возможных дополнительных (максимум 5)
                {
                    random = dsprand::GetRandomNumber(1.);

                    switch (tier)
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
                    SkillAmount += (uint8)(SkillAmount * map_config.skillup_amount_multiplier);
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

                if ((CurSkill / 10) < (CurSkill + SkillAmount) / 10) //if gone up a level
                {
                    PChar->WorkingSkills.skill[SkillID] += 1;
                    PChar->pushPacket(new CCharSkillsPacket(PChar));
                    PChar->pushPacket(new CMessageBasicPacket(PChar, PChar, SkillID, (CurSkill + SkillAmount) / 10, 53));

                    CheckWeaponSkill(PChar, SkillID);
                    /* ignoring this for now
                    if (SkillID >= 1 && SkillID <= 12)
                    {
                    PChar->addModifier(Mod::ATT, 1);
                    PChar->addModifier(Mod::ACC, 1);
                    }
                    */
                }
                SaveCharSkills(PChar, SkillID);
            }
        }
    }

    /************************************************************************
    *                                                                       *
    *  When skill level gained check for weapon skill                       *
    *                                                                       *
    ************************************************************************/

    void CheckWeaponSkill(CCharEntity* PChar, uint8 skill)
    {
        if (PChar->m_Weapons[SLOT_MAIN]->getSkillType() != skill)
        {
            return;
        }
        auto& WeaponSkillList = battleutils::GetWeaponSkills(skill);
        uint16 curSkill = PChar->RealSkills.skill[skill] / 10;

        for (auto&& PSkill : WeaponSkillList)
        {
            if (curSkill == PSkill->getSkillLevel() && (battleutils::CanUseWeaponskill(PChar, PSkill)))
            {
                addWeaponSkill(PChar, PSkill->getID());
                PChar->pushPacket(new CMessageBasicPacket(PChar, PChar, PSkill->getID(), PSkill->getID(), 45));
                PChar->pushPacket(new CCharAbilitiesPacket(PChar));
            }
        }
    }

    /************************************************************************
    *                                                                       *
    *  Методы для работы с ключевыми предметами                             *
    *                                                                       *
    ************************************************************************/

    bool hasKeyItem(CCharEntity* PChar, uint16 KeyItemID)
    {
        auto table = KeyItemID / 512;
        return PChar->keys.tables[table].keyList[KeyItemID % 512];
    }

    bool seenKeyItem(CCharEntity* PChar, uint16 KeyItemID)
    {
        auto table = KeyItemID / 512;
        return PChar->keys.tables[table].seenList[KeyItemID % 512];
    }

    void unseenKeyItem(CCharEntity* PChar, uint16 KeyItemID)
    {
        auto table = KeyItemID / 512;
        PChar->keys.tables[table].seenList[KeyItemID % 512] = false;
    }

    void addKeyItem(CCharEntity* PChar, uint16 KeyItemID)
    {
        auto table = KeyItemID / 512;
        PChar->keys.tables[table].keyList[KeyItemID % 512] = true;
    }

    void delKeyItem(CCharEntity* PChar, uint16 KeyItemID)
    {
        auto table = KeyItemID / 512;
        PChar->keys.tables[table].keyList[KeyItemID % 512] = false;
    }

    /************************************************************************
    *                                                                       *
    *  Методы для работы с заклинаниями                                     *
    *                                                                       *
    ************************************************************************/

    int32 hasSpell(CCharEntity* PChar, uint16 SpellID)
    {
        return PChar->m_SpellList[SpellID];
    }

    int32 addSpell(CCharEntity* PChar, uint16 SpellID)
    {
        if (!hasSpell(PChar, SpellID)) {
            PChar->m_SpellList[SpellID] = true;
            return 1;
        }
        return 0;
    }

    int32 delSpell(CCharEntity* PChar, uint16 SpellID)
    {
        if (hasSpell(PChar, SpellID)) {
            PChar->m_SpellList[SpellID] = false;
            return 1;
        }
        return 0;
    }

    /************************************************************************
    *                                                                       *
    *  Learned abilities (corsair rolls)                                    *
    *                                                                       *
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
    *  Learned weaponskills                                                 *
    *                                                                       *
    ************************************************************************/

    bool hasLearnedWeaponskill(CCharEntity* PChar, uint8 wsid)
    {
        return PChar->m_LearnedWeaponskills[wsid];
    }

    void addLearnedWeaponskill(CCharEntity* PChar, uint8 wsid)
    {
        PChar->m_LearnedWeaponskills[wsid] = true;
    }

    void delLearnedWeaponskill(CCharEntity* PChar, uint8 wsid)
    {
        PChar->m_LearnedWeaponskills[wsid] = false;
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
    *                                                                       *
    *  Методы для работы с основными способностями                          *
    *                                                                       *
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
    *                                                                       *
    *  Weapon Skill functions                                               *
    *                                                                       *
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
    *                                                                       *
    *  Trait Functions                                                      *
    *                                                                       *
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
    *       Pet Command Functions
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
    *  Инициализируем таблицу опыта                                         *
    *                                                                       *
    ************************************************************************/

    void LoadExpTable()
    {
        const char* fmtQuery = "SELECT r1,r2,r3,r4,r5,r6,r7,r8,r9,r10,r11,r12,r13,r14,r15,r16,r17,r18,r19,r20 "
            "FROM exp_table "
            "ORDER BY level ASC "
            "LIMIT 50";

        int32 ret = Sql_Query(SqlHandle, fmtQuery);

        if (ret != SQL_ERROR && Sql_NumRows(SqlHandle) != 0)
        {
            for (uint32 x = 0; x < 50 && Sql_NextRow(SqlHandle) == SQL_SUCCESS; ++x)
            {
                for (uint32 y = 0; y < 20; ++y)
                {
                    g_ExpTable[x][y] = (uint16)Sql_GetIntData(SqlHandle, y);
                }
            }
        }

        ret = Sql_Query(SqlHandle, "SELECT level, exp FROM exp_base LIMIT 100;");

        if (ret != SQL_ERROR && Sql_NumRows(SqlHandle) != 0)
        {
            while (Sql_NextRow(SqlHandle) == SQL_SUCCESS)
            {
                uint8 level = (uint8)Sql_GetIntData(SqlHandle, 0) - 1;

                if (level < 100)
                {
                    g_ExpPerLevel[level] = (uint16)Sql_GetIntData(SqlHandle, 1);
                }
            }
        }
    }

    /************************************************************************
    *                                                                       *
    *  Узнаем реальное количество опыта, который персонаж получит с цели    *
    *                                                                       *
    ************************************************************************/

    uint32 GetRealExp(uint8 charlvl, uint8 moblvl)
    {
        int32 levelDif = moblvl - charlvl + 34;

        if ((charlvl > 0) && (charlvl < 100))
        {
            return g_ExpTable[std::clamp(levelDif, 0, 49)][(charlvl - 1) / 5];
        }
        return 0;
    }

    /************************************************************************
    *                                                                       *
    *  Узнаем количество опыта, необходимое для получения следующего уровня *
    *                                                                       *
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
    *                                                                       *
    *  Distributes gil to party members.                                    *
    *                                                                       *
    ************************************************************************/

    // TODO: REALISATION MUST BE IN TREASUREPOOL

    void DistributeGil(CCharEntity* PChar, CMobEntity* PMob)
    {
        //work out the amount of gil to give (guessed; replace with testing)
        uint32 gil = PMob->GetRandomGil();
        uint32 gBonus = 0;

        if (map_config.all_mobs_gil_bonus > 0)
        {
            gBonus = map_config.all_mobs_gil_bonus*PMob->GetMLevel();
            gil += std::clamp<uint32>(gBonus, 1, map_config.max_gil_bonus);
        }

        // Distribute gil to player/party/alliance
        if (PChar->PParty != nullptr)
        {
            std::vector<CCharEntity*> members;

            // First gather all valid party members
            PChar->ForAlliance([PMob, &members](CBattleEntity* PPartyMember)
            {
                if (PPartyMember->getZone() == PMob->getZone() && distanceSquared(PPartyMember->loc.p, PMob->loc.p) < square(100.f))
                {
                    members.push_back((CCharEntity*)PPartyMember);
                }
            });

            // all members might not be in range
            if (members.size() > 0)
            {
                // distribute gil
                int32 gilPerPerson = static_cast<int32>(gil / members.size());
                for (auto PMember : members)
                {
                    // Check for gilfinder
                    gilPerPerson += gilPerPerson * PMember->getMod(Mod::GILFINDER) / 100;
                    UpdateItem(PMember, LOC_INVENTORY, 0, gilPerPerson);
                    PMember->pushPacket(new CMessageBasicPacket(PMember, PMember, gilPerPerson, 0, 565));
                }
            }
        }
        else if (distanceSquared(PChar->loc.p, PMob->loc.p) < square(100.f))
        {
            // Check for gilfinder
            gil += gil * PChar->getMod(Mod::GILFINDER) / 100;
            UpdateItem(PChar, LOC_INVENTORY, 0, static_cast<int32>(gil));
            PChar->pushPacket(new CMessageBasicPacket(PChar, PChar, static_cast<int32>(gil), 0, 565));
        }
    }

    /************************************************************************
    *                                                                       *
    *  Allocate experience points                                           *
    *                                                                       *
    ************************************************************************/

    void DistributeExperiencePoints(CCharEntity* PChar, CMobEntity* PMob)
    {
        auto pcinzone = 0;
        uint8 minlevel = 0, maxlevel = PChar->GetMLevel();
        REGIONTYPE region = PChar->loc.zone->GetRegionID();

        if (PChar->PParty != nullptr)
        {
            if (PChar->PParty->GetSyncTarget() != nullptr)
            {
                if (distance(PMob->loc.p, PChar->PParty->GetSyncTarget()->loc.p) >= 100 || PChar->PParty->GetSyncTarget()->health.hp == 0)
                {
                    PChar->ForParty([&PMob](CBattleEntity* PMember) {
                        if (PMember->getZone() == PMob->getZone() && distance(PMember->loc.p, PMob->loc.p) < 100)
                        {
                            auto PChar = static_cast<CCharEntity*>(PMember);
                            PChar->pushPacket(new CMessageBasicPacket(PChar, PChar, 0, 0, 545));
                        }
                    });
                    return;
                }
            }
        }

        PChar->ForAlliance([&pcinzone, &PMob, &minlevel, &maxlevel](CBattleEntity* PMember) {
            if (PMember->getZone() == PMob->getZone() && distance(PMember->loc.p, PMob->loc.p) < 100)
            {
                if (PMember->PPet != nullptr && PMember->PPet->GetMLevel() > maxlevel && PMember->PPet->objtype != TYPE_PET)
                {
                    maxlevel = PMember->PPet->GetMLevel();
                }
                if (PMember->GetMLevel() > maxlevel)
                {
                    maxlevel = PMember->GetMLevel();
                }
                else if (PMember->GetMLevel() < minlevel)
                {
                    minlevel = PMember->GetMLevel();
                }
                pcinzone++;
            }
        });

        PChar->ForAlliance([&PMob, &region, &minlevel, &maxlevel, &pcinzone](CBattleEntity* PPartyMember) {
            auto PMember = static_cast<CCharEntity*>(PPartyMember);
            uint32 baseexp = 0;
            auto exp = 0.f;
            float permonstercap, monsterbonus = 1.0f;
            bool chainactive = false;
            if (PMob->m_HiPCLvl > maxlevel) maxlevel = PMob->m_HiPCLvl;
            baseexp = GetRealExp(maxlevel, PMob->GetMLevel());
            if (baseexp != 0)
            {
                if (PMember->getZone() == PMob->getZone())
                {
                    if (map_config.exp_party_gap_penalties == 1)
                    {
                        if (maxlevel > 50 || maxlevel > (PMember->GetMLevel() + 7))
                        {
                            exp = (float)baseexp*(float)((float)(PMember->GetMLevel()) / (float)(maxlevel));
                        }
                        else
                        {
                            exp = (float)baseexp*(float)((float)(GetExpNEXTLevel(PMember->GetMLevel())) / (float)(GetExpNEXTLevel(maxlevel)));
                        }
                    }
                    else
                    {
                        exp = (float)baseexp;
                    }

                    if (PMember->StatusEffectContainer->HasStatusEffect(EFFECT_SIGNET) && (region >= 0 && region <= 22))
                    {
                        switch (pcinzone)
                        {
                            case 1: exp *= 1.00f; break;
                            case 2: exp *= 0.75f; break;
                            case 3: exp *= 0.55f; break;
                            case 4: exp *= 0.45f; break;
                            case 5: exp *= 0.39f; break;
                            case 6: exp *= 0.35f; break;
                            default: exp *= (1.8f / pcinzone); break;
                        }
                    }
                    else if (PMember->StatusEffectContainer->HasStatusEffect(EFFECT_SANCTION) && (region >= 28 && region <= 32))
                    {
                        switch (pcinzone)
                        {
                            case 1: exp *= 1.00f; break;
                            case 2: exp *= 0.75f; break;
                            case 3: exp *= 0.55f; break;
                            case 4: exp *= 0.45f; break;
                            case 5: exp *= 0.39f; break;
                            case 6: exp *= 0.35f; break;
                            default: exp *= (1.8f / pcinzone); break;
                        }

                    }
                    else
                    {
                        switch (pcinzone)
                        {
                            case 1: exp *= 1.00f; break;
                            case 2: exp *= 0.60f; break;
                            case 3: exp *= 0.45f; break;
                            case 4: exp *= 0.40f; break;
                            case 5: exp *= 0.37f; break;
                            case 6: exp *= 0.35f; break;
                            default: exp *= (1.8f / pcinzone); break;
                        }
                    }

                    if (PMob->getMobMod(MOBMOD_EXP_BONUS))
                    {
                        monsterbonus = 1 + (float)PMob->getMobMod(MOBMOD_EXP_BONUS) / 100.0f;
                        exp *= monsterbonus;
                    }

                    permonstercap = ((PMember->PParty != nullptr && pcinzone > 1) ? 1.35f : 1.15f);

                    if (PMember->GetMLevel() <= 50)
                    {
                        if (exp > (200 * permonstercap)) exp = 200 * permonstercap;
                    }
                    else if (PMember->GetMLevel() <= 60)
                    {
                        if (exp > (250 * permonstercap)) exp = 250 * permonstercap;
                    }
                    else if (exp > (300 * permonstercap))
                    {
                        exp = 300 * permonstercap;
                    }

                    if (PMember->expChain.chainTime > gettick() || PMember->expChain.chainTime == 0)
                    {
                        chainactive = true;
                        switch (PMember->expChain.chainNumber)
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
                        if (PMember->GetMLevel() <= 10) PMember->expChain.chainTime = gettick() + 50000;
                        else if (PMember->GetMLevel() <= 20) PMember->expChain.chainTime = gettick() + 100000;
                        else if (PMember->GetMLevel() <= 30) PMember->expChain.chainTime = gettick() + 150000;
                        else if (PMember->GetMLevel() <= 40) PMember->expChain.chainTime = gettick() + 200000;
                        else if (PMember->GetMLevel() <= 50) PMember->expChain.chainTime = gettick() + 250000;
                        else if (PMember->GetMLevel() <= 60) PMember->expChain.chainTime = gettick() + 300000;
                        else PMember->expChain.chainTime = gettick() + 360000;
                        chainactive = false;
                        PMember->expChain.chainNumber = 1;
                    }

                    if (chainactive && PMember->GetMLevel() <= 10)
                    {
                        switch (PMember->expChain.chainNumber)
                        {
                            case 0: PMember->expChain.chainTime = gettick() + 50000; break;
                            case 1: PMember->expChain.chainTime = gettick() + 40000; break;
                            case 2: PMember->expChain.chainTime = gettick() + 30000; break;
                            case 3: PMember->expChain.chainTime = gettick() + 20000; break;
                            case 4: PMember->expChain.chainTime = gettick() + 10000; break;
                            case 5: PMember->expChain.chainTime = gettick() + 6000; break;
                            default: PMember->expChain.chainTime = gettick() + 2000; break;
                        }
                    }
                    else if (chainactive && PMember->GetMLevel() <= 20)
                    {
                        switch (PMember->expChain.chainNumber)
                        {
                            case 0: PMember->expChain.chainTime = gettick() + 100000; break;
                            case 1: PMember->expChain.chainTime = gettick() + 80000; break;
                            case 2: PMember->expChain.chainTime = gettick() + 60000; break;
                            case 3: PMember->expChain.chainTime = gettick() + 40000; break;
                            case 4: PMember->expChain.chainTime = gettick() + 20000; break;
                            case 5: PMember->expChain.chainTime = gettick() + 8000; break;
                            default: PMember->expChain.chainTime = gettick() + 4000; break;
                        }
                    }
                    else if (chainactive && PMember->GetMLevel() <= 30)
                    {
                        switch (PMember->expChain.chainNumber)
                        {
                            case 0: PMember->expChain.chainTime = gettick() + 150000; break;
                            case 1: PMember->expChain.chainTime = gettick() + 120000; break;
                            case 2: PMember->expChain.chainTime = gettick() + 90000; break;
                            case 3: PMember->expChain.chainTime = gettick() + 60000; break;
                            case 4: PMember->expChain.chainTime = gettick() + 30000; break;
                            case 5: PMember->expChain.chainTime = gettick() + 10000; break;
                            default: PMember->expChain.chainTime = gettick() + 5000; break;
                        }
                    }
                    else if (chainactive && PMember->GetMLevel() <= 40)
                    {
                        switch (PMember->expChain.chainNumber)
                        {
                            case 0: PMember->expChain.chainTime = gettick() + 200000; break;
                            case 1: PMember->expChain.chainTime = gettick() + 160000; break;
                            case 2: PMember->expChain.chainTime = gettick() + 120000; break;
                            case 3: PMember->expChain.chainTime = gettick() + 80000; break;
                            case 4: PMember->expChain.chainTime = gettick() + 40000; break;
                            case 5: PMember->expChain.chainTime = gettick() + 40000; break;
                            default: PMember->expChain.chainTime = gettick() + 30000; break;
                        }
                    }
                    else if (chainactive && PMember->GetMLevel() <= 50)
                    {
                        switch (PMember->expChain.chainNumber)
                        {
                            case 0: PMember->expChain.chainTime = gettick() + 250000; break;
                            case 1: PMember->expChain.chainTime = gettick() + 200000; break;
                            case 2: PMember->expChain.chainTime = gettick() + 150000; break;
                            case 3: PMember->expChain.chainTime = gettick() + 100000; break;
                            case 4: PMember->expChain.chainTime = gettick() + 50000; break;
                            case 5: PMember->expChain.chainTime = gettick() + 50000; break;
                            default: PMember->expChain.chainTime = gettick() + 50000; break;
                        }
                    }
                    else if (chainactive && PMember->GetMLevel() <= 60)
                    {
                        switch (PMember->expChain.chainNumber)
                        {
                            case 0: PMember->expChain.chainTime = gettick() + 300000; break;
                            case 1: PMember->expChain.chainTime = gettick() + 240000; break;
                            case 2: PMember->expChain.chainTime = gettick() + 180000; break;
                            case 3: PMember->expChain.chainTime = gettick() + 120000; break;
                            case 4: PMember->expChain.chainTime = gettick() + 90000; break;
                            case 5: PMember->expChain.chainTime = gettick() + 60000; break;
                            default: PMember->expChain.chainTime = gettick() + 60000; break;
                        }
                    }
                    else if (chainactive)
                    {
                        switch (PMember->expChain.chainNumber)
                        {
                            case 0: PMember->expChain.chainTime = gettick() + 360000; break;
                            case 1: PMember->expChain.chainTime = gettick() + 300000; break;
                            case 2: PMember->expChain.chainTime = gettick() + 240000; break;
                            case 3: PMember->expChain.chainTime = gettick() + 165000; break;
                            case 4: PMember->expChain.chainTime = gettick() + 105000; break;
                            case 5: PMember->expChain.chainTime = gettick() + 60000; break;
                            default: PMember->expChain.chainTime = gettick() + 60000; break;
                        }
                    }
                    exp = charutils::AddExpBonus(PMember, exp);

                    // pet or companion exp penalty needs to be added here

                    if (distance(PMember->loc.p, PMob->loc.p) > 100)
                    {
                        PMember->pushPacket(new CMessageBasicPacket(PMember, PMember, 0, 0, 37));
                        return;
                    }
                    uint16 Pzone = PMember->getZone();
                    if (PMob->m_Type == MOBTYPE_NORMAL && ((Pzone > 0 && Pzone < 39) || (Pzone > 42 && Pzone < 134) || (Pzone > 135 && Pzone < 185) || (Pzone > 188 && Pzone < 255)))
                    {
                        if (PMember->StatusEffectContainer->HasStatusEffect(EFFECT_SIGNET) && PMob->m_Element > 0 && dsprand::GetRandomNumber(100) < 20 &&
                            PMember->loc.zone == PMob->loc.zone) // Need to move to SIGNET_CHANCE constant
                        {
                            PMember->PTreasurePool->AddItem(4095 + PMob->m_Element, PMob);
                        }
                    }
                    charutils::AddExperiencePoints(false, PMember, PMob, (uint32)exp, baseexp, chainactive);
                }
            }
        });
    }

    /************************************************************************
    *                                                                       *
    *  Losing exp on death. retainPercent is the amount of exp to be        *
    *  saved on death, e.g. 0.05 = retain 5% of lost exp. A value of        *
    *  1 means no exp loss. A value of 0 means full exp loss.               *
    *                                                                       *
    ************************************************************************/
    void DelExperiencePoints(CCharEntity* PChar, float retainPercent, uint16 forcedXpLoss)
    {
        DSP_DEBUG_BREAK_IF(retainPercent > 1.0f || retainPercent < 0.0f);
        DSP_DEBUG_BREAK_IF(map_config.exp_loss_level > 99 || map_config.exp_loss_level < 1);

        if (PChar->GetMLevel() < map_config.exp_loss_level && forcedXpLoss == 0)
        {
            return;
        }

        uint8 mLevel = (PChar->m_LevelRestriction != 0 && PChar->m_LevelRestriction < PChar->GetMLevel()) ? PChar->m_LevelRestriction : PChar->GetMLevel();
        uint16 exploss = mLevel <= 67 ? (GetExpNEXTLevel(mLevel) * 8) / 100 : 2400;

        if (forcedXpLoss > 0)
        {
            // Override normal XP loss with specified value.
            exploss = forcedXpLoss;
        }
        else
        {
            // Apply retention percent
            exploss = (uint16)(exploss * (1 - retainPercent));
            exploss = (uint16)(exploss * map_config.exp_loss_rate);
        }

        if (PChar->jobs.exp[PChar->GetMJob()] < exploss)
        {
            if (PChar->jobs.job[PChar->GetMJob()] > 1)
            {
                //de-level!
                int32 lowerLevelMaxExp = GetExpNEXTLevel(PChar->jobs.job[PChar->GetMJob()] - 1);
                exploss -= PChar->jobs.exp[PChar->GetMJob()];
                PChar->jobs.exp[PChar->GetMJob()] = std::max(0, lowerLevelMaxExp - exploss);
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

                PChar->pushPacket(new CCharJobsPacket(PChar));
                PChar->pushPacket(new CCharUpdatePacket(PChar));
                PChar->pushPacket(new CCharSkillsPacket(PChar));
                PChar->pushPacket(new CCharRecastPacket(PChar));
                PChar->pushPacket(new CCharAbilitiesPacket(PChar));
                PChar->pushPacket(new CMenuMeritPacket(PChar));
                PChar->pushPacket(new CCharJobExtraPacket(PChar, true));
                PChar->pushPacket(new CCharJobExtraPacket(PChar, false));
                PChar->pushPacket(new CCharSyncPacket(PChar));

                PChar->UpdateHealth();

                SaveCharStats(PChar);
                SaveCharJob(PChar, PChar->GetMJob());

                if (PChar->PParty != nullptr)
                {
                    if (PChar->PParty->GetSyncTarget() == PChar)
                    {
                        PChar->PParty->RefreshSync();
                    }
                    PChar->PParty->ReloadParty();
                }

                PChar->loc.zone->PushPacket(PChar, CHAR_INRANGE_SELF, new CMessageDebugPacket(PChar, PChar, PChar->jobs.job[PChar->GetMJob()], 0, 11));
                luautils::OnPlayerLevelDown(PChar);
                PChar->updatemask |= UPDATE_HP;
            }
            else
            {
                PChar->jobs.exp[PChar->GetMJob()] = 0;
            }
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
            exp = (uint32)(exp * map_config.exp_rate);
        }
        uint16 currentExp = PChar->jobs.exp[PChar->GetMJob()];
        bool onLimitMode = false;

        // Incase player de-levels to 74 on the field
        if (PChar->MeritMode == true && PChar->jobs.job[PChar->GetMJob()] > 74 && expFromRaise == false)
            onLimitMode = true;

        //we check if the player is level capped and max exp..
        if (PChar->jobs.job[PChar->GetMJob()] > 74 && PChar->jobs.job[PChar->GetMJob()] >= PChar->jobs.genkai && PChar->jobs.exp[PChar->GetMJob()] == GetExpNEXTLevel(PChar->jobs.job[PChar->GetMJob()]) - 1)
            onLimitMode = true;

        // exp added from raise shouldn't display a message. Don't need a message for zero exp either
        if (!expFromRaise && exp != 0)
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
            else if (exp > 0)
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
                conquest::AddConquestPoints(PChar, exp);
            }

            // Should this user be awarded imperial standing..
            if (PChar->StatusEffectContainer->HasStatusEffect(EFFECT_SANCTION) &&
                (region >= 28 && region <= 32))
            {
                charutils::AddPoints(PChar, "imperial_standing", (int32)(exp * 0.1f));
                PChar->pushPacket(new CConquestPacket(PChar));
            }

            // Cruor Drops in Abyssea zones.
            uint16 Pzone = PChar->getZone();
            if (zoneutils::GetCurrentRegion(Pzone) == REGION_ABYSSEA)
            {
                uint16 TextID = luautils::GetTextIDVariable(Pzone, "CRUOR_OBTAINED");
                uint32 Total = charutils::GetPoints(PChar, "cruor");
                uint32 Cruor = 0; // Need to work out how to do cruor chains, until then no cruor will drop unless this line is customized for non retail play.

                if (TextID == 0)
                {
                    ShowWarning(CL_YELLOW"Failed to fetch Cruor Message ID for zone: %i\n" CL_RESET, Pzone);
                }

                if (Cruor >= 1)
                {
                    PChar->pushPacket(new CMessageSpecialPacket(PChar, TextID, Cruor, Total + Cruor, 0, 0));
                    charutils::AddPoints(PChar, "cruor", Cruor);
                }
            }
        }

        PChar->PAI->EventHandler.triggerListener("EXPERIENCE_POINTS", PChar, exp);

        // Player levels up
        if ((currentExp + exp) >= GetExpNEXTLevel(PChar->jobs.job[PChar->GetMJob()]) && onLimitMode == false)
        {
            if (PChar->jobs.job[PChar->GetMJob()] >= PChar->jobs.genkai)
            {
                PChar->jobs.exp[PChar->GetMJob()] = GetExpNEXTLevel(PChar->jobs.job[PChar->GetMJob()]) - 1;
                if (PChar->PParty && PChar->PParty->GetSyncTarget() == PChar)
                {
                    PChar->PParty->SetSyncTarget(nullptr, 556);
                }
            }
            else
            {
                PChar->jobs.exp[PChar->GetMJob()] -= GetExpNEXTLevel(PChar->jobs.job[PChar->GetMJob()]);
                if (PChar->jobs.exp[PChar->GetMJob()] >= GetExpNEXTLevel(PChar->jobs.job[PChar->GetMJob()] + 1))
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
                    if (PChar->PAutomaton != nullptr && PChar->PAutomaton != PChar->PPet)
                    {
                        puppetutils::LoadAutomatonStats(PChar);
                    }
                }
                PChar->PLatentEffectContainer->CheckLatentsJobLevel();

                if (PChar->PParty != nullptr)
                {
                    if (PChar->PParty->GetSyncTarget() == PChar)
                    {
                        PChar->PParty->RefreshSync();
                    }
                    PChar->PParty->ReloadParty();
                }

                PChar->UpdateHealth();

                PChar->health.hp = PChar->GetMaxHP();
                PChar->health.mp = PChar->GetMaxMP();

                SaveCharStats(PChar);
                SaveCharJob(PChar, PChar->GetMJob());
                SaveCharExp(PChar, PChar->GetMJob());

                PChar->pushPacket(new CCharJobsPacket(PChar));
                PChar->pushPacket(new CCharUpdatePacket(PChar));
                PChar->pushPacket(new CCharSkillsPacket(PChar));
                PChar->pushPacket(new CCharRecastPacket(PChar));
                PChar->pushPacket(new CCharAbilitiesPacket(PChar));
                PChar->pushPacket(new CMenuMeritPacket(PChar));
                PChar->pushPacket(new CCharJobExtraPacket(PChar, true));
                PChar->pushPacket(new CCharJobExtraPacket(PChar, true));
                PChar->pushPacket(new CCharSyncPacket(PChar));

                PChar->loc.zone->PushPacket(PChar, CHAR_INRANGE_SELF, new CMessageDebugPacket(PChar, PMob, PChar->jobs.job[PChar->GetMJob()], 0, 9));
                PChar->pushPacket(new CCharStatsPacket(PChar));

                luautils::OnPlayerLevelUp(PChar);
                PChar->updatemask |= UPDATE_HP;
                return;
            }
        }

        SaveCharStats(PChar);
        SaveCharJob(PChar, PChar->GetMJob());
        SaveCharExp(PChar, PChar->GetMJob());
        PChar->pushPacket(new CCharStatsPacket(PChar));

        if (onLimitMode)
        {
            PChar->pushPacket(new CMenuMeritPacket(PChar));
        }

    }

    /************************************************************************
    *                                                                       *
    *  Устанавливаем ограничение уровня персонажа                           *
    *                                                                       *
    ************************************************************************/

    void SetLevelRestriction(CCharEntity* PChar, uint8 lvl)
    {

    }

    /************************************************************************
    *                                                                       *
    *  Сохраняем позицию                                                    *
    *                                                                       *
    ************************************************************************/

    void SaveCharPosition(CCharEntity* PChar)
    {
        const char* Query =
            "UPDATE chars "
            "SET "
            "pos_rot = %u,"
            "pos_x = %.3f,"
            "pos_y = %.3f,"
            "pos_z = %.3f,"
            "boundary = %u "
            "WHERE charid = %u;";

        Sql_Query(SqlHandle, Query,
            PChar->loc.p.rotation,
            PChar->loc.p.x,
            PChar->loc.p.y,
            PChar->loc.p.z,
            PChar->loc.boundary,
            PChar->id);
    }

    /************************************************************************
    *                                                                       *
    *  Сохраняем список квестов                                             *
    *                                                                       *
    ************************************************************************/

    void SaveQuestsList(CCharEntity* PChar)
    {
        const char* Query =
            "UPDATE chars "
            "SET "
            "quests = '%s' "
            "WHERE charid = %u;";

        char questslist[sizeof(PChar->m_questLog) * 2 + 1];
        Sql_EscapeStringLen(SqlHandle, questslist, (const char*)PChar->m_questLog, sizeof(PChar->m_questLog));

        Sql_Query(SqlHandle, Query,
            questslist,
            PChar->id);
    }

    /************************************************************************
    *                                                                       *
    *  Сохраняем список квестов                                             *
    *                                                                       *
    ************************************************************************/

    void SaveFame(CCharEntity* PChar)
    {
        const char* Query =
            "UPDATE char_profile "
            "SET "
            "fame_sandoria = %u,"
            "fame_bastok = %u,"
            "fame_windurst = %u,"
            "fame_norg = %u,"
            "fame_jeuno = %u,"
            "fame_aby_konschtat = %u,"
            "fame_aby_tahrongi = %u,"
            "fame_aby_latheine = %u,"
            "fame_aby_misareaux = %u,"
            "fame_aby_vunkerl = %u,"
            "fame_aby_attohwa = %u,"
            "fame_aby_altepa = %u,"
            "fame_aby_grauberg = %u,"
            "fame_aby_uleguerand = %u,"
            "fame_adoulin = %u "
            "WHERE charid = %u;";

        Sql_Query(SqlHandle, Query,
            PChar->profile.fame[0],
            PChar->profile.fame[1],
            PChar->profile.fame[2],
            PChar->profile.fame[3],
            PChar->profile.fame[4],
            PChar->profile.fame[5],
            PChar->profile.fame[6],
            PChar->profile.fame[7],
            PChar->profile.fame[8],
            PChar->profile.fame[9],
            PChar->profile.fame[10],
            PChar->profile.fame[11],
            PChar->profile.fame[12],
            PChar->profile.fame[13],
            PChar->profile.fame[14],
            PChar->id);
    }


    /************************************************************************
    *                                                                       *
    *  Save Character Missions                                              *
    *                                                                       *
    ************************************************************************/

    void SaveMissionsList(CCharEntity* PChar)
    {
        const char* Query =
            "UPDATE chars "
            "LEFT JOIN char_profile USING(charid) "
            "SET "
            "missions = '%s',"
            "assault = '%s',"
            "campaign = '%s',"
            "rank_points = %u,"
            "rank_sandoria = %u,"
            "rank_bastok = %u,"
            "rank_windurst = %u "
            "WHERE charid = %u;";

        char missionslist[sizeof(PChar->m_missionLog) * 2 + 1];
        Sql_EscapeStringLen(SqlHandle, missionslist, (const char*)PChar->m_missionLog, sizeof(PChar->m_missionLog));

        char assaultList[sizeof(PChar->m_assaultLog) * 2 + 1];
        Sql_EscapeStringLen(SqlHandle, assaultList, (const char*)&PChar->m_assaultLog, sizeof(PChar->m_assaultLog));

        char campaignList[sizeof(PChar->m_campaignLog) * 2 + 1];
        Sql_EscapeStringLen(SqlHandle, campaignList, (const char*)&PChar->m_campaignLog, sizeof(PChar->m_campaignLog));

        Sql_Query(SqlHandle, Query,
            missionslist,
            assaultList,
            campaignList,
            PChar->profile.rankpoints,
            PChar->profile.rank[0],
            PChar->profile.rank[1],
            PChar->profile.rank[2],
            PChar->id);
    }

    /************************************************************************
    *                                                                       *
    *  Cохраняем список колючевых предметов                                 *
    *                                                                       *
    ************************************************************************/

    void SaveCharInventoryCapacity(CCharEntity* PChar)
    {
        const char* Query =
            "UPDATE char_storage "
            "SET "
            "inventory = %u,"
            "safe = %u,"
            "locker = %u,"
            "satchel = %u,"
            "sack = %u, "
            "`case` = %u, "
            "wardrobe = %u, "
            "wardrobe2 = %u, "
            "wardrobe3 = %u, "
            "wardrobe4 = %u "
            "WHERE charid = %u";

        Sql_Query(SqlHandle, Query,
            PChar->getStorage(LOC_INVENTORY)->GetSize(),
            PChar->getStorage(LOC_MOGSAFE)->GetSize(),
            PChar->getStorage(LOC_MOGLOCKER)->GetSize(),
            PChar->getStorage(LOC_MOGSATCHEL)->GetSize(),
            PChar->getStorage(LOC_MOGSACK)->GetSize(),
            PChar->getStorage(LOC_MOGCASE)->GetSize(),
            PChar->getStorage(LOC_WARDROBE)->GetSize(),
            PChar->getStorage(LOC_WARDROBE2)->GetSize(),
            PChar->getStorage(LOC_WARDROBE3)->GetSize(),
            PChar->getStorage(LOC_WARDROBE4)->GetSize(),
            PChar->id);
    }

    /************************************************************************
    *                                                                       *
    *  Cохраняем список колючевых предметов                                 *
    *                                                                       *
    ************************************************************************/

    void SaveKeyItems(CCharEntity* PChar)
    {
        const char* fmtQuery = "UPDATE chars SET keyitems = '%s' WHERE charid = %u;";

        char keyitems[sizeof(PChar->keys) * 2 + 1];
        Sql_EscapeStringLen(SqlHandle, keyitems, (const char*)&PChar->keys, sizeof(PChar->keys));

        Sql_Query(SqlHandle, fmtQuery, keyitems, PChar->id);
    }

    /************************************************************************
    *                                                                       *
    *  Сохраняем список выученных заклинаний                                *
    *                                                                       *
    ************************************************************************/

    void SaveSpell(CCharEntity* PChar, uint16 spellID)
    {
        const char* Query =
            "INSERT IGNORE INTO char_spells "
            "VALUES (%u, %u);";

        Sql_Query(SqlHandle, Query,
            PChar->id,
            spellID);
    }

    void DeleteSpell(CCharEntity* PChar, uint16 spellID)
    {
        const char* Query =
            "DELETE FROM char_spells "
            "WHERE charid = %u AND spellid = %u;";

        Sql_Query(SqlHandle, Query,
            PChar->id,
            spellID);
    }

    /************************************************************************
    *                                                                       *
    *  Сохраняем список выученных заклинаний                                *
    *                                                                       *
    ************************************************************************/

    void SaveLearnedAbilities(CCharEntity* PChar)
    {
        const char* Query =
            "UPDATE chars SET "
            "abilities = '%s', "
            "weaponskills = '%s' "
            "WHERE charid = %u;";

        char abilities[sizeof(PChar->m_LearnedAbilities) * 2 + 1];
        char weaponskills[sizeof(PChar->m_LearnedWeaponskills) * 2 + 1];
        Sql_EscapeStringLen(SqlHandle, abilities, (const char*)PChar->m_LearnedAbilities, sizeof(PChar->m_LearnedAbilities));
        Sql_EscapeStringLen(SqlHandle, weaponskills, (const char*)&PChar->m_LearnedWeaponskills, sizeof(PChar->m_LearnedWeaponskills));

        Sql_Query(SqlHandle, Query,
            abilities,
            weaponskills,
            PChar->id);
    }

    /************************************************************************
    *                                                                       *
    *  Сохраняем список званий                                              *
    *                                                                       *
    ************************************************************************/

    void SaveTitles(CCharEntity* PChar)
    {
        const char* Query =
            "UPDATE chars "
            "LEFT JOIN char_stats USING(charid) "
            "SET "
            "titles = '%s',"
            "title = %u "
            "WHERE charid = %u";

        char titles[sizeof(PChar->m_TitleList) * 2 + 1];
        Sql_EscapeStringLen(SqlHandle, titles, (const char*)PChar->m_TitleList, sizeof(PChar->m_TitleList));

        Sql_Query(SqlHandle, Query,
            titles,
            PChar->profile.title,
            PChar->id);
    }

    /************************************************************************
    *                                                                       *
    *  Сохраняем список посещенных зон                                      *
    *                                                                       *
    ************************************************************************/

    void SaveZonesVisited(CCharEntity* PChar)
    {
        const char* fmtQuery = "UPDATE chars SET zones = '%s' WHERE charid = %u;";

        char zones[sizeof(PChar->m_ZonesList) * 2 + 1];
        Sql_EscapeStringLen(SqlHandle, zones, (const char*)PChar->m_ZonesList, sizeof(PChar->m_ZonesList));

        Sql_Query(SqlHandle, fmtQuery, zones, PChar->id);
    }

    /************************************************************************
    *                                                                       *
    *  Сохраняем экипировку и внешний вид персонажа.                        *
    *                                                                       *
    ************************************************************************/

    void SaveCharEquip(CCharEntity* PChar)
    {
        for (uint8 i = 0; i < 18; ++i)
        {
            if (PChar->equip[i] == 0)
            {
                Sql_Query(SqlHandle, "DELETE FROM char_equip WHERE charid = %u AND  equipslotid = %u LIMIT 1;", PChar->id, i);
            }
            else
            {
                const char* fmtQuery = "INSERT INTO char_equip SET charid = %u, equipslotid = %u , slotid  = %u, containerid = %u ON DUPLICATE KEY UPDATE slotid  = %u, containerid = %u;";
                Sql_Query(SqlHandle, fmtQuery, PChar->id, i, PChar->equip[i], PChar->equipLoc[i], PChar->equip[i], PChar->equipLoc[i]);
            }
        }
    }

    void SaveCharLook(CCharEntity* PChar)
    {
        const char* Query = "UPDATE char_look "
            "SET head = %u, body = %u, hands = %u, legs = %u, feet = %u, main = %u, sub = %u, ranged = %u "
            "WHERE charid = %u;";

        look_t* look = (PChar->getStyleLocked() ? &PChar->mainlook : &PChar->look);
        Sql_Query(SqlHandle,
            Query,
            look->head,
            look->body,
            look->hands,
            look->legs,
            look->feet,
            look->main,
            look->sub,
            look->ranged,
            PChar->id);

        Sql_Query(SqlHandle,
            "UPDATE chars SET isstylelocked = %u WHERE charid = %u;",
            PChar->getStyleLocked() ? 1 : 0,
            PChar->id);

        Query = "INSERT INTO char_style (charid, head, body, hands, legs, feet, main, sub, ranged) "
            "VALUES (%u, %u, %u, %u, %u, %u, %u, %u, %u) ON DUPLICATE KEY UPDATE "
            "charid = VALUES(charid), head = VALUES(head), body = VALUES(body), "
            "hands = VALUES(hands), legs = VALUES(legs), feet = VALUES(feet), "
            "main = VALUES(main), sub = VALUES(sub), ranged = VALUES(ranged);";

        Sql_Query(SqlHandle,
            Query,
            PChar->id,
            PChar->styleItems[SLOT_HEAD],
            PChar->styleItems[SLOT_BODY],
            PChar->styleItems[SLOT_HANDS],
            PChar->styleItems[SLOT_LEGS],
            PChar->styleItems[SLOT_FEET],
            PChar->styleItems[SLOT_MAIN],
            PChar->styleItems[SLOT_SUB],
            PChar->styleItems[SLOT_RANGED]);
    }

    /************************************************************************
    *                                                                       *
    *  Сохраняем часть текущих характеристик персонажа                      *
    *                                                                       *
    ************************************************************************/

    void SaveCharStats(CCharEntity* PChar)
    {
        const char* Query = "UPDATE char_stats "
            "SET hp = %u, mp = %u, nameflags = %u, mhflag = %u, mjob = %u, sjob = %u, "
            "pet_id = %u, pet_type = %u, pet_hp = %u, pet_mp = %u "
            "WHERE charid = %u;";

        Sql_Query(SqlHandle,
            Query,
            PChar->health.hp,
            PChar->health.mp,
            PChar->nameflags.flags,
            PChar->profile.mhflag,
            PChar->GetMJob(),
            PChar->GetSJob(),
            PChar->petZoningInfo.petID,
            PChar->petZoningInfo.petType,
            PChar->petZoningInfo.petHP,
            PChar->petZoningInfo.petMP,
            PChar->id);
    }

    /************************************************************************
    *                                                                       *
    *  Save the char's GM level and nameflags                               *
    *                                                                       *
    ************************************************************************/

    void SaveCharGMLevel(CCharEntity* PChar)
    {
        const char* Query = "UPDATE %s SET %s %u WHERE charid = %u;";

        Sql_Query(SqlHandle, Query, "chars", "gmlevel =", PChar->m_GMlevel, PChar->id);
        Sql_Query(SqlHandle, Query, "char_stats", "nameflags =", PChar->nameflags.flags, PChar->id);
    }

    void SaveMentorFlag(CCharEntity* PChar)
    {
        const char* Query = "UPDATE %s SET %s %u WHERE charid = %u;";

        Sql_Query(SqlHandle, Query, "chars", "mentor =", PChar->m_mentorUnlocked, PChar->id);
    }

    /************************************************************************
    *                                                                       *
    *  Save the char's menu config flags                                    *
    *                                                                       *
    ************************************************************************/
    void SaveMenuConfigFlags(CCharEntity* PChar)
    {
        const char* Query = "UPDATE %s SET %s %u WHERE charid = %u;";

        Sql_Query(SqlHandle, Query, "chars", "nnameflags =", PChar->menuConfigFlags.flags, PChar->id);
    }

    /************************************************************************
    *                                                                       *
    *  Saves character nation changes                                       *
    *                                                                       *
    ************************************************************************/

    void SaveCharNation(CCharEntity* PChar)
    {
        const char* Query =
            "UPDATE chars "
            "SET nation = %u "
            "WHERE charid = %u;";

        Sql_Query(SqlHandle,
            Query,
            PChar->profile.nation,
            PChar->id);
    }

    /************************************************************************
    *                                                                       *
    *  Saves characters current campaign allegiance                         *
    *                                                                       *
    ************************************************************************/

    void SaveCampaignAllegiance(CCharEntity* PChar)
    {
        const char* Query =
            "UPDATE chars "
            "SET campaign_allegiance = %u "
            "WHERE charid = %u;";

        Sql_Query(SqlHandle,
            Query,
            PChar->profile.campaign_allegiance,
            PChar->id);
    }

    /************************************************************************
    *                                                                       *
    *  Сохраняем текущие уровни профессий персонажа                         *
    *                                                                       *
    ************************************************************************/

    void SaveCharJob(CCharEntity* PChar, JOBTYPE job)
    {
        DSP_DEBUG_BREAK_IF(job == JOB_NON || job >= MAX_JOBTYPE);

        const char* fmtQuery;

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
            default: fmtQuery = ""; break;
        }
        Sql_Query(SqlHandle, fmtQuery, PChar->jobs.unlocked, PChar->jobs.job[job], PChar->id);

        // Remove the new player flag if we have reached level 5.
        // Should also remove it based on playtime (180 hours?)
        if (PChar->isNewPlayer() && PChar->jobs.job[job] >= 5)
        {
            PChar->menuConfigFlags.flags |= NFLAG_NEWPLAYER;
            PChar->updatemask |= UPDATE_HP;
            SaveMenuConfigFlags(PChar);
        }
    }

    /************************************************************************
    *                                                                       *
    *  Сохраняем текущий опыт персонажа                                     *
    *                                                                       *
    ************************************************************************/

    void SaveCharExp(CCharEntity* PChar, JOBTYPE job)
    {
        DSP_DEBUG_BREAK_IF(job == JOB_NON || job >= MAX_JOBTYPE);

        const char* Query;

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
            default: Query = ""; break;
        }
        Sql_Query(SqlHandle, Query,
            PChar->jobs.exp[job],
            PChar->PMeritPoints->GetMeritPoints(),
            PChar->PMeritPoints->GetLimitPoints(),
            PChar->id);
    }

    /************************************************************************
    *                                                                       *
    *  Сохраняем значение выбранного умения персонажа                       *
    *                                                                       *
    ************************************************************************/

    void SaveCharSkills(CCharEntity* PChar, uint8 SkillID)
    {
        DSP_DEBUG_BREAK_IF(SkillID >= MAX_SKILLTYPE);

        const char* Query =
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
    *                                                                       *
    *  Conquest Point / Nation TP, ...                                      *
    *                                                                       *
    ************************************************************************/

    void SaveCharPoints(CCharEntity* PChar)
    {
        const char* Query = "UPDATE char_points "
            "SET sandoria_supply = %u, bastok_supply = %u, windurst_supply = %u, "
            "runic_portal = %u, maw = %u, past_sandoria_tp = %u, "
            "past_bastok_tp = %u, past_windurst_tp = %u "
            "WHERE charid = %u;";

        Sql_Query(SqlHandle,
            Query,
            PChar->nationtp.sandoria,
            PChar->nationtp.bastok,
            PChar->nationtp.windurst,
            PChar->nationtp.ahturhgan,
            PChar->nationtp.maw,
            PChar->nationtp.pastsandoria,
            PChar->nationtp.pastbastok,
            PChar->nationtp.pastwindurst,
            PChar->id);
    }

    float  AddExpBonus(CCharEntity* PChar, float exp)
    {
        int32 bonus = 0;
        if (PChar->StatusEffectContainer->GetStatusEffect(EFFECT_DEDICATION))
        {
            CStatusEffect* dedication = PChar->StatusEffectContainer->GetStatusEffect(EFFECT_DEDICATION);
            int16 percentage = dedication->GetPower();
            int16 cap = dedication->GetSubPower();
            bonus += std::clamp<int32>((int32)((exp * percentage) / 100), 0, cap);
            dedication->SetSubPower(cap -= bonus);

            if (cap <= 0)
            {
                PChar->StatusEffectContainer->DelStatusEffect(EFFECT_DEDICATION);
            }

        }

        bonus += (int32)(exp * (PChar->getMod(Mod::EXP_BONUS) / 100.0f));

        if (bonus + (int32)exp < 0)
            exp = 0;
        else
            exp = exp + bonus;

        return exp;
    }

    bool hasMogLockerAccess(CCharEntity* PChar) {
        char fmtQuery[] = "SELECT value FROM char_vars WHERE charid = %u AND varname = '%s' ";
        Sql_Query(SqlHandle, fmtQuery, PChar->id, "mog-locker-expiry-timestamp");

        if (Sql_NextRow(SqlHandle) == SQL_SUCCESS)
        {
            auto tstamp = (uint32)Sql_GetIntData(SqlHandle, 0);
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

    uint16 AvatarPerpetuationReduction(CCharEntity* PChar)
    {
        uint16 reduction = PChar->getMod(Mod::PERPETUATION_REDUCTION);

        static const Mod strong[8] = {
            Mod::FIRE_AFFINITY_PERP,
            Mod::EARTH_AFFINITY_PERP,
            Mod::WATER_AFFINITY_PERP,
            Mod::WIND_AFFINITY_PERP,
            Mod::ICE_AFFINITY_PERP,
            Mod::THUNDER_AFFINITY_PERP,
            Mod::LIGHT_AFFINITY_PERP,
            Mod::DARK_AFFINITY_PERP};

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

        reduction = reduction + PChar->getMod(strong[element]);

        if (CVanaTime::getInstance()->getWeekday() == element)
        {
            reduction = reduction + PChar->getMod(Mod::DAY_REDUCTION);
        }

        WEATHER weather = battleutils::GetWeather(PChar, false);

        if (weather == weatherStrong[element] || weather == weatherStrong[element] + 1)
        {
            reduction = reduction + PChar->getMod(Mod::WEATHER_REDUCTION);
        }

        return reduction;
    }

    /************************************************************************
    *                                                                       *
    *  Record now as when the character has died and save it to the db.     *
    *                                                                       *
    ************************************************************************/

    void SaveDeathTime(CCharEntity* PChar)
    {
        uint32 currentTime = (uint32)time(nullptr);
        PChar->m_DeathCounter += (currentTime - PChar->m_DeathTimestamp);
        PChar->m_DeathTimestamp = currentTime;

        const char* fmtQuery = "UPDATE char_stats SET death = %u WHERE charid = %u LIMIT 1;";
        Sql_Query(SqlHandle, fmtQuery, PChar->m_DeathCounter, PChar->id);
    }

    void SavePlayTime(CCharEntity* PChar)
    {
        Sql_Query(SqlHandle, "UPDATE chars SET playtime = '%u' WHERE charid = '%u' LIMIT 1;", PChar->GetPlayTime(), PChar->id);
    }

    /************************************************************************
    *                                                                       *
    *  Checks which UnarmedItem to grant when SLOT_MAIN is empty.           *
    *                                                                       *
    ************************************************************************/

    void CheckUnarmedWeapon(CCharEntity* PChar)
    {
        CItem* PSubslot = PChar->getEquip(SLOT_SUB);

        // Main or sub job provides H2H skill, and sub slot is empty.
        if ((battleutils::GetSkillRank(SKILL_H2H, PChar->GetMJob()) > 0 || battleutils::GetSkillRank(SKILL_H2H, PChar->GetSJob()) > 0) &&
            (!PSubslot || !PSubslot->isType(ITEM_ARMOR)))
        {
            PChar->m_Weapons[SLOT_MAIN] = itemutils::GetUnarmedH2HItem();
            PChar->look.main = 21;                                          // The secret to H2H animations.  setModelId for UnarmedH2H didn't work.
        }
        else {
            PChar->m_Weapons[SLOT_MAIN] = itemutils::GetUnarmedItem();
            PChar->look.main = 0;
        }
        BuildingCharWeaponSkills(PChar);
    }

    /************************************************************************
    *                                                                       *
    *  Opens the characters send box                                        *
    *                                                                       *
    ************************************************************************/

    void OpenSendBox(CCharEntity* PChar)
    {
        PChar->UContainer->Clean();
        PChar->UContainer->SetType(UCONTAINER_DELIVERYBOX);

        PChar->pushPacket(new CDeliveryBoxPacket(0x0D, 2, 0, 0x01));
        return;
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
            if (!hasLearnedAbility(PChar, PAbility->getID()))
            {
                return false;
            }
        }
        if (PAbility->getAddType() & ADDTYPE_LIGHT_ARTS)
        {
            if (!PChar->StatusEffectContainer->HasStatusEffect({EFFECT_LIGHT_ARTS, EFFECT_ADDENDUM_WHITE}))
            {
                return false;
            }
        }
        if (PAbility->getAddType() & ADDTYPE_DARK_ARTS)
        {
            if (!PChar->StatusEffectContainer->HasStatusEffect({EFFECT_DARK_ARTS, EFFECT_ADDENDUM_BLACK}))
            {
                return false;
            }
        }
        if ((PAbility->getAddType() & (ADDTYPE_JUGPET | ADDTYPE_CHARMPET)) == (ADDTYPE_JUGPET | ADDTYPE_CHARMPET))
        {
            if (!PChar->PPet || !(PChar->PPet->objtype == TYPE_MOB || (PChar->PPet->objtype == TYPE_PET && static_cast<CPetEntity*>(PChar->PPet)->getPetType() == PETTYPE_JUG_PET)))
            {
                return false;
            }
        }
        if ((PAbility->getAddType() & (ADDTYPE_JUGPET | ADDTYPE_CHARMPET)) == ADDTYPE_JUGPET)
        {
            if (!PChar->PPet || PChar->PPet->objtype != TYPE_PET || static_cast<CPetEntity*>(PChar->PPet)->getPetType() != PETTYPE_JUG_PET)
            {
                return false;
            }
        }
        if ((PAbility->getAddType() & (ADDTYPE_JUGPET | ADDTYPE_CHARMPET)) == ADDTYPE_CHARMPET)
        {
            if (!PChar->PPet || PChar->PPet->objtype != TYPE_MOB)
            {
                return false;
            }
        }
        if (PAbility->getAddType() & ADDTYPE_AVATAR)
        {
            if (!PChar->PPet || PChar->PPet->objtype != TYPE_PET || static_cast<CPetEntity*>(PChar->PPet)->getPetType() != PETTYPE_AVATAR)
            {
                return false;
            }
        }
        if (PAbility->getAddType() & ADDTYPE_AUTOMATON)
        {
            if (!PChar->PPet || PChar->PPet->objtype != TYPE_PET || static_cast<CPetEntity*>(PChar->PPet)->getPetType() != PETTYPE_AUTOMATON)
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
        for (uint8 slotID = 0; slotID < 16; ++slotID)
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
        for (uint8 slotID = 0; slotID < 16; ++slotID)
        {
            CItemArmor* PItem = (CItemArmor*)PChar->getEquip((SLOTTYPE)slotID);
            if (PItem)
            {
                PChar->addEquipModifiers(&PItem->modList, PItem->getReqLvl(), slotID);
                if (PItem->getReqLvl() <= PChar->GetMLevel())
                {
                    PChar->PLatentEffectContainer->AddLatentEffects(PItem->latentList, PItem->getReqLvl(), slotID);
                    PChar->PLatentEffectContainer->CheckLatentsEquip(slotID);
                }
            }
        }
    }

    void ClearTempItems(CCharEntity* PChar)
    {
        CItemContainer* Temp = PChar->getStorage(LOC_TEMPITEMS);

        const char* Query = "DELETE FROM char_inventory WHERE charid = %u AND location = 3;";

        if (Sql_Query(SqlHandle, Query, PChar->id) != SQL_ERROR)
        {
            Temp->Clear();
        }
    }

    void ReloadParty(CCharEntity* PChar)
    {
        int ret = Sql_Query(SqlHandle, "SELECT partyid, allianceid, partyflag & %d FROM accounts_sessions s JOIN accounts_parties p ON "
            "s.charid = p.charid WHERE p.charid = %u;", (PARTY_SECOND | PARTY_THIRD), PChar->id);
        if (ret != SQL_ERROR && Sql_NumRows(SqlHandle) != 0 && Sql_NextRow(SqlHandle) == SQL_SUCCESS)
        {
            uint32 partyid = Sql_GetUIntData(SqlHandle, 0);
            uint32 allianceid = Sql_GetUIntData(SqlHandle, 1);
            uint32 partynumber = Sql_GetUIntData(SqlHandle, 2);

            //first, parties and alliances must be created or linked if the character's current party has changed
            // for example, joining a party from another server
            if (PChar->PParty)
            {
                if (PChar->PParty->GetPartyID() != partyid)
                {
                    PChar->PParty->SetPartyID(partyid);
                }
            }
            else
            {
                //find if party exists on this server already
                CParty* PParty = nullptr;
                zoneutils::ForEachZone([partyid, &PParty](CZone* PZone)
                {
                    PZone->ForEachChar([partyid, &PParty](CCharEntity* PChar)
                    {
                        if (PChar->PParty && PChar->PParty->GetPartyID() == partyid)
                        {
                            PParty = PChar->PParty;
                        }
                    });
                });

                //create new party if it doesn't exist already
                if (!PParty)
                {
                    PParty = new CParty(partyid);
                }

                PParty->PushMember(PChar);
            }

            CBattleEntity* PSyncTarget = PChar->PParty->GetSyncTarget();
            if (PSyncTarget && PChar->getZone() == PSyncTarget->getZone()
                && !(PChar->StatusEffectContainer->HasStatusEffect(EFFECT_LEVEL_SYNC))
                && PSyncTarget->StatusEffectContainer->HasStatusEffect(EFFECT_LEVEL_SYNC)
                && PSyncTarget->StatusEffectContainer->GetStatusEffect(EFFECT_LEVEL_SYNC)->GetDuration() == 0)
            {
                PChar->pushPacket(new CMessageBasicPacket(PChar, PChar, 0, PSyncTarget->GetMLevel(), 540));
                PChar->StatusEffectContainer->AddStatusEffect(new CStatusEffect(
                    EFFECT_LEVEL_SYNC,
                    EFFECT_LEVEL_SYNC,
                    PSyncTarget->GetMLevel(),
                    0,
                    0), true);
                PChar->StatusEffectContainer->DelStatusEffectsByFlag(EFFECTFLAG_DISPELABLE);
            }

            if (allianceid != 0)
            {
                if (PChar->PParty->m_PAlliance)
                {
                    if (PChar->PParty->m_PAlliance->m_AllianceID != allianceid)
                    {
                        PChar->PParty->m_PAlliance->m_AllianceID = allianceid;
                    }
                }
                else
                {
                    //find if the alliance exists on this server already
                    CAlliance* PAlliance = nullptr;
                    zoneutils::ForEachZone([allianceid, &PAlliance](CZone* PZone)
                    {
                        PZone->ForEachChar([allianceid, &PAlliance](CCharEntity* PChar)
                        {
                            if (PChar->PParty && PChar->PParty->m_PAlliance && PChar->PParty->m_PAlliance->m_AllianceID == allianceid)
                            {
                                PAlliance = PChar->PParty->m_PAlliance;
                            }
                        });
                    });

                    //create new alliance if it doesn't exist on this server already
                    if (!PAlliance)
                    {
                        PAlliance = new CAlliance(allianceid);
                    }

                    PAlliance->pushParty(PChar->PParty, partynumber);
                }
            }
            else if (PChar->PParty->m_PAlliance)
            {
                PChar->PParty->m_PAlliance->delParty(PChar->PParty);
            }

            //once parties and alliances have been reassembled, reload the party/parties
            if (PChar->PParty->m_PAlliance)
            {
                for (auto party : PChar->PParty->m_PAlliance->partyList)
                {
                    party->ReloadParty();
                }
            }
            else
            {
                PChar->PParty->ReloadParty();
            }
        }
        else
        {
            if (PChar->PParty)
            {
                PChar->PParty->DelMember(PChar);
            }
            PChar->ReloadPartyDec();
        }
    }

    bool IsAidBlocked(CCharEntity* PInitiator, CCharEntity* PTarget) {
        if (PTarget->getBlockingAid())
        {
            bool inAlliance = false;
            PTarget->ForAlliance([&PInitiator, &inAlliance](CBattleEntity* PEntity) {
                if (PEntity->id == PInitiator->id)
                    inAlliance = true;
            });

            if (!inAlliance)
                return true;
        }
        return false;
    }

    //char_points manipulation
    void AddPoints(CCharEntity* PChar, const char* type, int32 amount, int32 max)
    {
        const char* Query = "UPDATE char_points SET %s = GREATEST(LEAST(%s+%d, %d), 0) WHERE charid = %u;";

        Sql_Query(SqlHandle, Query, type, type, amount, max, PChar->id);
    }

    void SetPoints(CCharEntity* PChar, const char* type, int32 amount)
    {
        const char* Query = "UPDATE char_points SET %s = %d WHERE charid = %u;";

        Sql_Query(SqlHandle, Query, type, amount, PChar->id);
    }

    int32 GetPoints(CCharEntity* PChar, const char* type)
    {
        const char* Query = "SELECT %s FROM char_points WHERE charid = %u;";

        int ret = Sql_Query(SqlHandle, Query, type, PChar->id);

        if (ret != SQL_ERROR && Sql_NextRow(SqlHandle) == SQL_SUCCESS)
        {
            return Sql_GetIntData(SqlHandle, 0);
        }
        return 0;
    }

    std::string GetConquestPointsName(CCharEntity* PChar)
    {
        switch (PChar->profile.nation)
        {
            case 0:
                return "sandoria_cp";
            case 1:
                return "bastok_cp";
            case 2:
                return "windurst_cp";
            default:
                DSP_DEBUG_BREAK_IF(true);
                return nullptr;
        }
    }

    void SendToZone(CCharEntity* PChar, uint8 type, uint64 ipp)
    {
        if (type == 2)
        {
            Sql_Query(SqlHandle, "UPDATE accounts_sessions SET server_addr = %u, server_port = %u WHERE charid = %u;",
                (uint32)ipp, (uint32)(ipp >> 32), PChar->id);

            const char* Query =
                "UPDATE chars "
                "SET "
                "pos_zone = %u,"
                "pos_prevzone = %u,"
                "pos_rot = %u,"
                "pos_x = %.3f,"
                "pos_y = %.3f,"
                "pos_z = %.3f,"
                "moghouse = %u,"
                "boundary = %u "
                "WHERE charid = %u;";

            Sql_Query(SqlHandle, Query,
                PChar->loc.destination,
                (PChar->m_moghouseID || PChar->loc.destination == PChar->getZone()) ? PChar->loc.prevzone : PChar->getZone(),
                PChar->loc.p.rotation,
                PChar->loc.p.x,
                PChar->loc.p.y,
                PChar->loc.p.z,
                PChar->m_moghouseID,
                PChar->loc.boundary,
                PChar->id);
        }
        else
        {
            SaveCharPosition(PChar);
        }

        PChar->pushPacket(new CServerIPPacket(PChar, type, ipp));
    }

    void HomePoint(CCharEntity* PChar)
    {
        // remove weakness on homepoint
        PChar->StatusEffectContainer->DelStatusEffectSilent(EFFECT_WEAKNESS);
        PChar->StatusEffectContainer->DelStatusEffectSilent(EFFECT_LEVEL_SYNC);

        PChar->health.hp = PChar->GetMaxHP();
        PChar->health.mp = PChar->GetMaxMP();

        PChar->loc.boundary = 0;
        PChar->loc.p = PChar->profile.home_point.p;
        PChar->loc.destination = PChar->profile.home_point.destination;

        PChar->status = STATUS_DISAPPEAR;
        PChar->animation = ANIMATION_NONE;
        PChar->updatemask |= UPDATE_HP;

        PChar->clearPacketList();
        SendToZone(PChar, 2, zoneutils::GetZoneIPP(PChar->loc.destination));
    }

    void AddWeaponSkillPoints(CCharEntity* PChar, SLOTTYPE slotid, int wspoints)
    {
        CItemWeapon* PWeapon = (CItemWeapon*)PChar->m_Weapons[slotid];

        if (PWeapon && PWeapon->isUnlockable() && !PWeapon->isUnlocked())
        {
            if (PWeapon->addWsPoints(wspoints))
            {
                // weapon is now broken
                PChar->PLatentEffectContainer->CheckLatentsWeaponBreak(slotid);
                PChar->pushPacket(new CCharStatsPacket(PChar));
            }
            char extra[sizeof(PWeapon->m_extra) * 2 + 1];
            Sql_EscapeStringLen(SqlHandle, extra, (const char*)PWeapon->m_extra, sizeof(PWeapon->m_extra));

            const char* Query = "UPDATE char_inventory SET extra = '%s' WHERE charid = %u AND location = %u AND slot = %u LIMIT 1";
            Sql_Query(SqlHandle, Query, extra, PChar->id, PWeapon->getLocationID(), PWeapon->getSlotID());
        }
    }

    int32 GetVar(CCharEntity* PChar, const char* var)
    {
        const char* fmtQuery = "SELECT value FROM char_vars WHERE charid = %u AND varname = '%s' LIMIT 1;";

        int32 ret = Sql_Query(SqlHandle, fmtQuery, PChar->id, var);

        if (ret != SQL_ERROR &&
            Sql_NumRows(SqlHandle) != 0 &&
            Sql_NextRow(SqlHandle) == SQL_SUCCESS)
        {
            return Sql_GetIntData(SqlHandle, 0);
        }
        return 0;
    }

}; // namespace charutils
