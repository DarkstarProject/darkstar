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

CAutomatonEntity::CAutomatonEntity()
    : CPetEntity(PETTYPE_AUTOMATON)
{
    PAI->SetController(nullptr);
    loadSpells();
}

CAutomatonEntity::~CAutomatonEntity()
{}

void CAutomatonEntity::loadSpells()
{
    m_SpellList[AUTOSPELL_DIA] = 1;
    m_SpellList[AUTOSPELL_CURE] = 12;
    m_SpellList[AUTOSPELL_STONE] = 15;
    m_SpellList[AUTOSPELL_POISON] = 18;
    m_SpellList[AUTOSPELL_PARALYZE] = 21;
    m_SpellList[AUTOSPELL_PROTECT] = 24;
    m_SpellList[AUTOSPELL_BLIND] = 27;
    m_SpellList[AUTOSPELL_POISONA] = 27;
    m_SpellList[AUTOSPELL_WATER] = 30;
    m_SpellList[AUTOSPELL_BIO] = 33;
    m_SpellList[AUTOSPELL_PARALYNA] = 36;
    m_SpellList[AUTOSPELL_SLOW] = 42;
    m_SpellList[AUTOSPELL_AERO] = 45;
    m_SpellList[AUTOSPELL_BLINDNA] = 45;
    m_SpellList[AUTOSPELL_CURE_II] = 45;
    m_SpellList[AUTOSPELL_DRAIN] = 45;
    m_SpellList[AUTOSPELL_SHELL] = 54;
    m_SpellList[AUTOSPELL_SILENCE] = 57;
    m_SpellList[AUTOSPELL_FIRE] = 60;
    m_SpellList[AUTOSPELL_SILENA] = 60;
    m_SpellList[AUTOSPELL_REGEN] = 66;
    m_SpellList[AUTOSPELL_BLIZZARD] = 75;
    m_SpellList[AUTOSPELL_ASPIR] = 78;
    m_SpellList[AUTOSPELL_CURE_III] = 81;
    m_SpellList[AUTOSPELL_PROTECT_II] = 84;
    m_SpellList[AUTOSPELL_CURSNA] = 90;
    m_SpellList[AUTOSPELL_THUNDER] = 90;
    m_SpellList[AUTOSPELL_DIA_II] = 96;
    m_SpellList[AUTOSPELL_ERASE] = 99;
    m_SpellList[AUTOSPELL_PHALANX] = 99;
    m_SpellList[AUTOSPELL_DISPEL] = 105;
    m_SpellList[AUTOSPELL_STONESKIN] = 105;
    m_SpellList[AUTOSPELL_VIRUNA] = 105;
    m_SpellList[AUTOSPELL_BIO_II] = 107;
    m_SpellList[AUTOSPELL_STONE_II] = 108;
    m_SpellList[AUTOSPELL_SHELL_II] = 114;
    m_SpellList[AUTOSPELL_ABSORB_INT] = 120;
    m_SpellList[AUTOSPELL_STONA] = 120;
    m_SpellList[AUTOSPELL_WATER_II] = 123;
    m_SpellList[AUTOSPELL_REGEN_II] = 135;
    m_SpellList[AUTOSPELL_AERO_II] = 138;
    m_SpellList[AUTOSPELL_POISON_II] = 141;
    m_SpellList[AUTOSPELL_PROTECT_III] = 144;
    m_SpellList[AUTOSPELL_CURE_IV] = 147;
    m_SpellList[AUTOSPELL_HASTE] = 147;
    m_SpellList[AUTOSPELL_FIRE_II] = 153;
    m_SpellList[AUTOSPELL_BLIZZARD_II] = 178;
    m_SpellList[AUTOSPELL_SHELL_III] = 188;
    m_SpellList[AUTOSPELL_THUNDER_II] = 203;
    m_SpellList[AUTOSPELL_CURE_V] = 207;
    m_SpellList[AUTOSPELL_PROTECT_IV] = 217;
    m_SpellList[AUTOSPELL_STONE_III] = 227;
    m_SpellList[AUTOSPELL_REGEN_III] = 232;
    m_SpellList[AUTOSPELL_WATER_III] = 236;
    m_SpellList[AUTOSPELL_SHELL_IV] = 241;
    m_SpellList[AUTOSPELL_AERO_III] = 246;
    m_SpellList[AUTOSPELL_FIRE_III] = 251;
    m_SpellList[AUTOSPELL_BLIZZARD_III] = 256;
    m_SpellList[AUTOSPELL_DREAD_SPIKES] = 256;
    m_SpellList[AUTOSPELL_THUNDER_III] = 261;
    m_SpellList[AUTOSPELL_STONE_IV] = 266;
    m_SpellList[AUTOSPELL_WATER_IV] = 271;
    m_SpellList[AUTOSPELL_AERO_IV] = 276;
    m_SpellList[AUTOSPELL_FIRE_IV] = 281;
    m_SpellList[AUTOSPELL_PROTECT_V] = 281;
    m_SpellList[AUTOSPELL_BLIZZARD_IV] = 286;
    m_SpellList[AUTOSPELL_THUNDER_IV] = 291;
    m_SpellList[AUTOSPELL_STONE_V] = 296;
    m_SpellList[AUTOSPELL_CURE_VI] = 313;
    m_SpellList[AUTOSPELL_WATER_V] = 313;
    m_SpellList[AUTOSPELL_AERO_V] = 331;
    m_SpellList[AUTOSPELL_ASPIR_II] = 331;
    m_SpellList[AUTOSPELL_ADDLE] = 337;
    m_SpellList[AUTOSPELL_REGEN_IV] = 337;
    m_SpellList[AUTOSPELL_SHELL_V] = 347;
    m_SpellList[AUTOSPELL_FIRE_V] = 349;
    m_SpellList[AUTOSPELL_ABSORB_ATTRI] = 368;
    m_SpellList[AUTOSPELL_BLIZZARD_V] = 368;
    m_SpellList[AUTOSPELL_THUNDER_V] = 389;
    m_SpellList[AUTOSPELL_HASTE_II] = 410; // Guess
    m_SpellList[AUTOSPELL_PROTECTRA_V] = 425; // Guess
    m_SpellList[AUTOSPELL_SHELLRA_V] = 434; // Guess
}

bool CAutomatonEntity::hasSpell(AUTOSPELL spellid)
{
    if (GetSkill(SKILL_AMA) < m_SpellList[spellid]) {
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
            burden = burden - dsp_max(1 + PMaster->getMod(Mod::BURDEN_DECAY), 1);
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
