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

#include "../../common/showmsg.h"
#include "../../common/timer.h"
#include "../../common/utils.h"

#include <string.h>

#include "../packets/action.h"
#include "../packets/basic.h"
#include "../packets/char.h"
#include "../packets/char_update.h"
#include "../packets/char_recast.h"
#include "../packets/lock_on.h"
#include "../packets/inventory_finish.h"
#include "../packets/menu_raisetractor.h"
#include "../packets/char_health.h"
#include "../packets/char_appearance.h"

#include "../ai/ai_container.h"
#include "../ai/controllers/player_controller.h"
#include "../ai/helpers/targetfind.h"
#include "../ai/states/ability_state.h"
#include "../ai/states/attack_state.h"
#include "../ai/states/death_state.h"
#include "../ai/states/item_state.h"
#include "../ai/states/raise_state.h"
#include "../ai/states/range_state.h"
#include "../ai/states/weaponskill_state.h"
#include "../ai/states/magic_state.h"

#include "charentity.h"
#include "automatonentity.h"
#include "../ability.h"
#include "../conquest_system.h"
#include "../spell.h"
#include "../utils/attackutils.h"
#include "../utils/charutils.h"
#include "../utils/battleutils.h"
#include "../item_container.h"
#include "../items/item_weapon.h"
#include "../items/item_usable.h"
#include "../trade_container.h"
#include "../universal_container.h"
#include "../recast_container.h"
#include "../latent_effect_container.h"
#include "../status_effect_container.h"
#include "../treasure_pool.h"
#include "../weapon_skill.h"


CCharEntity::CCharEntity()
{
    objtype = TYPE_PC;
    m_EcoSystem = SYSTEM_HUMANOID;

    m_event.reset();

    m_GMlevel = 0;
    m_isGMHidden = false;

    m_mentor = 0;
    m_isNewPlayer = true;

    allegiance = ALLEGIANCE_PLAYER;

    TradeContainer = new CTradeContainer();
    Container = new CTradeContainer();
    UContainer = new CUContainer();
    CraftContainer = new CTradeContainer();

    m_Inventory = new CItemContainer(LOC_INVENTORY);
    m_Mogsafe = new CItemContainer(LOC_MOGSAFE);
    m_Storage = new CItemContainer(LOC_STORAGE);
    m_Tempitems = new CItemContainer(LOC_TEMPITEMS);
    m_Moglocker = new CItemContainer(LOC_MOGLOCKER);
    m_Mogsatchel = new CItemContainer(LOC_MOGSATCHEL);
    m_Mogsack = new CItemContainer(LOC_MOGSACK);
    m_Mogcase = new CItemContainer(LOC_MOGCASE);
    m_Wardrobe = new CItemContainer(LOC_WARDROBE);
    m_Mogsafe2 = new CItemContainer(LOC_MOGSAFE2);

    memset(&jobs, 0, sizeof(jobs));
    memset(&keys, 0, sizeof(keys));
    memset(&equip, 0, sizeof(equip));
    memset(&equipLoc, 0, sizeof(equipLoc));
    memset(&RealSkills, 0, sizeof(RealSkills));
    memset(&nationtp, 0, sizeof(nationtp));
    memset(&expChain, 0, sizeof(expChain));
    memset(&nameflags, 0, sizeof(nameflags));

    memset(&m_SpellList, 0, sizeof(m_SpellList));
    memset(&m_LearnedAbilities, 0, sizeof(m_LearnedAbilities));
    memset(&m_TitleList, 0, sizeof(m_TitleList));
    memset(&m_ZonesList, 0, sizeof(m_ZonesList));
    memset(&m_Abilities, 0, sizeof(m_Abilities));
    memset(&m_TraitList, 0, sizeof(m_TraitList));
    memset(&m_PetCommands, 0, sizeof(m_PetCommands));
    memset(&m_WeaponSkills, 0, sizeof(m_WeaponSkills));
    memset(&m_SetBlueSpells, 0, sizeof(m_SetBlueSpells));
    memset(&m_unlockedAttachments, 0, sizeof(m_unlockedAttachments));

    memset(&m_questLog, 0, sizeof(m_questLog));
    memset(&m_missionLog, 0, sizeof(m_missionLog));
    memset(&m_assaultLog, 0, sizeof(m_assaultLog));
    memset(&m_campaignLog, 0, sizeof(m_campaignLog));

    for (uint8 i = 0; i <= 3; ++i)
    {
        m_missionLog[i].current = 0xFFFF;
    }

    m_missionLog[4].current = 0; // MISSION_TOAU
    m_missionLog[5].current = 0; // MISSION_WOTG

    m_copCurrent = 0;
    m_acpCurrent = 0;
    m_mkeCurrent = 0;
    m_asaCurrent = 0;

    m_Costum = 0;
    m_Monstrosity = 0;
    m_hasTractor = 0;
    m_hasRaise = 0;
    m_hasAutoTarget = 1;
    m_InsideRegionID = 0;
    m_LevelRestriction = 0;
    m_lastBcnmTimePrompt = 0;
    m_AHHistoryTimestamp = 0;
    m_DeathCounter = 0;
    m_DeathTimestamp = 0;

    m_EquipFlag = 0;
    m_EquipBlock = 0;
    m_EquipSwap = false;

    MeritMode = false;

    m_isWeaponSkillKill = false;
    m_isMijinGakure = false;
    m_isStyleLocked = false;

    BazaarID.clean();
    TradePending.clean();
    InvitePending.clean();

    PLinkshell1 = nullptr;
    PLinkshell2 = nullptr;
    PTreasurePool = nullptr;
    PWideScanTarget = nullptr;

    PAutomaton = nullptr;

    PRecastContainer = new CRecastContainer(this);
    PLatentEffectContainer = new CLatentEffectContainer(this);

    petZoningInfo.respawnPet = false;
    petZoningInfo.petID = 0;
    petZoningInfo.petType = PETTYPE_AVATAR;			// dummy data, the bool tells us to respawn if required
    petZoningInfo.petHP = 0;
    petZoningInfo.petMP = 0;
    petZoningInfo.petTP = 0;

    m_PlayTime = 0;
    m_SaveTime = 0;
    m_reloadParty = 0;

    m_LastYell = 0;
    m_moghouseID = 0;

    PAI = std::make_unique<CAIContainer>(this, nullptr, std::make_unique<CPlayerController>(this),
        std::make_unique<CTargetFind>(this));
}

CCharEntity::~CCharEntity()
{
    clearPacketList();

    if (PTreasurePool != nullptr)
    {
        // remove myself
        PTreasurePool->DelMember(this);
    }

    delete TradeContainer;
    delete Container;
    delete UContainer;
    delete CraftContainer;
    delete PMeritPoints;
    delete PRecastContainer;

    delete m_Inventory;
    delete m_Mogsafe;
    delete m_Storage;
    delete m_Tempitems;
    delete m_Moglocker;
    delete m_Mogsatchel;
    delete m_Mogsack;
    delete m_Mogcase;
    delete m_Mogsafe2;
}

uint8 CCharEntity::GetGender()
{
    return (look.race) % 2 ^ (look.race > 6);
}

bool CCharEntity::isPacketListEmpty()
{
    return PacketList.empty();
}

void CCharEntity::clearPacketList()
{
    while (!PacketList.empty())
    {
        delete popPacket();
    }
}

void CCharEntity::pushPacket(CBasicPacket* packet)
{
    std::lock_guard<std::mutex> lk(m_PacketListMutex);
    PacketList.push_back(packet);
}

void CCharEntity::pushPacket(std::unique_ptr<CBasicPacket> packet)
{
    pushPacket(packet.release());
}

CBasicPacket* CCharEntity::popPacket()
{
    std::lock_guard<std::mutex> lk(m_PacketListMutex);
    CBasicPacket* PPacket = PacketList.front();
    PacketList.pop_front();
    return PPacket;
}

PacketList_t CCharEntity::getPacketList()
{
    std::lock_guard<std::mutex> lk(m_PacketListMutex);
    return PacketList;
}

size_t CCharEntity::getPacketCount()
{
    std::lock_guard<std::mutex> lk(m_PacketListMutex);
    return PacketList.size();
}

void CCharEntity::erasePackets(uint8 num)
{
    for (auto i = 0; i < num; i++)
    {
        delete popPacket();
    }
}

void CCharEntity::resetPetZoningInfo()
{
    // reset the petZoning info
    petZoningInfo.petHP = 0;
    petZoningInfo.petTP = 0;
    petZoningInfo.respawnPet = false;
    petZoningInfo.petType = PETTYPE_AVATAR;
}
/************************************************************************
*																		*
*  Возвращаем контейнер с указанным ID. Если ID выходит за рамки, то	*
*  защищаем сервер от падения использованием контейнера временных		*
*  предметов в качестве заглушки (из этого контейнера предметы нельзя	*
*  перемещать, надевать, передавать, продавать и т.д.). Отображаем		*
*  сообщение о фатальной ошибке.										*
*																		*
************************************************************************/

CItemContainer* CCharEntity::getStorage(uint8 LocationID)
{
    switch (LocationID)
    {
        case LOC_INVENTORY:	 return m_Inventory;
        case LOC_MOGSAFE:	 return m_Mogsafe;
        case LOC_STORAGE:	 return m_Storage;
        case LOC_TEMPITEMS:	 return m_Tempitems;
        case LOC_MOGLOCKER:	 return m_Moglocker;
        case LOC_MOGSATCHEL: return m_Mogsatchel;
        case LOC_MOGSACK:	 return m_Mogsack;
        case LOC_MOGCASE:	 return m_Mogcase;
        case LOC_WARDROBE:   return m_Wardrobe;
        case LOC_MOGSAFE2:   return m_Mogsafe2;
    }

    DSP_DEBUG_BREAK_IF(LocationID >= MAX_CONTAINER_ID);	// неразрешенный ID хранилища
    return 0;
}

int8 CCharEntity::getShieldSize()
{
    CItemArmor* PItem = (CItemArmor*)(getEquip(SLOT_SUB));

    if (PItem == nullptr) {
        return 0;
    }

    if (!PItem->IsShield()) {
        return 0;
    }

    return PItem->getShieldSize();
}

void CCharEntity::SetName(int8* name)
{
    this->name.insert(0, name, dsp_cap(strlen((const int8*)name), 0, 15));
}

int16 CCharEntity::addTP(int16 tp)
{
    int16 oldtp = health.tp;
    tp = CBattleEntity::addTP(tp);
    //	if ((oldtp < 1000 && health.tp >= 1000 ) || (oldtp >= 1000 && health.tp < 1000))
    //	{
    PLatentEffectContainer->CheckLatentsTP(health.tp);
    //	}
    return abs(tp);
}

int32 CCharEntity::addHP(int32 hp)
{
    hp = CBattleEntity::addHP(hp);
    PLatentEffectContainer->CheckLatentsHP(health.hp);

    return abs(hp);
}

int32 CCharEntity::addMP(int32 mp)
{
    mp = CBattleEntity::addMP(mp);
    PLatentEffectContainer->CheckLatentsMP(health.mp);

    return abs(mp);
}

bool CCharEntity::getWeaponSkillKill()
{
    return m_isWeaponSkillKill;
}

void CCharEntity::setWeaponSkillKill(bool isWeaponSkillKill)
{
    m_isWeaponSkillKill = isWeaponSkillKill;
}

bool CCharEntity::getMijinGakure()
{
    return m_isMijinGakure;
}

void CCharEntity::setMijinGakure(bool isMijinGakure)
{
    m_isMijinGakure = isMijinGakure;
}

bool CCharEntity::getStyleLocked()
{
    return m_isStyleLocked;
}

void CCharEntity::setStyleLocked(bool isStyleLocked)
{
    m_isStyleLocked = isStyleLocked;
}

void CCharEntity::SetPlayTime(uint32 playTime)
{
    m_PlayTime = playTime;
    m_SaveTime = gettick() / 1000;
}

uint32 CCharEntity::GetPlayTime(bool needUpdate)
{
    if (needUpdate)
    {
        uint32 currentTime = gettick() / 1000;

        m_PlayTime += currentTime - m_SaveTime;
        m_SaveTime = currentTime;
    }

    return m_PlayTime;
}

CItemArmor* CCharEntity::getEquip(SLOTTYPE slot)
{
    uint8 loc = equip[slot];
    uint8 est = equipLoc[slot];
    CItemArmor* item = nullptr;

    if (loc != 0)
    {
        item = (CItemArmor*)getStorage(est)->GetItem(loc);
    }
    return item;
}

void CCharEntity::ReloadPartyInc()
{
    m_reloadParty = true;
}

void CCharEntity::ReloadPartyDec()
{
    m_reloadParty = false;
}

bool CCharEntity::ReloadParty()
{
    return m_reloadParty;
}

void CCharEntity::UpdateEntity()
{
    if (loc.zone && updatemask && !m_isGMHidden)
    {
        loc.zone->PushPacket(this, CHAR_INRANGE, new CCharPacket(this, ENTITY_UPDATE, updatemask));
        pushPacket(new CCharUpdatePacket(this));
        updatemask = 0;
    }
}

void CCharEntity::addTrait(CTrait* PTrait)
{
    CBattleEntity::addTrait(PTrait);
    charutils::addTrait(this, PTrait->getID());
}

void CCharEntity::delTrait(CTrait* PTrait)
{
    CBattleEntity::delTrait(PTrait);
    charutils::delTrait(this, PTrait->getID());
}

bool CCharEntity::ValidTarget(CBattleEntity* PInitiator, uint8 targetFlags)
{
    if (StatusEffectContainer->GetConfrontationEffect() != PInitiator->StatusEffectContainer->GetConfrontationEffect())
    {
        return false;
    }
    if (CBattleEntity::ValidTarget(PInitiator, targetFlags))
    {
        return true;
    }

    if (targetFlags & TARGET_PLAYER)
    {
        return true;
    }
    if ((targetFlags & TARGET_PLAYER_PARTY) &&
        (PParty && PInitiator->PParty == PParty))
    {
        return true;
    }
    if ((targetFlags & TARGET_PLAYER_DEAD) && isDead())
    {
        return true;
    }

    return false;
}

bool CCharEntity::CanUseSpell(CSpell* PSpell)
{
    return charutils::hasSpell(this, PSpell->getID()) && CBattleEntity::CanUseSpell(PSpell) &&
        !PRecastContainer->Has(RECAST_MAGIC, PSpell->getID());
}

void CCharEntity::OnChangeTarget(CBattleEntity* PNewTarget)
{
    pushPacket(new CLockOnPacket(this, PNewTarget));
}

void CCharEntity::OnDisengage(CAttackState& state)
{
    CBattleEntity::OnDisengage(state);
    if (state.HasErrorMsg())
    {
        pushPacket(state.GetErrorMsg());
    }
    PLatentEffectContainer->CheckLatentsWeaponDraw(false);
}

bool CCharEntity::CanAttack(CBattleEntity* PTarget, std::unique_ptr<CMessageBasicPacket>& errMsg)
{
    float dist = distance(loc.p, PTarget->loc.p);

    if (!IsMobOwner(PTarget))
    {
        errMsg = std::make_unique<CMessageBasicPacket>(this, PTarget, 0, 0, MSGBASIC_ALREADY_CLAIMED);

        PAI->Disengage();
        return false;
    }
    else if (dist > 30)
    {
        errMsg = std::make_unique<CMessageBasicPacket>(this, PTarget, 0, 0, MSGBASIC_LOSE_SIGHT);
        PAI->Disengage();
        return false;
    }
    else if (!isFaceing(this->loc.p, PTarget->loc.p, 40))
    {
        errMsg = std::make_unique<CMessageBasicPacket>(this, PTarget, 0, 0, MSGBASIC_UNABLE_TO_SEE_TARG);
        return false;
    }
    else if (dist > PTarget->m_ModelSize)
    {
        errMsg = std::make_unique<CMessageBasicPacket>(this, PTarget, 0, 0, MSGBASIC_TARG_OUT_OF_RANGE);
        return false;
    }
    return true;
}

bool CCharEntity::OnAttack(CAttackState& state, action_t& action)
{
    auto controller {static_cast<CPlayerController*>(PAI->GetController())};
    controller->setLastAttackTime(server_clock::now());
    auto ret = CBattleEntity::OnAttack(state, action);

    auto PTarget = static_cast<CBattleEntity*>(state.GetTarget());

    if (PTarget->isDead())
    {
        if (this->m_hasAutoTarget && PTarget->objtype == TYPE_MOB) // Auto-Target
        {
            for (auto&& PPotentialTarget : this->SpawnMOBList)
            {
                if (PPotentialTarget.second->animation == ANIMATION_ATTACK &&
                    isFaceing(this->loc.p, PPotentialTarget.second->loc.p, 64) &&
                    distance(this->loc.p, PPotentialTarget.second->loc.p) <= 10)
                {
                    std::unique_ptr<CMessageBasicPacket> errMsg;
                    if (IsValidTarget(PPotentialTarget.second->targid, TARGET_ENEMY, errMsg))
                    {
                        controller->ChangeTarget(PPotentialTarget.second->targid);
                    }
                }
            }
        }
    }
    if (ret)
    {
        if (PTarget->objtype == TYPE_MOB)
        {
            CMobEntity* Monster = (CMobEntity*)PTarget;

            if (Monster->m_HiPCLvl < GetMLevel())
            {
                Monster->m_HiPCLvl = GetMLevel();
            }
        }
    }
    return ret;
}

void CCharEntity::OnCastFinished(CMagicState& state, action_t& action)
{
    CBattleEntity::OnCastFinished(state, action);

    auto PSpell = state.GetSpell();
    auto PTarget = static_cast<CBattleEntity*>(state.GetTarget());

    PRecastContainer->Add(RECAST_MAGIC, PSpell->getID(), action.recast);

    for (auto&& actionList : action.actionLists)
    {
        for (auto&& actionTarget : actionList.actionTargets)
        {
            if (actionTarget.param > 0 && PSpell->dealsDamage() && PSpell->getSpellGroup() == SPELLGROUP_BLUE &&
                StatusEffectContainer->HasStatusEffect(EFFECT_CHAIN_AFFINITY) &&
                static_cast<CBlueSpell*>(PSpell)->getPrimarySkillchain() != 0)
            {

                SUBEFFECT effect = battleutils::GetSkillChainEffect(PTarget, static_cast<CBlueSpell*>(PSpell));
                if (effect != SUBEFFECT_NONE)
                {
                    uint16 skillChainDamage = battleutils::TakeSkillchainDamage(static_cast<CBattleEntity*>(this), PTarget, actionTarget.param);

                    actionTarget.addEffectParam = skillChainDamage;
                    actionTarget.addEffectMessage = 287 + effect;
                    actionTarget.additionalEffect = effect;

                }
                if (StatusEffectContainer->HasStatusEffect(EFFECT_SEKKANOKI) ||
                    StatusEffectContainer->HasStatusEffect(EFFECT_MEIKYO_SHISUI))
                {
                    health.tp = (health.tp > 1000 ? health.tp - 1000 : 0);
                }
                else
                {
                    health.tp = 0;
                }

                StatusEffectContainer->DelStatusEffectSilent(EFFECT_CHAIN_AFFINITY);
            }
        }
    }
    charutils::RemoveStratagems(this, PSpell);
    if (PSpell->tookEffect())
    {
        charutils::TrySkillUP(this, (SKILLTYPE)PSpell->getSkillType(), PTarget->GetMLevel());
        if (PSpell->getSkillType() == SKILL_SNG)
        {
            CItemWeapon* PItem = static_cast<CItemWeapon*>(getEquip(SLOT_RANGED));
            if (PItem && PItem->isType(ITEM_ARMOR))
            {
                SKILLTYPE Skilltype = (SKILLTYPE)PItem->getSkillType();
                if (Skilltype == SKILL_STR || Skilltype == SKILL_WND || Skilltype == SKILL_SNG)
                {
                    charutils::TrySkillUP(this, Skilltype, PTarget->GetMLevel());
                }
            }
        }
    }
}

void CCharEntity::OnCastInterrupted(CMagicState& state, action_t& action, MSGBASIC_ID msg)
{
    CBattleEntity::OnCastInterrupted(state, action, msg);

    auto message = state.GetErrorMsg();

    if (message)
    {
        static_cast<CCharEntity*>(this)->pushPacket(message);
    }
}

void CCharEntity::OnWeaponSkillFinished(CWeaponSkillState& state, action_t& action)
{
    CBattleEntity::OnWeaponSkillFinished(state, action);

    auto PWeaponSkill = state.GetSkill();
    auto PBattleTarget = static_cast<CBattleEntity*>(state.GetTarget());

    int16 tp = state.GetSpentTP();
    tp = battleutils::CalculateWeaponSkillTP(this, PWeaponSkill, tp);

    PLatentEffectContainer->CheckLatentsTP(this->health.tp);

    SLOTTYPE damslot = SLOT_MAIN;
    if (distance(loc.p, PBattleTarget->loc.p) - PBattleTarget->m_ModelSize < PWeaponSkill->getRange())
    {
        //WS scripts currently rely on user:getTP() to get the tp
        int16 prevTP = health.tp;
        health.tp = tp;

        if (PWeaponSkill->getID() >= 192 && PWeaponSkill->getID() <= 221)
        {
            damslot = SLOT_RANGED;
        }

        PAI->TargetFind->reset();
        //#TODO: revise parameters
        if (PWeaponSkill->isAoE())
        {
            PAI->TargetFind->findWithinArea(PBattleTarget, AOERADIUS_TARGET, 10);
        }
        else
        {
            PAI->TargetFind->findSingleTarget(PBattleTarget);
        }

        for (auto&& PTarget : PAI->TargetFind->m_targets)
        {
            actionList_t& actionList = action.getNewActionList();
            actionList.ActionTargetID = PTarget->id;

            actionTarget_t& actionTarget = actionList.getNewActionTarget();

            uint16 tpHitsLanded;
            uint16 extraHitsLanded;
            int32 damage;
            std::tie(damage, tpHitsLanded, extraHitsLanded) = luautils::OnUseWeaponSkill(this, PTarget, PWeaponSkill);

            actionTarget.reaction = REACTION_NONE;
            actionTarget.speceffect = SPECEFFECT_NONE;
            actionTarget.animation = PWeaponSkill->getAnimationId();
            actionTarget.messageID = 0;

            bool primary = PTarget == PBattleTarget;

            CBattleEntity* taChar = nullptr;

            if (primary)
            {
                if (this->StatusEffectContainer->HasStatusEffect(EFFECT_TRICK_ATTACK))
                    taChar = battleutils::getAvailableTrickAttackChar(this, PBattleTarget);
            }

            if (!battleutils::isValidSelfTargetWeaponskill(PWeaponSkill->getID()))
            {
                health.tp = prevTP;
                if (!primary) {
                    tpHitsLanded = 0; extraHitsLanded = 0;
                }
                damage = battleutils::TakeWeaponskillDamage(this, PTarget, damage, damslot, tpHitsLanded, taChar);
                actionTarget.reaction = (tpHitsLanded || extraHitsLanded ? REACTION_HIT : REACTION_EVADE);
                actionTarget.speceffect = (damage > 0 ? SPECEFFECT_RECOIL : SPECEFFECT_NONE);
                addTP(extraHitsLanded * 10);
                prevTP = health.tp;
                health.tp = tp;

                if (actionTarget.reaction == REACTION_EVADE)
                    actionTarget.messageID = primary ? 188 : 282; //but misses
                else if (damage < 0)
                {
                    actionTarget.param = -damage;
                    actionTarget.messageID = primary ? 238 : 263; //absorbed ws
                }
                else
                {
                    actionTarget.param = damage;
                    actionTarget.messageID = primary ? 185 : 264; //damage ws

                    if (primary && PBattleTarget->objtype == TYPE_MOB)
                    {
                        luautils::OnWeaponskillHit(PBattleTarget, this, PWeaponSkill->getID());
                    }
                }

                if (PTarget->objtype == TYPE_MOB)
                {
                    CMobEntity* Monster = (CMobEntity*)PTarget;

                    if (Monster->m_HiPCLvl < GetMLevel())
                    {
                        Monster->m_HiPCLvl = GetMLevel();
                    }
                }
            }
            else
            {
                actionTarget.messageID = primary ? 224 : 276; //restores mp msg
                actionTarget.reaction = REACTION_HIT;
                dsp_max(damage, 0);
                actionTarget.param = addMP(damage);
            }

            if (primary)
            {
                if (PWeaponSkill->getID() >= 192 && PWeaponSkill->getID() <= 218)
                {
                    battleutils::RemoveAmmo(this);
                }
                if (actionTarget.reaction == REACTION_HIT)
                {
                    if (getEquip(damslot)->getModifier(MOD_ADDITIONAL_EFFECT))
                    {
                        actionTarget_t dummy;
                        luautils::OnAdditionalEffect(this, PTarget, static_cast<CItemWeapon*>(getEquip(damslot)), &dummy, damage);
                    }
                    else if (damslot == SLOT_RANGED && getEquip(SLOT_AMMO) && getEquip(SLOT_AMMO)->getModifier(MOD_ADDITIONAL_EFFECT))
                    {
                        actionTarget_t dummy;
                        luautils::OnAdditionalEffect(this, PTarget, static_cast<CItemWeapon*>(getEquip(SLOT_AMMO)), &dummy, damage);
                    }
                    int wspoints = 1;
                    if (PWeaponSkill->getPrimarySkillchain() != 0)
                    {
                        // NOTE: GetSkillChainEffect is INSIDE this if statement because it
                        //  ALTERS the state of the resonance, which misses and non-elemental skills should NOT do.
                        SUBEFFECT effect = battleutils::GetSkillChainEffect(PBattleTarget, PWeaponSkill);
                        if (effect != SUBEFFECT_NONE)
                        {
                            actionTarget.addEffectParam = battleutils::TakeSkillchainDamage(this, PBattleTarget, damage);
                            if (actionTarget.addEffectParam < 0)
                            {
                                actionTarget.addEffectParam = -actionTarget.addEffectParam;
                                actionTarget.addEffectMessage = 384 + effect;
                            }
                            else
                                actionTarget.addEffectMessage = 287 + effect;
                            actionTarget.additionalEffect = effect;

                            if (effect >= 7)
                                wspoints += 1;
                            else if (effect >= 3)
                                wspoints += 2;
                            else
                                wspoints += 4;
                        }
                    }
                    // check for ws points
                    charutils::AddWeaponSkillPoints(this, damslot, wspoints);
                }
            }
        }
        health.tp = prevTP;
    }
    else
    {
        loc.zone->PushPacket(this, CHAR_INRANGE_SELF, new CMessageBasicPacket(this, this, 0, 0, MSGBASIC_TOO_FAR_AWAY));
    }
    PAI->EventHandler.triggerListener("WEAPONSKILL_USE", this, PWeaponSkill->getID());
    charutils::UpdateHealth(this);
}

void CCharEntity::OnAbility(CAbilityState& state, action_t& action)
{
    auto PAbility = state.GetAbility();
    if (this->PRecastContainer->HasRecast(RECAST_ABILITY, PAbility->getRecastId()))
    {
        pushPacket(new CMessageBasicPacket(this, this, 0, 0, MSGBASIC_WAIT_LONGER));
        return;
    }
    if (this->StatusEffectContainer->HasStatusEffect(EFFECT_AMNESIA)) {
        pushPacket(new CMessageBasicPacket(this, this, 0, 0, MSGBASIC_UNABLE_TO_USE_JA2));
        return;
    }
    auto PTarget = static_cast<CBattleEntity*>(state.GetTarget());
    std::unique_ptr<CMessageBasicPacket> errMsg;
    if (IsValidTarget(PTarget->targid, PAbility->getValidTarget(), errMsg))
    {
        if (this != PTarget && distance(this->loc.p, PTarget->loc.p) > PAbility->getRange())
        {
            pushPacket(new CMessageBasicPacket(this, PTarget, 0, 0, MSGBASIC_TOO_FAR_AWAY));
            return;
        }
        if (PAbility->getID() >= ABILITY_HEALING_RUBY)
        {
            // Blood pact MP costs are stored under animation ID
            if (this->health.mp < PAbility->getAnimationID())
            {
                pushPacket(new CMessageBasicPacket(this, PTarget, 0, 0, MSGBASIC_UNABLE_TO_USE_JA));
                return;
            }
        }
        CBaseEntity* PMsgTarget = this;
        int32 errNo = luautils::OnAbilityCheck(this, PTarget, PAbility, &PMsgTarget);
        if (errNo != 0)
        {
            pushPacket(new CMessageBasicPacket(this, PMsgTarget, PAbility->getID() + 16, PAbility->getID(), errNo));
            return;
        }
        // #TODO: needed??
        //if (PAbility->getValidTarget() == TARGET_ENEMY)
        //{
        //    if (!IsMobOwner(PTarget))
        //    {
        //        this->pushPacket(new CMessageBasicPacket(this, this, 0, 0, MSGBASIC_ALREADY_CLAIMED));

        //        TransitionBack();
        //        PAbility = nullptr;
        //        return;
        //    }
        //}

        if (battleutils::IsParalyzed(this)) {
            // display paralyzed
            loc.zone->PushPacket(this, CHAR_INRANGE_SELF, new CMessageBasicPacket(this, PTarget, 0, 0, MSGBASIC_IS_PARALYZED));
            return;
        }

        // get any available merit recast reduction
        uint8 meritRecastReduction = 0;

        if (PAbility->getMeritModID() > 0 && !(PAbility->getAddType() & ADDTYPE_MERIT))
        {
            meritRecastReduction = PMeritPoints->GetMeritValue((MERIT_TYPE)PAbility->getMeritModID(), this);
        }

        action.recast = (PAbility->getRecastTime() - meritRecastReduction);

        if (PAbility->getID() == ABILITY_LIGHT_ARTS || PAbility->getID() == ABILITY_DARK_ARTS || PAbility->getRecastId() == 231) //stratagems
        {
            if (this->StatusEffectContainer->HasStatusEffect(EFFECT_TABULA_RASA))
                action.recast = 0;
        }
        else if (PAbility->getID() == ABILITY_DEACTIVATE && PAutomaton && PAutomaton->health.hp == PAutomaton->GetMaxHP())
        {
            CAbility* PAbility = ability::GetAbility(ABILITY_ACTIVATE);
            if (PAbility)
                PRecastContainer->Del(RECAST_ABILITY, PAbility->getRecastId());
        }
        else if (PAbility->getID() >= ABILITY_HEALING_RUBY)
        {
            if (this->getMod(MOD_BP_DELAY) > 15) {
                action.recast -= 15;
            }
            else {
                action.recast -= getMod(MOD_BP_DELAY);
            }
        }

        // remove invisible if aggresive
        if (PAbility->getID() != ABILITY_FIGHT)
        {
            if (PAbility->getValidTarget() & TARGET_ENEMY) {
                // aggresive action
                StatusEffectContainer->DelStatusEffectsByFlag(EFFECTFLAG_DETECTABLE);
            }
            else if (PAbility->getID() != ABILITY_TRICK_ATTACK) {
                // remove invisible only
                StatusEffectContainer->DelStatusEffectsByFlag(EFFECTFLAG_INVISIBLE);
            }
        }

        if (PAbility->getID() == ABILITY_REWARD) {
            CItem* PItem = getEquip(SLOT_HEAD);
            if (PItem && (PItem->getID() == 15157 || PItem->getID() == 15158 || PItem->getID() == 16104 || PItem->getID() == 16105)) {
                //TODO: Transform this into an item MOD_REWARD_RECAST perhaps ?
                //The Bison/Brave's Warbonnet & Khimaira/Stout Bonnet reduces recast time by 10 seconds.
                action.recast -= 10;   // remove 10 seconds
            }
        }

        //#TODO: move this somewhere (hopefully entirely to script!)
        /*if (PAbility->getID() >= ABILITY_FIGHTERS_ROLL && PAbility->getID() <= ABILITY_SCHOLARS_ROLL)
        {
StatusEffectContainer->DelStatusEffectSilent(EFFECT_DOUBLE_UP_CHANCE);
            uint8 roll = dsprand::GetRandomNumber(1, 7);
StatusEffectContainer->AddStatusEffect(new CStatusEffect(
                EFFECT_DOUBLE_UP_CHANCE,
                EFFECT_DOUBLE_UP_CHANCE,
                roll,
                0,
                45,
                PAbility->getID(),
                PAbility->getAnimationID(),
                battleutils::getCorsairRollEffect(PAbility->getID())
                ), true);

            m_CorsairDoubleUp = PAbility->getID();

            if (this->StatusEffectContainer->CheckForElevenRoll())
            {
                RecastTime /= 2;
            }

            action.reaction = REACTION_NONE;
            action.speceffect = (SPECEFFECT)roll;
            action.animation = PAbility->getAnimationID();
            action.param = roll;
            action.knockback = 0;

            if (this->PParty != nullptr)
            {
                for (uint32 i = 0; i < this->PParty->members.size(); i++)
                {
                    CCharEntity* PTarget = (CCharEntity*)this->PParty->members[i];

                    if (!PTarget->isDead() &&
                        PTarget->getZone() == getZone() &&
                        distance(this->loc.p, PTarget->loc.p) <= PAbility->getRange())
                    {
                        action.ActionTarget = PTarget;
                        luautils::OnUseAbilityRoll(this, action.ActionTarget, PAbility, roll);
                        if (PTarget->id == id) {
                            if (PAbility->getMessage() == MSGBASIC_ROLL_SUB_FAIL) {
                                action.messageID = MSGBASIC_ROLL_MAIN_FAIL;
                            }
                            else {
                                action.messageID = PAbility->getMessage();
                            }
                        }
                        else if (PAbility->getMessage() == MSGBASIC_ROLL_SUB_FAIL) {
                            action.messageID = MSGBASIC_ROLL_SUB_FAIL;
                        }
                        else {
                            action.messageID = MSGBASIC_ROLL_SUB;
                        }
m_ActionList.push_back(Action);
                    }
                }
            }
            else {
                action.ActionTarget = PTarget;
                luautils::OnUseAbilityRoll(this, action.ActionTarget, PAbility, roll);
                if (PAbility->getMessage() == MSGBASIC_ROLL_SUB_FAIL) {
                    action.messageID = MSGBASIC_ROLL_MAIN_FAIL;
                }
                else {
                    action.messageID = PAbility->getMessage();
                }

m_ActionList.push_back(Action);
            }
PRecastContainer->Add(RECAST_ABILITY, 194, 8); //double up
        }
        else if (PAbility->getID() == ABILITY_WILD_CARD)
        {
            uint8 roll = dsprand::GetRandomNumber(1, 7);
            uint16 AnimationId = 132 + (roll - 1);

            CAbility* rollAbility = ability::GetAbility(ABILITY_WILD_CARD);
            action.animation = AnimationId;
            action.reaction = REACTION_NONE;
            action.speceffect = (SPECEFFECT)roll;
            action.param = roll;
            action.knockback = 0;

            if (this->PParty != nullptr)
            {
                for (uint8 i = 0; i < this->PParty->members.size(); i++)
                {
                    CCharEntity* PTarget = (CCharEntity*)this->PParty->members[i];

                    if (!PTarget->isDead() &&
                        PTarget->getZone() == getZone() &&
                        distance(this->loc.p, PTarget->loc.p) <= PAbility->getRange())
                    {
                        action.ActionTarget = PTarget;
                        battleutils::DoWildCardToEntity(this, PTarget, roll);
                        PTarget->pushPacket(new CCharSkillsPacket(PTarget));
                        PTarget->pushPacket(new CCharRecastPacket(PTarget));
                        PTarget->pushPacket(new CCharHealthPacket(PTarget));
                        action.messageID = PAbility->getMessage();
m_ActionList.push_back(Action);
                    }
                }
            }
            else
            {
                battleutils::DoWildCardToEntity(this, this, roll);
                action.ActionTarget = PTarget;
pushPacket(new CCharSkillsPacket(this));
pushPacket(new CCharRecastPacket(this));
pushPacket(new CCharHealthPacket(this));
                action.messageID = PAbility->getMessage();
m_ActionList.push_back(Action);
            }
            luautils::OnUseAbilityRoll(this, action.ActionTarget, rollAbility, roll);
        }
        else if (PAbility->getID() == ABILITY_DOUBLE_UP)
        {
            if (this->StatusEffectContainer->HasStatusEffect(EFFECT_DOUBLE_UP_CHANCE))
            {
                //TODO: some reason cosair double up chance is sometimes null
                uint8 roll = (dsprand::GetRandomNumber(1, 7));
                CStatusEffect* doubleUpEffect = StatusEffectContainer->GetStatusEffect(EFFECT_DOUBLE_UP_CHANCE);

                if (this->StatusEffectContainer->HasStatusEffect(EFFECT_SNAKE_EYE))
                {
                    //check for instant 11 via Snake Eye merits
                    if (doubleUpEffect->GetPower() >= 5 && dsprand::GetRandomNumber(100) < this->StatusEffectContainer->GetStatusEffect(EFFECT_SNAKE_EYE)->GetPower())
                    {
                        roll = 11 - doubleUpEffect->GetPower();
                    }
                    else
                    {
                        roll = 1;
                    }
StatusEffectContainer->DelStatusEffectSilent(EFFECT_SNAKE_EYE);
                }

                uint8 total = doubleUpEffect->GetPower() + roll;
                if (total > 12)
                {
                    total = 12;
                }
                doubleUpEffect->SetPower(total);

                CAbility* rollAbility = ability::GetAbility(m_CorsairDoubleUp);

                action.animation = doubleUpEffect->GetSubPower();
                action.reaction = REACTION_NONE;
                action.speceffect = (SPECEFFECT)roll;
                action.param = total;

                if (total == 12) //bust!
                {
                    if (this->PParty != nullptr)
                    {
                        for (uint32 i = 0; i < this->PParty->members.size(); i++)
                        {
                            CCharEntity* PTarget = (CCharEntity*)this->PParty->members[i];

                            if (!PTarget->isDead() &&
                                PTarget->getZone() == getZone() &&
                                distance(this->loc.p, PTarget->loc.p) <= PAbility->getRange())
                            {
                                action.ActionTarget = PTarget;
                                if (PTarget->id == id) {
                                    action.messageID = MSGBASIC_DOUBLEUP_BUST;
                                    luautils::OnUseAbilityRoll(this, action.ActionTarget, rollAbility, total);
                                }
                                else {
                                    action.messageID = MSGBASIC_DOUBLEUP_BUST_SUB;
                                }
                                PTarget->StatusEffectContainer->DelStatusEffectSilent(battleutils::getCorsairRollEffect(m_CorsairDoubleUp));
m_ActionList.push_back(Action);
                            }
                        }
                    }
                    else {
                        action.ActionTarget = PTarget;
                        luautils::OnUseAbilityRoll(this, action.ActionTarget, rollAbility, total);
                        action.messageID = MSGBASIC_DOUBLEUP_BUST;
StatusEffectContainer->DelStatusEffectSilent(battleutils::getCorsairRollEffect(m_CorsairDoubleUp));
m_ActionList.push_back(Action);
                    }
StatusEffectContainer->DelStatusEffectSilent(EFFECT_DOUBLE_UP_CHANCE);
                }
                else {
                    if (total == 11)
                    {
PRecastContainer->Del(RECAST_ABILITY, 193); //phantom roll
                    }
                    if (this->PParty != nullptr)
                    {
                        for (uint32 i = 0; i < this->PParty->members.size(); i++)
                        {
                            CCharEntity* PTarget = (CCharEntity*)this->PParty->members[i];

                            if (!PTarget->isDead() &&
                                PTarget->getZone() == getZone() &&
                                distance(this->loc.p, PTarget->loc.p) <= PAbility->getRange())
                            {
                                action.ActionTarget = PTarget;
                                luautils::OnUseAbilityRoll(this, action.ActionTarget, rollAbility, total);
                                if (PTarget->id == id) {
                                    if (PAbility->getMessage() == MSGBASIC_ROLL_SUB_FAIL) {
                                        action.messageID = MSGBASIC_DOUBLEUP_FAIL;
                                    }
                                    else {
                                        action.messageID = PAbility->getMessage();
                                    }
                                }
                                else if (PAbility->getMessage() == MSGBASIC_ROLL_SUB_FAIL) {
                                    action.messageID = MSGBASIC_ROLL_SUB_FAIL;
                                }
                                else {
                                    action.messageID = MSGBASIC_ROLL_SUB;
                                }
m_ActionList.push_back(Action);
                            }
                        }
                    }
                    else {
                        action.ActionTarget = PTarget;
                        luautils::OnUseAbilityRoll(this, action.ActionTarget, rollAbility, total);
                        if (PAbility->getMessage() == MSGBASIC_ROLL_SUB_FAIL) {
                            action.messageID = MSGBASIC_DOUBLEUP_FAIL;
                        }
                        else {
                            action.messageID = PAbility->getMessage();
                        }
m_ActionList.push_back(Action);
                    }
                }
            }
        }*/

        action.id = this->id;
        action.actiontype = PAbility->getActionType();
        action.actionid = PAbility->getID();

        // #TODO: get rid of this to script, too
        if (PAbility->isAvatarAbility())
        {
            if (this->PPet != nullptr) //is a bp - dont display msg and notify pet
            {
                actionList_t& actionList = action.getNewActionList();
                actionList.ActionTargetID = PTarget->id;
                actionTarget_t& actionTarget = actionList.getNewActionTarget();
                actionTarget.animation = 94; //assault anim
                actionTarget.reaction = REACTION_NONE;
                actionTarget.speceffect = SPECEFFECT_RECOIL;
                actionTarget.param = 0;
                actionTarget.messageID = 0;

                if (PAbility->getID() == ABILITY_SEARING_LIGHT || PAbility->getID() == ABILITY_AERIAL_BLAST || PAbility->getID() == ABILITY_EARTHEN_FURY) {
                    if (this->health.mp >= GetMLevel() * 2) {
                        addMP(-this->GetMLevel() * 2);
                    }
                }
                else {
                    addMP(-PAbility->getAnimationID()); // TODO: ...
                }
                //#TODO: probably needs to be in a script, since the pet abilities actually have their own IDs
                PPet->PAI->MobSkill(PTarget->targid, PAbility->getMobSkillID());

                charutils::UpdateHealth(this);
            }
        }
        //#TODO: make this generic enough to not require an if
        else if (PAbility->isAoE() && this->PParty != nullptr)
        {
            PAI->TargetFind->reset();

            float distance = PAbility->getRange();

            PAI->TargetFind->findWithinArea(this, AOERADIUS_ATTACKER, distance);

            uint16 msg = 0;
            for (auto&& PTarget : PAI->TargetFind->m_targets)
            {
                actionList_t& actionList = action.getNewActionList();
                actionList.ActionTargetID = PTarget->id;
                actionTarget_t& actionTarget = actionList.getNewActionTarget();
                actionTarget.reaction = REACTION_NONE;
                actionTarget.speceffect = SPECEFFECT_NONE;
                actionTarget.animation = PAbility->getAnimationID();
                actionTarget.messageID = PAbility->getMessage();
                actionTarget.param = luautils::OnUseAbility(this, PTarget, PAbility, &action);

                if (msg == 0) {
                    msg = PAbility->getMessage();
                }
                else {
                    msg = PAbility->getAoEMsg();
                }

                if (actionTarget.param < 0)
                {
                    msg = ability::GetAbsorbMessage(msg);
                    actionTarget.param = -actionTarget.param;
                }

                actionTarget.messageID = msg;
            }
        }
        else
        {
            actionList_t& actionList = action.getNewActionList();
            actionList.ActionTargetID = PTarget->id;
            actionTarget_t& actionTarget = actionList.getNewActionTarget();
            actionTarget.reaction = REACTION_NONE;
            actionTarget.speceffect = SPECEFFECT_RECOIL;
            actionTarget.animation = PAbility->getAnimationID();
            actionTarget.param = 0;
            auto prevMsg = actionTarget.messageID;

            int32 value = luautils::OnUseAbility(this, PTarget, PAbility, &action);
            if (prevMsg == actionTarget.messageID) actionTarget.messageID = PAbility->getMessage();
            actionTarget.param = value;

            if (value < 0)
            {
                actionTarget.messageID = ability::GetAbsorbMessage(actionTarget.messageID);
                actionTarget.param = -value;
            }

            //#TODO: set the HP from script
            //if (PAbility->getID() == ABILITY_MIJIN_GAKURE)
            //{
            //    this->setMijinGakure(true);
            //    this->health.hp = 0;
            //    charutils::UpdateHealth(this);
            //    this->loc.zone->PushPacket(this, CHAR_INRANGE, new CActionPacket(this));
            //}

            /* TODO: Handle post-Lv. 75 genkai job abilities from support jobs that
            * deal damage points and defeats a monster while Blade of Darkness and/or
            * Blade of Death quests are active.
            */

            //#TODO: move all of these to script!
            // Shadow Bind
            //if (PAbility->getID() == ABILITY_SHADOWBIND)
            //{
            //    //action.flag = 3;

            //    uint16 shadowBindDuration = 30 + this->getMod(MOD_SHADOW_BIND_EXT);
            //    if (dsprand::GetRandomNumber(100) >= PTarget->getMod(MOD_BINDRES))
            //    {
            //        // Shadow bind success!
            //        this->loc.zone->PushPacket(this, CHAR_INRANGE_SELF, new CMessageBasicPacket(this, PTarget, PAbility->getID() + 16, 11, 277));
            //        PTarget->StatusEffectContainer->AddStatusEffect(new CStatusEffect(EFFECT_BIND, EFFECT_BIND, 1, 0, shadowBindDuration));
            //    }
            //    else
            //    {
            //        // Shadowbind failed!
            //        this->loc.zone->PushPacket(this, CHAR_INRANGE_SELF, new CMessageBasicPacket(this, PTarget, PAbility->getID() + 16, 11, 283));
            //    }
            //}

            //// Jump
            //if (PAbility->getID() == ABILITY_JUMP)
            //{
            //    action.param = battleutils::jumpAbility(this, PTarget, 1);
            //    if (action.param == 0)
            //    {
            //        action.messageID = 0;
            //        this->loc.zone->PushPacket(this, CHAR_INRANGE_SELF, new CMessageBasicPacket(this, PTarget, PAbility->getID() + 16, 0, MSGBASIC_USES_BUT_MISSES));
            //    }
            //    else if (action.param >= PTarget->health.hp)
            //    {
            //        this->setWeaponSkillKill(true);
            //    }
            //}

            //// High Jump
            //else if (PAbility->getID() == ABILITY_HIGH_JUMP)
            //{
            //    action.param = battleutils::jumpAbility(this, PTarget, 2);
            //    if (action.param == 0)
            //    {
            //        action.messageID = 0;
            //        this->loc.zone->PushPacket(this, CHAR_INRANGE_SELF, new CMessageBasicPacket(this, PTarget, PAbility->getID() + 16, 0, MSGBASIC_USES_BUT_MISSES));
            //    }
            //    else if (action.param >= PTarget->health.hp)
            //    {
            //        this->setWeaponSkillKill(true);
            //    }
            //}

            //// Super Jump
            //else if (PAbility->getID() == ABILITY_SUPER_JUMP)
            //{
            //    battleutils::jumpAbility(this, PTarget, 3);
            //    action.messageID = 0;
            //    this->loc.zone->PushPacket(this, CHAR_INRANGE_SELF, new CMessageBasicPacket(this, PTarget, PAbility->getID() + 16, 0, MSGBASIC_USES_JA));
            //}

            // Handle Accomplice / Collabrator..
            if (PAbility->getID() == ABILITY_ACCOMPLICE || PAbility->getID() == ABILITY_COLLABORATOR)
            {
                // Find all mobs within 8.5 radius of the target..
                //#TODO: use spawned mob list to avoid iterating 400 mobs
                //for (uint32 x = 0; x < 0x400; x++)
                //{
                //    CBaseEntity* PTarget = PTarget->GetEntity(x, TYPE_MOB);
                //    if (PTarget != nullptr && PTarget->objtype == TYPE_MOB)
                //    {
                //        if (PAI->TargetFind->isWithinRange(&PTarget->loc.p, 8.5f))
                //        {
                //            CMobEntity* PTargetMob = (CMobEntity*)PTarget;
                //            if (PTargetMob->PEnmityContainer->HasTargetID(PTarget->id))
                //                battleutils::TransferEnmity(this, PTarget, PTargetMob, (PAbility->getID() == ABILITY_ACCOMPLICE) ? 50 : 25);
                //        }
                //    }
                //}
            }

            //#TODO: move these 3 BST abilities to scripts
            //if (PAbility->getID() == ABILITY_SNARL)
            //{
            //    //Snarl
            //    CBattleEntity* PTarget = (CBattleEntity*)PTarget->PBattleAI->GetBattleTarget();

            //    if (PTarget != nullptr)
            //    {
            //        switch (PTarget->objtype)
            //        {
            //            case TYPE_MOB:
            //                ((CMobEntity*)PTarget)->PEnmityContainer->LowerEnmityByPercent(this, 100, PTarget);
            //                this->loc.zone->PushPacket(this, CHAR_INRANGE_SELF, new CMessageBasicPacket(this, PTarget, PAbility->getID() + 16, 0, 528));  //528 - The <player> uses .. Enmity is transferred to the <player>'s pet.
            //                break;

            //            case TYPE_PET:
            //                // pets have no emnity container
            //                break;

            //            case TYPE_PC:
            //                PTarget->PBattleAI->SetBattleTarget(PTarget); //Change target. in prevision of future PvP
            //                break;
            //        }
            //    }
            //}
            //if (PAbility->getID() == ABILITY_GAUGE) {
            //    if (PTarget != nullptr && PTarget->objtype == TYPE_MOB) {
            //        if (((CMobEntity*)PTarget)->m_Type & MOBTYPE_NOTORIOUS ||
            //            PTarget->m_EcoSystem == SYSTEM_BEASTMEN ||
            //            PTarget->m_EcoSystem == SYSTEM_ARCANA)
            //        {
            //            //NM, Beastman or Arcana, cannot charm at all !
            //            this->pushPacket(new CMessageBasicPacket(this, PTarget, 0, 0, MSGBASIC_CANNOT_CHARM));
            //        }
            //        else {
            //            uint16 baseExp = charutils::GetRealExp(this->GetMLevel(), PTarget->GetMLevel());

            //            if (baseExp >= 400) {//IT
            //                this->pushPacket(new CMessageBasicPacket(this, PTarget, 0, 0, MSGBASIC_VERY_DIFFICULT_CHARM));
            //            }
            //            else if (baseExp >= 240) {//VT
            //                this->pushPacket(new CMessageBasicPacket(this, PTarget, 0, 0, MSGBASIC_DIFFICULT_TO_CHARM));
            //            }
            //            else if (baseExp >= 120) {//T
            //                this->pushPacket(new CMessageBasicPacket(this, PTarget, 0, 0, MSGBASIC_MIGHT_BE_ABLE_CHARM));
            //            }
            //            else if (baseExp >= 100) {//EM
            //                this->pushPacket(new CMessageBasicPacket(this, PTarget, 0, 0, MSGBASIC_SHOULD_BE_ABLE_CHARM));
            //            }
            //            else {
            //                this->pushPacket(new CMessageBasicPacket(this, PTarget, 0, 0, MSGBASIC_SHOULD_BE_ABLE_CHARM));
            //            }
            //        }
            //    }
            //}
            //if (PAbility->getID() == ABILITY_REWARD)
            //{
            //    this->PPet->UpdateHealth();
            //    this->loc.zone->PushPacket(this, CHAR_INRANGE_SELF, new CMessageBasicPacket(this, PTarget, PAbility->getID() + 16, value, MSGBASIC_USES_RECOVERS_HP));

            //    //Reward gives enmity to the pet and not the Beastmaster.
            //    CBattleEntity* PTarget = PPet->PBattleAI->GetBattleTarget();
            //    if (PTarget != nullptr && PTarget->objtype == TYPE_MOB)
            //    {
            //        ((CMobEntity*)PTarget)->PEnmityContainer->UpdateEnmityFromCure(this->PPet, this->PPet->GetMLevel(), value, false);
            //    }
            //}

            state.ApplyEnmity();
        }

        // #TODO: delete ammo from script

        //if (PAbility->getID() == ABILITY_CALL_BEAST || PAbility->getID() == ABILITY_REWARD ||
        //    PAbility->getID() == ABILITY_ANGON || PAbility->getID() == ABILITY_TOMAHAWK || PAbility->getID() == ABILITY_REPAIR)
        //{
        //    CItemArmor* PAmmo = getEquip(SLOT_AMMO);
        //    uint8 slot = equip[SLOT_AMMO];
        //    uint8 loc = equipLoc[SLOT_AMMO];
        //    if (PAmmo->getQuantity() == 1)
        //    {
        //        charutils::UnequipItem(this, SLOT_AMMO);
        //        charutils::SaveCharEquip(this);
        //    }
        //    charutils::UpdateItem(this, loc, slot, -1);

        //    this->pushPacket(new CInventoryFinishPacket());
        //}

        //if (PAbility->getID() >= ABILITY_FIRE_SHOT && PAbility->getID() <= ABILITY_DARK_SHOT)
        //{
        //    CItemContainer* inventory = getStorage(LOC_INVENTORY);
        //    uint8 slotID = inventory->SearchItem(2176 + PAbility->getID() - ABILITY_FIRE_SHOT); //Elemental Card

        //    if (slotID != ERROR_SLOTID)
        //    {
        //        charutils::UpdateItem(this, LOC_INVENTORY, slotID, -1);
        //    }
        //    else
        //    {
        //        slotID = inventory->SearchItem(2974); //Trump Card
        //        DSP_DEBUG_BREAK_IF(slotID == ERROR_SLOTID);
        //        charutils::UpdateItem(this, LOC_INVENTORY, slotID, -1);
        //    }
        //    this->pushPacket(new CInventoryFinishPacket());
        //}

        uint32 chargeTime = 0;
        uint8 maxCharges = 0;
        Charge_t* charge = ability::GetCharge(this, PAbility->getRecastId());
        if (charge != nullptr)
        {
            chargeTime = charge->chargeTime;
            maxCharges = charge->maxCharges;
        }
        PRecastContainer->Add(RECAST_ABILITY, PAbility->getRecastId(), action.recast, chargeTime, maxCharges);
        pushPacket(new CCharRecastPacket(this));

        //#TODO: refactor 
        //if (this->getMijinGakure())
        //{
        //    m_ActionType = ACTION_FALL;
        //    ActionFall();
        //}
    }
    else if (errMsg)
    {
        pushPacket(std::move(errMsg));
    }
}

void CCharEntity::OnRangedAttack(CRangeState& state, action_t& action)
{
    auto PTarget = static_cast<CBattleEntity*>(state.GetTarget());

    int32 damage = 0;
    int32 totalDamage = 0;

    action.id = id;
    action.actiontype = ACTION_RANGED_FINISH;

    actionList_t& actionList = action.getNewActionList();
    actionList.ActionTargetID = PTarget->id;

    actionTarget_t& actionTarget = actionList.getNewActionTarget();
    actionTarget.reaction = REACTION_HIT;		//0x10
    actionTarget.speceffect = SPECEFFECT_HIT;		//0x60 (SPECEFFECT_HIT + SPECEFFECT_RECOIL)
    actionTarget.messageID = 352;

    CItemWeapon* PItem = (CItemWeapon*)this->getEquip(SLOT_RANGED);
    CItemWeapon* PAmmo = (CItemWeapon*)this->getEquip(SLOT_AMMO);

    bool ammoThrowing = PAmmo ? PAmmo->isThrowing() : false;
    bool rangedThrowing = PItem ? PItem->isThrowing() : false;
    uint8 slot = SLOT_RANGED;

    if (ammoThrowing)
    {
        slot = SLOT_AMMO;
        PItem = nullptr;
    }
    if (rangedThrowing)
    {
        PAmmo = nullptr;
    }

    uint8 shadowsTaken = 0;
    uint8 hitCount = 1;			// 1 hit by default
    uint8 realHits = 0;			// to store the real number of hit for tp multipler
    bool hitOccured = false;	// track if player hit mob at all
    bool isSange = false;
    bool isBarrage = StatusEffectContainer->HasStatusEffect(EFFECT_BARRAGE, 0);

    // if barrage is detected, getBarrageShotCount also checks for ammo count
    if (!ammoThrowing && !rangedThrowing && isBarrage)
    {
        hitCount += battleutils::getBarrageShotCount(this);
    }
    else if (ammoThrowing && this->StatusEffectContainer->HasStatusEffect(EFFECT_SANGE))
    {
        isSange = true;
        hitCount += getMod(MOD_UTSUSEMI);
    }

    // loop for barrage hits, if a miss occurs, the loop will end
    for (uint8 i = 0; i < hitCount; ++i)
    {
        if (PTarget->StatusEffectContainer->HasStatusEffect(EFFECT_PERFECT_DODGE, 0))
        {
            actionTarget.messageID = 32;
            actionTarget.reaction = REACTION_EVADE;
            actionTarget.speceffect = SPECEFFECT_NONE;
            i = hitCount; // end barrage, shot missed
        }
        else if (dsprand::GetRandomNumber(100) < battleutils::GetRangedHitRate(this, PTarget, isBarrage)) // hit!
        {
            // absorbed by shadow
            if (battleutils::IsAbsorbByShadow(PTarget))
            {
                shadowsTaken++;
            }
            else
            {
                float pdif = battleutils::GetRangedPDIF(this, PTarget);
                bool isCrit = false;

                if (dsprand::GetRandomNumber(100) < battleutils::GetCritHitRate(this, PTarget, true))
                {
                    pdif *= 1.25; //uncapped
                    int16 criticaldamage = getMod(MOD_CRIT_DMG_INCREASE);
                    criticaldamage = dsp_cap(criticaldamage, 0, 100);
                    pdif *= ((100 + criticaldamage) / 100.0f);
                    actionTarget.speceffect = SPECEFFECT_CRITICAL_HIT;
                    actionTarget.messageID = 353;
                    isCrit = true;
                }

                // at least 1 hit occured
                hitOccured = true;
                realHits++;

                if (isSange)
                {
                    // change message to sange
                    actionTarget.messageID = 77;
                }

                damage = (this->GetRangedWeaponDmg() + battleutils::GetFSTR(this, PTarget, slot)) * pdif;

                if (slot == SLOT_RANGED)
                {
                    if (state.IsRapidShot())
                    {
                        damage = attackutils::CheckForDamageMultiplier(this, PItem, damage, RAPID_SHOT_ATTACK);
                    }
                    else
                    {
                        damage = attackutils::CheckForDamageMultiplier(this, PItem, damage, RANGED_ATTACK);
                    }

                    if (PItem != nullptr)
                    {
                        charutils::TrySkillUP(this, (SKILLTYPE)PItem->getSkillType(), PTarget->GetMLevel());
                    }
                }
                else if (slot == SLOT_AMMO && PAmmo != nullptr)
                {
                    charutils::TrySkillUP(this, (SKILLTYPE)PAmmo->getSkillType(), PTarget->GetMLevel());
                }
            }
        }
        else //miss
        {
            actionTarget.reaction = REACTION_EVADE;
            actionTarget.speceffect = SPECEFFECT_NONE;
            actionTarget.messageID = 354;

            battleutils::ClaimMob(PTarget, this);

            i = hitCount; // end barrage, shot missed
        }

        // check for recycle chance
        uint16 recycleChance = getMod(MOD_RECYCLE);
        if (charutils::hasTrait(this, TRAIT_RECYCLE))
        {
            recycleChance += PMeritPoints->GetMeritValue(MERIT_RECYCLE, this);
        }

        // Only remove unlimited shot on hit
        if (hitOccured && this->StatusEffectContainer->HasStatusEffect(EFFECT_UNLIMITED_SHOT))
        {
            StatusEffectContainer->DelStatusEffect(EFFECT_UNLIMITED_SHOT);
            recycleChance = 100;
        }

        if (PAmmo != nullptr && dsprand::GetRandomNumber(100) > recycleChance)
        {
            if ((PAmmo->getQuantity() - 1) < 1) // ammo will run out after this shot, make sure we remove it from equip
            {
                TrackArrowUsageForScavenge(PAmmo);
                uint8 slot = equip[SLOT_AMMO];
                uint8 loc = equipLoc[SLOT_AMMO];
                charutils::UnequipItem(this, SLOT_AMMO);
                charutils::SaveCharEquip(this);
                charutils::UpdateItem(this, loc, slot, -1);
                i = hitCount; // end loop (if barrage), player is out of ammo
                PAmmo = nullptr;
            }
            else
            {
                TrackArrowUsageForScavenge(PAmmo);
                charutils::UpdateItem(this, this->equipLoc[SLOT_AMMO], this->equip[SLOT_AMMO], -1);
            }
            pushPacket(new CInventoryFinishPacket());
        }
        totalDamage += damage;
    }

    // if a hit did occur (even without barrage)
    if (hitOccured == true)
    {
        // any misses with barrage cause remaing shots to miss, meaning we must check Action.reaction
        if (actionTarget.reaction == REACTION_EVADE && (this->StatusEffectContainer->HasStatusEffect(EFFECT_BARRAGE) || isSange))
        {
            actionTarget.messageID = 352;
            actionTarget.reaction = REACTION_HIT;
            actionTarget.speceffect = SPECEFFECT_CRITICAL_HIT;
        }

        actionTarget.param = battleutils::TakePhysicalDamage(this, PTarget, totalDamage, false, slot, realHits, nullptr, true, true);

        // lower damage based on shadows taken
        if (shadowsTaken)
            actionTarget.param = actionTarget.param * (1 - ((float)shadowsTaken / realHits));

        // absorb message
        if (actionTarget.param < 0)
        {
            actionTarget.param = -(actionTarget.param);
            actionTarget.messageID = 382;
        }

        //add additional effects
        //this should go AFTER damage taken
        //or else sleep effect won't work
        //battleutils::HandleRangedAdditionalEffect(this,PTarget,&Action);
        //TODO: move all hard coded additional effect ammo to scripts
        if ((PAmmo != nullptr && PAmmo->getModifier(MOD_ADDITIONAL_EFFECT) > 0) || (PItem != nullptr && PItem->getModifier(MOD_ADDITIONAL_EFFECT) > 0)) {}
        luautils::OnAdditionalEffect(this, PTarget, (PAmmo != nullptr ? PAmmo : PItem), &actionTarget, totalDamage);
    }
    else if (shadowsTaken > 0)
    {
        // shadows took damage
        actionTarget.messageID = 0;
        actionTarget.reaction = REACTION_EVADE;
        PTarget->loc.zone->PushPacket(PTarget, CHAR_INRANGE_SELF, new CMessageBasicPacket(PTarget, PTarget, 0, shadowsTaken, MSGBASIC_SHADOW_ABSORB));

        battleutils::ClaimMob(PTarget, this);
    }

    if (actionTarget.speceffect == SPECEFFECT_HIT && actionTarget.param > 0)
        actionTarget.speceffect = SPECEFFECT_RECOIL;

    // TODO: что это ? ....
    // если не ошибаюсь, то TREASURE_HUNTER работает лишь при последнем ударе

    if (PTarget->objtype == TYPE_MOB)
    {
        CMobEntity* Monster = (CMobEntity*)PTarget;

        if (Monster->m_HiPCLvl < GetMLevel())
        {
            Monster->m_HiPCLvl = GetMLevel();
        }
    }

    // remove barrage effect if present
    if (this->StatusEffectContainer->HasStatusEffect(EFFECT_BARRAGE, 0)) {
        StatusEffectContainer->DelStatusEffect(EFFECT_BARRAGE, 0);
    }
    else if (isSange)
    {
        uint16 power = StatusEffectContainer->GetStatusEffect(EFFECT_SANGE)->GetPower();

        // remove shadows
        while (realHits-- && dsprand::GetRandomNumber(100) <= power && battleutils::IsAbsorbByShadow(this));

        StatusEffectContainer->DelStatusEffect(EFFECT_SANGE);
    }

    // only remove detectables
    StatusEffectContainer->DelStatusEffectsByFlag(EFFECTFLAG_DETECTABLE);

    // Try to double shot
    //#TODO: figure out the packet structure of double/triple shot
    //if (this->StatusEffectContainer->HasStatusEffect(EFFECT_DOUBLE_SHOT, 0) && !this->secondDoubleShotTaken &&	!isBarrage && !isSange)
    //{
    //    uint16 doubleShotChance = getMod(MOD_DOUBLE_SHOT_RATE);
    //    if (dsprand::GetRandomNumber(100) < doubleShotChance)
    //    {
    //        this->secondDoubleShotTaken = true;
    //        m_ActionType = ACTION_RANGED_FINISH;
    //        this->m_rangedDelay = 0;
    //        return;
    //    }
    //}
    static_cast<CPlayerController*>(PAI->GetController())->setNextRangedTime(server_clock::now() + 1s + std::chrono::milliseconds(this->GetAmmoDelay()));
}

bool CCharEntity::IsMobOwner(CBattleEntity* PBattleTarget)
{
    DSP_DEBUG_BREAK_IF(PBattleTarget == nullptr);

    if (PBattleTarget->m_OwnerID.id == 0 || PBattleTarget->m_OwnerID.id == this->id || PBattleTarget->objtype == TYPE_PC)
    {
        return true;
    }

    bool found = false;

    static_cast<CCharEntity*>(this)->ForAlliance([&PBattleTarget, &found](CBattleEntity* PEntity) {
        if (PEntity->id == PBattleTarget->m_OwnerID.id)
        {
            found = true;
        }
    });

    return found;
}

void CCharEntity::HandleErrorMessage(std::unique_ptr<CMessageBasicPacket>& msg)
{
    if (msg)
        pushPacket(msg.release());
}

void CCharEntity::OnDeathTimer()
{
    //home point
}

void CCharEntity::OnRaise()
{
    // TODO: Moghancement Experience needs to be factored in here somewhere.
    if (m_hasRaise > 0)
    {
        uint8 weaknessLvl = 1;
        if (StatusEffectContainer->HasStatusEffect(EFFECT_WEAKNESS))
        {
            //double weakness!
            weaknessLvl = 2;
        }

        //add weakness effect (75% reduction in HP/MP)
        if (!getMijinGakure())
        {
            CStatusEffect* PWeaknessEffect = new CStatusEffect(EFFECT_WEAKNESS, EFFECT_WEAKNESS, weaknessLvl, 0, 300);
            StatusEffectContainer->AddStatusEffect(PWeaknessEffect);
        }

        double ratioReturned = 0.0f;
        uint16 hpReturned = 1;

        action_t action;
        action.id = id;
        action.actiontype = ACTION_RAISE_MENU_SELECTION;
        auto& list = action.getNewActionList();
        auto& actionTarget = list.getNewActionTarget();

        list.ActionTargetID = id;
        if (m_hasRaise == 1)
        {
            actionTarget.animation = 511;
            hpReturned = (getMijinGakure()) ? GetMaxHP()*0.5 : GetMaxHP()*0.1;
            ratioReturned = 0.50f * (1 - map_config.exp_retain);
        }
        else if (m_hasRaise == 2)
        {
            actionTarget.animation = 512;
            hpReturned = (getMijinGakure()) ? GetMaxHP()*0.5 : GetMaxHP()*0.25;
            ratioReturned = ((GetMLevel() <= 50) ? 0.50f : 0.75f) * (1 - map_config.exp_retain);
        }
        else if (m_hasRaise == 3)
        {
            actionTarget.animation = 496;
            hpReturned = GetMaxHP()*0.5;
            ratioReturned = ((GetMLevel() <= 50) ? 0.50f : 0.90f) * (1 - map_config.exp_retain);
        }
        addHP(((hpReturned < 1) ? 1 : hpReturned));
        updatemask |= UPDATE_HP;
        actionTarget.speceffect = SPECEFFECT_RAISE;

        loc.zone->PushPacket(this, CHAR_INRANGE_SELF, new CActionPacket(action));

        charutils::UpdateHealth(this);

        uint8 mLevel = (m_LevelRestriction != 0 && m_LevelRestriction < GetMLevel()) ? m_LevelRestriction : GetMLevel();
        uint16 expLost = mLevel <= 67 ? (charutils::GetExpNEXTLevel(mLevel) * 8) / 100 : 2400;

        uint16 xpNeededToLevel = charutils::GetExpNEXTLevel(jobs.job[GetMJob()]) - jobs.exp[GetMJob()];

        // Exp is enough to level you and (you're not under a level restriction, or the level restriction is higher than your current main level).
        if (xpNeededToLevel < expLost && (m_LevelRestriction == 0 || GetMLevel() < m_LevelRestriction))
        {
            // Player probably leveled down when they died.  Give they xp for the next level.
            expLost = GetMLevel() <= 67 ? (charutils::GetExpNEXTLevel(jobs.job[GetMJob()] + 1) * 8) / 100 : 2400;
        }

        uint16 xpReturned = ceil(expLost * ratioReturned);

        if (!getMijinGakure() && GetMLevel() >= map_config.exp_loss_level)
        {
            charutils::AddExperiencePoints(true, this, this, xpReturned);
        }

        setMijinGakure(false);

        m_hasRaise = 0;
    }
}

void CCharEntity::OnItemFinish(CItemState& state, action_t& action)
{
    auto PTarget = static_cast<CBattleEntity*>(state.GetTarget());
    auto PItem = static_cast<CItemUsable*>(state.GetItem());

    //#TODO: I'm sure this is supposed to be in the action packet... (animation, message)
    if (PItem->getAoE())
    {
        PTarget->ForParty([PItem, PTarget](CBattleEntity* PMember)
        {
            if (!PMember->isDead() && distance(PTarget->loc.p, PMember->loc.p) <= 10)
            {
                luautils::OnItemUse(PMember, PItem);
            }
        });
    }
    else
    {
        luautils::OnItemUse(PTarget, PItem);
    }

    action.id = this->id;
    action.actiontype = ACTION_ITEM_FINISH;

    actionList_t& actionList = action.getNewActionList();
    actionList.ActionTargetID = PTarget->id;

    actionTarget_t& actionTarget = actionList.getNewActionTarget();
    actionTarget.animation = PItem->getAnimationID();

    if (PItem->isType(ITEM_ARMOR))
    {
        if (PItem->getMaxCharges() > 1)
        {
            PItem->setCurrentCharges(PItem->getCurrentCharges() - 1);
        }
        PItem->setLastUseTime(CVanaTime::getInstance()->getVanaTime());

        int8 extra[sizeof(PItem->m_extra) * 2 + 1];
        Sql_EscapeStringLen(SqlHandle, extra, (const char*)PItem->m_extra, sizeof(PItem->m_extra));

        const int8* Query =
            "UPDATE char_inventory "
            "SET extra = '%s' "
            "WHERE charid = %u AND location = %u AND slot = %u;";

        Sql_Query(
            SqlHandle,
            Query,
            extra,
            this->id,
            PItem->getLocationID(),
            PItem->getSlotID());

        if (PItem->getCurrentCharges() != 0)
        {
            this->PRecastContainer->Add(RECAST_ITEM, PItem->getSlotID(), PItem->getReuseTime() / 1000);
        }
    }
    else // разблокируем все предметы, кроме экипирвоки
    {
        PItem->setSubType(ITEM_UNLOCKED);

        charutils::UpdateItem(this, PItem->getLocationID(), PItem->getSlotID(), -1, true);
    }
}

CBattleEntity* CCharEntity::IsValidTarget(uint16 targid, uint8 validTargetFlags, std::unique_ptr<CMessageBasicPacket>& errMsg)
{
    auto PTarget = CBattleEntity::IsValidTarget(targid, validTargetFlags, errMsg);
    if (PTarget)
    {
        if (static_cast<CCharEntity*>(this)->IsMobOwner(PTarget))
        {
            return PTarget;
        }
        else
        {
            errMsg = std::make_unique<CMessageBasicPacket>(this, PTarget, 0, 0, MSGBASIC_ALREADY_CLAIMED);
        }
    }
    else
    {
        errMsg = std::make_unique<CMessageBasicPacket>(this, this, 0, 0, MSGBASIC_CANNOT_ATTACK_TARGET);
    }
    return nullptr;
}

void CCharEntity::Die()
{
    if (GetBattleTargetID() == 0)
    {
        //falls to the ground
        loc.zone->PushPacket(this, CHAR_INRANGE_SELF, new CMessageBasicPacket(this, this, 0, 0, 20));
    }
    else
    {
        auto PTarget = GetEntity(GetBattleTargetID());
        loc.zone->PushPacket(this, CHAR_INRANGE_SELF, new CMessageBasicPacket(this, PTarget, 0, 0, 97));
    }
    Die(60min);
    m_DeathCounter = 0;
    m_DeathTimestamp = (uint32)time(nullptr);

    //influence for conquest system
    conquest::LoseInfluencePoints(this);

    if (!this->getMijinGakure())
        charutils::DelExperiencePoints(this, map_config.exp_retain);
}

void CCharEntity::Die(duration _duration)
{
    PAI->ClearStateStack();
    PAI->Internal_Die(_duration);
    pushPacket(new CRaiseTractorMenuPacket(this, TYPE_HOMEPOINT));
    StatusEffectContainer->DelStatusEffectsByFlag(EFFECTFLAG_DEATH, true);

    // reraise modifiers
    if (this->getMod(MOD_RERAISE_I) > 0)
        m_hasRaise = 1;

    if (this->getMod(MOD_RERAISE_II) > 0)
        m_hasRaise = 2;

    if (this->getMod(MOD_RERAISE_III) > 0)
        m_hasRaise = 3;
    CBattleEntity::Die();
}

void CCharEntity::Raise()
{
    PAI->Internal_Raise();
}

void CCharEntity::TrackArrowUsageForScavenge(CItemWeapon* PAmmo)
{
    // Check if local has been set yet
    if (this->GetLocalVar("ArrowsUsed") == 0)
    {
        // Local not set yet so set
        this->SetLocalVar("ArrowsUsed", PAmmo->getID() * 10000 + 1);
    }
    else
    {
        // Local exists now check if arrow used is same as last time
        if ((floor(this->GetLocalVar("ArrowsUsed") / 10000)) == PAmmo->getID())
        {
            // Same arrow used as last time now check that arrows used do not go above 1980
            if (!(floor(this->GetLocalVar("ArrowsUsed") % 10000) >= 1980))
            {
                // Safe to increment arrows used
                this->SetLocalVar("ArrowsUsed", this->GetLocalVar("ArrowsUsed") + 1);
            }
        }
        else
        {
            // Different arrow is being used so remake local
            this->SetLocalVar("ArrowsUsed", PAmmo->getID() * 10000 + 1);
        }
    }
}

void CCharEntity::Tick(time_point _tick)
{
    if (m_EquipSwap)
    {
        pushPacket(new CCharAppearancePacket(this));
        pushPacket(new CCharUpdatePacket(this));

        pushPacket(new CCharHealthPacket(this));
        m_EquipSwap = false;
    }
    CBattleEntity::Tick(_tick);
}

bool CCharEntity::OnAttackError(CAttackState& state)
{
    auto controller {static_cast<CPlayerController*>(PAI->GetController())};
    if (controller->getLastErrMsgTime() + std::chrono::milliseconds(this->GetWeaponDelay(false)) < PAI->getTick())
    {
        controller->setLastErrMsgTime(PAI->getTick());
        return true;
    }
    return false;
}
