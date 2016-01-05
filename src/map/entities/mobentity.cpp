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

#include "mobentity.h"

#include <string.h>
#include "../../common/timer.h"
#include "../../common/utils.h"
#include "../ai/ai_container.h"
#include "../ai/controllers/ai_controller.h"
#include "../ai/helpers/pathfind.h"
#include "../ai/helpers/targetfind.h"
#include "../ai/states/weaponskill_state.h"
#include "../ai/states/mobskill_state.h"
#include "../entities/charentity.h"
#include "../packets/action.h"
#include "../packets/entity_update.h"
#include "../utils/battleutils.h"
#include "../utils/blueutils.h"
#include "../utils/charutils.h"
#include "../utils/itemutils.h"
#include "../utils/mobutils.h"
#include "../status_effect_container.h"
#include "../enmity_container.h"
#include "../mob_spell_container.h"
#include "../mob_spell_list.h"
#include "../mob_modifier.h"
#include "../weapon_skill.h"
#include "../mobskill.h"
#include "../treasure_pool.h"
#include "../conquest_system.h"

CMobEntity::CMobEntity()
{
    objtype = TYPE_MOB;

    m_DropID = 0;

    m_minLevel = 1;
    m_maxLevel = 1;

    HPscale = 1.0;
    MPscale = 1.0;
    m_flags = 0;

    allegiance = ALLEGIANCE_MOB;

    // default to normal roaming
    m_roamFlags = ROAMFLAG_NONE;
    m_specialFlags = SPECIALFLAG_NONE;
    m_name_prefix = 0;
    m_MobSkillList = 0;

    m_AllowRespawn = 0;
    m_DropItemTime = 0;
    m_Family = 0;
    m_Type = MOBTYPE_NORMAL;
    m_Behaviour = BEHAVIOUR_NONE;
    m_SpawnType = SPAWNTYPE_NORMAL;
    m_EcoSystem = SYSTEM_UNCLASSIFIED;
    m_Element = 0;
    m_HiPCLvl = 0;
    m_THLvl = 0;
    m_ItemStolen = false;
    m_RageMode = 0;

    strRank = 3;
    vitRank = 3;
    agiRank = 3;
    intRank = 3;
    mndRank = 3;
    chrRank = 3;
    attRank = 3;
    defRank = 3;
    accRank = 3;
    evaRank = 3;

    m_dmgMult = 100;

    m_giveExp = false;
    m_neutral = false;
    m_Aggro = AGGRO_NONE;
    m_Link = 0;

    m_battlefieldID = 0;
    m_bcnmID = 0;

    m_maxRoamDistance = 50.0f;
    m_disableScent = false;

    memset(&m_SpawnPoint, 0, sizeof(m_SpawnPoint));

    m_SpellListContainer = nullptr;
    PEnmityContainer = new CEnmityContainer(this);
    SpellContainer = new CMobSpellContainer(this);

    // For Dyna Stats
    m_StatPoppedMobs = false;

    PAI = std::make_unique<CAIContainer>(this, std::make_unique<CPathFind>(this), std::make_unique<CAIController>(this),
        std::make_unique<CTargetFind>(this));
}

void CMobEntity::setMobFlags(uint32 MobFlags)
{
    m_flags = MobFlags;
}

CMobEntity::~CMobEntity()
{
    delete PEnmityContainer;
    delete SpellContainer;
}

/************************************************************************
*                                                                       *
*  Время исчезновения монстра в секундах                                *
*                                                                       *
************************************************************************/

time_point CMobEntity::GetDespawnTime()
{
    return m_DespawnTimer;
}

void CMobEntity::SetDespawnTime(duration _duration)
{
    if (_duration > 0s)
    {
        m_DespawnTimer = server_clock::now() + _duration;
    }
    else
    {
        m_DespawnTimer = time_point::min();
    }
}

uint32 CMobEntity::GetRandomGil()
{

    int16 min = getMobMod(MOBMOD_GIL_MIN);
    int16 max = getMobMod(MOBMOD_GIL_MAX);

    if (min && max)
    {
        // make sure divide won't crash server
        if (max <= min)
        {
            max = min + 2;
        }

        if (max - min < 2)
        {
            max = min + 2;
            ShowWarning("CMobEntity::GetRandomGil Max value is set too low, defauting\n");
        }

        return dsprand::GetRandomNumber(min, max);
    }

    float gil = pow(GetMLevel(), 1.05f);

    if (gil < 1) {
        gil = 1;
    }

    uint16 highGil = (float)(gil) / 3 + 4;

    if (max)
    {
        highGil = max;
    }

    if (highGil < 2) {
        highGil = 2;
    }

    // randomize it
    gil += dsprand::GetRandomNumber(highGil);

    if (min && gil < min)
    {
        gil = min;
    }

    if (getMobMod(MOBMOD_GIL_BONUS) != 0)
    {
        gil = (float)gil * (getMobMod(MOBMOD_GIL_BONUS) / 100.0f);
    }

    return gil;
}

bool CMobEntity::CanDropGil()
{
    // smaller than 0 means drop no gil
    if (getMobMod(MOBMOD_GIL_MAX) < 0) return false;

    if (getMobMod(MOBMOD_GIL_MIN) > 0 || getMobMod(MOBMOD_GIL_MAX))
    {
        return true;
    }

    return getMobMod(MOBMOD_GIL_BONUS) > 0;
}

bool CMobEntity::CanStealGil()
{
    // TODO: Some mobs cannot be mugged
    return CanDropGil();
}

void CMobEntity::ResetGilPurse()
{
    uint32 purse = GetRandomGil() / ((dsprand::GetRandomNumber(4, 7)));
    if (purse == 0)
        purse = GetRandomGil();
    setMobMod(MOBMOD_MUG_GIL, purse);
}

bool CMobEntity::CanRoamHome()
{
    if (speed == 0 && !(m_roamFlags & ROAMFLAG_WORM)) return false;

    if (getMobMod(MOBMOD_NO_DESPAWN) != 0 ||
        map_config.mob_no_despawn)
    {
        return true;
    }

    return distance(m_SpawnPoint, loc.p) < roam_home_distance;
}

bool CMobEntity::CanRoam()
{
    return !(m_roamFlags & ROAMFLAG_EVENT) && PMaster == nullptr && (speed > 0 || (m_roamFlags & ROAMFLAG_WORM));
}

bool CMobEntity::CanLink(position_t* pos, int16 superLink)
{
    // handle super linking
    if (superLink && getMobMod(MOBMOD_SUPERLINK) == superLink)
    {
        return true;
    }

    // can't link right now
    if (m_neutral)
    {
        return false;
    }

    // link only if I see him
    if ((m_Aggro & AGGRO_DETECT_SIGHT) || (m_Aggro & AGGRO_DETECT_TRUESIGHT)) {

        if (!isFaceing(loc.p, *pos, 40)) return false;
    }

    // link if close enough
    return distance(loc.p, *pos) <= getMobMod(MOBMOD_LINK_RADIUS);
}

/************************************************************************
*                                                                       *
*                                                                       *
*                                                                       *
************************************************************************/

bool CMobEntity::CanDeaggro()
{
    return !(m_Type & MOBTYPE_NOTORIOUS || m_Type & MOBTYPE_BATTLEFIELD);
}

/************************************************************************
*                                                                       *
*  RAGE MODE                                                            *
*                                                                       *
************************************************************************/

bool CMobEntity::hasRageMode()
{
    return m_RageMode;
}

void CMobEntity::addRageMode()
{
    if (!m_RageMode)
    {
        stats.AGI *= 10;
        stats.CHR *= 10;
        stats.DEX *= 10;
        stats.INT *= 10;
        stats.MND *= 10;
        stats.STR *= 10;
        stats.VIT *= 10;
    }
    m_RageMode = true;
}

void CMobEntity::delRageMode()
{
    if (m_RageMode)
    {
        stats.AGI /= 10;
        stats.CHR /= 10;
        stats.DEX /= 10;
        stats.INT /= 10;
        stats.MND /= 10;
        stats.STR /= 10;
        stats.VIT /= 10;
    }
    m_RageMode = false;
}

bool CMobEntity::IsFarFromHome()
{
    return distance(loc.p, m_SpawnPoint) > m_maxRoamDistance;
}

bool CMobEntity::CanBeNeutral()
{
    return !(m_Type & MOBTYPE_NOTORIOUS);
}

uint8 CMobEntity::TPUseChance()
{
    auto& MobSkillList = battleutils::GetMobSkillList(getMobMod(MOBMOD_SKILL_LIST));

    if (health.tp < 1000 || MobSkillList.empty() == true || !static_cast<CAIController*>(PAI->GetController())->IsWeaponSkillEnabled())
    {
        return 0;
    }

    if (health.tp == 3000 || (GetHPP() <= 25 && health.tp >= 1000))
    {
        return 100;
    }

    return getMobMod(MOBMOD_TP_USE_CHANCE);
}

void CMobEntity::setMobMod(uint16 type, int16 value)
{
    m_mobModStat[type] = value;
}

int16 CMobEntity::getMobMod(uint16 type)
{
    return m_mobModStat[type];
}

void CMobEntity::addMobMod(uint16 type, int16 value)
{
    m_mobModStat[type] += value;
}

void CMobEntity::defaultMobMod(uint16 type, int16 value)
{
    if (m_mobModStat[type] == 0)
    {
        m_mobModStat[type] = value;
    }
}

void CMobEntity::resetMobMod(uint16 type)
{
    m_mobModStat[type] = m_mobModStatSave[type];
}

int32 CMobEntity::getBigMobMod(uint16 type)
{
    return getMobMod(type) * 1000;
}

void CMobEntity::saveMobModifiers()
{
    m_mobModStatSave = m_mobModStat;
}

void CMobEntity::restoreMobModifiers()
{
    m_mobModStat = m_mobModStatSave;
}

void CMobEntity::HideModel(bool hide)
{
    if (hide)
    {
        // I got this from ambush antlion
        // i'm not sure if this is right
        m_flags |= 0x80;
    }
    else
    {
        m_flags &= ~0x80;
    }
}

bool CMobEntity::IsModelHidden()
{
    return (m_flags & 0x80) == 0x80;
}

void CMobEntity::HideHP(bool hide)
{
    if (hide)
    {
        m_flags |= 0x100;
    }
    else
    {
        m_flags &= ~0x100;
    }
    updatemask |= UPDATE_HP;
}

bool CMobEntity::IsHPHidden()
{
    return (m_flags & 0x100) == 0x100;
}


void CMobEntity::CallForHelp(bool call)
{
    if (call)
    {
        m_flags |= 0x20;
    }
    else
    {
        m_flags &= ~0x20;
    }
    updatemask |= UPDATE_HP;
}

bool CMobEntity::CalledForHelp()
{
    return (m_flags & 0x20) == 0x20;
}

void CMobEntity::Untargetable(bool untargetable)
{
    if (untargetable)
    {
        m_flags |= 0x800;
    }
    else
    {
        m_flags &= ~0x800;
    }
    updatemask |= UPDATE_HP;
}

bool CMobEntity::IsUntargetable()
{
    return (m_flags & 0x800) == 0x800;
}

void CMobEntity::UpdateEntity()
{
    if (loc.zone && updatemask)
    {
        loc.zone->PushPacket(this, CHAR_INRANGE, new CEntityUpdatePacket(this, ENTITY_UPDATE, updatemask));
        updatemask = 0;
    }
}

float CMobEntity::GetRoamDistance()
{
    return (float)getMobMod(MOBMOD_ROAM_DISTANCE) / 10.0f;
}

float CMobEntity::GetRoamRate()
{
    return (float)getMobMod(MOBMOD_ROAM_RATE) / 10.0f;
}

bool CMobEntity::ValidTarget(CBattleEntity* PInitiator, uint8 targetFlags)
{
    if (StatusEffectContainer->GetConfrontationEffect() != PInitiator->StatusEffectContainer->GetConfrontationEffect())
    {
        return false;
    }
    if (CBattleEntity::ValidTarget(PInitiator, targetFlags))
    {
        return true;
    }
    if (targetFlags & TARGET_PLAYER_DEAD && (m_Behaviour & BEHAVIOUR_RAISABLE)
        && isDead())
    {
        return true;
    }

    if (targetFlags & TARGET_NPC)
    {
        if (allegiance == PInitiator->allegiance && !(m_Behaviour & BEHAVIOUR_NOHELP))
        {
            return true;
        }
    }

    return false;
}

void CMobEntity::Spawn()
{
    CBattleEntity::Spawn();
    m_giveExp = true;
    m_HiPCLvl = 0;
    m_THLvl = 0;
    m_ItemStolen = false;
    m_DropItemTime = 1000;
    animationsub = getMobMod(MOBMOD_SPAWN_ANIMATIONSUB);
    CallForHelp(false);

    PEnmityContainer->Clear();

    uint8 level = m_minLevel;

    // Generate a random level between min and max level
    if (m_maxLevel != m_minLevel)
    {
        level += dsprand::GetRandomNumber(0, m_maxLevel - m_minLevel);
    }

    SetMLevel(level);
    SetSLevel(level);//calculated in function
    delRageMode();

    mobutils::CalculateStats(this);
    mobutils::GetAvailableSpells(this);

    // spawn somewhere around my point
    loc.p = m_SpawnPoint;

    if (m_roamFlags & ROAMFLAG_AMBUSH)
    {
        HideName(true);
        animationsub = 0;
        // this will hide the mob
        HideModel(true);
    }

    if (m_roamFlags & ROAMFLAG_STEALTH)
    {
        HideName(true);
        Untargetable(true);
    }

    // add people to my posse
    if (getMobMod(MOBMOD_ASSIST))
    {
        for (int8 i = 1; i < getMobMod(MOBMOD_ASSIST) + 1; i++)
        {
            CMobEntity* PMob = (CMobEntity*)GetEntity(targid + i, TYPE_MOB);

            if (PMob != nullptr)
            {
                PMob->setMobMod(MOBMOD_SUPERLINK, targid);
            }
        }
    }
    m_DespawnTimer = time_point::min();
    luautils::OnMobSpawn(this);
}

void CMobEntity::OnWeaponSkillFinished(CWeaponSkillState& state, action_t& action)
{
    CBattleEntity::OnWeaponSkillFinished(state, action);

    auto PSkill = state.GetSkill();
    auto PBattleTarget = static_cast<CBattleEntity*>(state.GetTarget());
    PAI->EventHandler.triggerListener("WEAPONSKILL_USE", this, PSkill->getID());
    //#TODO
}


void CMobEntity::OnMobSkillFinished(CMobSkillState& state, action_t& action)
{
    auto PSkill = state.GetSkill();
    auto PTarget = static_cast<CBattleEntity*>(state.GetTarget());

    PTarget->StatusEffectContainer->DelStatusEffectsByFlag(EFFECTFLAG_DETECTABLE);

    // store the skill used
    m_UsedSkillIds[PSkill->getID()] = GetMLevel();

    PAI->TargetFind->reset();

    float distance = PSkill->getDistance();
    uint8 findFlags = 0;
    if (PSkill->getFlag() & SKILLFLAG_HIT_ALL)
    {
        findFlags |= FINDFLAGS_HIT_ALL;
    }

    // Mob buff abilities also hit monster's pets
    if (PSkill->getValidTargets() == TARGET_SELF)
    {
        findFlags |= FINDFLAGS_PET;
    }

    if (PAI->TargetFind->isWithinRange(&PTarget->loc.p, distance))
    {
        if (PSkill->isAoE())
        {
            PAI->TargetFind->findWithinArea(PTarget, (AOERADIUS)PSkill->getAoe(), PSkill->getRadius(), findFlags);
        }
        else if (PSkill->isConal())
        {
            float angle = 45.0f;
            PAI->TargetFind->findWithinCone(PTarget, distance, angle, findFlags);
        }
        else
        {
            PAI->TargetFind->findSingleTarget(PTarget, findFlags);
        }
    }

    uint16 actionsLength = PAI->TargetFind->m_targets.size();

    PSkill->setTotalTargets(actionsLength);
    PSkill->setTP(state.GetSpentTP());
    PSkill->setHPP(GetHPP());

    action.id = id;
    action.actiontype = objtype == TYPE_PET ? ACTION_PET_MOBABILITY_FINISH : ACTION_MOBABILITY_FINISH;
    action.actionid = PSkill->getID();

    uint16 msg = 0;
    uint16 defaultMessage = PSkill->getMsg();

    bool first {true};
    for (auto&& PTarget : PAI->TargetFind->m_targets)
    {
        actionList_t& list = action.getNewActionList();

        list.ActionTargetID = PTarget->id;

        actionTarget_t& target = list.getNewActionTarget();

        list.ActionTargetID = PTarget->id;
        target.reaction = REACTION_HIT;
        target.speceffect = SPECEFFECT_HIT;
        target.animation = PSkill->getAnimationID();
        target.messageID = PSkill->getMsg();


        // reset the skill's message back to default
        PSkill->setMsg(defaultMessage);

        if (objtype == TYPE_PET)
        {
            target.animation = PSkill->getPetAnimationID();
            target.param = luautils::OnPetAbility(PTarget, this, PSkill, PMaster);
        }
        else
        {
            target.param = luautils::OnMobWeaponSkill(PTarget, this, PSkill);
        }

        if (msg == 0)
        {
            msg = PSkill->getMsg();
        }
        else
        {
            msg = PSkill->getAoEMsg();
        }

        target.messageID = msg;

        if (PSkill->hasMissMsg())
        {
            target.reaction = REACTION_MISS;
            target.speceffect = SPECEFFECT_NONE;
            if (msg = PSkill->getAoEMsg())
                msg = 282;
        }
        else
        {
            target.reaction = REACTION_HIT;
        }

        if (target.speceffect & SPECEFFECT_HIT)
        {
            target.speceffect = SPECEFFECT_RECOIL;
            target.knockback = PSkill->getKnockback();
            if (first && (PSkill->getSkillchain() != 0))
            {
                CWeaponSkill* PWeaponSkill = battleutils::GetWeaponSkill(PSkill->getSkillchain());
                if (PWeaponSkill)
                {
                    SUBEFFECT effect = battleutils::GetSkillChainEffect(PTarget, PWeaponSkill);
                    if (effect != SUBEFFECT_NONE)
                    {
                        int32 skillChainDamage = battleutils::TakeSkillchainDamage(this, PTarget, target.param);
                        if (skillChainDamage < 0)
                        {
                            target.addEffectParam = -skillChainDamage;
                            target.addEffectMessage = 384 + effect;
                        }
                        else
                        {
                            target.addEffectParam = skillChainDamage;
                            target.addEffectMessage = 287 + effect;
                        }
                        target.additionalEffect = effect;
                    }
                }
                first = false;
            }
        }
    }
}

void CMobEntity::DropItems()
{
    CCharEntity* PChar = (CCharEntity*)GetEntity(m_OwnerID.targid, TYPE_PC);

    if (PChar != nullptr && PChar->id == m_OwnerID.id)
    {

        loc.zone->PushPacket(this, CHAR_INRANGE, new CMessageBasicPacket(PChar, this, 0, 0, MSGBASIC_DEFEATS_TARG));

        if (!CalledForHelp())
        {
            blueutils::TryLearningSpells(PChar, this);
            m_UsedSkillIds.clear();

            if (m_giveExp)
            {
                charutils::DistributeExperiencePoints(PChar, this);
            }

            DropList_t* DropList = itemutils::GetDropList(m_DropID);
            //ShowDebug(CL_CYAN"DropID: %u dropping with TH Level: %u\n" CL_RESET, PMob->m_DropID, PMob->m_THLvl);

            if (DropList != nullptr && !getMobMod(MOBMOD_NO_DROPS) && DropList->size())
            {
                for (uint8 i = 0; i < DropList->size(); ++i)
                {
                    //THLvl is the number of 'extra chances' at an item. If the item is obtained, then break out.
                    uint8 tries = 0;
                    uint8 maxTries = 1 + (m_THLvl > 2 ? 2 : m_THLvl);
                    uint8 bonus = (m_THLvl > 2 ? (m_THLvl - 2) * 10 : 0);
                    while (tries < maxTries)
                    {
                        if (dsprand::GetRandomNumber(1000) < DropList->at(i).DropRate * map_config.drop_rate_multiplier + bonus)
                        {
                            PChar->PTreasurePool->AddItem(DropList->at(i).ItemID, this);
                            break;
                        }
                        tries++;
                    }
                }
            }

            // check for gil (beastmen drop gil, some NMs drop gil)
            if (CanDropGil() || (map_config.all_mobs_gil_bonus > 0 && getMobMod(MOBMOD_GIL_MAX) >= 0)) // Negative value of MOBMOD_GIL_MAX is used to prevent gil drops in Dynamis/Limbus.
            {
                charutils::DistributeGil(PChar, this); // TODO: REALISATION MUST BE IN TREASUREPOOL
            }
            //check for seal drops
            /* MobLvl >= 1 = Beastmen Seals ID=1126
                      >= 50 = Kindred Seals ID=1127
                      >= 75 = Kindred Crests ID=2955
                      >= 90 = High Kindred Crests ID=2956
            */

            uint16 Pzone = PChar->getZone();

            bool validZone = ((Pzone > 0 && Pzone < 39) || (Pzone > 42 && Pzone < 134) || (Pzone > 135 && Pzone < 185) || (Pzone > 188 && Pzone < 255));

            if (validZone && charutils::GetRealExp(PChar->GetMLevel(), GetMLevel()) > 0)
            {
                if (((PChar->StatusEffectContainer->HasStatusEffect(EFFECT_SIGNET) && conquest::GetInfluenceGraphics(PChar->loc.zone->GetRegionID()) < 64) ||
                    (PChar->StatusEffectContainer->HasStatusEffect(EFFECT_SANCTION) && PChar->loc.zone->GetRegionID() >= 28 && PChar->loc.zone->GetRegionID() <= 32) ||
                    (PChar->StatusEffectContainer->HasStatusEffect(EFFECT_SIGIL) && PChar->loc.zone->GetRegionID() >= 33 && PChar->loc.zone->GetRegionID() <= 40)) &&
                    m_Element > 0 && dsprand::GetRandomNumber(100) < 20) // Need to move to CRYSTAL_CHANCE constant
                {
                    PChar->PTreasurePool->AddItem(4095 + m_Element, this);
                }

                // Todo: Avatarite and Geode drops during day/weather. Much higher chance during weather than day.
                // Item element matches day/weather element, not mob crystal. Lv80+ xp mobs can drop Avatarite.
                // Wiki's have conflicting info on mob lv required for Geodes. One says 50 the other 75. I think 50 is correct.

                if (dsprand::GetRandomNumber(100) < 20 && PChar->PTreasurePool->CanAddSeal() && !getMobMod(MOBMOD_NO_DROPS))
                {
                    //RULES: Only 1 kind may drop per mob
                    if (GetMLevel() >= 75 && luautils::IsExpansionEnabled("ABYSSEA")) //all 4 types
                    {
                        switch (dsprand::GetRandomNumber(4))
                        {
                            case 0:
                                PChar->PTreasurePool->AddItem(1126, this);
                                break;
                            case 1:
                                PChar->PTreasurePool->AddItem(1127, this);
                                break;
                            case 2:
                                PChar->PTreasurePool->AddItem(2955, this);
                                break;
                            case 3:
                                PChar->PTreasurePool->AddItem(2956, this);
                                break;
                        }
                    }
                    else if (GetMLevel() >= 70 && luautils::IsExpansionEnabled("ABYSSEA")) //b.seal & k.seal & k.crest
                    {
                        switch (dsprand::GetRandomNumber(3))
                        {
                            case 0:
                                PChar->PTreasurePool->AddItem(1126, this);
                                break;
                            case 1:
                                PChar->PTreasurePool->AddItem(1127, this);
                                break;
                            case 2:
                                PChar->PTreasurePool->AddItem(2955, this);
                                break;
                        }
                    }
                    else if (GetMLevel() >= 50) //b.seal & k.seal only
                    {
                        if (dsprand::GetRandomNumber(2) == 0)
                        {
                            PChar->PTreasurePool->AddItem(1126, this);
                        }
                        else
                        {
                            PChar->PTreasurePool->AddItem(1127, this);
                        }
                    }
                    else
                    {
                        //b.seal only
                        PChar->PTreasurePool->AddItem(1126, this);
                    }
                }
            }
        }

        PChar->setWeaponSkillKill(false);
        StatusEffectContainer->KillAllStatusEffect();

        // NOTE: this is called for all alliance / party members!
        luautils::OnMobDeath(this, PChar);

    }
    else
    {
        luautils::OnMobDeath(this, nullptr);
    }
}

void CMobEntity::FadeOut()
{
    CBaseEntity::FadeOut();
    PEnmityContainer->Clear();
}

void CMobEntity::OnDeathTimer()
{
    PAI->Despawn();
}

void CMobEntity::Die()
{
    m_THLvl = PEnmityContainer->GetHighestTH();
    PEnmityContainer->Clear();
    PAI->ClearStateStack();
    if (PPet != nullptr && PPet->isAlive() && GetMJob() == JOB_SMN)
    {
        PPet->Die();
    }
    PAI->Internal_Die(15s);
    CBattleEntity::Die();
    PAI->QueueAction(queueAction_t(std::chrono::milliseconds(m_DropItemTime), false, [this](CBaseEntity* PEntity) {
        DropItems();
    }));
}

void CMobEntity::OnDisengage(CAttackState& state)
{
    PAI->PathFind->Clear();
    PEnmityContainer->Clear();

    if (getMobMod(MOBMOD_IDLE_DESPAWN))
    {
        SetDespawnTime(std::chrono::milliseconds(getMobMod(MOBMOD_IDLE_DESPAWN)));
    }
    // this will let me decide to walk home or despawn
    m_neutral = true;

    delRageMode();
    m_OwnerID.clean();

    CBattleEntity::OnDisengage(state);

    luautils::OnMobDisengage(this);
}
