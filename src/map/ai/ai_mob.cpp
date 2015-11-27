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

#include "ai_mob.h"
#include "states/death_state.h"
#include "states/despawn_state.h"
#include "states/weaponskill_state.h"
#include "../conquest_system.h"
#include "../mobskill.h"
#include "../weapon_skill.h"
#include "../entities/mobentity.h"
#include "../packets/entity_update.h"
#include "../utils/blueutils.h"
#include "../utils/charutils.h"
#include "../utils/itemutils.h"

CAIMob::CAIMob(CBattleEntity* _PEntity, std::unique_ptr<CPathFind>&& _Pathfind, std::unique_ptr<CController>&& _Controller) :
    CAIBattle(_PEntity, std::forward<std::unique_ptr<CPathFind>>(_Pathfind),
        std::forward<std::unique_ptr<CController>>(_Controller))
{}

void CAIMob::Internal_Disengage()
{
    auto PMob = static_cast<CMobEntity*>(PEntity);
    PathFind->Clear();

    if (PMob->getMobMod(MOBMOD_IDLE_DESPAWN))
    {
        PMob->SetDespawnTime(std::chrono::milliseconds(PMob->getMobMod(MOBMOD_IDLE_DESPAWN)));
    }

    PMob->delRageMode();
    PMob->m_OwnerID.clean();
    PMob->updatemask |= (UPDATE_STATUS | UPDATE_HP);
    PMob->CallForHelp(false);
    PMob->animation = ANIMATION_NONE;

    CAIBattle::Internal_Disengage();
}

bool CAIMob::Internal_WeaponSkill(uint16 targid, uint16 wsid)
{
    if (CanChangeState())
    {
        if (ChangeState<CWeaponSkillState>(static_cast<CBattleEntity*>(PEntity), targid))
        {
            if (PEntity->look.size == MODEL_EQUIPED)
            {
                return static_cast<CWeaponSkillState*>(GetCurrentState())->StartWeaponSkill(wsid);
            }
            else
            {
                return static_cast<CWeaponSkillState*>(GetCurrentState())->StartMobSkill(wsid);
            }
        }
    }
    return false;
}

void CAIMob::OnWeaponSkillFinished(CWeaponSkillState& state, action_t& action)
{
    CAIBattle::OnWeaponSkillFinished(state, action);

    auto PMobSkill = state.GetMobSkill();
    auto PMob = static_cast<CMobEntity*>(PEntity);
    auto PBattleTarget = static_cast<CBattleEntity*>(state.GetTarget());
    PMob->PAI->EventHandler.triggerListener("WEAPONSKILL_USE", PMob, PMobSkill);
    //#TODO
}

bool CAIMob::IsAutoAttackEnabled()
{
    return m_AutoAttackEnabled;
}

void CAIMob::SetAutoAttackEnabled(bool enabled)
{
    m_AutoAttackEnabled = enabled;
}

bool CAIMob::IsWeaponSkillEnabled()
{
    return m_WeaponSkillEnabled;
}

void CAIMob::SetWeaponSkillEnabled(bool enabled)
{
    m_WeaponSkillEnabled = enabled;
}

void CAIMob::DropItems()
{
    auto PMob = static_cast<CMobEntity*>(PEntity);
    PMob->PAI->QueueAction(queueAction_t(std::chrono::milliseconds(PMob->m_DropItemTime), false, [PMob](CBaseEntity* PEntity)
    {
        CCharEntity* PChar = (CCharEntity*)PMob->GetEntity(PMob->m_OwnerID.targid, TYPE_PC);

        if (PChar != nullptr && PChar->id == PMob->m_OwnerID.id)
        {

            PMob->loc.zone->PushPacket(PMob, CHAR_INRANGE, new CMessageBasicPacket(PChar,PMob,0,0, MSGBASIC_DEFEATS_TARG));

            if (!PMob->CalledForHelp())
            {
                blueutils::TryLearningSpells(PChar, PMob);
                PMob->m_UsedSkillIds.clear();

                if (PMob->m_giveExp)
                {
                    charutils::DistributeExperiencePoints(PChar, PMob);
                }

                DropList_t* DropList = itemutils::GetDropList(PMob->m_DropID);
                //ShowDebug(CL_CYAN"DropID: %u dropping with TH Level: %u\n" CL_RESET, PMob->m_DropID, PMob->m_THLvl);

                if (DropList != nullptr && !PMob->getMobMod(MOBMOD_NO_DROPS) && DropList->size())
                {
                    for (uint8 i = 0; i < DropList->size(); ++i)
                    {
                        //THLvl is the number of 'extra chances' at an item. If the item is obtained, then break out.
                        uint8 tries = 0;
                        uint8 maxTries = 1 + (PMob->m_THLvl > 2 ? 2 : PMob->m_THLvl);
                        uint8 bonus = (PMob->m_THLvl > 2 ? (PMob->m_THLvl - 2)*10 : 0);
                        while (tries < maxTries)
                        {
                            if (dsprand::GetRandomNumber(1000) < DropList->at(i).DropRate * map_config.drop_rate_multiplier + bonus)
                            {
                                PChar->PTreasurePool->AddItem(DropList->at(i).ItemID, PMob);
                                break;
                            }
                            tries++;
                        }
                    }
                }

                // check for gil (beastmen drop gil, some NMs drop gil)
                if (PMob->CanDropGil() || (map_config.all_mobs_gil_bonus > 0 && PMob->getMobMod(MOBMOD_GIL_MAX) >= 0)) // Negative value of MOBMOD_GIL_MAX is used to prevent gil drops in Dynamis/Limbus.
                {
                    charutils::DistributeGil(PChar, PMob); // TODO: REALISATION MUST BE IN TREASUREPOOL
                }
                //check for seal drops
                /* MobLvl >= 1 = Beastmen Seals ID=1126
                          >= 50 = Kindred Seals ID=1127
                          >= 75 = Kindred Crests ID=2955
                          >= 90 = High Kindred Crests ID=2956
                */

                uint16 Pzone = PChar->getZone();

                bool validZone = ((Pzone > 0 && Pzone < 39) || (Pzone > 42 && Pzone < 134) || (Pzone > 135 && Pzone < 185) || (Pzone > 188 && Pzone < 255));

                if (validZone && charutils::GetRealExp(PChar->GetMLevel(),PMob->GetMLevel()) > 0)
                {
                    if (((PChar->StatusEffectContainer->HasStatusEffect(EFFECT_SIGNET) && conquest::GetInfluenceGraphics(PChar->loc.zone->GetRegionID()) < 64) ||
                       (PChar->StatusEffectContainer->HasStatusEffect(EFFECT_SANCTION) && PChar->loc.zone->GetRegionID() >= 28 && PChar->loc.zone->GetRegionID() <= 32) ||
                       (PChar->StatusEffectContainer->HasStatusEffect(EFFECT_SIGIL) && PChar->loc.zone->GetRegionID() >= 33 && PChar->loc.zone->GetRegionID() <= 40)) &&
                        PMob->m_Element > 0 && dsprand::GetRandomNumber(100) < 20) // Need to move to CRYSTAL_CHANCE constant
                    {
                        PChar->PTreasurePool->AddItem(4095 + PMob->m_Element, PMob);
                    }

                    // Todo: Avatarite and Geode drops during day/weather. Much higher chance during weather than day.
                    // Item element matches day/weather element, not mob crystal. Lv80+ xp mobs can drop Avatarite.
                    // Wiki's have conflicting info on mob lv required for Geodes. One says 50 the other 75. I think 50 is correct.

                    if (dsprand::GetRandomNumber(100) < 20 && PChar->PTreasurePool->CanAddSeal() && !PMob->getMobMod(MOBMOD_NO_DROPS))
                    {
                        //RULES: Only 1 kind may drop per mob
                        if (PMob->GetMLevel() >= 75 && luautils::IsExpansionEnabled("ABYSSEA")) //all 4 types
                        {
                            switch (dsprand::GetRandomNumber(4))
                            {
                            case 0:
                                PChar->PTreasurePool->AddItem(1126, PMob);
                                break;
                            case 1:
                                PChar->PTreasurePool->AddItem(1127, PMob);
                                break;
                            case 2:
                                PChar->PTreasurePool->AddItem(2955, PMob);
                                break;
                            case 3:
                                PChar->PTreasurePool->AddItem(2956, PMob);
                                break;
                            }
                        }
                        else if (PMob->GetMLevel() >= 70 && luautils::IsExpansionEnabled("ABYSSEA")) //b.seal & k.seal & k.crest
                        {
                            switch (dsprand::GetRandomNumber(3))
                            {
                            case 0:
                                PChar->PTreasurePool->AddItem(1126, PMob);
                                break;
                            case 1:
                                PChar->PTreasurePool->AddItem(1127, PMob);
                                break;
                            case 2:
                                PChar->PTreasurePool->AddItem(2955, PMob);
                                break;
                            }
                        }
                        else if (PMob->GetMLevel() >= 50) //b.seal & k.seal only
                        {
                            if (dsprand::GetRandomNumber(2) == 0)
                            {
                                PChar->PTreasurePool->AddItem(1126, PMob);
                            }
                            else
                            {
                                PChar->PTreasurePool->AddItem(1127, PMob);
                            }
                        }
                        else
                        {
                            //b.seal only
                            PChar->PTreasurePool->AddItem(1126, PMob);
                        }
                    }
                }
            }

            PChar->setWeaponSkillKill(false);
            PMob->StatusEffectContainer->KillAllStatusEffect();

            // NOTE: this is called for all alliance / party members!
            luautils::OnMobDeath(PMob, PChar);

        }
        else
        {
            luautils::OnMobDeath(PMob, nullptr);
        }
    }));
}

void CAIMob::OnDeathTimer()
{
    auto PMob = static_cast<CMobEntity*>(PEntity);
    PMob->PAIBattle()->Despawn();
}

void CAIMob::Die()
{
    auto PMob = static_cast<CMobEntity*>(PEntity);
    PMob->m_THLvl = PMob->PEnmityContainer->GetHighestTH();
    PMob->PEnmityContainer->Clear();
    ClearStateStack();
    ChangeState<CDeathState>(static_cast<CBattleEntity*>(PEntity), 15s);
    if (PMob->PPet != nullptr && PMob->PPet->isAlive() && PMob->GetMJob() == JOB_SMN)
    {
        PMob->PPet->PAIBattle()->Die();
    }
}

void CAIMob::OnDisengage()
{
    auto PMob = static_cast<CMobEntity*>(PEntity);
    PathFind->Clear();
    PMob->PEnmityContainer->Clear();

    if (PMob->getMobMod(MOBMOD_IDLE_DESPAWN))
    {
        PMob->SetDespawnTime(std::chrono::milliseconds(PMob->getMobMod(MOBMOD_IDLE_DESPAWN)));
    }
    // this will let me decide to walk home or despawn
    PMob->m_neutral = true;

    PMob->delRageMode();
    PMob->m_OwnerID.clean();

    CAIBattle::OnDisengage();

    luautils::OnMobDisengage(PMob);
}
