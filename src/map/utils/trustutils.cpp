/*
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

#include "../../common/timer.h"
#include "../../common/utils.h"

#include <string.h>
#include <vector>
#include <math.h>

#include "battleutils.h"
#include "charutils.h"
#include "mobutils.h"
#include "../grades.h"
#include "../map.h"
#include "trustutils.h"
#include "zoneutils.h"
#include "../entities/trustentity.h"
#include "../ability.h"
#include "../spell.h"
#include "../trust_spell_container.h"
#include "../status_effect_container.h"
#include "../latent_effect_container.h"
#include "../trust_spell_list.h"
#include "../trust_weaponskill_list.h"
#include "../enmity_container.h"
#include "../items/item_weapon.h"
#include "../zone_instance.h"
#include "../lua/luautils.h"
#include "../mob_modifier.h"

#include "../ai/ai_container.h"
#include "../ai/controllers/trust_controller.h"
#include "../ai/states/ability_state.h"

#include "../packets/char_abilities.h"
#include "../packets/char_sync.h"
#include "../packets/char_update.h"
#include "../packets/entity_update.h"
#include "../packets/message_standard.h"
#include "../packets/trust_sync.h"

struct Trust_t
{
    uint32      trustId;
    look_t		look;		// внешний вид
    string_t	name;		// имя
    ECOSYSTEM	EcoSystem;	// эко-система

    uint8		minLevel;	// минимально-возможный  уровень
    uint8		maxLevel;	// максимально-возможный уровень

    uint8       name_prefix;
    uint8		size;		// размер модели
    uint16		m_Family;
    uint32		time;		// время существования (будет использоваться для задания длительности статус эффекта)

    uint8		mJob;
    uint8		sJob;
    uint8		m_Element;
    uint16      m_Behaviour;                // mob behaviour

    float       HPscale;                             // HP boost percentage
    float       MPscale;                             // MP boost percentage

    uint16      cmbDelay;
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
    uint8        evaRank;
    uint8        accRank;

    uint16       m_MobSkillList;

    // magic stuff
    bool hasSpellScript;
    uint16 spellList;
    CTrustSpellList*        m_SpellListContainer;        // The spells list container for this mob
    std::map<uint16, uint16>    m_UsedSkillIds;

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

std::vector<Trust_t*> g_PTrustList;

namespace trustutils
{

    /************************************************************************
    *																		*
    *  Загружаем список прототипов питомцев									*
    *																		*
    ************************************************************************/

    void LoadTrustList()
    {
        FreeTrustList();

        const char* Query =
            "SELECT\
                mob_pools.name,\
                modelid,\
                minLevel,\
                maxLevel,\
                time,\
                mobsize,\
                systemid,\
                mob_pools.familyid,\
                mob_pools.mJob,\
                trust_list.element,\
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
                mob_family_system.EVA, \
                hasSpellScript, spellList, \
                Slash, Pierce, H2H, Impact, \
                Fire, Ice, Wind, Earth, Lightning, Water, Light, Dark, \
                cmbDelay, name_prefix, mob_pools.skill_list_id, \
                trust_list.spellid, mob_pools.behavior, mob_pools.sJob\
                FROM trust_list, mob_pools, mob_family_system \
                WHERE trust_list.poolid = mob_pools.poolid AND mob_pools.familyid = mob_family_system.familyid";

        if (Sql_Query(SqlHandle, Query) != SQL_ERROR && Sql_NumRows(SqlHandle) != 0)
        {
            while (Sql_NextRow(SqlHandle) == SQL_SUCCESS)
            {
                Trust_t* Pet = new Trust_t();

                Pet->trustId = (uint16)Sql_GetIntData(SqlHandle, 41);
                Pet->name.insert(0, (const char*)Sql_GetData(SqlHandle, 0));

                memcpy(&Pet->look, Sql_GetData(SqlHandle, 1), 20);
                Pet->minLevel = (uint8)Sql_GetIntData(SqlHandle, 2);
                Pet->maxLevel = (uint8)Sql_GetIntData(SqlHandle, 3);
                Pet->time = Sql_GetUIntData(SqlHandle, 4);
                Pet->size = Sql_GetUIntData(SqlHandle, 5);
                Pet->EcoSystem = (ECOSYSTEM)Sql_GetIntData(SqlHandle, 6);
                Pet->m_Family = (uint16)Sql_GetIntData(SqlHandle, 7);
                Pet->mJob = (uint8)Sql_GetIntData(SqlHandle, 8);
                Pet->sJob = (uint8)Sql_GetIntData(SqlHandle, 43);
                Pet->m_Element = (uint8)Sql_GetIntData(SqlHandle, 9);
                Pet->m_Behaviour = (uint16)Sql_GetIntData(SqlHandle, 42);

                Pet->HPscale = Sql_GetFloatData(SqlHandle, 10);
                Pet->MPscale = Sql_GetFloatData(SqlHandle, 11);

                Pet->speed = (uint8)Sql_GetIntData(SqlHandle, 12);

                Pet->strRank = (uint8)Sql_GetIntData(SqlHandle, 13);
                Pet->dexRank = (uint8)Sql_GetIntData(SqlHandle, 14);
                Pet->vitRank = (uint8)Sql_GetIntData(SqlHandle, 15);
                Pet->agiRank = (uint8)Sql_GetIntData(SqlHandle, 16);
                Pet->intRank = (uint8)Sql_GetIntData(SqlHandle, 17);
                Pet->mndRank = (uint8)Sql_GetIntData(SqlHandle, 18);
                Pet->chrRank = (uint8)Sql_GetIntData(SqlHandle, 19);
                Pet->defRank = (uint8)Sql_GetIntData(SqlHandle, 20);
                Pet->attRank = (uint8)Sql_GetIntData(SqlHandle, 21);
                Pet->accRank = (uint8)Sql_GetIntData(SqlHandle, 22);
                Pet->evaRank = (uint8)Sql_GetIntData(SqlHandle, 23);

                Pet->hasSpellScript = (bool)Sql_GetIntData(SqlHandle, 24);

                Pet->spellList = (uint16)Sql_GetIntData(SqlHandle, 25);
                Pet->m_SpellListContainer = trustSpellList::GetTrustSpellList(Pet->spellList);

                // resistances
                Pet->slashres = (uint16)(Sql_GetFloatData(SqlHandle, 26) * 1000);
                Pet->pierceres = (uint16)(Sql_GetFloatData(SqlHandle, 27) * 1000);
                Pet->hthres = (uint16)(Sql_GetFloatData(SqlHandle, 28) * 1000);
                Pet->impactres = (uint16)(Sql_GetFloatData(SqlHandle, 29) * 1000);

                Pet->firedef = 0;
                Pet->icedef = 0;
                Pet->winddef = 0;
                Pet->earthdef = 0;
                Pet->thunderdef = 0;
                Pet->waterdef = 0;
                Pet->lightdef = 0;
                Pet->darkdef = 0;

                Pet->fireres = (uint16)((Sql_GetFloatData(SqlHandle, 30) - 1) * -100);
                Pet->iceres = (uint16)((Sql_GetFloatData(SqlHandle, 31) - 1) * -100);
                Pet->windres = (uint16)((Sql_GetFloatData(SqlHandle, 32) - 1) * -100);
                Pet->earthres = (uint16)((Sql_GetFloatData(SqlHandle, 33) - 1) * -100);
                Pet->thunderres = (uint16)((Sql_GetFloatData(SqlHandle, 34) - 1) * -100);
                Pet->waterres = (uint16)((Sql_GetFloatData(SqlHandle, 35) - 1) * -100);
                Pet->lightres = (uint16)((Sql_GetFloatData(SqlHandle, 36) - 1) * -100);
                Pet->darkres = (uint16)((Sql_GetFloatData(SqlHandle, 37) - 1) * -100);

                Pet->cmbDelay = (uint16)Sql_GetIntData(SqlHandle, 38);
                Pet->name_prefix = (uint8)Sql_GetUIntData(SqlHandle, 39);
                Pet->m_MobSkillList = (uint16)Sql_GetUIntData(SqlHandle, 40);

                g_PTrustList.push_back(Pet);
            }
        }
    }

    /************************************************************************
    *																		*
    *  Освобождаем список прототипов питомцев								*
    *																		*
    ************************************************************************/

    void FreeTrustList()
    {
        while (!g_PTrustList.empty())
        {
            delete *g_PTrustList.begin();
            g_PTrustList.erase(g_PTrustList.begin());
        }
    }

    void LoadTrustStats(CTrustEntity* PTrust)
    {
        // Cargo cult of PC calculations.

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

        uint8 mlvl = PTrust->GetMLevel();
        uint8 slvl = PTrust->GetSLevel();
        JOBTYPE mjob = PTrust->GetMJob();
        JOBTYPE sjob = PTrust->GetSJob();

        uint8 race = 0;                 //Human

        switch (PTrust->look.race)
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


        PTrust->health.maxhp = (int16)(map_config.player_hp_multiplier * (raceStat + jobStat + bonusStat + sJobStat));

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

        PTrust->health.maxmp = (int16)(map_config.player_mp_multiplier * (raceStat + jobStat + sJobStat)); // результат расчета MP

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

            // Вывод значения
            ref<uint16>(&PTrust->stats, counter) = (uint16)((raceStat + jobStat + sJobStat));
            counter += 2;
        }
    }

    int16 TrustCheck(CCharEntity* PMaster, uint32 TrustID)
    {
        // TODO: You can only spawn trusts in battle areas, similar to pets. See MSGBASIC_TRUST_NOT_HERE

        // TODO: There is an expandable limit of trusts you can summon, based on key items.
        size_t maxTrusts = 5;

        // TODO: These checks should be done at before spellcast time!!
        // If you're in a party, you can only spawn trusts if:
        //  * You're the party leader
        //  * The party isn't full
        //  * The party isn't part of an alliance

        if (PMaster->PParty != nullptr)
        {
            CBattleEntity* PLeader = PMaster->PParty->GetLeader();
            if (PMaster->PParty->members.size() >= 6)
            {
                return (int16)MsgStd::TrustLimit;
            }    

            if (PLeader == nullptr || PLeader->id != PMaster->id)
            {
                return (int16)MsgStd::TrustSoloOrLeader;
            }

            if (PMaster->PParty->m_PAlliance != nullptr)
            {
                return (int16)MsgStd::TrustSoloOrLeader;
            }
            //WaitParty


            // Reduce the max number of summonable trusts
            maxTrusts = 6 - PMaster->PParty->members.size();
        }

        if (PMaster->m_LastPartyTime > server_clock::now())
        {
            return (int16)MsgStd::WaitParty;
        }

        if (PMaster->PTrusts.size() >= maxTrusts)
        {
            return (int16)MsgStd::TrustLimit;
        }

        for (auto&& PPotentialTarget : PMaster->SpawnMOBList)
        {
            if (PPotentialTarget.second->animation == ANIMATION_ATTACK &&
                ((CMobEntity*)PPotentialTarget.second)->HasID(PMaster->id))
            {
                return (int16)MsgStd::TrustEnmity;
            }
        }

        // You can't spawn the same trust twice
        // TODO: This includes otherwise distinct trusts, e.g. Shantotto and Shantotto II, only 1 can be called.
        //       It'd probably be "good enough" to use the name as a heuristic, looking for "II" (this catches 99% of them).
        for (auto PTrust : PMaster->PTrusts)
        {
            if (PTrust->m_TrustID == TrustID)
            {
                return (int16)MsgStd::TrustSame;
            }
        }

        if (PMaster->nameflags.flags & FLAG_INVITE)
        {
            return (int16)MsgStd::TrustCannotLFP;
        }
        return 0;
    }


    void SpawnTrust(CCharEntity* PMaster, uint32 TrustID)
    {
        // Make a new party if we weren't in one.
        // TODO: It's actually not a real party: /sea shows your name as grey not yellow, but it shows as a party on the GUI.
        if (PMaster->PParty == nullptr)
        {
            PMaster->PParty = new CParty(PMaster);
        }

        CTrustEntity* PTrust = LoadTrust(PMaster, TrustID);
        GetAvailableSpells(PTrust);
        PMaster->PTrusts.insert(PMaster->PTrusts.end(), PTrust);
        PMaster->StatusEffectContainer->CopyConfrontationEffect(PTrust);

        PMaster->loc.zone->InsertTRUST(PTrust);
        //PMaster->PParty->ReloadParty();
        PMaster->ReloadPartyInc();

        luautils::OnTrustSpawn(PTrust);

        PMaster->pushPacket(new CCharUpdatePacket(PMaster));
        PMaster->pushPacket(new CTrustSyncPacket((CCharEntity*)PMaster, PTrust));
        //PMaster->loc.zone->PushPacket(PTrust, CHAR_INZONE, new CTrustSyncPacket(PMaster, PTrust));
    }

    bool HasTrust(CCharEntity* PMaster, uint32 TrustID)
    {
        if (PMaster->PTrusts.size() > 0)
        {
            for (auto PTrust : PMaster->PTrusts)
            {
                if (PTrust->m_TrustID == TrustID)
                {
                    return true;
                }
            }
        }
        return false;
    }

    CTrustEntity* LoadTrust(CCharEntity* PMaster, uint32 TrustID)
    {
        CTrustEntity* PTrust = new CTrustEntity;
        Trust_t* trust = new Trust_t();
        uint32 x = 0;

        for (x; x < g_PTrustList.size(); x++)
        {
            if (g_PTrustList.at(x)->trustId == TrustID)
            {
                trust = g_PTrustList.at(x);
                break;
            }
        }

        DSP_DEBUG_BREAK_IF(x > g_PTrustList.size());

        PTrust->PMaster = PMaster;
        PTrust->loc = PMaster->loc;
        PTrust->m_OwnerID.id = PMaster->id;
        PTrust->m_OwnerID.targid = PMaster->targid;

        // spawn me randomly around master
        PTrust->loc.p = nearPosition(PMaster->loc.p, 3.0f, (float)M_PI);

        PTrust->look = trust->look;
        PTrust->name = trust->name;
        PTrust->m_MobSkillList = trust->m_MobSkillList;
        PTrust->m_Element = trust->m_Element;
        PTrust->m_TrustID = TrustID;
        PTrust->status = STATUS_NORMAL;
        PTrust->m_name_prefix = trust->name_prefix;
        PTrust->m_ModelSize = trust->size;
        PTrust->m_EcoSystem = trust->EcoSystem;
        PTrust->m_Behaviour = trust->m_Behaviour;
        PTrust->m_HasSpellScript = trust->hasSpellScript;
        PTrust->m_TrustSpellListContainer = trustSpellList::GetTrustSpellList(trust->spellList);
        PTrust->m_TrustWSListContainer = trustWSList::GetTrustWSList(TrustID - 895);

        // assume level matches master
        PTrust->SetMJob(trust->mJob);
        PTrust->SetSJob(trust->sJob);
        PTrust->SetMLevel(PMaster->GetMLevel());
        PTrust->SetSLevel(PMaster->GetMLevel() / 2);

        // TODO: Proper stats per trust
        PTrust->setModifier(Mod::ATT, battleutils::GetMaxSkill(SKILL_CLUB, JOB_WHM, PTrust->GetMLevel()));
        PTrust->setModifier(Mod::ACC, battleutils::GetMaxSkill(SKILL_CLUB, JOB_WHM, PTrust->GetMLevel()));
        PTrust->setModifier(Mod::EVA, battleutils::GetMaxSkill(SKILL_THROWING, JOB_WHM, PTrust->GetMLevel())); // Throwing??
        PTrust->setModifier(Mod::DEF, battleutils::GetMaxSkill(SKILL_THROWING, JOB_WHM, PTrust->GetMLevel()));

        PTrust->defaultMobMod(MOBMOD_SPECIAL_COOL, 4);
        PTrust->defaultMobMod(MOBMOD_SPECIAL_DELAY, 4);
        PTrust->defaultMobMod(MOBMOD_TP_USE_CHANCE, 75);

        //set C magic evasion
        PTrust->setModifier(Mod::MEVA, battleutils::GetMaxSkill(SKILL_ELEMENTAL_MAGIC, JOB_RDM, PTrust->GetMLevel()));

        ((CItemWeapon*)PTrust->m_Weapons[SLOT_MAIN])->setDelay((trust->cmbDelay * 1000) / 60);

        // HP/MP STR/DEX/etc..
        LoadTrustStats(PTrust);

        PTrust->health.tp = 0;
        PTrust->UpdateHealth();
        PTrust->health.hp = PTrust->GetMaxHP();
        PTrust->health.mp = PTrust->GetMaxMP();

        // TODO: Load stats from script
        return PTrust;
    }

    void RecalculateActionContainer(CTrustEntity* PTrust)
    {
        // clear spell list
        PTrust->TrustSpellContainer->ClearSpells();
        PTrust->TrustSpellContainer->ClearWeaponskills();

        //insert the rest of the spells
        for (std::vector<TrustSpell_t>::iterator it = PTrust->m_TrustSpellListContainer->m_spellList.begin(); it != PTrust->m_TrustSpellListContainer->m_spellList.end(); ++it)
        {
            if (PTrust->GetMLevel() >= (*it).min_level && PTrust->GetMLevel() <= (*it).max_level)
            {
                PTrust->TrustSpellContainer->AddSpell((*it).spellId);
            }
        }

        if (PTrust->m_TrustWSListContainer != nullptr)
        {
            for (std::vector<TrustWS_t>::iterator it = PTrust->m_TrustWSListContainer->m_wsList.begin(); it != PTrust->m_TrustWSListContainer->m_wsList.end(); ++it)
            {
                if (PTrust->GetMLevel() >= (*it).min_level && PTrust->GetMLevel() <= (*it).max_level)
                {
                    PTrust->TrustSpellContainer->AddWeaponskills((*it).wsMobId);
                }
            }
        }
    }

    void GetAvailableSpells(CTrustEntity* PTrust) {
        //make sure the mob actually has a spell list
        if (PTrust->m_TrustSpellListContainer == nullptr)
        {
            return;
        }

        // catch all non-defaulted spell chances
        PTrust->defaultMobMod(MOBMOD_GA_CHANCE, 35);
        PTrust->defaultMobMod(MOBMOD_NA_CHANCE, 50);
        PTrust->defaultMobMod(MOBMOD_BUFF_CHANCE, 35);
        PTrust->defaultMobMod(MOBMOD_HEAL_CHANCE, 75);
        PTrust->defaultMobMod(MOBMOD_HP_HEAL_CHANCE, 75);

        PTrust->defaultMobMod(MOBMOD_MAGIC_COOL, 4);
        PTrust->defaultMobMod(MOBMOD_MAGIC_DELAY, 4);


        RecalculateActionContainer(PTrust);

        // make sure mob has mp to cast spells
        if (PTrust->health.maxmp == 0 && PTrust->TrustSpellContainer != nullptr && PTrust->TrustSpellContainer->HasMPSpells())
        {
            ShowError("mobutils::CalculateStats Mob (%u) has no mp for casting spells!\n", PTrust->id);
        }
    }

    bool isValidSelfTargetWeaponskill(int wsid) {
        switch (wsid) {
        case 163: //starlight
        case 164: //moonlight
            return true;
        }
        return false;
    }

    void DespawnTrust(CBattleEntity* PMaster, CTrustEntity* PMob)
    {

        CTrustEntity* PTrust = PMob;
        CCharEntity* PChar = (CCharEntity*)PMaster;

        PTrust->PAI->Internal_Die(0s);

        //if (PTrust->isAlive())
        //{
        //    PTrust->PAI->Internal_Despawn();
        //}

        PChar->pushPacket(new CCharUpdatePacket(PChar));
    }

}; // namespace petutils
