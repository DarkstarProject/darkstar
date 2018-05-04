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

#include "../common/showmsg.h"
#include "../common/utils.h"

#include "ai/ai_container.h"
#include "alliance.h"
#include "enmity_container.h"
#include "entities/battleentity.h"
#include "entities/charentity.h"
#include "entities/mobentity.h"
#include "packets/entity_update.h"
#include "status_effect_container.h"
#include "utils/battleutils.h"
#include "utils/zoneutils.h"

/************************************************************************
*                                                                       *
*                                                                       *
*                                                                       *
************************************************************************/

CEnmityContainer::CEnmityContainer(CMobEntity* holder) : m_EnmityHolder(holder)
{
}

CEnmityContainer::~CEnmityContainer()
{
    Clear();
}

/************************************************************************
*                                                                       *
*  Clear Enmity List                                                    *
*                                                                       *
************************************************************************/

void CEnmityContainer::Clear(uint32 EntityID)
{
    if (EntityID == 0)
    {
        m_EnmityList.clear();
        return;
    }
    else
    {
        m_EnmityList.erase(EntityID);
    }
    m_tameable = true;
}

void CEnmityContainer::LogoutReset(uint32 EntityID)
{
    auto enmity_obj = m_EnmityList.find(EntityID);

    if (enmity_obj != m_EnmityList.end())
    {
        enmity_obj->second.PEnmityOwner = nullptr;
        enmity_obj->second.active = false;
    }
}

/************************************************************************
*                                                                       *
*  Минимальное (базовое) значение ненависти                             *
*                                                                       *
************************************************************************/

void CEnmityContainer::AddBaseEnmity(CBattleEntity* PChar)
{
    m_EnmityList.emplace(PChar->id, EnmityObject_t {PChar,0,0,false,0});
}

/************************************************************************
*                                                                       *
*  Calculate Enmity Bonus
*                                                                       *
************************************************************************/

float CEnmityContainer::CalculateEnmityBonus(CBattleEntity* PEntity)
{
    int8 enmityBonus = 0;
    if (PEntity->objtype & TYPE_PC)
    {
        CCharEntity* PChar = static_cast<CCharEntity*>(PEntity);
        enmityBonus = PChar->PMeritPoints->GetMeritValue(MERIT_ENMITY_INCREASE, PChar) - PChar->PMeritPoints->GetMeritValue(MERIT_ENMITY_DECREASE, PChar);

        if (PChar->StatusEffectContainer->HasStatusEffect(EFFECT_SOULEATER))
        {
            enmityBonus -= PChar->PMeritPoints->GetMeritValue(MERIT_MUTED_SOUL, PChar);
        }
    }

    float bonus = (100.0f + std::clamp(PEntity->getMod(Mod::ENMITY) + enmityBonus, -50, 100)) / 100.0f;

    return bonus;
}

/************************************************************************
*                                                                       *
*  Add entity to hate list                                              *
*                                                                       *
************************************************************************/

void CEnmityContainer::UpdateEnmity(CBattleEntity* PEntity, int16 CE, int16 VE, bool withMaster, bool tameable)
{
    // you're too far away so i'm ignoring you
    if (!IsWithinEnmityRange(PEntity))
    {
        CE = 0;
        VE = 0;
    }

    auto enmity_obj = m_EnmityList.find(PEntity->id);

    if (enmity_obj != m_EnmityList.end())
    {
        if (enmity_obj->second.PEnmityOwner == nullptr) enmity_obj->second.PEnmityOwner = PEntity;
        float bonus = CalculateEnmityBonus(PEntity);

        int newCE = (int)(enmity_obj->second.CE + ((CE > 0) ? CE * bonus : CE));
        int newVE = (int)(enmity_obj->second.VE + ((VE > 0) ? VE * bonus : VE));

        //Check for cap limit
        enmity_obj->second.CE = std::clamp(newCE, 0, 10000);
        enmity_obj->second.VE = std::clamp(newVE, 0, 10000);
        enmity_obj->second.active = true;

        if (CE + VE > 0 && PEntity->getMod(Mod::TREASURE_HUNTER) > enmity_obj->second.maxTH)
            enmity_obj->second.maxTH = (uint8)(PEntity->getMod(Mod::TREASURE_HUNTER));
    }
    else if (CE >= 0 && VE >= 0)
    {
        bool initial = true;
        for (auto&& enmityObject : m_EnmityList)
        {
            if (enmityObject.second.active)
            {
                initial = false;
                break;
            }
        }
        auto maxTH = 0;
        if(CE + VE > 0)
        {
            maxTH = (uint8)(PEntity->getMod(Mod::TREASURE_HUNTER));
        }
        if (initial) CE += 200;
        float bonus = CalculateEnmityBonus(PEntity);

        CE = std::clamp<int16>((int16)(CE * bonus), 0, 10000);
        VE = std::clamp<int16>((int16)(VE * bonus), 0, 10000);

        m_EnmityList.emplace(PEntity->id, EnmityObject_t {PEntity, CE, VE, true, (uint8)maxTH});

        if (withMaster && PEntity->PMaster != nullptr)
        {
            //add master to the enmity list
            //add master to the enmity list (charmed mob)
            if (PEntity->objtype == TYPE_PET || (PEntity->objtype == TYPE_MOB && PEntity->PMaster != nullptr && PEntity->PMaster->objtype == TYPE_PC))
            {
                AddBaseEnmity(PEntity->PMaster);
            }
        }
    }
    if (!tameable)
    {
        m_tameable = false;
    }
}

bool CEnmityContainer::HasID(uint32 TargetID)
{
    return std::find_if(m_EnmityList.begin(), m_EnmityList.end(), [TargetID](auto elem)
    {
        return elem.first == TargetID && elem.second.active;
    }) != m_EnmityList.end();
}

/************************************************************************
*                                                                       *
*                                                                       *
*                                                                       *
************************************************************************/

void CEnmityContainer::UpdateEnmityFromCure(CBattleEntity* PEntity, uint8 level, uint16 CureAmount, bool isCureV)
{
    if (!IsWithinEnmityRange(PEntity))
        return;

    int16 CE;
    int16 VE;
    float bonus = CalculateEnmityBonus(PEntity);
    float tranquilHeartReduction = 1.f - battleutils::HandleTranquilHeart(PEntity);
    
    if (isCureV)
    {
        CE = (int16)(400 * bonus * tranquilHeartReduction);
        VE = (int16)(700 * bonus * tranquilHeartReduction);
    }
    else
    {
        CureAmount = (CureAmount < 1 ? 1 : CureAmount);

        auto mod = battleutils::GetEnmityModCure(level);

        CE = (int16)(40. / mod * CureAmount * bonus * tranquilHeartReduction);
        VE = (int16)(240. / mod * CureAmount * bonus * tranquilHeartReduction);
    }

    auto enmity_obj = m_EnmityList.find(PEntity->id);

    if (enmity_obj != m_EnmityList.end())
    {
        enmity_obj->second.CE = std::clamp(enmity_obj->second.CE + CE, 0, 10000);
        enmity_obj->second.VE = std::clamp(enmity_obj->second.VE + VE, 0, 10000);
        enmity_obj->second.active = true;
    }
    else
        m_EnmityList.emplace(PEntity->id, EnmityObject_t{ PEntity, std::clamp<int16>(CE, 0, 10000), std::clamp<int16>(VE, 0, 10000), true, 0 });
}

/************************************************************************
*                                                                       *
*    Lower enmity by percent %                                          *
*                                                                       *
************************************************************************/

void CEnmityContainer::LowerEnmityByPercent(CBattleEntity* PEntity, uint8 percent, CBattleEntity* HateReceiver)
{

    auto enmity_obj = m_EnmityList.find(PEntity->id);

    if (enmity_obj != m_EnmityList.end())
    {
        float mod = ((float)(percent) / 100.0f);

        auto CEValue = (int16)(enmity_obj->second.CE * mod);
        enmity_obj->second.CE -= (CEValue < 0 ? 0 : CEValue);

        auto VEValue = (int16)(enmity_obj->second.VE * mod);
        enmity_obj->second.VE -= (VEValue < 0 ? 0 : VEValue);


        // transfer hate if HateReceiver not nullptr
        if (HateReceiver != nullptr)
        {
            UpdateEnmity(HateReceiver, CEValue, VEValue);
        }
    }
}

/************************************************************************
*                                                                       *
*    Returns the CE or VE for the current entity                        *
*                                                                       *
************************************************************************/

uint16 CEnmityContainer::GetCE(CBattleEntity* PEntity)
{
    auto PEnmity = m_EnmityList.find(PEntity->id);
    return PEnmity != m_EnmityList.end() ? PEnmity->second.CE : 0;
}

uint16 CEnmityContainer::GetVE(CBattleEntity* PEntity)
{
    auto PEnmity = m_EnmityList.find(PEntity->id);
    return PEnmity != m_EnmityList.end() ? PEnmity->second.VE : 0;
}

/************************************************************************
*                                                                       *
*    Sets the CE or VE for the current entity                           *
*                                                                       *
************************************************************************/

void CEnmityContainer::SetCE(CBattleEntity* PEntity, uint16 amount)
{
    auto PEnmity = m_EnmityList.find(PEntity->id);
    if (PEnmity != m_EnmityList.end())
    {
        PEnmity->second.CE = amount;
    }
    else
    {
        AddBaseEnmity(PEntity);
        SetCE(PEntity, amount);
    }
}

void CEnmityContainer::SetVE(CBattleEntity* PEntity, uint16 amount)
{
    auto PEnmity = m_EnmityList.find(PEntity->id);
    if (PEnmity != m_EnmityList.end())
    {
        PEnmity->second.VE = amount;
    }
    else
    {
        AddBaseEnmity(PEntity);
        SetVE(PEntity, amount);
    }
}

/************************************************************************
*                                                                       *
*                                                                       *
*                                                                       *
************************************************************************/

void CEnmityContainer::UpdateEnmityFromDamage(CBattleEntity* PEntity, uint16 Damage)
{
    Damage = (Damage < 1 ? 1 : Damage);

    uint16 mod = battleutils::GetEnmityModDamage(PEntity->GetMLevel()); //default fallback

    if (m_EnmityHolder != nullptr) {//use the correct mod value
        mod = battleutils::GetEnmityModDamage(m_EnmityHolder->GetMLevel());
    }

    auto CE = (int16)((80.0f / mod) * Damage);
    auto VE = (int16)((240.0f / mod) * Damage);

    UpdateEnmity(PEntity, CE, VE);

    if (m_EnmityHolder && m_EnmityHolder->m_HiPCLvl < PEntity->GetMLevel())
        m_EnmityHolder->m_HiPCLvl = PEntity->GetMLevel();
}

/************************************************************************
*                                                                       *
*                                                                       *
*                                                                       *
************************************************************************/

void CEnmityContainer::UpdateEnmityFromAttack(CBattleEntity* PEntity, uint16 Damage)
{
    if (m_EnmityList.find(PEntity->id) == m_EnmityList.end())
    {
        return;
    }
    float reduction = (100.f - std::min<int16>(PEntity->getMod(Mod::ENMITY_LOSS_REDUCTION), 100)) / 100.0f;
    int16 CE = (int16)(-(1800 * Damage / PEntity->GetMaxHP()) * reduction);

    auto enmity_obj = m_EnmityList.find(PEntity->id);

    if (enmity_obj != m_EnmityList.end())
    {
        enmity_obj->second.CE = std::clamp(enmity_obj->second.CE + CE, 0, 10000);
    }
}

/************************************************************************
*                                                                       *
*  Decay Enmity, Get Entity with the highest enmity                     *
*                                                                       *
************************************************************************/

CBattleEntity* CEnmityContainer::GetHighestEnmity()
{
    if (m_EnmityList.empty())
    {
        return nullptr;
    }
    uint32 HighestEnmity = 0;
    auto highest = m_EnmityList.end();
    bool active = false;

    for (auto it = m_EnmityList.begin(); it != m_EnmityList.end(); ++it)
    {
        const EnmityObject_t& PEnmityObject = it->second;
        uint32 Enmity = PEnmityObject.CE + PEnmityObject.VE;

        if (Enmity >= HighestEnmity && ((PEnmityObject.active == active) || (PEnmityObject.active && !active)))
        {
            auto POwner = PEnmityObject.PEnmityOwner;
            if (!POwner || (POwner->allegiance != m_EnmityHolder->allegiance))
            {
                active = PEnmityObject.active;
                HighestEnmity = Enmity;
                highest = it;
            }
        }
    }
    CBattleEntity* PEntity = nullptr;
    if (highest != m_EnmityList.end())
    {
        PEntity = highest->second.PEnmityOwner;
        if (!PEntity)
        {
            PEntity = zoneutils::GetChar(highest->first);
        }
        if (!PEntity || PEntity->getZone() != m_EnmityHolder->getZone() ||
            PEntity->PInstance != m_EnmityHolder->PInstance)
        {
            m_EnmityList.erase(highest);
            PEntity = GetHighestEnmity();
        }

    }
    return PEntity;
}

void CEnmityContainer::DecayEnmity()
{
    for (auto it = m_EnmityList.begin(); it != m_EnmityList.end(); ++it)
    {
        EnmityObject_t& PEnmityObject = it->second;
        constexpr int decay_amount = (int)(60 / server_tick_rate);

        PEnmityObject.VE -= PEnmityObject.VE > decay_amount ? decay_amount : PEnmityObject.VE;
        //ShowDebug("%d: active: %d CE: %d VE: %d\n", it->first, PEnmityObject.active, PEnmityObject.CE, PEnmityObject.VE);
    }
}

bool CEnmityContainer::IsWithinEnmityRange(CBattleEntity* PEntity)
{
    return distance(m_EnmityHolder->loc.p, PEntity->loc.p) <= m_EnmityHolder->m_enmityRange;
}

uint8 CEnmityContainer::GetHighestTH()
{
    CBattleEntity* PEntity = nullptr;
    uint8 THLvl = 0;

    for (auto it = m_EnmityList.cbegin(); it != m_EnmityList.cend(); ++it)
    {
        const EnmityObject_t& PEnmityObject = it->second;
        PEntity = PEnmityObject.PEnmityOwner;

        if (PEntity != nullptr && !PEntity->isDead() && IsWithinEnmityRange(PEntity) && PEnmityObject.maxTH > THLvl)
            THLvl = PEnmityObject.maxTH;
    }

    return THLvl;
}

EnmityList_t* CEnmityContainer::GetEnmityList()
{
    return &m_EnmityList;
}

bool CEnmityContainer::IsTameable()
{
    return m_tameable;
}
