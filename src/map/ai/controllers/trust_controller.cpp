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

#include "trust_controller.h"
//#include "../common/timer.h"
#include "mob_controller.h"
#include "../ai_container.h"
#include "../helpers/targetfind.h"
#include "../states/ability_state.h"
#include "../states/magic_state.h"
#include "../states/weaponskill_state.h"
#include "../../mobskill.h"
#include "../../trust_weaponskill.h"
#include "../../trust_weaponskill_list.h"
#include "../../party.h"
#include "../../status_effect_container.h"
#include "../../enmity_container.h"
#include "../../mob_modifier.h"
#include "../../trust_spell_container.h"
#include "../../entities/trustentity.h"
#include "../../entities/mobentity.h"
#include "../../utils/battleutils.h"
#include "../../../common/utils.h"
#include "../../utils/trustutils.h"
#include "../../recast_container.h"

//CTrustController::CTrustController(CTrustEntity* PTrust) : CController(PTrust), PTrust(PTrust)
//CTrustController::CTrustController(CTrustEntity* PTrust) : CMobController(PTrust), PTrust(PTrust)
//{
//    //PTrust->PAI->PathFind = std::make_unique<CPathFind>(PTrust);
//}

CTrustController::CTrustController(CTrustEntity* PEntity) :
    CMobController(PEntity),
    PTrust(PEntity)
{
    PActionTarget = { nullptr };
}

CTrustController::~CTrustController()
{
    if (PTrust->PAI->IsEngaged())
    {
        PTrust->PAI->Internal_Disengage();
    }
    PTrust->PAI->PathFind.reset();
    PTrust->allegiance = ALLEGIANCE_PLAYER;
    PTrust->PMaster = nullptr;
}

//Ticks, Roaming, and Combat Functions
////////////////////////////////////////

void CTrustController::Tick(time_point tick)
{
    if (!PTrust->PMaster)
    {
        return;
    }

    m_Tick = tick;

    if (PTrust->isAlive())
    {
        if (PTrust->PAI->IsEngaged())
        {
            DoCombatTick(m_Tick);
        }
        else if (!PTrust->isDead())
        {
            DoRoamTick(m_Tick);
        }
    }
}

void CTrustController::DoCombatTick(time_point t_tick)
{


    if (!PTrust->PMaster->PAI->IsEngaged())
    {
        Disengage();
        TTarget = nullptr;
        return;
    }

    auto PTarget = (CMobEntity*)PTrust->PMaster->GetBattleTarget();

    if (TTarget && PTarget)
    {
        if (TTarget->targid != PTarget->targid)
        {
            if (PTarget->animation == ANIMATION_ATTACK && PTarget->HasID(PTrust->PMaster->id))
            {
                TTarget->m_OwnerID.clean();
                PTrust->SetBattleTargetID(PTarget->targid);
                FaceTarget(PTarget->targid);
                TTarget = PTarget;
            }
        }

        if (!isFaceing(PTrust->loc.p, TTarget->loc.p, 5))
        {
            FaceTarget(TTarget->targid);
        }

        float currentDistance = distance(PTrust->loc.p, TTarget->loc.p);

        PTrust->PAI->EventHandler.triggerListener("COMBAT_TICK", PTrust);

        luautils::OnTrustFight(PTrust, TTarget);

        if (IsWeaponSkillReady(currentDistance) && dsprand::GetRandomNumber(100) < PTrust->TPUseChance() && TryWeaponSkill())
        {
            return;
        }
        else if (IsAbilityReady(currentDistance) && TryAbilitySkill())
        {
            return;
        }
        else if (IsSpellReady(currentDistance) && TryCastSpell())
        {
            return;
        }

        Move();
    }
}

void CTrustController::DoRoamTick(time_point tick)
{
    if (TTarget && TTarget->isDead())
    {
        TTarget = nullptr;
        return;
    }

    CCharEntity* POwner = (CCharEntity*)PTrust;
    CCharEntity* master = (CCharEntity*)PTrust->PMaster;
    float currentDistance = 0;
    CBattleEntity* PFollow = nullptr;
    uint8 currentPartyPos = master->TrustPartyPosition((CTrustEntity*)PTrust);
    float roamingDistance = 0.0f;

    if (currentPartyPos == 0)
    {
        roamingDistance = RoamDistance / 2;
        PFollow = POwner->PMaster;
        currentDistance = distance(PTrust->loc.p, PFollow->loc.p);
    }
    else
    {
        roamingDistance = RoamDistance;
        PFollow = (CBattleEntity*)master->PTrusts.at(currentPartyPos - 1);
        currentDistance = distance(PTrust->loc.p, PFollow->loc.p);
    }

    if ((PTrust->GetHPP() != 100 || PTrust->GetMPP() != 100) && m_Tick >= m_WaitTime)
    {
        if (PTrust->CanRest())
        {
            // recover 3% health/mp
            if (healTick <= 3)
            {
                if (PTrust->Rest(0.03f))
                {
                    // health updated
                    PTrust->updatemask |= UPDATE_HP;
                    if (healTick == 1)
                    {
                        Wait(25s);
                        healTick++;
                    }
                    else if (healTick == 2 || healTick == 3)
                    {
                        Wait(10s);
                        healTick++;
                    }
                }
            }
            // recover 5% health/mp
            else
            {
                if (PTrust->Rest(0.05f))
                {
                    Wait(3s);
                }
            }
            if (PTrust->GetHPP() == 100 && PTrust->GetMPP() == 100)
            {
                healTick = 1;
            }
        }
    }

    for (auto PSpawnedMob : static_cast<CCharEntity*>(master)->SpawnTRUSTList)
    {
        CTrustEntity* TTrust = (CTrustEntity*)PSpawnedMob.second;
        if (TTrust->PMaster == master)
        {
            float currentTrustDistance = distance(PTrust->loc.p, TTrust->loc.p);

            if (TTrust != PTrust && currentTrustDistance < 1.5f && currentPartyPos > master->TrustPartyPosition((CTrustEntity*)TTrust))
            {
                //if (PTrust->PAI->PathFind->IsFollowingPath())
                //{
                auto angle = getangle(PTrust->loc.p, TTrust->loc.p) + dsprand::GetRandomNumber(60, 90);
                position_t new_pos{ PTrust->loc.p.x - (cosf(rotationToRadian(angle)) * dsprand::GetRandomNumber(3.5f)),
                    TTrust->loc.p.y, PTrust->loc.p.z + (sinf(rotationToRadian(angle)) * dsprand::GetRandomNumber(3.5f)), 0, 0 };
                if (PTrust->PAI->PathFind->ValidPosition(new_pos))
                {
                    PTrust->PAI->PathFind->PathAround(new_pos, 0.5f, PATHFLAG_WALLHACK | PATHFLAG_RUN);
                    PTrust->PAI->PathFind->FollowPath();
                }
                //}
            }
        }
    }

    if (currentDistance > roamingDistance)
    {
        if (PFollow != nullptr)
        {
            if (currentDistance < 35.0f && PTrust->PAI->PathFind->PathAround(PFollow->loc.p, 1.0f, PATHFLAG_RUN | PATHFLAG_WALLHACK))
            {
                PTrust->PAI->PathFind->FollowPath();
            }
            else if (PTrust->GetSpeed() > 0)
            {
                PTrust->PAI->PathFind->WarpTo(PFollow->loc.p, roamingDistance);
            }
        }
    }
}


//Engage and Disengage Functions
////////////////////////////////////////

bool CTrustController::Engage(uint16 targid)
{
    auto ret = CController::Engage(targid);
    luautils::OnTrustEngaged(PTrust, PTrust->PMaster->GetBattleTarget());

    if (ret)
    {
        m_firstSpell = true;
        healTick = 1;
        // Don't cast magic or use special ability right away
        if (PTrust->getMobMod(MOBMOD_MAGIC_DELAY) != 0)
        {
            m_LastMagicTime = m_Tick - std::chrono::seconds(PTrust->getMobMod(MOBMOD_MAGIC_COOL) + dsprand::GetRandomNumber(PTrust->getMobMod(MOBMOD_MAGIC_DELAY)));
        }

        if (PTrust->getMobMod(MOBMOD_SPECIAL_DELAY) != 0)
        {
            m_LastSpecialTime = m_Tick - std::chrono::seconds(PTrust->getMobMod(MOBMOD_SPECIAL_COOL) + dsprand::GetRandomNumber(PTrust->getMobMod(MOBMOD_SPECIAL_DELAY)));
        }

        if (PTrust->getMobMod(MOBMOD_SPECIAL_DELAY) != 0)
        {
            m_LastAbilityTime = m_Tick - std::chrono::seconds(PTrust->getMobMod(MOBMOD_SPECIAL_COOL) + dsprand::GetRandomNumber(PTrust->getMobMod(MOBMOD_SPECIAL_DELAY)));
        }
    }
    return ret;
}

void CTrustController::Despawn()
{
    if (PTrust)
    {
        TTarget = nullptr;
        //luautils::OnTrustDespawn(PTrust);
        PTrust->PAI->Internal_Despawn();
    }
}

bool CTrustController::Disengage()
{
    PTrust->updatemask |= (UPDATE_STATUS | UPDATE_HP);
    PTrust->animation = ANIMATION_NONE;
    TTarget = nullptr;
    PTrust->setLastWs(0);

    return CController::Disengage();
}


//Trust Skills Functions
////////////////////////////////////////

bool CTrustController::IsWeaponSkillReady(float currentDistance)
{

    if (PTrust->getMobMod(MOBMOD_SPECIAL_SKILL) == 0) return false;
    if (PTrust->StatusEffectContainer->HasStatusEffect(EFFECT_CHAINSPELL)) return false;
    if (currentDistance > 5 && PTrust->m_Behaviour != 2) return false;

    if (PTrust->getLastWs() == 0)
    {
        if (m_Tick >= m_LastWeaponSkillTime + std::chrono::seconds(PTrust->getMobMod(MOBMOD_SPECIAL_COOL)))
        {
            return true;
        }
        return false;
    }
    return true;
}

bool CTrustController::TryWeaponSkill()
{
    m_LastWeaponSkillTime = m_Tick;

    if (PTrust->getLastWs() == 0)
    {
        float getDistance = 0;
        uint16 skillID = 0;

        auto selectedSkill = nullptr;

        auto skillList{ trustWSList::GetTrustWSList(PTrust->m_TrustID - 895) };

        if (skillList->m_wsList.empty())
        {
            return false;
        }

        std::shuffle(skillList->m_wsList.begin(), skillList->m_wsList.end(), dsprand::mt());
        for (auto skillid : skillList->m_wsList)
        {
            auto PTrustMobSkill{ battleutils::GetMobSkill(skillid.wsMobId) };

            if (!PTrustMobSkill)
            {
                continue;
            }
            if (skillid.min_level > PTrust->GetMLevel())
            {
                continue;
            }

            auto target_flags = PTrustMobSkill->getValidTargets();

            if (target_flags == TARGET_ENEMY) //enemy
            {
                PActionTarget = TTarget;
            }
            else if (target_flags == TARGET_SELF) //self
            {
                PActionTarget = (CBattleEntity*)PTrust;
            }

            if (((CBattleEntity*)PTrust)->health.tp < 3000)
            {
                int result = luautils::OnTrustWeaponSkillCheck(PActionTarget, PTrust, PTrustMobSkill);
                if (result == 1)
                {
                    continue;
                }
                else if (result == 2)
                {                    
                    return false;
                }
            }
            PTrust->setLastWs(skillid.wsMobId);
            break;
        }
    }

    if (PTrust->getLastWs() > 0)
    {
        auto PTrustMobSkill{ battleutils::GetMobSkill(PTrust->getLastWs()) };

        float currentDistance = distance(PTrust->loc.p, PActionTarget->loc.p);
        if (currentDistance <= PTrustMobSkill->getDistance())
        {
            return TrustSkill(PActionTarget->targid, PTrust->getLastWs());
        }
    }

    return false;
}

//bool CTrustController::WeaponSkill(uint16 targid, uint16 wsid)
//{
//    if (PTrust->PAI->CanChangeState())
//    {
//        CBattleEntity* PTarget = (CBattleEntity*)PTrust->GetEntity(targid, TYPE_TRUST | TYPE_MOB);
//
//        if (PTrust->StatusEffectContainer->HasStatusEffect({ EFFECT_AMNESIA, EFFECT_IMPAIRMENT }))
//        {
//            return false;
//        }
//
//        if (!isFaceing(PTrust->loc.p, PTarget->loc.p, 40) && PTarget->targid != PTrust->targid)
//        {
//            return false;
//        }
//
//        return PTrust->PAI->Internal_TrustSkill(targid, wsid);
//    }
//    return false;
//}
//
//bool CTrustController::TrustSkill(int wsList)
//{
//    /* #TODO: mob 2 hours, etc */
//    //if (!wsList) wsList = PTrust->getMobMod(MOBMOD_SKILL_LIST);
//    auto skillList{ trustWSList::GetTrustWSList(wsList) };
//
//    if (skillList->m_wsList.empty())
//    {
//        return false;
//    }
//
//    std::shuffle(skillList->m_wsList.begin(), skillList->m_wsList.end(), dsprand::mt());
//
//
//    CBattleEntity* PActionTarget{ nullptr };
//
//    for (auto skillid : skillList->m_wsList)
//    {
//
//        auto PTrustSkill{ battleutils::GetTrustWeaponSkill(skillid.wsMobId) };
//        if (!PTrustSkill)
//        {
//            continue;
//        }
//        CMobSkill* PWeaponSkill = battleutils::GetMobSkill(skillid.wsMobId);
//
//        if (PTrustSkill->getValidTargets() == TARGET_ENEMY) //enemy
//        {
//            PActionTarget = TTarget;
//        }
//        else if (PTrustSkill->getValidTargets() == TARGET_SELF) //self
//        {
//            PActionTarget = PTrust;
//        }
//        else
//        {
//            continue;
//        }
//        float currentDistance = distance(PTrust->loc.p, PActionTarget->loc.p);
//
//        if (currentDistance <= PTrustSkill->getDistance())
//        {                
//            return ((CMobController*)PTrust)->MobSkill(PActionTarget->targid, PTrustSkill->getID());
//        }
//    }
//
//    return false;
//}

bool CTrustController::TrustSkill(uint16 targid, uint16 wsid)
{
    if (PTrust)
    {
        if (m_Tick >= m_WaitTime)
        {
            Wait(5s);
        }
        else
        {
            return PTrust->PAI->Internal_TrustSkill(targid, wsid);
        }
    }

    return false;
}




//Trust Magic Functions
////////////////////////////////////////
bool CTrustController::IsSpellReady(float currentDistance)
{

    int32 bonusTime = 0;
    if (currentDistance > 5)
    {
        // Mobs use ranged attacks quicker when standing back
        bonusTime = PTrust->getMobMod(MOBMOD_STANDBACK_COOL);
    }

    if (PTrust->StatusEffectContainer->HasStatusEffect({ EFFECT_CHAINSPELL,EFFECT_MANAFONT }))
    {
        return true;
    }

    if (m_Tick >= m_LastMagicTime + std::chrono::seconds(PTrust->getMobMod(MOBMOD_MAGIC_COOL) - bonusTime))
    {
        return true;
    }

    return false;
}

bool CTrustController::TryCastSpell()
{
    m_LastMagicTime = m_Tick - std::chrono::seconds(PTrust->getBigMobMod(MOBMOD_MAGIC_COOL) / 2);

    if (!CanCastSpells())
    {
        return false;
    }

    if (PTrust->m_HasSpellScript)
    {
        // skip logic and follow script

        uint16 spellID;
        uint16 targetID;

        std::tie(spellID, targetID) = luautils::OnTrustCast(PTrust);
        if (spellID > 0)
        {
            Cast(targetID, static_cast<SpellID>(spellID));
            m_LastMagicTime = m_Tick;
            return true;
        }
    }

    // find random spell
    std::optional<SpellID> chosenSpellId;

    chosenSpellId = PTrust->TrustSpellContainer->GetSpell();

    if (chosenSpellId)
    {
        if (PTrust->PRecastContainer->HasRecast(RECAST_MAGIC, static_cast<uint16>(chosenSpellId.value()), 0))
        {
            return false;
        }

        CastSpell(chosenSpellId.value());
        return true;

    }
    return false;
}

bool CTrustController::CanCastSpells()
{

    if (!PTrust->TrustSpellContainer->getCanCastSpells() && !PTrust->m_HasSpellScript)
    {
        return false;
    }

    // check for spell blockers e.g. silence
    if (PTrust->StatusEffectContainer->HasStatusEffect({ EFFECT_SILENCE, EFFECT_MUTE }))
    {
        return false;
    }

    return IsMagicCastingEnabled();
}

void CTrustController::CastSpell(SpellID spellid)
{
    CSpell* PSpell = spell::GetSpell(spellid);
    if (PSpell == nullptr)
    {
        return;
    }

    if (PSpell->isCure())
    {
        uint16 healPercent = PTrust->getMobMod(MOBMOD_HP_HEAL_CHANCE);
        if (PTrust->PMaster->GetHPP() <= healPercent)
        {
            if (Cast(PTrust->PMaster->targid, spellid))
                return;
        }

        if (PTrust->GetHPP() <= healPercent)
        {
            if (Cast(PTrust->targid, spellid))
                return;
        }

        for (auto member : PTrust->PMaster->PParty->members)
        {
            if (member->GetHPP() <= healPercent)
            {
                if (Cast(member->targid, spellid))
                    return;
            }
        }

        CCharEntity* player = (CCharEntity*)PTrust->PMaster;
        for (auto trust : player->PTrusts)
        {
            if (trust->id != PTrust->id)
            {
                if (trust->GetHPP() <= healPercent)
                {
                    if (Cast(trust->targid, spellid))
                        return;
                }
            }
        }
        return;
    }

    else if (PSpell->isNa())
    {
        EFFECT status = (EFFECT)spell::GetEnfeebleEffect(PSpell);
        std::vector<SpellID> castPriority;

        PTrust->PMaster->StatusEffectContainer->ForEachEffect([&castPriority](CStatusEffect* PStatus)
        {
            if (PStatus->GetDuration() > 0)
            {
                if (PStatus->GetFlag() & EFFECTFLAG_ERASABLE)
                {
                    castPriority.push_back(SpellID::Erase);
                }
            }
        });

        for (SpellID& id : castPriority)
        {
            if (Cast(PTrust->PMaster->targid, spellid))
                return;
        }

        if (PTrust->PMaster->StatusEffectContainer->HasStatusEffect(status))
        {
            if (Cast(PTrust->PMaster->targid, spellid))
                return;
        }

        castPriority.clear();

        PTrust->StatusEffectContainer->ForEachEffect([&castPriority](CStatusEffect* PStatus)
        {
            if (PStatus->GetDuration() > 0)
            {
                if (PStatus->GetFlag() & EFFECTFLAG_ERASABLE)
                {
                    castPriority.push_back(SpellID::Erase);
                }
            }
        });

        for (SpellID& id : castPriority)
        {
            if (Cast(PTrust->targid, spellid))
                return;
        }

        if (PTrust->PMaster->StatusEffectContainer->HasStatusEffect(status))
        {
            if (Cast(PTrust->targid, spellid))
                return;
        }
        return;
    }
    else if (PSpell->isBuff())
    {
        EFFECT status = (EFFECT)spell::GetEnfeebleEffect(PSpell);

        if (!PTrust->PMaster->StatusEffectContainer->HasStatusEffect(status))
        {
            if (Cast(PTrust->PMaster->targid, spellid))
                return;
        }

        if (!PTrust->StatusEffectContainer->HasStatusEffect(status))
        {
            if (Cast(PTrust->targid, spellid))
                return;
        }
        return;
    }
    else if (PSpell->isDebuff())
    {
        EFFECT status = (EFFECT)spell::GetEnfeebleEffect(PSpell);
        if (!TTarget->StatusEffectContainer->HasStatusEffect(status))
        {
            if (Cast(TTarget->targid, spellid))
                return;
        }
    }
    else
    {
        if (PTrust->PAI->Cast(TTarget->targid, spellid))
            return;
    }
}

bool CTrustController::Cast(uint16 targid, SpellID spellid)
{
    auto PChar = static_cast<CTrustEntity*>(PTrust);
    if (!PChar->PRecastContainer->HasRecast(RECAST_MAGIC, static_cast<uint16>(spellid), 0))
    {
        if (luautils::OnTrustSpellCheck(PTrust->GetEntity(targid), PTrust, spell::GetSpell(spellid)) > 0)
        {
            return false;
        }

        if (CController::Cast(targid, spellid))
        {
            FaceTarget(targid);
            return true;
        }
    }
    return false;
}



//Trust Moving Functions
////////////////////////////////////////

bool CTrustController::CanMoveForward(float currentDistance)
{
    if (PTrust->m_Behaviour & BEHAVIOUR_STANDBACK && currentDistance < 20)
    {
        return false;
    }

    if (PTrust->getMobMod(MOBMOD_NO_STANDBACK) == 0 && PTrust->getMobMod(MOBMOD_HP_STANDBACK) > 0 && currentDistance < 20 && PTrust->GetHPP() >= PTrust->getMobMod(MOBMOD_HP_STANDBACK))
    {
        // Excluding Nins, mobs should not standback if can't cast magic
        if (PTrust->GetMJob() != JOB_NIN && PTrust->TrustSpellContainer->HasSpells() && !CanCastSpells())
        {
            return true;
        }

        return false;
    }

    return true;
}

void CTrustController::Move()
{
    CCharEntity* master = (CCharEntity*)PTrust->PMaster;

    if (!PTrust->PAI->CanFollowPath())
    {
        return;
    }
    if (PTrust->PAI->PathFind->IsFollowingScriptedPath() && PTrust->PAI->CanFollowPath())
    {
        PTrust->PAI->PathFind->FollowPath();
        return;
    }

    bool move = PTrust->PAI->PathFind->IsFollowingPath();
    float attack_range = PTrust->GetMeleeRange();

    float currentDistance = distance(PTrust->loc.p, TTarget->loc.p);
    if (((currentDistance > attack_range - 0.2f) || move) && PTrust->PAI->CanFollowPath())
    {
        if (PTrust->speed != 0 && PTrust->getMobMod(MOBMOD_NO_MOVE) == 0 && m_Tick >= m_LastSpecialTime)
        {
            if (CanMoveForward(currentDistance))
            {
                if (!PTrust->PAI->PathFind->IsFollowingPath() || distanceSquared(PTrust->PAI->PathFind->GetDestination(), TTarget->loc.p) > 10)
                {
                    //path to the target if we don't have a path already
                    PTrust->PAI->PathFind->PathInRange(TTarget->loc.p, attack_range - 0.2f, PATHFLAG_WALLHACK | PATHFLAG_RUN);
                }
                PTrust->PAI->PathFind->FollowPath();
                if (!PTrust->PAI->PathFind->IsFollowingPath())
                {
                    //arrived at target - move if there is another mob under me
                    if (TTarget->objtype == TYPE_MOB)
                    {
                        for (auto PSpawnedMob : static_cast<CCharEntity*>(master)->SpawnTRUSTList)
                        {
                            if (PSpawnedMob.second != PTrust && !PSpawnedMob.second->PAI->PathFind->IsFollowingPath() && distance(PSpawnedMob.second->loc.p, PTrust->loc.p) < 1.5f)
                            {
                                auto angle = getangle(PTrust->loc.p, TTarget->loc.p) + 90;
                                position_t new_pos{ PTrust->loc.p.x - (cosf(rotationToRadian(angle)) * 3.5f),
                                    TTarget->loc.p.y, PTrust->loc.p.z + (sinf(rotationToRadian(angle)) * 3.5f), 0, 0 };
                                if (PTrust->PAI->PathFind->ValidPosition(new_pos))
                                {
                                    PTrust->PAI->PathFind->PathTo(new_pos, PATHFLAG_WALLHACK | PATHFLAG_RUN);
                                }
                                break;
                            }
                        }
                    }
                }
            }
            else
            {
                FaceTarget();
            }
        }
    }
    else
    {
        FaceTarget();
    }
}

void CTrustController::FaceTarget(uint16 targid)
{
    CBaseEntity* targ = TTarget;
    if (targid != 0 && ((targ && targid != targ->targid) || !targ))
    {
        targ = PTrust->GetEntity(targid);
    }
    if (!(PTrust->m_Behaviour & BEHAVIOUR_NO_TURN) && targ)
    {
        PTrust->PAI->PathFind->LookAt(targ->loc.p);
    }
}

void CTrustController::Wait(duration _duration)
{
    if (m_Tick > m_WaitTime)
    {
        m_WaitTime = m_Tick += _duration;
    }
    else
    {
        m_WaitTime += _duration;
    }
}

//Trust Ability Functions
////////////////////////////////////////
bool CTrustController::IsAbilityReady(float currentDistance)
{

    if (PTrust->getMobMod(MOBMOD_SPECIAL_SKILL) == 0) return false;

    if (m_Tick >= m_LastAbilityTime + std::chrono::seconds(PTrust->getMobMod(MOBMOD_SPECIAL_COOL)))
    {
        return true;
    }

    return false;
}

bool CTrustController::TryAbilitySkill()
{
    m_LastAbilityTime = m_Tick;

    int wsList = PTrust->m_MobSkillList;
    auto skillList{ ability::GetTrustAbilityLists(wsList) };

    if (skillList.empty())
    {
        return false;
    }

    std::shuffle(skillList.begin(), skillList.end(), dsprand::mt());
    CBattleEntity* PAbilityTarget{ nullptr };

    for (auto skillid : skillList)
    {
        auto PAbilitySkill{ ability::GetAbility(skillid->abilityID) };

        if (!PAbilitySkill)
        {
            continue;
        }
        if (PTrust->PRecastContainer->HasRecast(RECAST_ABILITY, PAbilitySkill->getRecastId(), 0))
        {
            continue;
        }
        if (skillid->minLevel > PTrust->GetMLevel())
        {
            continue;
        }

        if (PAbilitySkill->getValidTarget() == TARGET_ENEMY) //enemy
        {
            PAbilityTarget = PTrust->GetBattleTarget();
        }
        else if (PAbilitySkill->getValidTarget() == TARGET_SELF) //self
        {
            PAbilityTarget = PTrust;
        }

        if (luautils::OnTrustSkillCheck(PAbilityTarget, PTrust, PAbilitySkill) != 0)
        {
            continue;
        }
        if (luautils::OnAbilityCheck(PTrust, PAbilityTarget, PAbilitySkill, nullptr) != 0)
        {
            continue;
        }


        // distance check for special skill
        float currentDistance = distance(PTrust->loc.p, PAbilityTarget->loc.p);

        if (currentDistance <= PAbilitySkill->getRange())
        {
            return Ability(PAbilityTarget->targid, PAbilitySkill->getID());
        }
    }
    return false;
}

bool CTrustController::Ability(uint16 targid, uint16 abilityid)
{
    m_LastAbilityTime = m_Tick;

    if (PTrust->PAI->CanChangeState())
    {
        return PTrust->PAI->Internal_Ability(targid, abilityid);
        //return PChar->PAI->Internal_TrustAbility(targid, abilityid);
    }
    return false;
}


bool CTrustController::CanUseWeaponskill(CTrustEntity* PTrust, CWeaponSkill* PSkill)
{
    if (PSkill->getSkillLevel() > 0)
    {
        if (PTrust->GetSkill(PSkill->getType()) >= PSkill->getSkillLevel())
        {
            if (PSkill->getJob(PTrust->GetMJob()) > 0 ||
                (PSkill->getJob(PTrust->GetSJob()) > 0 && !PSkill->mainOnly()))
            {
                return true;
            }
        }
    }
    return false;
}
