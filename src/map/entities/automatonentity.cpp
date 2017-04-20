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

#include "automatonentity.h"
#include "../ai/ai_container.h"
#include "../ai/controllers/automaton_controller.h"
#include "../utils/puppetutils.h"
#include "../../common/utils.h"
#include "../packets/entity_update.h"
#include "../packets/pet_sync.h"
#include "../packets/char_job_extra.h"
#include "../status_effect_container.h"
#include "../ai/states/magic_state.h"
#include "../ai/states/mobskill_state.h"
#include "../packets/action.h"
#include "../mob_modifier.h"
#include "../utils/mobutils.h"

// Maybe move these to a sql table?
std::unordered_map<AUTOSPELL, uint16, EnumClassHash> g_autoSpellList{
    { AUTOSPELL_DIA,            0 }, // Temp fix
    { AUTOSPELL_CURE,           12 },
    { AUTOSPELL_STONE,          15 },
    { AUTOSPELL_POISON,         18 },
    { AUTOSPELL_PARALYZE,       21 },
    { AUTOSPELL_PROTECT,        24 },
    { AUTOSPELL_BLIND,          27 },
    { AUTOSPELL_POISONA,        27 },
    { AUTOSPELL_WATER,          30 },
    { AUTOSPELL_BIO,            33 },
    { AUTOSPELL_PARALYNA,       36 },
    { AUTOSPELL_SLOW,           42 },
    { AUTOSPELL_AERO,           45 },
    { AUTOSPELL_BLINDNA,        45 },
    { AUTOSPELL_CURE_II,        45 },
    { AUTOSPELL_DRAIN,          45 },
    { AUTOSPELL_SHELL,          54 },
    { AUTOSPELL_SILENCE,        57 },
    { AUTOSPELL_FIRE,           60 },
    { AUTOSPELL_SILENA,         60 },
    { AUTOSPELL_REGEN,          66 },
    { AUTOSPELL_BLIZZARD,       75 },
    { AUTOSPELL_ASPIR,          78 },
    { AUTOSPELL_CURE_III,       81 },
    { AUTOSPELL_PROTECT_II,     84 },
    { AUTOSPELL_CURSNA,         90 },
    { AUTOSPELL_THUNDER,        90 },
    { AUTOSPELL_DIA_II,         96 },
    { AUTOSPELL_ERASE,          99 },
    { AUTOSPELL_PHALANX,        99 },
    { AUTOSPELL_DISPEL,         105 },
    { AUTOSPELL_STONESKIN,      105 },
    { AUTOSPELL_VIRUNA,         105 },
    { AUTOSPELL_BIO_II,         107 },
    { AUTOSPELL_STONE_II,       108 },
    { AUTOSPELL_SHELL_II,       114 },
    { AUTOSPELL_ABSORB_INT,     120 },
    { AUTOSPELL_STONA,          120 },
    { AUTOSPELL_WATER_II,       123 },
    { AUTOSPELL_REGEN_II,       135 },
    { AUTOSPELL_AERO_II,        138 },
    { AUTOSPELL_POISON_II,      141 },
    { AUTOSPELL_PROTECT_III,    144 },
    { AUTOSPELL_CURE_IV,        147 },
    { AUTOSPELL_HASTE,          147 },
    { AUTOSPELL_FIRE_II,        153 },
    { AUTOSPELL_BLIZZARD_II,    178 },
    { AUTOSPELL_SHELL_III,      188 },
    { AUTOSPELL_THUNDER_II,     203 },
    { AUTOSPELL_CURE_V,         207 },
    { AUTOSPELL_PROTECT_IV,     217 },
    { AUTOSPELL_STONE_III,      227 },
    { AUTOSPELL_REGEN_III,      232 },
    { AUTOSPELL_WATER_III,      236 },
    { AUTOSPELL_SHELL_IV,       241 },
    { AUTOSPELL_AERO_III,       246 },
    { AUTOSPELL_FIRE_III,       251 },
    { AUTOSPELL_BLIZZARD_III,   256 },
    { AUTOSPELL_DREAD_SPIKES,   256 },
    { AUTOSPELL_THUNDER_III,    261 },
    { AUTOSPELL_STONE_IV,       266 },
    { AUTOSPELL_WATER_IV,       271 },
    { AUTOSPELL_AERO_IV,        276 },
    { AUTOSPELL_FIRE_IV,        281 },
    { AUTOSPELL_PROTECT_V,      281 },
    { AUTOSPELL_BLIZZARD_IV,    286 },
    { AUTOSPELL_THUNDER_IV,     291 },
    { AUTOSPELL_STONE_V,        296 },
    { AUTOSPELL_CURE_VI,        313 },
    { AUTOSPELL_WATER_V,        313 },
    { AUTOSPELL_AERO_V,         331 },
    { AUTOSPELL_ASPIR_II,       331 },
    { AUTOSPELL_ADDLE,          337 },
    { AUTOSPELL_REGEN_IV,       337 },
    { AUTOSPELL_SHELL_V,        347 },
    { AUTOSPELL_FIRE_V,         349 },
    { AUTOSPELL_ABSORB_ATTRI,   368 },
    { AUTOSPELL_BLIZZARD_V,     368 },
    { AUTOSPELL_THUNDER_V,      389 },
    { AUTOSPELL_HASTE_II,       410 }, // Guess
    { AUTOSPELL_PROTECTRA_V,    425 }, // Guess
    { AUTOSPELL_SHELLRA_V,      434 } // Guess
};

CAutomatonEntity::CAutomatonEntity()
    : CPetEntity(PETTYPE_AUTOMATON)
{
    PAI->SetController(nullptr);
    memset(&m_ElementMax, 0, sizeof(m_ElementMax));
    memset(&m_ElementEquip, 0, sizeof(m_ElementEquip));
    memset(&m_Burden, 0, sizeof(m_Burden));
    memset(&m_Equip.Attachments, 0, sizeof(m_Equip.Attachments));
}

CAutomatonEntity::~CAutomatonEntity()
{}

bool CAutomatonEntity::hasSpell(AUTOSPELL spellid)
{
    if (GetSkill(SKILL_AMA) < g_autoSpellList[spellid]) {
        return false;
    }

    switch (getHead())
    {
    case HEAD_SPIRITREAVER:
    {
        switch (spellid)
        {
        case AUTOSPELL_DIA:
        case AUTOSPELL_DIA_II:
        case AUTOSPELL_SLOW:
        case AUTOSPELL_PARALYZE:
        case AUTOSPELL_SILENCE:
        case AUTOSPELL_FIRE:
        case AUTOSPELL_FIRE_II:
        case AUTOSPELL_FIRE_III:
        case AUTOSPELL_FIRE_IV:
        case AUTOSPELL_FIRE_V:
        case AUTOSPELL_BLIZZARD:
        case AUTOSPELL_BLIZZARD_II:
        case AUTOSPELL_BLIZZARD_III:
        case AUTOSPELL_BLIZZARD_IV:
        case AUTOSPELL_BLIZZARD_V:
        case AUTOSPELL_AERO:
        case AUTOSPELL_AERO_II:
        case AUTOSPELL_AERO_III:
        case AUTOSPELL_AERO_IV:
        case AUTOSPELL_AERO_V:
        case AUTOSPELL_STONE:
        case AUTOSPELL_STONE_II:
        case AUTOSPELL_STONE_III:
        case AUTOSPELL_STONE_IV:
        case AUTOSPELL_STONE_V:
        case AUTOSPELL_THUNDER:
        case AUTOSPELL_THUNDER_II:
        case AUTOSPELL_THUNDER_III:
        case AUTOSPELL_THUNDER_IV:
        case AUTOSPELL_THUNDER_V:
        case AUTOSPELL_WATER:
        case AUTOSPELL_WATER_II:
        case AUTOSPELL_WATER_III:
        case AUTOSPELL_WATER_IV:
        case AUTOSPELL_WATER_V:
        case AUTOSPELL_POISON:
        case AUTOSPELL_POISON_II:
        case AUTOSPELL_BIO:
        case AUTOSPELL_BIO_II:
        case AUTOSPELL_DRAIN:
        case AUTOSPELL_ASPIR:
        case AUTOSPELL_ASPIR_II:
        case AUTOSPELL_BLIND:
        case AUTOSPELL_ABSORB_INT:
        case AUTOSPELL_DREAD_SPIKES:
        case AUTOSPELL_ADDLE:
        case AUTOSPELL_ABSORB_ATTRI:
            return true;
        default:
            return false;
        }
        break;
    }
    case HEAD_STORMWAKER:
    {
        switch (spellid)
        {
        case AUTOSPELL_CURE:
        case AUTOSPELL_CURE_II:
        case AUTOSPELL_CURE_III:
        case AUTOSPELL_CURE_IV:
        case AUTOSPELL_DIA:
        case AUTOSPELL_DIA_II:
        case AUTOSPELL_PROTECT:
        case AUTOSPELL_PROTECT_II:
        case AUTOSPELL_PROTECT_III:
        case AUTOSPELL_PROTECT_IV:
        case AUTOSPELL_SHELL:
        case AUTOSPELL_SHELL_II:
        case AUTOSPELL_SHELL_III:
        case AUTOSPELL_SHELL_IV:
        case AUTOSPELL_SHELL_V: // Possibly a mistake?
        case AUTOSPELL_STONESKIN:
        case AUTOSPELL_SLOW:
        case AUTOSPELL_HASTE:
        case AUTOSPELL_PARALYZE:
        case AUTOSPELL_SILENCE:
        case AUTOSPELL_PHALANX:
        case AUTOSPELL_FIRE:
        case AUTOSPELL_FIRE_II:
        case AUTOSPELL_FIRE_III:
        case AUTOSPELL_FIRE_IV:
        case AUTOSPELL_BLIZZARD:
        case AUTOSPELL_BLIZZARD_II:
        case AUTOSPELL_BLIZZARD_III:
        case AUTOSPELL_BLIZZARD_IV:
        case AUTOSPELL_AERO:
        case AUTOSPELL_AERO_II:
        case AUTOSPELL_AERO_III:
        case AUTOSPELL_AERO_IV:
        case AUTOSPELL_STONE:
        case AUTOSPELL_STONE_II:
        case AUTOSPELL_STONE_III:
        case AUTOSPELL_STONE_IV:
        case AUTOSPELL_THUNDER:
        case AUTOSPELL_THUNDER_II:
        case AUTOSPELL_THUNDER_III:
        case AUTOSPELL_THUNDER_IV:
        case AUTOSPELL_WATER:
        case AUTOSPELL_WATER_II:
        case AUTOSPELL_WATER_III:
        case AUTOSPELL_WATER_IV:
        case AUTOSPELL_POISON:
        case AUTOSPELL_POISON_II:
        case AUTOSPELL_BIO:
        case AUTOSPELL_BIO_II:
        case AUTOSPELL_BLIND:
        case AUTOSPELL_DISPEL:
        case AUTOSPELL_ADDLE:
        case AUTOSPELL_HASTE_II:
            return true;
        default:
            return false;
        }
        break;
    }
    case HEAD_SOULSOOTHER: // Inherits spells from lower heads
    {
        switch (spellid)
        {
        case AUTOSPELL_CURE_V:
        case AUTOSPELL_CURE_VI:
        case AUTOSPELL_POISONA:
        case AUTOSPELL_PARALYNA:
        case AUTOSPELL_BLINDNA:
        case AUTOSPELL_SILENA:
        case AUTOSPELL_STONA:
        case AUTOSPELL_VIRUNA:
        case AUTOSPELL_CURSNA:
        case AUTOSPELL_DIA:
        case AUTOSPELL_DIA_II:
        case AUTOSPELL_PROTECT:
        case AUTOSPELL_PROTECT_II:
        case AUTOSPELL_PROTECT_III:
        case AUTOSPELL_PROTECT_IV:
        case AUTOSPELL_PROTECT_V:
        case AUTOSPELL_SHELL:
        case AUTOSPELL_SHELL_II:
        case AUTOSPELL_SHELL_III:
        case AUTOSPELL_SHELL_IV:
        case AUTOSPELL_SHELL_V:
        case AUTOSPELL_SLOW:
        case AUTOSPELL_HASTE:
        case AUTOSPELL_PARALYZE:
        case AUTOSPELL_SILENCE:
        case AUTOSPELL_REGEN:
        case AUTOSPELL_REGEN_II:
        case AUTOSPELL_REGEN_III:
        case AUTOSPELL_PROTECTRA_V:
        case AUTOSPELL_SHELLRA_V:
        case AUTOSPELL_ERASE:
        case AUTOSPELL_POISON:
        case AUTOSPELL_POISON_II:
        case AUTOSPELL_BIO:
        case AUTOSPELL_BIO_II:
        case AUTOSPELL_BLIND:
        case AUTOSPELL_ADDLE:
        case AUTOSPELL_REGEN_IV:
            return true;
        }
    }
    case HEAD_HARLEQUIN: // Inherits spells from lower heads
    {
        switch (spellid)
        {
        case AUTOSPELL_POISON_II:
            return true;
        }
    }
    case HEAD_SHARPSHOT: // Inherits spells from lower head
    {
        switch (spellid)
        {
        case AUTOSPELL_DIA:
        case AUTOSPELL_DIA_II:
        case AUTOSPELL_SLOW:
        case AUTOSPELL_PARALYZE:
        case AUTOSPELL_SILENCE:
        case AUTOSPELL_POISON:
        case AUTOSPELL_BIO:
        case AUTOSPELL_BIO_II:
        case AUTOSPELL_BLIND:
        case AUTOSPELL_ADDLE:
            return true;
        }
    }
    case HEAD_VALOREDGE:
    {
        switch (spellid)
        {
        case AUTOSPELL_CURE:
        case AUTOSPELL_CURE_II:
        case AUTOSPELL_CURE_III:
        case AUTOSPELL_CURE_IV:
            return true;
        default:
            return false;
        }
    }
    }
    return false;
}

void CAutomatonEntity::setFrame(AUTOFRAMETYPE frame)
{
    m_Equip.Frame = frame;
}

AUTOFRAMETYPE CAutomatonEntity::getFrame()
{
    return (AUTOFRAMETYPE)m_Equip.Frame;
}

void CAutomatonEntity::setHead(AUTOHEADTYPE head)
{
    m_Equip.Head = head;
}

AUTOHEADTYPE CAutomatonEntity::getHead()
{
    return (AUTOHEADTYPE)m_Equip.Head;
}

void CAutomatonEntity::setAttachment(uint8 slotid, uint8 id)
{
    m_Equip.Attachments[slotid] = id;
}

uint8 CAutomatonEntity::getAttachment(uint8 slotid)
{
    return m_Equip.Attachments[slotid];
}

bool CAutomatonEntity::hasAttachment(uint8 attachment)
{
    for (auto&& attachmentid : m_Equip.Attachments)
    {
        if (attachmentid == attachment)
        {
            return true;
        }
    }
    return false;
}

void CAutomatonEntity::setElementMax(uint8 element, uint8 max)
{
    m_ElementMax[element] = max;
}

uint8 CAutomatonEntity::getElementMax(uint8 element)
{
    return m_ElementMax[element];
}

void CAutomatonEntity::addElementCapacity(uint8 element, int8 value)
{
    m_ElementEquip[element] += value;
}

uint8 CAutomatonEntity::getElementCapacity(uint8 element)
{
    return m_ElementEquip[element];
}

void CAutomatonEntity::burdenTick()
{
    for (auto&& burden : m_Burden)
    {
        if (burden > 0)
        {
            burden -= dsp_cap(1 + PMaster->getMod(Mod::BURDEN_DECAY) + this->getMod(Mod::BURDEN_DECAY), 1, burden);
        }
    }
}

void CAutomatonEntity::setInitialBurden()
{
    m_Burden.fill(30);
}

uint16 CAutomatonEntity::addBurden(uint8 element, int16 burden)
{
    if (m_Burden[element] < -burden)
        m_Burden[element] = 0;
    else
        m_Burden[element] += burden;

    if (burden > 0)
    {
        //check for overload
        int16 thresh = 30 + PMaster->getMod(Mod::OVERLOAD_THRESH);
        if (m_Burden[element] > thresh)
        {
            if (dsprand::GetRandomNumber(100) < (m_Burden[element] - thresh + 5))
            {
                //return overload duration
                return m_Burden[element] - thresh;
            }
        }
    }
    return 0;
}

void CAutomatonEntity::PostTick()
{
    auto pre_mask = updatemask;
    CPetEntity::PostTick();
    if (pre_mask && status != STATUS_DISAPPEAR)
    {
        if (PMaster && PMaster->objtype == TYPE_PC)
        {
            ((CCharEntity*)PMaster)->pushPacket(new CCharJobExtraPacket((CCharEntity*)PMaster, PMaster->GetMJob() == JOB_PUP));
        }
    }
}

void CAutomatonEntity::Die()
{
    if (PMaster != nullptr)
        PMaster->StatusEffectContainer->RemoveAllManeuvers();
    CPetEntity::Die();
}

bool CAutomatonEntity::ValidTarget(CBattleEntity* PInitiator, uint16 targetFlags)
{
    if (targetFlags & TARGET_PLAYER && this == PInitiator)
    {
        return true;
    }
    return CPetEntity::ValidTarget(PInitiator, targetFlags);
}

void CAutomatonEntity::OnCastFinished(CMagicState& state, action_t& action)
{
    CMobEntity::OnCastFinished(state, action);

    auto PSpell = state.GetSpell();
    auto PTarget = static_cast<CBattleEntity*>(state.GetTarget());

    m_RecastList[PSpell->getID()] = time(nullptr) + action.recast;

    if (PSpell->tookEffect())
    {
        puppetutils::TrySkillUP(this, SKILL_AMA, PTarget->GetMLevel());
    }
}

void CAutomatonEntity::OnMobSkillFinished(CMobSkillState& state, action_t& action)
{
    CMobEntity::OnMobSkillFinished(state, action);

    auto PSkill = state.GetSkill();
    auto PTarget = static_cast<CBattleEntity*>(state.GetTarget());

    // Ranged attack skill up
    if (PSkill->getID() == 1949 && !PSkill->hasMissMsg())
    {
        puppetutils::TrySkillUP(this, SKILL_ARA, PTarget->GetMLevel());
    }
}

void CAutomatonEntity::Spawn()
{
    //we need to skip CMobEntity's spawn because it calculates stats (and our stats are already calculated)

    if (PMaster && PMaster->objtype == TYPE_PC && m_EcoSystem == SYSTEM_ELEMENTAL)
    {
        this->defaultMobMod(MOBMOD_MAGIC_DELAY, 12);
        this->defaultMobMod(MOBMOD_MAGIC_COOL, 48);
        mobutils::GetAvailableSpells(this);
    }

    status = allegiance == ALLEGIANCE_MOB ? STATUS_MOB : STATUS_NORMAL;
    updatemask |= UPDATE_HP;
    //ResetLocalVars(); // I hate making this function just to comment this out, why is this function called at all here?
    PAI->Reset();
    PAI->EventHandler.triggerListener("SPAWN", this);
    animation = ANIMATION_NONE;
    m_OwnerID.clean();
    HideName(false);
    luautils::OnMobSpawn(this);
}
