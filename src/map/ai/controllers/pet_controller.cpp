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

#include "pet_controller.h"
#include "../../mob_spell_container.h"
#include "../ai_container.h"
#include "../../status_effect_container.h"
#include "../../entities/petentity.h"
#include "../../utils/petutils.h"
#include "../../../common/utils.h"
#include "../../mob_modifier.h"
#include "../../../common/showmsg.h"

CPetController::CPetController(CPetEntity* _PPet) :
    CMobController(_PPet), PPet(_PPet)
{
    //#TODO: this probably will have to depend on pet type (automaton does WS on its own..)
    SetWeaponSkillEnabled(false);      
}

void CPetController::Tick(time_point tick)
{
    if (PPet->isCharmed && tick > PPet->charmTime)
    {
        petutils::DespawnPet(PPet->PMaster);
        return;
    }
    CMobController::Tick(tick);
}

void CPetController::DoRoamTick(time_point tick)
{
    if ((PPet->PMaster == nullptr || PPet->PMaster->isDead()) && PPet->isAlive()) {
        PPet->Die();
        return;
    }

    //automaton, wyvern
    if (PPet->getPetType() == PETTYPE_WYVERN || PPet->getPetType() == PETTYPE_AUTOMATON) {
        if (PetIsHealing()) {
            return;
        }
    }
    else if (PPet->isBstPet() && PPet->StatusEffectContainer->GetStatusEffect(EFFECT_HEALING)) {
        return;
    }

    float currentDistance = distance(PPet->loc.p, PPet->PMaster->loc.p);

    if (currentDistance > PetRoamDistance)
    {
        if (currentDistance < 35.0f && PPet->PAI->PathFind->PathAround(PPet->PMaster->loc.p, 2.0f, PATHFLAG_RUN | PATHFLAG_WALLHACK))
        {
            PPet->PAI->PathFind->FollowPath();
        }
        else if (PPet->GetSpeed() > 0)
        {
            PPet->PAI->PathFind->WarpTo(PPet->PMaster->loc.p, PetRoamDistance);
        }
    }
    duration d = std::chrono::duration_cast<std::chrono::milliseconds>(m_Tick - m_LastMagicTime);
    int32 lastCast = (int32)(d.count() / 1000000);
    if(lastCast < 0)
        lastCast = 0;
    bool casted = luautils::OnPetRoam(PPet, lastCast);
    if(casted)
        m_LastMagicTime = m_Tick;        
}

bool CPetController::PetIsHealing()
{
    bool isMasterHealing = (PPet->PMaster->animation == ANIMATION_HEALING);
    bool isPetHealing = (PPet->animation == ANIMATION_HEALING);

    if (isMasterHealing && !isPetHealing && !PPet->StatusEffectContainer->HasPreventActionEffect()) {
        //animation down
        PPet->animation = ANIMATION_HEALING;
        PPet->StatusEffectContainer->AddStatusEffect(new CStatusEffect(EFFECT_HEALING, 0, 0, map_config.healing_tick_delay, 0));
        PPet->updatemask |= UPDATE_HP;
        return true;
    }
    else if (!isMasterHealing && isPetHealing) {
        //animation up
        PPet->animation = ANIMATION_NONE;
        PPet->StatusEffectContainer->DelStatusEffect(EFFECT_HEALING);
        PPet->updatemask |= UPDATE_HP;
        return false;
    }
    return isMasterHealing;
}

bool CPetController::TryDeaggro()
{
    if (PTarget == nullptr)
    {
        return true;
    }

    // target is no longer valid, so wipe them from our enmity list
    if (PTarget->isDead() ||
        PTarget->isMounted() ||
        PTarget->loc.zone->GetID() != PPet->loc.zone->GetID() ||
        PPet->StatusEffectContainer->GetConfrontationEffect() != PTarget->StatusEffectContainer->GetConfrontationEffect())
    {
        return true;
    }
    return false;
}

bool CPetController::Ability(uint16 targid, uint16 abilityid)
{
    if (PPet->PAI->CanChangeState())
    {
        return PPet->PAI->Internal_Ability(targid, abilityid);
    }
    return false;
}
bool CPetController::Engage(uint16 targid)
{ 
    auto ret = CController::Engage(targid);
    if (ret)
    {
        m_firstSpell = true;        
        int32 delay = 0;        
        int32 newDelay = luautils::OnPetEngage(PPet, delay);
        m_firstDelay = delay;        
        m_LastMagicTime = m_Tick - std::chrono::milliseconds(newDelay);
    }
    return ret;    
}

void CPetController::DoCombatTick(time_point tick)
{        
    HandleEnmity();
    PTarget = static_cast<CBattleEntity*>(PPet->GetEntity(PPet->GetBattleTargetID()));

    if (TryDeaggro())
    {
        Disengage();
        return;
    }

    TryLink();

    float currentDistance = distance(PPet->loc.p, PTarget->loc.p);

    PPet->PAI->EventHandler.triggerListener("COMBAT_TICK", PPet);
    int32 newDelay = 0;
    if (m_firstSpell == false || m_firstDelay == 0) {
        int32 delay = PPet->getBigMobMod(MOBMOD_MAGIC_COOL);
        newDelay = luautils::OnPetFight(PPet, PTarget, delay);    
        if(m_firstDelay == 0)
            m_firstDelay = newDelay;
    } else {
        newDelay = luautils::OnPetFight(PPet, PTarget, m_firstDelay);
    }
    
    // Try to spellcast (this is done first so things like Chainspell spam is prioritised over TP moves etc.
    if (IsSpecialSkillReady(currentDistance) && TrySpecialSkill())
    {
        return;
    }
    else if (IsPetSpellReady(currentDistance,newDelay) && TryCastPetSpell())
    {        
        return;
    }
    else if (m_Tick >= m_LastMobSkillTime && dsprand::GetRandomNumber(100) < PMob->TPUseChance() && MobSkill())
    {        
        return;
    }

    Move();
}


bool CPetController::IsPetSpellReady(float currentDistance, int32 delay)
{

    int32 bonusTime = 0;
    if (currentDistance > 5)
    {
        // Mobs use ranged attacks quicker when standing back
        bonusTime = PPet->getBigMobMod(MOBMOD_STANDBACK_COOL);
    }

    if (PPet->StatusEffectContainer->HasStatusEffect({EFFECT_CHAINSPELL,EFFECT_MANAFONT}))
    {
        return true;
    }    
    bool result = (m_Tick >= m_LastMagicTime + std::chrono::milliseconds(delay - bonusTime));    
    return result;
}


bool CPetController::TryCastPetSpell()
{
    if (!CanCastSpells())
    {
        return false;
    }

    m_LastMagicTime = m_Tick;

    if (PPet->m_HasSpellScript)
    {
        // skip logic and follow script
        auto chosenSpellId = luautils::OnMonsterMagicPrepare(PPet, PTarget);
        if (chosenSpellId)
        {
            CastSpell(chosenSpellId.value());
            return true;
        }
    }
    else
    {
        // find random spell
        std::optional<SpellID> chosenSpellId;
        
        chosenSpellId = PPet->SpellContainer->GetSpell();
        
        if (chosenSpellId)
        {
            //#TODO: select target based on spell type
            CastSpell(chosenSpellId.value());
            return true;
        }
    }
    return false;
}
