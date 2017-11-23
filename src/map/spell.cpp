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

#include <string.h>
#include <array>

#include "lua/luautils.h"

#include "map.h"
#include "spell.h"
#include "blue_spell.h"
#include "status_effect_container.h"
#include "utils/blueutils.h"
#include "items/item_weapon.h"


CSpell::CSpell(SpellID id)
{
    m_ID = id;
}

  std::unique_ptr<CSpell> CSpell::clone()
  {
      //no make_unique because it requires the copy constructor to be public
      return std::unique_ptr<CSpell>(new CSpell(*this));
  }

void CSpell::setTotalTargets(std::uint16_t total)
{
    m_totalTargets = total;
}

std::uint16_t CSpell::getTotalTargets()
{
    return m_totalTargets;
}

void CSpell::setID(SpellID id)
{
    m_ID = id;
}

SpellID CSpell::getID()
{
    return m_ID;
}

std::uint8_t CSpell::getJob(JOBTYPE JobID)
{
    return (m_job[JobID] == CANNOT_USE_SPELL ? 255 : m_job[JobID]);
}

void CSpell::setJob(std::int8_t* jobs)
{
    memcpy(&m_job[1], jobs, 22);
}

uint32 CSpell::getCastTime()
{
    return m_castTime;
}

void CSpell::setCastTime(uint32 CastTime)
{
    m_castTime = CastTime;
}

uint32 CSpell::getRecastTime()
{
    return m_recastTime;
}

void CSpell::setRecastTime(uint32 RecastTime)
{
    m_recastTime = RecastTime;
}

const std::int8_t* CSpell::getName()
{
    return (const std::int8_t*)m_name.c_str();
}

void CSpell::setName(std::int8_t* name)
{
    m_name.clear();
    m_name.insert(0, (const char*)name);
}

SPELLGROUP CSpell::getSpellGroup()
{
    return m_spellGroup;
}

void CSpell::setSpellGroup(SPELLGROUP SpellGroup)
{
    m_spellGroup = SpellGroup;
}

std::uint8_t CSpell::getSkillType()
{
    return m_skillType;
}

void CSpell::setSkillType(std::uint8_t SkillType)
{
    m_skillType = SkillType;
}

bool CSpell::isBuff()
{
    return (getValidTarget() & TARGET_SELF) && !(getValidTarget() & TARGET_ENEMY);
}

bool CSpell::tookEffect()
{
    if(m_message == 75 || m_message == 284 || m_message == 283 || m_message == 85){
        return false;
    }
    return true;
}

bool CSpell::hasMPCost()
{
    return m_spellGroup != SPELLGROUP_SONG && m_spellGroup != SPELLGROUP_NINJUTSU;
}

bool CSpell::isHeal()
{
    return ((getValidTarget() & TARGET_SELF) && getSkillType() == SKILL_HEA) || m_ID == SpellID::Pollen || m_ID == SpellID::Wild_Carrot || m_ID == SpellID::Healing_Breeze || m_ID == SpellID::Magic_Fruit;
}


bool CSpell::isCure()
{
    return ((static_cast<std::uint16_t>(m_ID) >= 1 && static_cast<std::uint16_t>(m_ID) <= 11) || m_ID == SpellID::Cura || m_ID == SpellID::Cura_II || m_ID == SpellID::Cura_III);
}

bool CSpell::isNa()
{
    return (static_cast<std::uint16_t>(m_ID) >= 14 && static_cast<std::uint16_t>(m_ID) <= 20) || m_ID == SpellID::Erase;
}

bool CSpell::canHitShadow()
{
    return m_ID != SpellID::Meteor_II && canTargetEnemy();
}

bool CSpell::dealsDamage()
{
    //damage or drain hp
    return m_message == 2 || m_message == 227 || m_message == 252 || m_message == 274;
}

float CSpell::getRadius()
{
    return m_radius;
}

std::uint16_t CSpell::getZoneMisc()
{
    return m_zoneMisc;
}

void CSpell::setZoneMisc(std::uint16_t Misc)
{
    m_zoneMisc = Misc;
}

std::uint16_t CSpell::getAnimationID()
{
    return m_animation;
}

void CSpell::setAnimationID(std::uint16_t AnimationID)
{
    m_animation = AnimationID;
}

std::uint16_t CSpell::getAnimationTime()
{
    return m_animationTime;
}

void CSpell::setAnimationTime(std::uint16_t AnimationTime)
{
    m_animationTime = AnimationTime;
}

std::uint16_t CSpell::getMPCost()
{
    return m_mpCost;
}

void CSpell::setMPCost(std::uint16_t MP)
{
    m_mpCost = MP;
}

bool CSpell::canTargetEnemy()
{
    return (getValidTarget() & TARGET_ENEMY) && !(getValidTarget() & TARGET_SELF);
}

std::uint8_t CSpell::getAOE()
{
    return m_AOE;
}

void CSpell::setAOE(std::uint8_t AOE)
{
    m_AOE = AOE;
}

std::uint16_t CSpell::getBase()
{
    return m_base;
}

void CSpell::setBase(std::uint16_t base)
{
    m_base = base;
}

std::uint8_t CSpell::getValidTarget()
{
    return m_ValidTarget;
}

void CSpell::setValidTarget(std::uint8_t ValidTarget)
{
    m_ValidTarget = ValidTarget;
}

float CSpell::getMultiplier()
{
    return m_multiplier;
}

void CSpell::setMultiplier(float multiplier)
{
    m_multiplier = multiplier;
}

std::uint16_t CSpell::getMessage()
{
    return m_message;
}

std::uint16_t CSpell::getAoEMessage()
{
    switch(m_message){
        case 93: // vanishes
            return 273;
        case 85: // resists
            return 284;
        case 230: //casts gain the effect of
            return 266; // gains the effect of
        case 236: // is blind
            // return 203;
            return 277;
            // 279
        case 237: //if its a damage spell msg and is hitting the 2nd+ target
        return 278;
        case 2: //if its a damage spell msg and is hitting the 2nd+ target
            return 264;
        default:
            return m_message;
    }
}

void CSpell::setMessage(std::uint16_t message)
{
    m_message = message;
}

std::uint16_t CSpell::getMagicBurstMessage()
{
    return m_MagicBurstMessage;
}

void CSpell::setMagicBurstMessage(std::uint16_t message)
{
    m_MagicBurstMessage = message;
}

std::uint16_t CSpell::getElement()
{
    return m_element;
}

void CSpell::setElement(std::uint16_t element)
{
    m_element = element;
}

void CSpell::setCE(std::uint16_t ce)
{
    m_CE = ce;
}

std::uint16_t CSpell::getCE()
{
    return m_CE;
}

void CSpell::setRadius(float radius)
{
    m_radius = radius;
}

void CSpell::setVE(std::uint16_t ve)
{
    m_VE = ve;
}

std::uint16_t CSpell::getVE()
{
    return m_VE;
}

void CSpell::setModifiedRecast(uint32 mrec)
{
    m_modifiedRecastTime = mrec;
}

uint32 CSpell::getModifiedRecast()
{
    return m_modifiedRecastTime;
}

std::uint8_t CSpell::getRequirements()
{
    return m_requirements;
}

void CSpell::setRequirements(std::uint8_t requirements)
{
    m_requirements = requirements;
}

std::uint16_t CSpell::getMeritId()
{
    return m_meritId;
}

void CSpell::setMeritId(std::uint16_t meritId)
{
    m_meritId = meritId;
}

std::uint8_t CSpell::getFlag()
{
    return m_flag;
}

void CSpell::setFlag(std::uint8_t flag)
{
    m_flag = flag;
}

std::int8_t* CSpell::getContentTag()
{
    return m_contentTag;
}

float CSpell::getRange()
{
    return m_range;
}

void CSpell::setContentTag(std::int8_t* contentTag)
{
    m_contentTag = contentTag;
}

void CSpell::setRange(float range)
{
    m_range = range;
}

//Implement namespace to work with spells
namespace spell
{
    std::array<CSpell*, 1024> PSpellList; // spell list
    std::map<std::uint16_t, std::uint16_t> PMobSkillToBlueSpell; // maps the skill id (key) to spell id (value).

    //Load a list of spells
    void LoadSpellList()
    {
        const char* Query = "SELECT spellid, name, jobs, `group`, validTargets, skill, castTime, recastTime, animation, animationTime, mpCost, \
                             AOE, base, element, zonemisc, multiplier, message, magicBurstMessage, CE, VE, requirements, content_tag, spell_range \
                             FROM spell_list;";

        std::int32_t ret = Sql_Query(SqlHandle, Query);

        if( ret != SQL_ERROR && Sql_NumRows(SqlHandle) != 0)
        {
            while(Sql_NextRow(SqlHandle) == SQL_SUCCESS)
            {
                char* contentTag;
                CSpell* PSpell = nullptr;
                SpellID id = (SpellID)Sql_GetUIntData(SqlHandle,0);

                if ((SPELLGROUP)Sql_GetIntData(SqlHandle, 3) == SPELLGROUP_BLUE)
                {
                    PSpell = new CBlueSpell(id);
                }
                else
                {
                    PSpell = new CSpell(id);
                }

                PSpell->setName(Sql_GetData(SqlHandle,1));
                PSpell->setJob(Sql_GetData(SqlHandle,2));
                PSpell->setSpellGroup((SPELLGROUP)Sql_GetIntData(SqlHandle,3));
                PSpell->setValidTarget(Sql_GetIntData(SqlHandle,4));
                PSpell->setSkillType(Sql_GetIntData(SqlHandle,5));
                PSpell->setCastTime(Sql_GetIntData(SqlHandle,6));
                PSpell->setRecastTime(Sql_GetIntData(SqlHandle,7));
                PSpell->setAnimationID(Sql_GetIntData(SqlHandle,8));
                PSpell->setAnimationTime(Sql_GetIntData(SqlHandle,9));
                PSpell->setMPCost(Sql_GetIntData(SqlHandle,10));
                PSpell->setAOE(Sql_GetIntData(SqlHandle,11));
                PSpell->setBase(Sql_GetIntData(SqlHandle,12));
                PSpell->setElement(Sql_GetIntData(SqlHandle,13));
                PSpell->setZoneMisc(Sql_GetIntData(SqlHandle,14));
                PSpell->setMultiplier((float)Sql_GetIntData(SqlHandle,15));
                PSpell->setMessage(Sql_GetIntData(SqlHandle,16));
                PSpell->setMagicBurstMessage(Sql_GetIntData(SqlHandle,17));
                PSpell->setCE(Sql_GetIntData(SqlHandle,18));
                PSpell->setVE(Sql_GetIntData(SqlHandle,19));
                PSpell->setRequirements(Sql_GetIntData(SqlHandle,20));

                Sql_GetData(SqlHandle, 21, &contentTag, nullptr);
                PSpell->setContentTag((std::int8_t*)contentTag);

                PSpell->setRange(static_cast<float>(Sql_GetIntData(SqlHandle, 22)) / 10);

                if(PSpell->getAOE())
                {
                    // default radius
                    PSpell->setRadius(10);
                }

                PSpellList[static_cast<std::uint16_t>(PSpell->getID())] = PSpell;
            }
        }

        const char* blueQuery = "SELECT blue_spell_list.spellid, blue_spell_list.mob_skill_id, blue_spell_list.set_points, \
                                blue_spell_list.trait_category, blue_spell_list.trait_category_weight, blue_spell_list.primary_sc, \
                                blue_spell_list.secondary_sc, spell_list.content_tag \
                             FROM blue_spell_list JOIN spell_list on blue_spell_list.spellid = spell_list.spellid;";

        ret = Sql_Query(SqlHandle, blueQuery);

        if( ret != SQL_ERROR && Sql_NumRows(SqlHandle) != 0)
        {
            while(Sql_NextRow(SqlHandle) == SQL_SUCCESS)
            {
                char* contentTag;
                Sql_GetData(SqlHandle, 7, &contentTag, nullptr);

                if (luautils::IsContentEnabled(contentTag) == false){
                    continue;
                }

                // Sanity check the spell ID
                std::uint16_t spellId = Sql_GetIntData(SqlHandle,0);

                if(PSpellList[spellId] == nullptr)
                {
                    ShowWarning("spell::LoadSpellList Tried to load nullptr blue spell (%u)\n", spellId);
                    continue;
                }

                ((CBlueSpell*)PSpellList[spellId])->setMonsterSkillId(Sql_GetIntData(SqlHandle,1));
                ((CBlueSpell*)PSpellList[spellId])->setSetPoints(Sql_GetIntData(SqlHandle,2));
                ((CBlueSpell*)PSpellList[spellId])->setTraitCategory(Sql_GetIntData(SqlHandle,3));
                ((CBlueSpell*)PSpellList[spellId])->setTraitWeight(Sql_GetIntData(SqlHandle,4));
                ((CBlueSpell*)PSpellList[spellId])->setPrimarySkillchain(Sql_GetIntData(SqlHandle,5));
                ((CBlueSpell*)PSpellList[spellId])->setSecondarySkillchain(Sql_GetIntData(SqlHandle,6));
                PMobSkillToBlueSpell.insert(std::make_pair(Sql_GetIntData(SqlHandle,1), spellId));
            }
        }
        ret = Sql_Query(SqlHandle,"SELECT spellId, modId, value FROM blue_spell_mods WHERE spellId IN (SELECT spellId FROM spell_list LEFT JOIN blue_spell_list USING (spellId))");

        if( ret != SQL_ERROR && Sql_NumRows(SqlHandle) != 0)
        {
            while(Sql_NextRow(SqlHandle) == SQL_SUCCESS)
            {
                std::uint16_t spellId = (std::uint16_t)Sql_GetUIntData(SqlHandle,0);
                Mod modID  = static_cast<Mod>(Sql_GetUIntData(SqlHandle,1));
                std::int16_t  value  = (std::int16_t) Sql_GetIntData (SqlHandle,2);

                if (PSpellList[spellId])
                {
                    ((CBlueSpell*)PSpellList[spellId])->addModifier(CModifier(modID,value));
                }
            }
        }

        ret = Sql_Query(SqlHandle,"SELECT spellId, meritId, content_tag FROM spell_list INNER JOIN merits ON spell_list.name = merits.name;");

        if( ret != SQL_ERROR && Sql_NumRows(SqlHandle) != 0)
        {
            while(Sql_NextRow(SqlHandle) == SQL_SUCCESS)
            {
                char* contentTag;
                Sql_GetData(SqlHandle, 2, &contentTag, nullptr);

                if (luautils::IsContentEnabled(contentTag) == false){
                    continue;
                }

                std::uint16_t spellId = (std::uint16_t)Sql_GetUIntData(SqlHandle,0);

                if (PSpellList[spellId])
                {
                    PSpellList[spellId]->setMeritId(Sql_GetUIntData(SqlHandle,1));
                }
            }
        }
    }

    CSpell* GetSpellByMonsterSkillId(std::uint16_t SkillID) {
        std::map<std::uint16_t,std::uint16_t>::iterator it = PMobSkillToBlueSpell.find(SkillID);
        if (it == PMobSkillToBlueSpell.end()) {
            return nullptr;
        }
        else {
            std::uint16_t spellId = it->second;
            return PSpellList[spellId];
        }
    }

    //Get Spell By ID
    CSpell* GetSpell(SpellID SpellID)
    {
        return PSpellList[static_cast<size_t>(SpellID)];
    }

    bool CanUseSpell(CBattleEntity* PCaster, SpellID SpellID)
    {
        CSpell* spell = GetSpell(SpellID);
        return CanUseSpell(PCaster, spell);
    }

    //Check If user can cast spell
    bool CanUseSpell(CBattleEntity* PCaster, CSpell* spell)
    {
        bool usable = false;

        if (spell != nullptr)
        {
            std::uint8_t JobMLVL = spell->getJob(PCaster->GetMJob());
            std::uint8_t JobSLVL = spell->getJob(PCaster->GetSJob());
            std::uint8_t requirements = spell->getRequirements();

            if (PCaster->objtype == TYPE_MOB || (PCaster->objtype == TYPE_PET && static_cast<CPetEntity*>(PCaster)->getPetType() == PETTYPE_AUTOMATON))
            {
                // cant cast cause im hidden or untargetable
                if (PCaster->IsNameHidden() || static_cast<CMobEntity*>(PCaster)->IsUntargetable())
                    return false;

                // Mobs can cast any non-given char spell
                return true;
            }

            if(PCaster->GetMLevel() >= JobMLVL)
            {
                usable = true;
                if (requirements & SPELLREQ_TABULA_RASA)
                {
                    if (!PCaster->StatusEffectContainer->HasStatusEffect(EFFECT_TABULA_RASA))
                    {
                        usable = false;
                    }
                }
                if (requirements & SPELLREQ_ADDENDUM_BLACK && PCaster->GetMJob() == JOB_SCH)
                {
                    if (!PCaster->StatusEffectContainer->HasStatusEffect({EFFECT_ADDENDUM_BLACK, EFFECT_ENLIGHTENMENT}))
                    {
                        usable = false;
                    }
                }
                else if (requirements & SPELLREQ_ADDENDUM_WHITE && PCaster->GetMJob() == JOB_SCH)
                {
                    if (!PCaster->StatusEffectContainer->HasStatusEffect({EFFECT_ADDENDUM_WHITE, EFFECT_ENLIGHTENMENT}))
                    {
                        usable = false;
                    }
                }
                else if (spell->getSpellGroup() == SPELLGROUP_BLUE)
                {
                    if (PCaster->objtype == TYPE_PC)
                    {
                        if (requirements & SPELLREQ_UNBRIDLED_LEARNING)
                        {
                            if (!PCaster->StatusEffectContainer->HasStatusEffect({EFFECT_UNBRIDLED_LEARNING, EFFECT_UNBRIDLED_WISDOM}))
                            {
                                usable = false;
                            }
                        }
                        else if (!blueutils::IsSpellSet((CCharEntity*)PCaster, (CBlueSpell*)spell))
                        {
                            usable = false;
                        }
                    }
                }
                if (usable) { return true; }
            }
            if(PCaster->GetSLevel() >= JobSLVL)
            {
                usable = true;
                if (requirements & SPELLREQ_TABULA_RASA)
                {
                    if (!PCaster->StatusEffectContainer->HasStatusEffect(EFFECT_TABULA_RASA))
                    {
                        usable = false;
                    }
                }
                if (requirements & SPELLREQ_ADDENDUM_BLACK && PCaster->GetSJob() == JOB_SCH)
                {
                    if (!PCaster->StatusEffectContainer->HasStatusEffect({EFFECT_ADDENDUM_BLACK, EFFECT_ENLIGHTENMENT}))
                    {
                        usable = false;
                    }
                }
                else if (requirements & SPELLREQ_ADDENDUM_WHITE && PCaster->GetSJob() == JOB_SCH)
                {
                    if (!PCaster->StatusEffectContainer->HasStatusEffect({EFFECT_ADDENDUM_WHITE, EFFECT_ENLIGHTENMENT}))
                    {
                        usable = false;
                    }
                }
                else if (spell->getSpellGroup() == SPELLGROUP_BLUE)
                {
                    if (PCaster->objtype == TYPE_PC)
                    {
                        if (requirements & SPELLREQ_UNBRIDLED_LEARNING)
                        {
                            if (!PCaster->StatusEffectContainer->HasStatusEffect({EFFECT_UNBRIDLED_LEARNING, EFFECT_UNBRIDLED_WISDOM}))
                            {
                                usable = false;
                            }
                        }
                        else if (!blueutils::IsSpellSet((CCharEntity*)PCaster, (CBlueSpell*)spell))
                        {
                            usable = false;
                        }
                    }
                }
            }
        }
        return usable;
    }

    // This is a utility method for mobutils, when we want to work out if we can give monsters a spell
    // but they are on an odd job (e.g. PLDs getting -ga3)
    bool CanUseSpellWith(SpellID spellId, JOBTYPE job, std::uint8_t level)
    {
        if (GetSpell(spellId) != nullptr)
        {
            std::uint8_t jobMLevel = PSpellList[static_cast<size_t>(spellId)]->getJob(job);

            return level > jobMLevel;
        }
        return false;
    }

    float GetSpellRadius(CSpell* spell, CBattleEntity* entity)
    {
        float total = spell->getRadius();

        // brd gets bonus radius from string skill
        if(spell->getSpellGroup() == SPELLGROUP_SONG && (spell->getValidTarget() & TARGET_SELF)){
            if(entity->objtype == TYPE_MOB || (entity->GetMJob() == JOB_BRD &&
                entity->objtype == TYPE_PC && ((CCharEntity*)entity)->getEquip(SLOT_RANGED) &&
                ((CItemWeapon*)((CCharEntity*)entity)->getEquip(SLOT_RANGED))->getSkillType() == SKILL_STR)){
                total += ((float)entity->GetSkill(SKILL_STR) / 276) * 10;
            }

            if (total > 20){
                total = 20;
            }
        }

        return total;
    }
};
