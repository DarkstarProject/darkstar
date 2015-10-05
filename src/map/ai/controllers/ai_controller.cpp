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

#include "ai_controller.h"
#include "../ai_mob.h"
#include "../states/ability_state.h"
#include "../../mobskill.h"
#include "../../entities/mobentity.h"
#include "../../utils/battleutils.h"

CAIController::CAIController(CMobEntity* PEntity) :
    CController(PEntity, true),
    PMob(PEntity)
{}

void CAIController::Tick(time_point tick)
{
    m_Tick = tick;
    if (PMob->getMobMod(MOBMOD_SHARE_TARGET) > 0 && PMob->loc.zone->GetEntity(PMob->getMobMod(MOBMOD_SHARE_TARGET), TYPE_MOB))
    {
        ChangeTarget(static_cast<CMobEntity*>(PMob->loc.zone->GetEntity(PMob->getMobMod(MOBMOD_SHARE_TARGET), TYPE_MOB))->PAIBattle()->GetBattleTargetID());

        if (!PMob->PAIBattle()->GetBattleTargetID())
        {
            auto PTarget = PMob->PEnmityContainer->GetHighestEnmity();
            ChangeTarget(PTarget ? PTarget->targid : 0);
        }
    }
    else
    {
        auto PTarget = PMob->PEnmityContainer->GetHighestEnmity();
        ChangeTarget(PTarget ? PTarget->targid : 0);
    }

    PTarget = static_cast<CBattleEntity*>(PMob->loc.zone->GetEntity(PMob->PAIBattle()->GetBattleTargetID()));

    if (TryDeaggro())
    {
        Disengage();
        return;
    }

    float currentDistance = distance(PMob->loc.p, PTarget->loc.p);

    TryLink();

    if (!(PMob->m_Behaviour & BEHAVIOUR_NO_TURN))
    {
        PMob->PAI->PathFind->LookAt(PTarget->loc.p);
    }

    if (PMob->StatusEffectContainer->HasStatusEffect(EFFECT_BIND))
    {
        // bind prevents deaggro
        m_DeaggroTime = m_Tick;
    }

    // Try to spellcast (this is done first so things like Chainspell spam is prioritised over TP moves etc.
    if (PMob->getMobMod(MOBMOD_SPECIAL_SKILL) != 0 && !PMob->StatusEffectContainer->HasStatusEffect(EFFECT_CHAINSPELL) && 
        (m_Tick >= m_LastSpecialTime + std::chrono::milliseconds(PMob->getBigMobMod(MOBMOD_SPECIAL_COOL))) && TrySpecialSkill())
    {
        return;
    }
    else if ((m_Tick >= m_LastMagicTime + std::chrono::milliseconds(PMob->getBigMobMod(MOBMOD_MAGIC_COOL))) && TryCastSpell())
    {
        return;
    }
    else if (m_Tick >= m_LastMobSkillTime && dsprand::GetRandomNumber(100) < PMob->TPUseChance() && WeaponSkill())
    {
        return;
    }

    if (PMob->PAI->PathFind->IsFollowingScriptedPath())
    {
        PMob->PAI->PathFind->FollowPath();
        return;
    }

    // attempt to teleport
    if (PMob->getMobMod(MOBMOD_TELEPORT_TYPE) == 1)
    {
        if (m_Tick >= m_LastSpecialTime + std::chrono::milliseconds(PMob->getBigMobMod(MOBMOD_TELEPORT_CD)))
        {
            CMobSkill* teleportBegin = battleutils::GetMobSkill(PMob->getMobMod(MOBMOD_TELEPORT_START));

            if (teleportBegin)
            {
                CController::WeaponSkill(PMob->targid, teleportBegin->getID());
            }
        }
    }

    bool move = PMob->PAI->PathFind->IsFollowingPath();

    //If using mobskills instead of attacks, calculate distance to move and ability to use here
    if (PMob->getMobMod(MOBMOD_ATTACK_SKILL_LIST)) 
    {
        auto WeaponDelay = std::chrono::milliseconds(PMob->GetWeaponDelay(false));
        if (static_cast<CAIMob*>(PMob->PAI.get())->IsAutoAttackEnabled() && m_Tick > m_LastActionTime + WeaponDelay)
        {
            WeaponSkill(PMob->getMobMod(MOBMOD_ATTACK_SKILL_LIST));
        }
    }

    if (PMob->getMobMod(MOBMOD_SHARE_POS) > 0)
    {
        CMobEntity* posShare = (CMobEntity*)PMob->GetEntity(PMob->getMobMod(MOBMOD_SHARE_POS) + PMob->targid, TYPE_MOB);
        PMob->loc = posShare->loc;
    }

    else if (currentDistance > PMob->m_ModelSize || move)
    {
        //#TODO: can this be moved to scripts entirely?
        if (PMob->getMobMod(MOBMOD_DRAW_IN) > 0)
        {
            if (currentDistance >= PMob->m_ModelSize * 2)
                battleutils::DrawIn(PTarget, PMob, PMob->m_ModelSize - 0.2f);
        }
        if (PMob->speed != 0 && m_Tick >= m_LastSpecialTime)
        {
            // attempt to teleport to target (if in range)
            if (PMob->getMobMod(MOBMOD_TELEPORT_TYPE) == 2)
            {
                CMobSkill* teleportBegin = battleutils::GetMobSkill(PMob->getMobMod(MOBMOD_TELEPORT_START));

                if (teleportBegin && currentDistance <= teleportBegin->getDistance())
                {
                    CController::WeaponSkill(PMob->targid, teleportBegin->getID());
                    return;
                }
            }
            else if (!(PMob->m_Behaviour & BEHAVIOUR_STANDBACK && currentDistance < 20) &&
                !(PMob->m_Behaviour & BEHAVIOUR_HP_STANDBACK && currentDistance < 20 && PMob->GetHPP() > 70) &&
                !(PMob->getMobMod(MOBMOD_SPAWN_LEASH) > 0 && distance(PMob->loc.p, PMob->m_SpawnPoint) > PMob->getMobMod(MOBMOD_SPAWN_LEASH)))
            {
                PMob->PAI->PathFind->PathAround(PTarget->loc.p, 2.0f, PATHFLAG_WALLHACK | PATHFLAG_RUN);
                PMob->PAI->PathFind->FollowPath();
            }
        }
    }
}

bool CAIController::TryDeaggro()
{
    if (PTarget == nullptr && (PMob->PEnmityContainer != nullptr && PMob->PEnmityContainer->GetHighestEnmity() == nullptr))
    {
        return true;
    }

    // target is no longer valid, so wipe them from our enmity list
    if (PTarget->isDead() ||
        PTarget->animation == ANIMATION_CHOCOBO ||
        PTarget->loc.zone->GetID() != PMob->loc.zone->GetID() ||
        PMob->StatusEffectContainer->GetConfrontationEffect() != PTarget->StatusEffectContainer->GetConfrontationEffect())
    {
        PMob->PEnmityContainer->Clear(PTarget->id);
        PTarget = PMob->PEnmityContainer->GetHighestEnmity();
        return TryDeaggro();
    }

    bool tryDetectDeaggro = false;
    bool tryTimeDeaggro = true;

    if (PMob->m_Aggro & AGGRO_SCENT)
    {
        // if mob is in water it will instant deaggro if target cannot be detected
        if (PMob->PAI->PathFind->InWater() || PTarget->StatusEffectContainer->HasStatusEffect(EFFECT_DEODORIZE))
        {
            tryDetectDeaggro = true;
        }

        // certain weather / deodorize will turn on time deaggro
        tryTimeDeaggro = PMob->m_disableScent;
    }

    if (tryTimeDeaggro && m_Tick >= m_DeaggroTime + std::chrono::milliseconds(MOB_DEAGGRO_TIME) && PMob->CanDeaggro())
    {
        tryDetectDeaggro = true;
    }

    //Hide allows you to lose aggro on certain types of enemies.
    //Generally works on monsters that don't track by scent, regardless of detection method.
    //Can work on monsters that track by scent if the proper conditions are met (double rain weather, crossing over water, etc.) 
    if (tryTimeDeaggro && PTarget->StatusEffectContainer->HasStatusEffect(EFFECT_HIDE))
    {
        return true;
    }

    // I will now deaggro if I cannot detect my target
    if (tryDetectDeaggro && !CanDetectTarget(PTarget))
    {
        return true;
    }

    return false;
}

void CAIController::TryLink()
{
    if (PTarget == nullptr)
    {
        return;
    }

    //handle pet behaviour on the targets behalf (faster than in ai_pet_dummy)
    // Avatars defend masters by attacking mobs if the avatar isn't attacking anything currently (bodyguard behaviour)
    if (PTarget->PPet != nullptr && PTarget->PPet->PBattleAI->GetBattleTarget() == nullptr)
    {
        if (PTarget->PPet->objtype == TYPE_PET && ((CPetEntity*)PTarget->PPet)->getPetType() == PETTYPE_AVATAR)
        {
            PTarget->PPet->PBattleAI->SetBattleTarget(PMob);
        }
    }

    // my pet should help as well
    if (PMob->PPet != nullptr && PMob->PPet->PAI->IsRoaming())
    {
        ((CMobEntity*)PMob->PPet)->PEnmityContainer->AddLinkEnmity(PTarget);
    }

    // Handle monster linking if they are close enough
    if (PMob->PParty != nullptr)
    {
        for (uint16 i = 0; i < PMob->PParty->members.size(); ++i)
        {
            CMobEntity* PPartyMember = (CMobEntity*)PMob->PParty->members[i];

            if (PPartyMember->PAI->IsRoaming() && PPartyMember->CanLink(&PMob->loc.p, PMob->getMobMod(MOBMOD_SUPERLINK)))
            {
                PPartyMember->PEnmityContainer->AddLinkEnmity(PTarget);

                if (PPartyMember->m_roamFlags & ROAMFLAG_IGNORE)
                {
                    // force into attack action
                    PPartyMember->PBattleAI->SetCurrentAction(ACTION_ENGAGE);
                }
            }
        }
    }

    // ask my master for help
    if (PMob->PMaster != nullptr && PMob->PMaster->PAI->IsRoaming())
    {
        CMobEntity* PMaster = (CMobEntity*)PMob->PMaster;

        if (PMaster->PAI->IsRoaming() && PMaster->CanLink(&PMob->loc.p, PMob->getMobMod(MOBMOD_SUPERLINK)))
        {
            PMaster->PEnmityContainer->AddLinkEnmity(PTarget);
        }
    }
}

/**
* Checks if the mob can detect the target using it's detection (sight, sound, etc)
* This is used to aggro and deaggro (Mobs start to deaggro after failing to detect target).
**/
bool CAIController::CanDetectTarget(CBattleEntity* PTarget, bool forceSight)
{
    if (PTarget->isDead() || PTarget->animation == ANIMATION_CHOCOBO) return false;

    float verticalDistance = abs(PMob->loc.p.y - PTarget->loc.p.y);

    if (verticalDistance > 8)
    {
        return false;
    }

    uint16 aggro = PMob->m_Aggro;
    float currentDistance = distance(PTarget->loc.p, PMob->loc.p) + PTarget->getMod(MOD_STEALTH);

    bool detectSight = (aggro & AGGRO_DETECT_SIGHT) || forceSight;

    if (detectSight && !PTarget->StatusEffectContainer->HasStatusEffectByFlag(EFFECTFLAG_INVISIBLE) && currentDistance < PMob->getMobMod(MOBMOD_SIGHT_RANGE) && isFaceing(PMob->loc.p, PTarget->loc.p, 40))
    {
        return CanSeePoint(PTarget->loc.p);
    }

    if ((aggro & AGGRO_DETECT_TRUESIGHT) && currentDistance < PMob->getMobMod(MOBMOD_SIGHT_RANGE) && isFaceing(PMob->loc.p, PTarget->loc.p, 40))
    {
        return CanSeePoint(PTarget->loc.p);
    }

    if ((aggro & AGGRO_DETECT_TRUEHEARING) && currentDistance < PMob->getMobMod(MOBMOD_SOUND_RANGE))
    {
        return CanSeePoint(PTarget->loc.p);
    }

    if ((PMob->m_Behaviour & BEHAVIOUR_AGGRO_AMBUSH) && currentDistance < 3 && !PTarget->StatusEffectContainer->HasStatusEffect(EFFECT_SNEAK))
    {
        return true;
    }

    if ((aggro & AGGRO_DETECT_HEARING) && currentDistance < PMob->getMobMod(MOBMOD_SOUND_RANGE) && !PTarget->StatusEffectContainer->HasStatusEffect(EFFECT_SNEAK))
    {
        return CanSeePoint(PTarget->loc.p);
    }

    // everything below require distance to be below 20
    if (currentDistance > 20)
    {
        return false;
    }

    if ((aggro & AGGRO_DETECT_LOWHP) && PTarget->GetHPP() < 75)
    {
        return CanSeePoint(PTarget->loc.p);
    }

    if ((aggro & AGGRO_DETECT_MAGIC) && PTarget->PAI->IsCurrentState<CMagicState>() && PTarget->PBattleAI->GetCurrentSpell()->hasMPCost())
    {
        return CanSeePoint(PTarget->loc.p);
    }

    if ((aggro & AGGRO_DETECT_WEAPONSKILL) && PTarget->PAI->IsCurrentState<CWeaponSkillState>())
    {
        return CanSeePoint(PTarget->loc.p);
    }

    if ((aggro & AGGRO_DETECT_JOBABILITY) && PTarget->PAI->IsCurrentState<CAbilityState>())
    {
        return CanSeePoint(PTarget->loc.p);
    }

    return false;
}

bool CAIController::CanSeePoint(position_t pos)
{
    if (PMob->PAI->PathFind)
    {
        return PMob->PAI->PathFind->CanSeePoint(pos);
    }

    return true;
}

bool CAIController::WeaponSkill(int wsList)
{
    if (!wsList) wsList = PMob->getMobMod(MOBMOD_SKILL_LIST);
    auto skillList = battleutils::GetMobSkillList(wsList);
    //#TODO: select WS, select target, call WeaponSkill(targid, wsid)

    std::shuffle(skillList.begin(), skillList.end(), dsprand::mt());

    return false;
}

bool CAIController::TrySpecialSkill()
{
    // get my special skill
    CMobSkill* PSpecialSkill = battleutils::GetMobSkill(PMob->getMobMod(MOBMOD_SPECIAL_SKILL));
    CBattleEntity* PAbilityTarget = nullptr;

    if (PSpecialSkill == nullptr) {
        ShowError("CAIMobDummy::ActionSpawn Special skill was set but not found! (%d)\n", PMob->getMobMod(MOBMOD_SPECIAL_SKILL));
        return false;
    }

    if (static_cast<CAIMob*>(PMob->PAI.get())->IsWeaponSkillEnabled())
    {
        return false;
    }

    if ((PMob->m_specialFlags & SPECIALFLAG_HIDDEN) && !PMob->IsNameHidden())
    {
        return false;
    }

    if (PSpecialSkill->getValidTargets() & TARGET_SELF)
    {
        PAbilityTarget = PMob;
    }
    else if (PTarget != nullptr)
    {
        // distance check for special skill
        float currentDistance = distance(PMob->loc.p, PTarget->loc.p);

        if (currentDistance <= PSpecialSkill->getDistance())
        {
            PAbilityTarget = PTarget;
        }
        else
        {
            return false;
        }
    }
    else
    {
        return false;
    }

    if (luautils::OnMobSkillCheck(PAbilityTarget, PMob, PSpecialSkill) == 0)
    {
        CController::WeaponSkill(PAbilityTarget->targid, PSpecialSkill->getID());
        return true;
    }

    return false;
}

bool CAIController::TryCastSpell()
{
    if (!CanCastSpells())
    {
        return false;
    }

    int chosenSpellId = -1;

    if (PMob->m_HasSpellScript)
    {
        // skip logic and follow script
        chosenSpellId = luautils::OnMonsterMagicPrepare(PMob, PTarget);
        if (chosenSpellId > -1)
        {
            CastSpell(chosenSpellId);
            return true;
        }
    }
    else
    {
        // find random spell

        if (m_firstSpell)
        {
            // mobs first spell, should be aggro spell
            chosenSpellId = PMob->SpellContainer->GetAggroSpell();
            m_firstSpell = false;
        }
        else
        {
            chosenSpellId = PMob->SpellContainer->GetSpell();
        }

        if (chosenSpellId > -1)
        {
            //#TODO: select target based on spell type
            CastSpell(chosenSpellId);
            return true;
        }
    }

    // the script doesn't want to cast a spell at the moment, but it should still be treated as a magic attempt
    m_LastMagicTime = m_Tick;
    return false;
}

bool CAIController::CanCastSpells()
{

    if (!PMob->SpellContainer->HasSpells())
    {
        return false;
    }

    // check for spell blockers e.g. silence
    if (PMob->StatusEffectContainer->HasStatusEffect(EFFECT_SILENCE) ||
        PMob->StatusEffectContainer->HasStatusEffect(EFFECT_MUTE))
    {
        return false;
    }

    // smn can only cast spells if it has no pet
    if (PMob->GetMJob() == JOB_SMN)
    {
        if (PMob->PPet == nullptr ||
            !PMob->PPet->isDead())
        {
            return false;
        }
    }

    return true;
}

void CAIController::CastSpell(uint16 spellid)
{
    CSpell* PSpell = spell::GetSpell(spellid);
    if (PSpell == nullptr)
    {
        ShowWarning(CL_YELLOW"ai_mob_dummy::CastSpell: SpellId <%i> is not found\n" CL_RESET, spellid);
    }
    else
    {
        CBattleEntity* PCastTarget = nullptr;
        if (PTarget == nullptr)
        {
            // find my own target
            // check valid targets
            if (PSpell->getValidTarget() & TARGET_SELF)
            {
                PCastTarget = PMob;

                // only buff other targets if i'm roaming
                if ((PSpell->getValidTarget() & TARGET_PLAYER_PARTY))
                {
                    // chance to target my master
                    if (PMob->PMaster != nullptr && dsprand::GetRandomNumber(2) == 0)
                    {
                        // target my master
                        PCastTarget = PMob->PMaster;
                    }
                    else if (dsprand::GetRandomNumber(2) == 0)
                    {
                        // chance to target party
                        PMob->PAIBattle()->targetFind.reset();
                        PMob->PAIBattle()->targetFind.findWithinArea(PMob, AOERADIUS_ATTACKER, PSpell->getMaxRange());

                        if (!PMob->PAIBattle()->targetFind.m_targets.empty())
                        {
                            // randomly select a target
                            PCastTarget = PMob->PAIBattle()->targetFind.m_targets[dsprand::GetRandomNumber(PMob->PAIBattle()->targetFind.m_targets.size())];

                            // only target if are on same action
                            if (PMob->PAI->IsEngaged() == PCastTarget->PAI->IsEngaged())
                            {
                                PCastTarget = PMob;
                            }
                        }
                    }
                }
            }
            else
            {
                PCastTarget = PTarget;
            }
        }
        else
        {
            PCastTarget = PTarget;
        }
        Cast(PCastTarget->targid, spellid);
    }
}

void CAIController::Disengage()
{
    // this will let me decide to walk home or despawn
    m_LastActionTime = m_Tick - std::chrono::milliseconds(PMob->getBigMobMod(MOBMOD_ROAM_COOL) + MOB_NEUTRAL_TIME);
    PMob->m_neutral = true;
    //m_checkDespawn = true;
    m_NeutralTime = m_Tick;

    CController::Disengage();
}
