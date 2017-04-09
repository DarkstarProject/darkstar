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

#include "automaton_controller.h"
#include "../states/ability_state.h"
#include "../states/magic_state.h"
#include "../states/weaponskill_state.h"
#include "../ai_container.h"
#include "../../utils/battleutils.h"
#include "../../lua/luautils.h"
#include "../../mobskill.h"
#include "../../../common/utils.h"
#include "../../utils/petutils.h"
#include "../../utils/puppetutils.h"
#include "../../status_effect_container.h"
#include "../../enmity_container.h"

CAutomatonController::CAutomatonController(CAutomatonEntity* PPet) : CPetController(PPet),
    PAutomaton(PPet)
{
    PPet->setInitialBurden();
    setCooldowns();
    setMovement();
}

void CAutomatonController::setCooldowns()
{
    switch (PAutomaton->getFrame())
    {
    case FRAME_SHARPSHOT:
    {
        switch (PAutomaton->getHead())
        {
        case HEAD_SHARPSHOT:
            m_rangedCooldown = 20s;
            break;
        case HEAD_HARLEQUIN:
            m_rangedCooldown = 25s;
            break;
        default:
            m_rangedCooldown = 36s;
        }
    }
    break;
    case FRAME_HARLEQUIN:
    {
        // Old Automaton AI
        /*switch (PAutomaton->getHead())
        {
        case HEAD_SOULSOOTHER:
            m_magicCooldown = 31s;
            break;
        case HEAD_STORMWAKER:
            m_magicCooldown = 32s;
            break;
        case HEAD_SPIRITREAVER:
            m_magicCooldown = 33s;
            break;
        case HEAD_HARLEQUIN:
            m_magicCooldown = 37s;
            break;
        case HEAD_SHARPSHOT:
            m_magicCooldown = 55s;
            break;
        case HEAD_VALOREDGE:
            m_magicCooldown = 57s;
        }*/

        setMagicCooldowns();
    }
    break;
    case FRAME_STORMWAKER:
    {
        // Old Automaton AI
        /*switch (PAutomaton->getHead())
        {
        case HEAD_SOULSOOTHER:
            m_magicCooldown = 25s;
            break;
        case HEAD_STORMWAKER:
        case HEAD_SPIRITREAVER:
            m_magicCooldown = 27s;
            break;
        case HEAD_HARLEQUIN:
            m_magicCooldown = 32s;
            break;
        case HEAD_VALOREDGE:
            m_magicCooldown = 46s;
            break;
        case HEAD_SHARPSHOT:
            m_magicCooldown = 47s;
        }*/

        setMagicCooldowns();
    }
    break;
    case FRAME_VALOREDGE:
    {
        m_shieldbashCooldown = 3min;
    }
    }
}

// New retail Automaton magic AI (Needs more information to accurately recreate)
void CAutomatonController::setMagicCooldowns()
{
    switch (PAutomaton->getHead())
    {
    case HEAD_HARLEQUIN:
    {
        m_magicCooldown = 10s;
        m_enfeebleCooldown = 10s;
        m_healCooldown = 15s;
    }
    break;
    case HEAD_VALOREDGE:
    {
        m_magicCooldown = 20s;
        m_healCooldown = 20s;
    }
    break;
    case HEAD_SHARPSHOT:
    {
        m_magicCooldown = 12s;
        m_enfeebleCooldown = 12s;
        m_healCooldown = 18s; // Guess
    }
    break;
    case HEAD_STORMWAKER:
    {
        m_magicCooldown = 10s;
        m_enfeebleCooldown = 12s;
        m_healCooldown = 15s; // Guess
        m_elementalCooldown = 33s; // Guess
        m_enhanceCooldown = 10s; // Guess
    }
    break;
    case HEAD_SOULSOOTHER:
    {
        m_magicCooldown = 4s;
        m_enfeebleCooldown = 4s;
        m_healCooldown = 15s;
        m_enhanceCooldown = 15s;
        m_statusCooldown = 15s;
    }
    break;
    case HEAD_SPIRITREAVER:
    {
        m_magicCooldown = 10s;
        m_enfeebleCooldown = 10s;
        m_elementalCooldown = 33s;
        m_enhanceCooldown = 135s;
    }
    }

    m_naList[EFFECT_POISON] = AUTOSPELL_POISONA;
    m_naList[EFFECT_PARALYSIS] = AUTOSPELL_PARALYNA;
    m_naList[EFFECT_CURSE] = AUTOSPELL_CURSNA;
    m_naList[EFFECT_CURSE_II] = AUTOSPELL_CURSNA;
    m_naList[EFFECT_BANE] = AUTOSPELL_CURSNA;
    m_naList[EFFECT_BLINDNESS] = AUTOSPELL_BLINDNA;
    m_naList[EFFECT_SILENCE] = AUTOSPELL_SILENA;
    m_naList[EFFECT_LULLABY] = AUTOSPELL_CURE; // This is probably wrong
    m_naList[EFFECT_SLEEP] = AUTOSPELL_CURE; // This is probably wrong
    m_naList[EFFECT_SLEEP_II] = AUTOSPELL_CURE; // This is probably wrong
    m_naList[EFFECT_PETRIFICATION] = AUTOSPELL_STONA;
    m_naList[EFFECT_DISEASE] = AUTOSPELL_VIRUNA;
    m_naList[EFFECT_PLAGUE] = AUTOSPELL_VIRUNA;

    m_enfeebleList[AUTOSPELL_BIO_II] = EFFECT_BIO;
    m_enfeebleList[AUTOSPELL_BIO] = EFFECT_BIO;
    m_enfeebleList[AUTOSPELL_DIA_II] = EFFECT_DIA;
    m_enfeebleList[AUTOSPELL_DIA] = EFFECT_DIA;
    m_enfeebleList[AUTOSPELL_POISON_II] = EFFECT_POISON;
    m_enfeebleList[AUTOSPELL_POISON] = EFFECT_POISON;
    m_enfeebleList[AUTOSPELL_SILENCE] = EFFECT_SILENCE;
    m_enfeebleList[AUTOSPELL_SLOW] = EFFECT_SLOW;
    m_enfeebleList[AUTOSPELL_BLIND] = EFFECT_BLINDNESS;
    m_enfeebleList[AUTOSPELL_PARALYZE] = EFFECT_PARALYSIS;
    m_enfeebleList[AUTOSPELL_ADDLE] = EFFECT_ADDLE;
    m_enfeebleList[AUTOSPELL_ABSORB_INT] = EFFECT_INT_DOWN;

    m_immunityList[AUTOSPELL_SILENCE] = IMMUNITY_SILENCE;
    m_immunityList[AUTOSPELL_PARALYZE] = IMMUNITY_PARALYZE;
    m_immunityList[AUTOSPELL_BLIND] = IMMUNITY_BLIND;
    m_immunityList[AUTOSPELL_SLOW] = IMMUNITY_SLOW;
    m_immunityList[AUTOSPELL_POISON_II] = IMMUNITY_POISON;
    m_immunityList[AUTOSPELL_POISON] = IMMUNITY_POISON;
}

void CAutomatonController::setMovement()
{
    switch (PAutomaton->getHead())
    {
    case HEAD_HARLEQUIN:
    case HEAD_VALOREDGE:
        m_movementType = AUTOMOVEMENT_MELEE;
        break;
    case HEAD_SHARPSHOT:
        m_movementType = AUTOMOVEMENT_RANGED;
        break;
    case HEAD_STORMWAKER:
    case HEAD_SOULSOOTHER:
    case HEAD_SPIRITREAVER:
        m_movementType = AUTOMOVEMENT_MAGIC;
    }

    m_deployed = false;
}

CurrentManeuvers CAutomatonController::GetCurrentManeuvers()
{
    auto statuses = PAutomaton->PMaster->StatusEffectContainer;
    CurrentManeuvers maneuvers = {
        statuses->GetEffectsCount(EFFECT_FIRE_MANEUVER),
        statuses->GetEffectsCount(EFFECT_EARTH_MANEUVER),
        statuses->GetEffectsCount(EFFECT_WATER_MANEUVER),
        statuses->GetEffectsCount(EFFECT_WIND_MANEUVER),
        statuses->GetEffectsCount(EFFECT_ICE_MANEUVER),
        statuses->GetEffectsCount(EFFECT_THUNDER_MANEUVER),
        statuses->GetEffectsCount(EFFECT_LIGHT_MANEUVER),
        statuses->GetEffectsCount(EFFECT_DARK_MANEUVER)
    };
    return maneuvers;
}

void CAutomatonController::DoCombatTick(time_point tick)
{
    if ((PAutomaton->PMaster == nullptr || PAutomaton->PMaster->isDead()) && PAutomaton->isAlive()) {
        PAutomaton->Die();
        return;
    }

    auto PPrevTarget = PTarget;
    PTarget = static_cast<CBattleEntity*>(PAutomaton->GetEntity(PAutomaton->GetBattleTargetID()));

    if (TryDeaggro())
    {
        Disengage();
        return;
    }

    // We just deployed, so reposition if needed
    if (PPrevTarget != PTarget || (!m_deployed && PAutomaton->PAI->PathFind->IsFollowingPath()))
    {
        m_deployed = false;
        Move();
        return;
    }

    // Automatons only attempt actions in 3 second intervals (Reduced by the Tactical Processor)
    if (TryAction())
    {
        m_CurrentManeuvers = GetCurrentManeuvers();

        if (TryShieldBash())
        {
            m_LastShieldBashTime = m_Tick;
            return;
        }
        else if (TrySpellcast())
        {
            m_LastMagicTime = m_Tick;
            return;
        }
        else if (TryTPMove())
        {
            return;
        }
        else if (TryRangedAttack()) // TODO: Find the animation for its ranged attack
        {
            m_LastRangedTime = m_Tick;
            return;
        }
        else if (TryAttachment()) // TODO
        {
            return;
        }
    }
    Move();
}

void CAutomatonController::Move()
{
    if (!PAutomaton->PAI->CanFollowPath())
    {
        return;
    }

    bool move = PAutomaton->PAI->PathFind->IsFollowingPath();
    float attack_range = PAutomaton->GetMeleeRange();

    float currentDistance = distance(PAutomaton->loc.p, PTarget->loc.p);

    if ((move ||
        (m_movementType == AUTOMOVEMENT_MELEE && currentDistance > attack_range - 0.2f) ||
        (m_movementType == AUTOMOVEMENT_RANGED && currentDistance > 15) ||
        (m_movementType == AUTOMOVEMENT_MAGIC && (currentDistance > 15 || PAutomaton->health.mp < 8))) &&
        PAutomaton->speed != 0)
    {
        if (!move || distanceSquared(PAutomaton->PAI->PathFind->GetDestination(), PTarget->loc.p) > 10)
        {
            //path to the target if we don't have a path already
            PAutomaton->PAI->PathFind->PathInRange(PTarget->loc.p, attack_range - 0.2f, PATHFLAG_WALLHACK | PATHFLAG_RUN);
        }
        PAutomaton->PAI->PathFind->FollowPath();
    }
    else
    {
        FaceTarget();
    }
}

// Probably not exactly how decisions were decided
bool CAutomatonController::TryAction()
{
    if (m_Tick > m_LastActionTime + (m_actionCooldown - std::chrono::microseconds(PAutomaton->getMod(Mod::AUTO_DECISION_DELAY) * 10)))
    {
        m_LastActionTime = m_Tick;
        m_deployed = true;
        return true;
    }
    return false;
}

bool CAutomatonController::TryShieldBash()
{
    CState* PState = PTarget->PAI->GetCurrentState();
    if (m_shieldbashCooldown > 0s && PState && PState->CanInterrupt() &&
        m_Tick > m_LastShieldBashTime + (m_shieldbashCooldown - std::chrono::seconds(PAutomaton->getMod(Mod::AUTO_SHIELD_BASH_DELAY))))
    {
        return MobSkill(PTarget->targid, m_ShieldBashAbility);
    }
    return false;
}

bool CAutomatonController::TrySpellcast()
{
    // Note that the old AI used the Mana Booster attachment to reduce magic cooldown instead of giving fast cast
    if (!PAutomaton->PMaster || m_magicCooldown == 0s ||
        m_Tick <= m_LastMagicTime + (m_magicCooldown - std::chrono::seconds(PAutomaton->getMod(Mod::AUTO_MAGIC_DELAY))) || !CanCastSpells())
        return false;

    switch (PAutomaton->getHead())
    {
    case HEAD_VALOREDGE:
    {
        if (TryHeal())
        {
            m_LastHealTime = m_Tick;
            return true;
        }
    }
    break;
    case HEAD_SHARPSHOT:
    {
        if (m_CurrentManeuvers.light && TryHeal()) // Light -> Heal
        {
            m_LastHealTime = m_Tick;
            return true;
        }

        if (TryEnfeeble())
        {
            m_LastEnfeebleTime = m_Tick;
            return true;
        }
        else if (!m_CurrentManeuvers.light && TryHeal())
        {
            m_LastHealTime = m_Tick;
            return true;
        }
    }
    break;
    case HEAD_HARLEQUIN:
    {
        if (m_CurrentManeuvers.light && TryHeal()) // Light -> Heal
        {
            m_LastHealTime = m_Tick;
            return true;
        }

        if (TryEnfeeble())
        {
            m_LastEnfeebleTime = m_Tick;
            return true;
        }
        else if (!m_CurrentManeuvers.light && TryHeal())
        {
            m_LastHealTime = m_Tick;
            return true;
        }
    }
    break;
    case HEAD_STORMWAKER:
    {
        bool lowHP = PTarget->GetHPP() <= 30 && PTarget->health.hp <= 300;
        if (lowHP && TryElemental())  // Mob low HP -> Nuke
        {
            m_LastElementalTime = m_Tick;
            return true;
        }

        if (m_CurrentManeuvers.light && TryHeal()) // Light -> Heal
        {
            m_LastHealTime = m_Tick;
            return true;
        }
        else if (!lowHP && m_CurrentManeuvers.ice && TryElemental())  // Ice -> Nuke
        {
            m_LastElementalTime = m_Tick;
            return true;
        }

        if (TryEnfeeble())
        {
            m_LastEnfeebleTime = m_Tick;
            return true;
        }
        else if (!m_CurrentManeuvers.light && TryHeal())
        {
            m_LastHealTime = m_Tick;
            return true;
        }
        else if (!lowHP && !m_CurrentManeuvers.ice && TryElemental())
        {
            m_LastElementalTime = m_Tick;
            return true;
        }
        else if (TryEnhance())
        {
            m_LastEnhanceTime = m_Tick;
            return true;
        }
    }
    break;
    case HEAD_SOULSOOTHER:
    {
        if (m_CurrentManeuvers.light && TryHeal()) // Light -> Heal
        {
            m_LastHealTime = m_Tick;
            return true;
        }

        if (TryStatusRemoval())
        {
            m_LastStatusTime = m_Tick;
            return true;
        }
        else if (!m_CurrentManeuvers.light && TryHeal())
        {
            m_LastHealTime = m_Tick;
            return true;
        }
        else if (TryEnhance())
        {
            m_LastEnhanceTime = m_Tick;
            return true;
        }
        else if (TryEnfeeble())
        {
            m_LastEnfeebleTime = m_Tick;
            return true;
        }
    }
    break;
    case HEAD_SPIRITREAVER:
    {
        if (m_CurrentManeuvers.ice && TryElemental())  // Ice -> Nuke
        {
            m_LastElementalTime = m_Tick;
            return true;
        }
        else if (m_CurrentManeuvers.dark && TryEnhance())
        {
            m_LastEnhanceTime = m_Tick;
            return true;
        }
        else if ((m_CurrentManeuvers.dark || PAutomaton->GetHPP() <= 75 || PAutomaton->GetMPP() <= 75) && TryEnfeeble()) // Dark or self HPP/MPP <= 75 -> Enfeeble
        {
            m_LastEnfeebleTime = m_Tick;
            return true;
        }

        if (!m_CurrentManeuvers.ice && TryElemental())
        {
            m_LastElementalTime = m_Tick;
            return true;
        }
    }
    }
    return false;
}

bool CAutomatonController::TryHeal()
{
    if (!PAutomaton->PMaster || m_healCooldown == 0s || m_Tick <= m_LastHealTime + (m_healCooldown - std::chrono::seconds(PAutomaton->getMod(Mod::AUTO_HEALING_DELAY))))
        return false;

    float threshold = 0;
    switch (m_CurrentManeuvers.light) // Light -> Higher healing threshold
    {
    default:
        threshold += 30;
        break;
    case 1:
        threshold += 40;
        break;
    case 2:
        threshold += 50;
        break;
    case 3:
        threshold += 75;
    }

    threshold = dsp_cap(threshold + PAutomaton->getMod(Mod::AUTO_HEALING_THRESHOLD), 30, 90);
    CBattleEntity* PCastTarget = nullptr;

    bool haveHate = false;
    EnmityList_t* enmityList;

    auto PMob = dynamic_cast<CMobEntity*>(PTarget);
    if (PMob)
    {
        enmityList = PMob->PEnmityContainer->GetEnmityList();
        auto masterEnmity_obj = enmityList->find(PAutomaton->PMaster->id);
        auto selfEnmity_obj = enmityList->find(PAutomaton->id);

        if (masterEnmity_obj == enmityList->end())
            haveHate = true;
        else if (selfEnmity_obj == enmityList->end())
            haveHate = false;
        else
        {
            uint16 selfEnmity = selfEnmity_obj->second.CE + selfEnmity_obj->second.VE;
            uint16 masterEnmity = masterEnmity_obj->second.CE + masterEnmity_obj->second.VE;
            haveHate = selfEnmity > masterEnmity ? true : false;
        }
    }
    
    // Prioritize hate
    if (haveHate)
    {
        if (PAutomaton->GetHPP() <= 50) // Automaton only heals itself when <= 50%
            PCastTarget = PAutomaton;
        else if (PAutomaton->PMaster->GetHPP() <= threshold && distance(PAutomaton->loc.p, PAutomaton->PMaster->loc.p) < 20)
            PCastTarget = PAutomaton->PMaster;
    }
    else
    {
        if (PAutomaton->PMaster->GetHPP() <= threshold)
            PCastTarget = PAutomaton->PMaster;
        else if (PAutomaton->GetHPP() <= 50) // Automaton only heals itself when <= 50%
            PCastTarget = PAutomaton;
    }

    if (m_CurrentManeuvers.light && !PCastTarget && PAutomaton->getHead() == HEAD_SOULSOOTHER && PAutomaton->PMaster->PParty) // Light + Soulsoother head -> Heal party
    {
        if (PMob)
        {
            uint16 highestEnmity = 0;
            for (uint8 i = 0; i < PAutomaton->PMaster->PParty->members.size(); ++i)
            {
                CBattleEntity* member = PAutomaton->PMaster->PParty->members.at(i);
                if (member->id != PAutomaton->PMaster->id)
                {
                    auto enmity_obj = enmityList->find(member->id);
                    if (enmity_obj != enmityList->end() && highestEnmity < enmity_obj->second.CE + enmity_obj->second.VE &&
                        member->GetHPP() <= threshold && distance(PAutomaton->loc.p, PAutomaton->PMaster->loc.p) < 20)
                    {
                        highestEnmity = enmity_obj->second.CE + enmity_obj->second.VE;
                        PCastTarget = member;
                    }
                }
            }
        }
        else
        {
            for (uint8 i = 0; i < PAutomaton->PMaster->PParty->members.size(); ++i)
            {
                CBattleEntity* member = PAutomaton->PMaster->PParty->members.at(i);
                if (member->id != PAutomaton->PMaster->id && distance(PAutomaton->loc.p, PAutomaton->PMaster->loc.p) < 20)
                {
                    if (member->GetHPP() <= threshold)
                    {
                        PCastTarget = member;
                        break;
                    }
                }
            }
        }
    }

    // This might be wrong
    if (PCastTarget)
    {
        float missinghp = PCastTarget->GetMaxHP() - PCastTarget->health.hp;
        if (missinghp > 850 && CastSpell(AUTOSPELL_CURE_VI, PCastTarget))
            return true;
        else if (missinghp > 600 && CastSpell(AUTOSPELL_CURE_V, PCastTarget))
            return true;
        else if (missinghp > 350 && CastSpell(AUTOSPELL_CURE_IV, PCastTarget))
            return true;
        else if (missinghp > 190 && CastSpell(AUTOSPELL_CURE_III, PCastTarget))
            return true;
        else if (missinghp > 120 && CastSpell(AUTOSPELL_CURE_II, PCastTarget))
            return true;
        else if (CastSpell(AUTOSPELL_CURE, PCastTarget))
            return true;
    }

    return false;
}

bool CAutomatonController::TryElemental()
{
    if (!PAutomaton->PMaster || m_elementalCooldown == 0s || m_Tick <= m_LastElementalTime + m_elementalCooldown)
        return false;

    int tier = 4;
    int hp = PTarget->health.hp;
    int selfmp = PAutomaton->health.mp; // Shortcut for wasting less time
    if (selfmp < 4)
        return false;
    else if (hp <= 50 || selfmp < 16)
        tier = 0;
    else if (hp <= 150 || selfmp < 40)
        tier = 1;
    else if (hp <= 200 || selfmp < 88)
        tier = 2;
    else if (hp <= 600 || selfmp < 156)
        tier = 3;

    // Need to choose the weakest element, if they have that attachment, using PTarget->getMod(Mod::FIRERES)

    bool useManeuvers = PAutomaton->getHead() == HEAD_SPIRITREAVER;

    std::vector<AUTOSPELL> castPriority;
    std::vector<AUTOSPELL> defaultPriority;

    if (useManeuvers)
    {
        if (m_CurrentManeuvers.thunder) // Thunder -> Thunder spells
            castPriority.push_back(AUTOSPELL_THUNDER);
        else
            defaultPriority.push_back(AUTOSPELL_THUNDER);

        if (m_CurrentManeuvers.ice) // Ice -> Blizzard spells
            castPriority.push_back(AUTOSPELL_BLIZZARD);
        else
            defaultPriority.push_back(AUTOSPELL_BLIZZARD);

        if (m_CurrentManeuvers.fire) // Fire -> Fire spells
            castPriority.push_back(AUTOSPELL_FIRE);
        else
            defaultPriority.push_back(AUTOSPELL_FIRE);

        if (m_CurrentManeuvers.wind) // Wind -> Aero spells
            castPriority.push_back(AUTOSPELL_AERO);
        else
            defaultPriority.push_back(AUTOSPELL_AERO);

        if (m_CurrentManeuvers.water) // Water -> Water spells
            castPriority.push_back(AUTOSPELL_WATER);
        else
            defaultPriority.push_back(AUTOSPELL_WATER);

        if (m_CurrentManeuvers.earth) // Earth -> Stone spells
            castPriority.push_back(AUTOSPELL_STONE);
        else
            defaultPriority.push_back(AUTOSPELL_STONE);
    }
    else
        defaultPriority = { AUTOSPELL_THUNDER, AUTOSPELL_BLIZZARD, AUTOSPELL_FIRE, AUTOSPELL_AERO, AUTOSPELL_WATER, AUTOSPELL_STONE };

    while (tier >= 0)
    {
        for (AUTOSPELL id : castPriority)
            if (CastSpell((AUTOSPELL)(id + tier), PTarget))
                return true;

        for (AUTOSPELL id : defaultPriority)
            if (CastSpell((AUTOSPELL)(id + tier), PTarget))
                return true;

        --tier;
    }

    return false;
}

bool CAutomatonController::TryEnfeeble()
{
    if (!PAutomaton->PMaster || m_enfeebleCooldown == 0s || m_Tick <= m_LastEnfeebleTime + m_enfeebleCooldown)
        return false;

    std::vector<AUTOSPELL> castPriority;
    std::vector<AUTOSPELL> defaultPriority;

    switch (PAutomaton->getHead())
    {
    default:
    {
        if (!PTarget->StatusEffectContainer->HasStatusEffect(EFFECT_DIA))
        {
            if (m_CurrentManeuvers.dark) // Dark -> Bio
            {
                castPriority.push_back(AUTOSPELL_BIO_II);
                castPriority.push_back(AUTOSPELL_BIO);
            }
            else
            {
                defaultPriority.push_back(AUTOSPELL_BIO_II);
                defaultPriority.push_back(AUTOSPELL_BIO);
            }
        }

        if (!PTarget->StatusEffectContainer->HasStatusEffect(EFFECT_BIO))
        {
            if (m_CurrentManeuvers.light >= 2) // 2 Light -> Dia II
            {
                castPriority.push_back(AUTOSPELL_DIA_II);
            }

            if (m_CurrentManeuvers.light) // Light -> Dia
            {
                castPriority.push_back(AUTOSPELL_DIA);
            }
        }

        if (m_CurrentManeuvers.water) // Water -> Poison
        {
            castPriority.push_back(AUTOSPELL_POISON_II);
            castPriority.push_back(AUTOSPELL_POISON);
        }
        else
        {
            defaultPriority.push_back(AUTOSPELL_POISON_II);
            defaultPriority.push_back(AUTOSPELL_POISON);
        }

        if (m_CurrentManeuvers.wind) // Wind -> Silence
            castPriority.push_back(AUTOSPELL_SILENCE);
        else
            defaultPriority.push_back(AUTOSPELL_SILENCE);

        if (m_CurrentManeuvers.earth) // Earth -> Slow
            castPriority.push_back(AUTOSPELL_SLOW);
        else
            defaultPriority.push_back(AUTOSPELL_SLOW);

        if (m_CurrentManeuvers.dark) // Dark -> Blind
            castPriority.push_back(AUTOSPELL_BLIND);
        else
            defaultPriority.push_back(AUTOSPELL_BLIND);

        if (m_CurrentManeuvers.ice) // Ice -> Paralyze
            castPriority.push_back(AUTOSPELL_PARALYZE);
        else
            defaultPriority.push_back(AUTOSPELL_PARALYZE);

        if (m_CurrentManeuvers.fire) // Fire -> Addle
            castPriority.push_back(AUTOSPELL_ADDLE);
        else
            defaultPriority.push_back(AUTOSPELL_ADDLE);
    }
    break;
    case HEAD_SPIRITREAVER:
    {
        if (PAutomaton->GetMPP() <= 75 && PTarget->health.mp > 0) // MPP <= 75 -> Aspir
        {
            castPriority.push_back(AUTOSPELL_ASPIR_II);
            castPriority.push_back(AUTOSPELL_ASPIR);
        }

        if (PAutomaton->GetHPP() <= 75 && PTarget->m_EcoSystem != SYSTEM_UNDEAD) // HPP <= 75 -> Drain
            castPriority.push_back(AUTOSPELL_DRAIN);

        if (m_CurrentManeuvers.dark) // Dark -> Access to Enfeebles
        {
            if (!PAutomaton->StatusEffectContainer->HasStatusEffect(EFFECT_INT_BOOST)) // Use it ASAP
                defaultPriority.push_back(AUTOSPELL_ABSORB_INT);

            // Not prioritizable since it requires 1 Dark to access Enfeebles and requires 2 of another element to prioritize another
            defaultPriority.push_back(AUTOSPELL_BLIND);
            if (!PTarget->StatusEffectContainer->HasStatusEffect(EFFECT_DIA))
            {
                defaultPriority.push_back(AUTOSPELL_BIO_II);
                defaultPriority.push_back(AUTOSPELL_BIO);
            }

            if (!PTarget->StatusEffectContainer->HasStatusEffect(EFFECT_BIO))
            {
                if (m_CurrentManeuvers.light >= 2) // 2 Light -> Dia
                {
                    castPriority.push_back(AUTOSPELL_DIA_II);
                    castPriority.push_back(AUTOSPELL_DIA);
                }
            }


            if (m_CurrentManeuvers.water >= 2) // 2 Water -> Poison
            {
                castPriority.push_back(AUTOSPELL_POISON_II);
                castPriority.push_back(AUTOSPELL_POISON);
            }
            else
            {
                defaultPriority.push_back(AUTOSPELL_POISON_II);
                defaultPriority.push_back(AUTOSPELL_POISON);
            }

            if (m_CurrentManeuvers.wind >= 2) // 2 Wind -> Silence
                castPriority.push_back(AUTOSPELL_SILENCE);
            else
                defaultPriority.push_back(AUTOSPELL_SILENCE);

            if (m_CurrentManeuvers.earth >= 2) // 2 Earth -> Slow
                castPriority.push_back(AUTOSPELL_SLOW);
            else
                defaultPriority.push_back(AUTOSPELL_SLOW);

            if (m_CurrentManeuvers.ice >= 2) // 2 Ice -> Paralyze
                castPriority.push_back(AUTOSPELL_PARALYZE);
            else
                defaultPriority.push_back(AUTOSPELL_PARALYZE);

            if (m_CurrentManeuvers.fire >= 2) // 2 Fire -> Addle
                castPriority.push_back(AUTOSPELL_ADDLE);
            else
                defaultPriority.push_back(AUTOSPELL_ADDLE);
        }
    }
    break;
    case HEAD_SOULSOOTHER:
    {
        if (m_CurrentManeuvers.earth) // Earth -> Slow
            castPriority.push_back(AUTOSPELL_SLOW);
        else
            defaultPriority.push_back(AUTOSPELL_SLOW);

        if (m_CurrentManeuvers.water) // 2 Water -> Poison
        {
            castPriority.push_back(AUTOSPELL_POISON_II);
            castPriority.push_back(AUTOSPELL_POISON);
        }
        else
        {
            defaultPriority.push_back(AUTOSPELL_POISON_II);
            defaultPriority.push_back(AUTOSPELL_POISON);
        }

        if (m_CurrentManeuvers.dark) // Dark -> Blind > Bio
        {
            castPriority.push_back(AUTOSPELL_BLIND);
            if (!PTarget->StatusEffectContainer->HasStatusEffect(EFFECT_DIA))
            {
                castPriority.push_back(AUTOSPELL_BIO_II);
                castPriority.push_back(AUTOSPELL_BIO);
            }
        }
        else
        {
            defaultPriority.push_back(AUTOSPELL_BLIND);
            if (!PTarget->StatusEffectContainer->HasStatusEffect(EFFECT_DIA))
            {
                defaultPriority.push_back(AUTOSPELL_BIO_II);
                defaultPriority.push_back(AUTOSPELL_BIO);
            }
        }

        if (!PTarget->StatusEffectContainer->HasStatusEffect(EFFECT_BIO))
        {
            // This is probably wrong
            if (m_CurrentManeuvers.light) // Light -> Dia
            {
                castPriority.push_back(AUTOSPELL_DIA_II);
                castPriority.push_back(AUTOSPELL_DIA);
            }
            else
            {
                defaultPriority.push_back(AUTOSPELL_DIA_II);
                defaultPriority.push_back(AUTOSPELL_DIA);
            }
        }

        if (m_CurrentManeuvers.wind) // Wind -> Silence
            castPriority.push_back(AUTOSPELL_SILENCE);
        else
            defaultPriority.push_back(AUTOSPELL_SILENCE);

        if (m_CurrentManeuvers.ice) // Ice -> Paralyze
            castPriority.push_back(AUTOSPELL_PARALYZE);
        else
            defaultPriority.push_back(AUTOSPELL_PARALYZE);

        if (m_CurrentManeuvers.fire) // Fire -> Addle
            castPriority.push_back(AUTOSPELL_ADDLE);
        else
            defaultPriority.push_back(AUTOSPELL_ADDLE);
    }
    }

    CStatusEffectContainer* statuses = PTarget->StatusEffectContainer;
    // Could probably use hasImmunity() here instead if there was an easy way to calculate the effect's power
    for (AUTOSPELL id : castPriority)
    {
        if ((!m_enfeebleList[id] || (!statuses->HasStatusEffect(m_enfeebleList[id]) && !PTarget->hasImmunity(m_immunityList[id]))) &&
            CastSpell(id, PTarget))
            return true;
    }

    for (AUTOSPELL id : defaultPriority)
    {
        if ((!m_enfeebleList[id] || (!statuses->HasStatusEffect(m_enfeebleList[id]) && !PTarget->hasImmunity(m_immunityList[id]))) &&
            CastSpell(id, PTarget))
            return true;
    }

    return false;
}

bool CAutomatonController::TryStatusRemoval()
{
    if (!PAutomaton->PMaster || m_statusCooldown == 0s || m_Tick <= m_LastStatusTime + m_statusCooldown)
        return false;

    std::unordered_map<EFFECT, AUTOSPELL, EnumClassHash>& naList = m_naList;
    std::vector<AUTOSPELL> queue;

    PAutomaton->PMaster->StatusEffectContainer->ForEachEffect([&naList, &queue](CStatusEffect* PStatus)
    {
        if (PStatus->GetDuration() > 0)
        {
            auto id = naList[PStatus->GetStatusID()];
            if (id)
                queue.push_back(id);
            else if (PStatus->GetFlag() & EFFECTFLAG_ERASABLE)
                queue.push_back(AUTOSPELL_ERASE);
        }
    });

    for (AUTOSPELL id : queue)
        if (CastSpell(id, PAutomaton->PMaster))
            return true;

    queue.clear();

    PAutomaton->StatusEffectContainer->ForEachEffect([&naList, &queue](CStatusEffect* PStatus)
    {
        if (PStatus->GetDuration() > 0)
        {
            auto id = naList[PStatus->GetStatusID()];
            if (id)
                queue.push_back(id);
            else if (PStatus->GetFlag() & EFFECTFLAG_ERASABLE)
                queue.push_back(AUTOSPELL_ERASE);
        }
    });

    for (AUTOSPELL id : queue)
        if (CastSpell(id, PAutomaton))
            return true;

    if (m_CurrentManeuvers.water && PAutomaton->getHead() == HEAD_SOULSOOTHER && PAutomaton->PMaster->PParty) // Water + Soulsoother head -> Remove party's statuses
    {
        for (uint8 i = 0; i < PAutomaton->PMaster->PParty->members.size(); ++i)
        {
            CBattleEntity* member = PAutomaton->PMaster->PParty->members.at(i);
            if (member->id != PAutomaton->PMaster->id)
            {
                queue.clear();

                member->StatusEffectContainer->ForEachEffect([&naList, &queue](CStatusEffect* PStatus)
                {
                    if (PStatus->GetDuration() > 0)
                    {
                        auto id = naList[PStatus->GetStatusID()];
                        if (id)
                            queue.push_back(id);
                        else if (PStatus->GetFlag() & EFFECTFLAG_ERASABLE)
                            queue.push_back(AUTOSPELL_ERASE);
                    }
                });

                for (AUTOSPELL id : queue)
                    if (CastSpell(id, member))
                        return true;
            }
        }
    }

    return false;
}

bool CAutomatonController::TryEnhance()
{
    if (!PAutomaton->PMaster || m_enhanceCooldown == 0s || m_Tick <= m_LastEnhanceTime + m_enhanceCooldown)
        return false;

    if (PAutomaton->getHead() == HEAD_SPIRITREAVER)
        return CastSpell(AUTOSPELL_DREAD_SPIKES, PAutomaton);

    EnmityList_t* enmityList;
    auto PMob = dynamic_cast<CMobEntity*>(PTarget);
    if (PMob)
        enmityList = PMob->PEnmityContainer->GetEnmityList();

    int highestEnmity = 0;

    CBattleEntity* PRegenTarget = nullptr;
    CBattleEntity* PProtectTarget = nullptr;
    CBattleEntity* PShellTarget = nullptr;
    CBattleEntity* PHasteTarget = nullptr;
    CBattleEntity* PStoneSkinTarget = nullptr;
    CBattleEntity* PPhalanxTarget = nullptr;

    bool protect = false;
    int protectcount = 0;
    bool shell = false;
    int shellcount = 0;
    bool haste = false;
    bool stoneskin = false;
    bool phalanx = false;

    bool isEngaged = false;

    if (distance(PAutomaton->loc.p, PAutomaton->PMaster->loc.p) < 20)
    {
        if (PMob)
        {
            auto enmity_obj = enmityList->find(PAutomaton->PMaster->id);
            if (enmity_obj != enmityList->end())
            {
                isEngaged = true;
                if (highestEnmity < enmity_obj->second.CE + enmity_obj->second.VE)
                {
                    highestEnmity = enmity_obj->second.CE + enmity_obj->second.VE;
                    PRegenTarget = PAutomaton->PMaster;
                }
            }
        }
        else
        {
            isEngaged = true; // Assume everyone is engaged if the target isn't a mob
        }

        PAutomaton->PMaster->StatusEffectContainer->ForEachEffect([&protect, &protectcount, &shell, &shellcount, &haste, &stoneskin, &phalanx](CStatusEffect* PStatus)
        {
            if (PStatus->GetDuration() > 0)
            {
                if (PStatus->GetStatusID() == EFFECT_PROTECT)
                {
                    protect = true;
                    ++protectcount;
                }

                if (PStatus->GetStatusID() == EFFECT_SHELL)
                {
                    shell = true;
                    ++shellcount;
                }

                if (PStatus->GetStatusID() == EFFECT_HASTE || PStatus->GetStatusID() == EFFECT_HASTE_II)
                    haste = true;

                if (PStatus->GetStatusID() == EFFECT_STONESKIN)
                    stoneskin = true;

                if (PStatus->GetStatusID() == EFFECT_PHALANX)
                    phalanx = true;
            }
        });

        if (isEngaged) {
            if (!protect)
                PProtectTarget = PAutomaton->PMaster;

            if (!shell)
                PShellTarget = PAutomaton->PMaster;

            if (!haste)
                PHasteTarget = PAutomaton->PMaster;

            if (!stoneskin)
                PStoneSkinTarget = PAutomaton->PMaster;

            if (!phalanx)
                PPhalanxTarget = PAutomaton->PMaster;
        }
    }

    protect = false;
    shell = false;
    haste = false;
    stoneskin = false;
    phalanx = false;

    if (PMob)
    {
        auto enmity_obj = enmityList->find(PAutomaton->id);
        if (enmity_obj != enmityList->end() && highestEnmity < enmity_obj->second.CE + enmity_obj->second.VE)
        {
            highestEnmity = enmity_obj->second.CE + enmity_obj->second.VE;
            PRegenTarget = PAutomaton;
        }
    }

    PAutomaton->StatusEffectContainer->ForEachEffect([&protect, &shell, &haste, &stoneskin, &phalanx](CStatusEffect* PStatus)
    {
        if (PStatus->GetDuration() > 0)
        {
            if (PStatus->GetStatusID() == EFFECT_PROTECT)
                protect = true;

            if (PStatus->GetStatusID() == EFFECT_SHELL)
                shell = true;

            if (PStatus->GetStatusID() == EFFECT_HASTE || PStatus->GetStatusID() == EFFECT_HASTE_II)
                haste = true;
        }
    });

    if (!PProtectTarget && !protect)
        PProtectTarget = PAutomaton;

    if (!PShellTarget && !shell)
        PShellTarget = PAutomaton;

    if (!PHasteTarget && !haste)
        PHasteTarget = PAutomaton;

    int members = 0;

    // Unknown whether it only applies buffs to other members if they have hate or if the Soulsoother head is needed
    if (PAutomaton->PMaster->PParty)
    {
        members = PAutomaton->PMaster->PParty->members.size();
        for (uint8 i = 0; i < members; ++i)
        {
            CBattleEntity* member = PAutomaton->PMaster->PParty->members.at(i);
            if (member->id != PAutomaton->PMaster->id && distance(PAutomaton->loc.p, member->loc.p) < 20)
            {
                protect = false;
                shell = false;
                haste = false;

                isEngaged = false;

                if (PMob)
                {
                    auto enmity_obj = enmityList->find(member->id);
                    if (enmity_obj != enmityList->end())
                    {
                        isEngaged = true;
                        if (highestEnmity < enmity_obj->second.CE + enmity_obj->second.VE)
                        {
                            highestEnmity = enmity_obj->second.CE + enmity_obj->second.VE;
                            PRegenTarget = member;
                        }
                    }
                }
                else
                {
                    isEngaged = true; // Assume everyone is engaged if the target isn't a mob
                }

                member->StatusEffectContainer->ForEachEffect([&protect, &protectcount, &shell, &shellcount, &haste](CStatusEffect* PStatus)
                {
                    if (PStatus->GetDuration() > 0)
                    {
                        if (PStatus->GetStatusID() == EFFECT_PROTECT)
                        {
                            protect = true;
                            ++protectcount;
                        }

                        if (PStatus->GetStatusID() == EFFECT_SHELL)
                        {
                            shell = true;
                            ++shellcount;
                        }

                        if (PStatus->GetStatusID() == EFFECT_HASTE || PStatus->GetStatusID() == EFFECT_HASTE_II)
                            haste = true;
                    }
                });

                if (isEngaged)
                {
                    if (!PProtectTarget && !protect)
                        PProtectTarget = member;

                    if (!PShellTarget && !shell)
                        PShellTarget = member;

                    if (!PHasteTarget && !haste)
                        PHasteTarget = member;
                }
            }
        }
    }

    // No info on how this spell worked
    if ((members - protectcount) >= 4)
        CastSpell(AUTOSPELL_PROTECTRA_V, PAutomaton);

    // No info on how this spell worked
    if ((members - shellcount) >= 4)
        CastSpell(AUTOSPELL_SHELLRA_V, PAutomaton);

    if (PRegenTarget && (PTarget->GetMLevel() + 5) >= PAutomaton->GetMLevel() && !(PRegenTarget->StatusEffectContainer->HasStatusEffect(EFFECT_REGEN) ||
        PRegenTarget->StatusEffectContainer->HasStatusEffect(EFFECT_REGEN_II)))
        if (CastSpell(AUTOSPELL_REGEN_III, PRegenTarget) ||
            CastSpell(AUTOSPELL_REGEN_II, PRegenTarget) ||
            CastSpell(AUTOSPELL_REGEN, PRegenTarget))
            return true;

    if (PProtectTarget)
        if (CastSpell(AUTOSPELL_PROTECT_V, PProtectTarget) ||
            CastSpell(AUTOSPELL_PROTECT_IV, PProtectTarget) ||
            CastSpell(AUTOSPELL_PROTECT_III, PProtectTarget) ||
            CastSpell(AUTOSPELL_PROTECT_II, PProtectTarget) ||
            CastSpell(AUTOSPELL_PROTECT, PProtectTarget))
            return true;

    if (PShellTarget)
        if (CastSpell(AUTOSPELL_SHELL_V, PShellTarget) ||
            CastSpell(AUTOSPELL_SHELL_IV, PShellTarget) ||
            CastSpell(AUTOSPELL_SHELL_III, PShellTarget) ||
            CastSpell(AUTOSPELL_SHELL_II, PShellTarget) ||
            CastSpell(AUTOSPELL_SHELL, PShellTarget))
            return true;

    if (PHasteTarget)
        if (CastSpell(AUTOSPELL_HASTE_II, PHasteTarget) || CastSpell(AUTOSPELL_HASTE, PHasteTarget))
            return true;

    if (PStoneSkinTarget)
        if (CastSpell(AUTOSPELL_STONESKIN, PStoneSkinTarget))
            return true;

    if (PPhalanxTarget)
        if (CastSpell(AUTOSPELL_PHALANX, PPhalanxTarget))
            return true;

    return false;
}

bool CAutomatonController::TryTPMove()
{
    if (PAutomaton->health.tp > 1000)
    {
        const auto& FamilySkills = battleutils::GetMobSkillList(PAutomaton->m_Family);

        std::vector<CMobSkill*> validSkills;

        //load the skills that the automaton has access to with it's skill
        SKILLTYPE skilltype = SKILL_AME;

        if (PAutomaton->getFrame() == FRAME_SHARPSHOT)
            skilltype = SKILL_ARA;

        for (auto skillid : FamilySkills)
        {
            auto PSkill = battleutils::GetMobSkill(skillid);
            if (PSkill && PAutomaton->GetSkill(skilltype) > PSkill->getParam() && PSkill->getParam() != -1 &&
                distance(PAutomaton->loc.p, PTarget->loc.p) < PSkill->getRadius())
            {
                validSkills.push_back(PSkill);
            }
        }

        uint16 currentSkill = 0;
        CMobSkill* PWSkill;
        int8 currentManeuvers = -1;
        for (auto PSkill : validSkills)
        {
            int8 maneuvers = luautils::OnMobAutomatonSkillCheck(PTarget, PAutomaton, PSkill);
            if (maneuvers > -1 && (maneuvers > currentManeuvers || (maneuvers == currentManeuvers && PSkill->getParam() > currentSkill)))
            {
                currentManeuvers = maneuvers;
                currentSkill = PSkill->getParam();
                PWSkill = PSkill;
            }
        }

        // No WS was chosen (waiting on master's TP to skillchain probably)
        if (currentManeuvers == -1)
            return false;

        return MobSkill(PTarget->targid, PWSkill->getID());
    }
    return false;
}

bool CAutomatonController::TryRangedAttack()
{
    if (m_rangedCooldown > 0s && m_Tick > m_LastRangedTime + (m_rangedCooldown - std::chrono::seconds(PAutomaton->getMod(Mod::SNAP_SHOT))))
        return MobSkill(PTarget->targid, m_RangedAbility);
    return false;
}

bool CAutomatonController::TryAttachment()
{
    if (false)
    {
        return true;
    }
    return false;
}

bool CAutomatonController::CanCastSpells()
{
    // Check for spell blockers e.g. silence
    if (PAutomaton->StatusEffectContainer->HasStatusEffect({ EFFECT_SILENCE, EFFECT_MUTE }))
        return false;

    // Check if we are already casting!
    if (PAutomaton->PAI->IsCurrentState<CMagicState>())
        return false;

    return true;
}

bool CAutomatonController::CastSpell(AUTOSPELL spellid, CBattleEntity* PCastTarget)
{
    CSpell* PSpell = spell::GetSpell(spellid);

    if (!PAutomaton->hasSpell(spellid) || PAutomaton->health.mp < PSpell->getMPCost() ||
        (PAutomaton->m_RecastList[spellid] && time(nullptr) < PAutomaton->m_RecastList[spellid]))
        return false;

    if (PSpell == nullptr)
    {
        ShowWarning(CL_YELLOW"CAutomatonController::CastSpell: SpellId <%i> is not found\n" CL_RESET, spellid);
        return false;
    }
    else
    {
        Cast(PCastTarget->targid, spellid);
    }
    return true;
}
