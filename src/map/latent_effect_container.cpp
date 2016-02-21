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

#include "latent_effect_container.h"

#include "latent_effect.h"
#include "entities/charentity.h"
#include "entities/battleentity.h"
#include "utils/zoneutils.h"
#include "conquest_system.h"
#include "modifier.h"
#include "items/item_weapon.h"
#include "status_effect_container.h"
#include "ai/ai_container.h"

#include "time_server.h"

CLatentEffectContainer::CLatentEffectContainer(CCharEntity* PEntity)
    :m_POwner(PEntity)
{
    m_LatentEffectList.reserve(32);
}

CLatentEffectContainer::~CLatentEffectContainer()
{
    for (uint16 i = 0; i < m_LatentEffectList.size(); ++i)
    {
        delete m_LatentEffectList.at(i);
    }
}

/************************************************************************
*																		*
*  Adds new latent effect to the character.								*
*																		*
************************************************************************/

void CLatentEffectContainer::AddLatentEffect(CLatentEffect* LatentEffect)
{
    m_LatentEffectList.push_back(LatentEffect);
    LatentEffect->SetOwner(m_POwner);
}

void CLatentEffectContainer::AddLatentEffects(std::vector<CLatentEffect*> *latentList, uint8 reqLvl, uint8 slot)
{
    for (uint16 i = 0; i < latentList->size(); ++i)
    {
        if (m_POwner->GetMLevel() >= reqLvl || latentList->at(i)->GetConditionsValue() == LATENT_JOB_LEVEL_ABOVE)
        {
            if (latentList->at(i)->GetModValue() == MOD_MAIN_DMG_RATING && slot == SLOT_SUB)
            {
                AddLatentEffect(new CLatentEffect(latentList->at(i)->GetConditionsID(),
                    latentList->at(i)->GetConditionsValue(), slot, MOD_SUB_DMG_RATING,
                    latentList->at(i)->GetModPower()));
            }
            else {
                AddLatentEffect(new CLatentEffect(latentList->at(i)->GetConditionsID(),
                    latentList->at(i)->GetConditionsValue(), slot, latentList->at(i)->GetModValue(),
                    latentList->at(i)->GetModPower()));
            }
        }
    }
}

/************************************************************************
*																		*
*  Removes all latent effects associated with a specified slot			*
*																		*
************************************************************************/

void CLatentEffectContainer::DelLatentEffects(uint8 reqLvl, uint8 slot)
{
    for (int16 i = m_LatentEffectList.size() - 1; i >= 0; --i)
    {
        if (m_LatentEffectList.at(i)->GetSlot() == slot)
        {
            CLatentEffect* latent = m_LatentEffectList.at(i);
            if (latent->IsActivated())
            {
                latent->Deactivate();
            }
            m_LatentEffectList.erase(m_LatentEffectList.begin() + i);
            delete latent;
        }
    }
}

/************************************************************************
*																		*
*  Checks all latents that are affected by HP and activates them if  	*
*  the conditions are met.												*
*																		*
************************************************************************/

void CLatentEffectContainer::CheckLatentsHP(int32 hp)
{
    //TODO: hook into this from anywhere HP changes
    for (uint16 i = 0; i < m_LatentEffectList.size(); ++i)
    {
        switch (m_LatentEffectList.at(i)->GetConditionsID())
        {
        case LATENT_HP_UNDER_PERCENT:
            if (((float)hp / m_POwner->health.maxhp) * 100 <= m_LatentEffectList.at(i)->GetConditionsValue())
            {
                m_LatentEffectList.at(i)->Activate();
            }
            else
            {
                m_LatentEffectList.at(i)->Deactivate();
            }
            break;
        case LATENT_HP_OVER_PERCENT:
            if (((float)hp / m_POwner->health.maxhp) * 100 >= m_LatentEffectList.at(i)->GetConditionsValue())
            {
                m_LatentEffectList.at(i)->Activate();
            }
            else
            {
                m_LatentEffectList.at(i)->Deactivate();
            }
            break;
        case LATENT_HP_UNDER_TP_UNDER_100:
            if (((float)hp / m_POwner->health.maxhp) * 100 <= m_LatentEffectList.at(i)->GetConditionsValue() && m_POwner->health.tp < 1000)
            {
                m_LatentEffectList.at(i)->Activate();
            }
            else
            {
                m_LatentEffectList.at(i)->Deactivate();
            }
            break;
        case LATENT_HP_OVER_TP_UNDER_100:
            if (((float)hp / m_POwner->health.maxhp) * 100 >= m_LatentEffectList.at(i)->GetConditionsValue() && m_POwner->health.tp < 1000)
            {
                m_LatentEffectList.at(i)->Activate();
            }
            else
            {
                m_LatentEffectList.at(i)->Deactivate();
            }
            break;
            //case LATENT_HP_OVER_VISIBLE_GEAR:
            //    {
            //    //TODO: figure out if this is actually right
            //    CItemArmor* head = (CItemArmor*)(m_POwner->getStorage(LOC_INVENTORY)->GetItem(m_POwner->equip[SLOT_HEAD]));
            //    CItemArmor* body = (CItemArmor*)(m_POwner->getStorage(LOC_INVENTORY)->GetItem(m_POwner->equip[SLOT_BODY]));
            //    CItemArmor* hands = (CItemArmor*)(m_POwner->getStorage(LOC_INVENTORY)->GetItem(m_POwner->equip[SLOT_HANDS]));
            //    CItemArmor* legs = (CItemArmor*)(m_POwner->getStorage(LOC_INVENTORY)->GetItem(m_POwner->equip[SLOT_LEGS]));
            //    CItemArmor* feet = (CItemArmor*)(m_POwner->getStorage(LOC_INVENTORY)->GetItem(m_POwner->equip[SLOT_FEET]));

            //    int32 visibleHp = 0;
            //    visibleHp += (head ? head->getModifier(MOD_HP) : 0);
            //    visibleHp += (body ? body->getModifier(MOD_HP) : 0);
            //    visibleHp += (hands ? hands->getModifier(MOD_HP) : 0);
            //    visibleHp += (legs ? legs->getModifier(MOD_HP) : 0);
            //    visibleHp += (feet ? feet->getModifier(MOD_HP) : 0);

            //    //TODO: add mp percent too
            //    if ((float)( hp / ((m_POwner->health.hp - m_POwner->health.modhp) + (m_POwner->PMeritPoints->GetMerit(MERIT_MAX_HP)->count * 10 ) + 
            //        visibleHp) ) <= m_LatentEffectList.at(i)->GetConditionsValue())
            //    {
            //        m_LatentEffectList.at(i)->Activate();
            //    }
            //    else
            //    {
            //        m_LatentEffectList.at(i)->Deactivate();
            //    }
            //    }
            //    break;
        default:
            break;
        }
    }
}

/************************************************************************
*																		*
*  Checks all latents that are affected by TP and activates them if  	*
*  the conditions are met.												*
*																		*
************************************************************************/

void CLatentEffectContainer::CheckLatentsTP(int16 tp)
{
    for (uint16 i = 0; i < m_LatentEffectList.size(); ++i)
    {
        switch (m_LatentEffectList.at(i)->GetConditionsID())
        {
        case LATENT_TP_UNDER:
            if (m_POwner->health.tp < m_LatentEffectList.at(i)->GetConditionsValue())
            {
                m_LatentEffectList.at(i)->Activate();
            }
            else
            {
                m_LatentEffectList.at(i)->Deactivate();
            }
            break;
        case LATENT_TP_OVER:
            if (m_POwner->health.tp > m_LatentEffectList.at(i)->GetConditionsValue())
            {
                m_LatentEffectList.at(i)->Activate();
            }
            else
            {
                m_LatentEffectList.at(i)->Deactivate();
            }
            break;
        case LATENT_HP_UNDER_TP_UNDER_100:
            if (((float)m_POwner->health.hp / (float)m_POwner->health.maxhp) * 100 <= m_LatentEffectList.at(i)->GetConditionsValue() && m_POwner->health.tp < 1000)
            {
                m_LatentEffectList.at(i)->Activate();
            }
            else
            {
                m_LatentEffectList.at(i)->Deactivate();
            }
            break;
        case LATENT_HP_OVER_TP_UNDER_100:
            if (((float)m_POwner->health.hp / (float)m_POwner->health.maxhp) * 100 >= m_LatentEffectList.at(i)->GetConditionsValue() && m_POwner->health.tp < 1000)
            {
                m_LatentEffectList.at(i)->Activate();
            }
            else
            {
                m_LatentEffectList.at(i)->Deactivate();
            }
            break;
        default:
            break;
        }
    }
}

/************************************************************************
*																		*
*  Checks all latents that are affected by MP and activates them if  	*
*  the conditions are met.												*
*																		*
************************************************************************/

void CLatentEffectContainer::CheckLatentsMP(int32 mp)
{
    //TODO: hook into this from anywhere MP changes
    for (uint16 i = 0; i < m_LatentEffectList.size(); ++i)
    {
        switch (m_LatentEffectList.at(i)->GetConditionsID())
        {
        case LATENT_MP_UNDER_PERCENT:
            if (m_POwner->health.maxmp && (float)(mp / m_POwner->health.maxmp) * 100 <= m_LatentEffectList.at(i)->GetConditionsValue())
            {
                m_LatentEffectList.at(i)->Activate();
            }
            else
            {
                m_LatentEffectList.at(i)->Deactivate();
            }
            break;
        case LATENT_MP_UNDER:
            if (mp <= m_LatentEffectList.at(i)->GetConditionsValue())
            {
                m_LatentEffectList.at(i)->Activate();
            }
            else
            {
                m_LatentEffectList.at(i)->Deactivate();
            }
            break;
        case LATENT_MP_OVER:
            if (mp >= m_LatentEffectList.at(i)->GetConditionsValue())
            {
               m_LatentEffectList.at(i)->Activate();
            }
            else
            {
               m_LatentEffectList.at(i)->Deactivate();
            }
            break;
        case LATENT_WEAPON_DRAWN_MP_OVER:
            if (mp > m_LatentEffectList.at(i)->GetConditionsValue() && m_POwner->animation == ANIMATION_ATTACK)
            {
                m_LatentEffectList.at(i)->Activate();
            }
            else
            {
                m_LatentEffectList.at(i)->Deactivate();
            }
            break;
            //case LATENT_MP_UNDER_VISIBLE_GEAR:
            //    {
            //    //TODO: figure out if this is actually right
            //    CItemArmor* head = (CItemArmor*)(m_POwner->getStorage(LOC_INVENTORY)->GetItem(m_POwner->equip[SLOT_HEAD]));
            //    CItemArmor* body = (CItemArmor*)(m_POwner->getStorage(LOC_INVENTORY)->GetItem(m_POwner->equip[SLOT_BODY]));
            //    CItemArmor* hands = (CItemArmor*)(m_POwner->getStorage(LOC_INVENTORY)->GetItem(m_POwner->equip[SLOT_HANDS]));
            //    CItemArmor* legs = (CItemArmor*)(m_POwner->getStorage(LOC_INVENTORY)->GetItem(m_POwner->equip[SLOT_LEGS]));
            //    CItemArmor* feet = (CItemArmor*)(m_POwner->getStorage(LOC_INVENTORY)->GetItem(m_POwner->equip[SLOT_FEET]));

            //    int32 visibleMp = 0;
            //    visibleMp += (head ? head->getModifier(MOD_MP) : 0);
            //    visibleMp += (body ? body->getModifier(MOD_MP) : 0);
            //    visibleMp += (hands ? hands->getModifier(MOD_MP) : 0);
            //    visibleMp += (legs ? legs->getModifier(MOD_MP) : 0);
            //    visibleMp += (feet ? feet->getModifier(MOD_MP) : 0);

            //    //TODO: add mp percent too
            //    if ((float)( mp / ((m_POwner->health.mp - m_POwner->health.modmp) + (m_POwner->PMeritPoints->GetMerit(MERIT_MAX_MP)->count * 10 ) + 
            //        visibleMp) ) <= m_LatentEffectList.at(i)->GetConditionsValue())
            //    {
            //        m_LatentEffectList.at(i)->Activate();
            //    }
            //    else
            //    {
            //        m_LatentEffectList.at(i)->Deactivate();
            //    }
            //    }
            //    break;
        default:
            break;
        }
    }
}

/************************************************************************
*																		*
*  Checks all latents for a given slot (ie. on equip)					*
*																		*
************************************************************************/

void CLatentEffectContainer::CheckLatentsEquip(uint8 slot)
{
    for (uint16 i = 0; i < m_LatentEffectList.size(); ++i)
    {
        if (m_LatentEffectList.at(i)->GetSlot() == slot)
        {
            switch (m_LatentEffectList.at(i)->GetConditionsID())
            {
            case LATENT_HP_UNDER_PERCENT:
                if (((float)m_POwner->health.hp / m_POwner->health.maxhp) * 100 <= m_LatentEffectList.at(i)->GetConditionsValue())
                {
                    m_LatentEffectList.at(i)->Activate();
                }
                else
                {
                    m_LatentEffectList.at(i)->Deactivate();
                }
                break;
            case LATENT_HP_OVER_PERCENT:
                if (((float)m_POwner->health.hp / m_POwner->health.maxhp) * 100 >= m_LatentEffectList.at(i)->GetConditionsValue())
                {
                    m_LatentEffectList.at(i)->Activate();
                }
                else
                {
                    m_LatentEffectList.at(i)->Deactivate();
                }
                break;
            case LATENT_HP_UNDER_TP_UNDER_100:
                if (((float)m_POwner->health.hp / m_POwner->health.maxhp) * 100 <= m_LatentEffectList.at(i)->GetConditionsValue() && m_POwner->health.tp < 1000)
                {
                    m_LatentEffectList.at(i)->Activate();
                }
                else
                {
                    m_LatentEffectList.at(i)->Deactivate();
                }
                break;
            case LATENT_HP_OVER_TP_UNDER_100:
                if (((float)m_POwner->health.hp / m_POwner->health.maxhp) * 100 >= m_LatentEffectList.at(i)->GetConditionsValue() && m_POwner->health.tp < 1000)
                {
                    m_LatentEffectList.at(i)->Activate();
                }
                else
                {
                    m_LatentEffectList.at(i)->Deactivate();
                }
                break;
            case LATENT_MP_UNDER_PERCENT:
                if (m_POwner->health.maxmp && (float)(m_POwner->health.mp / m_POwner->health.maxmp) * 100 <= m_LatentEffectList.at(i)->GetConditionsValue())
                {
                    m_LatentEffectList.at(i)->Activate();
                }
                else
                {
                    m_LatentEffectList.at(i)->Deactivate();
                }
                break;
            case LATENT_MP_UNDER:
                if (m_POwner->health.mp <= m_LatentEffectList.at(i)->GetConditionsValue())
                {
                    m_LatentEffectList.at(i)->Activate();
                }
                else
                {
                    m_LatentEffectList.at(i)->Deactivate();
                }
                break;
            case LATENT_MP_OVER:
                if (m_POwner->health.mp >= m_LatentEffectList.at(i)->GetConditionsValue())
                {
                    m_LatentEffectList.at(i)->Activate();
                }
                else
                {
                    m_LatentEffectList.at(i)->Deactivate();
                }
                break;
            case LATENT_WEAPON_DRAWN_MP_OVER:
                if (m_POwner->health.mp > m_LatentEffectList.at(i)->GetConditionsValue() && m_POwner->animation == ANIMATION_ATTACK)
                {
                    m_LatentEffectList.at(i)->Activate();
                }
                else
                {
                    m_LatentEffectList.at(i)->Deactivate();
                }
                break;
            case LATENT_TP_UNDER:
                if (m_POwner->health.tp < m_LatentEffectList.at(i)->GetConditionsValue())
                {
                    m_LatentEffectList.at(i)->Activate();
                }
                else
                {
                    m_LatentEffectList.at(i)->Deactivate();
                }
                break;
            case LATENT_TP_OVER:
                if (m_POwner->health.tp > m_LatentEffectList.at(i)->GetConditionsValue())
                {
                    m_LatentEffectList.at(i)->Activate();
                }
                else
                {
                    m_LatentEffectList.at(i)->Deactivate();
                }
                break;
            case LATENT_PET_ID:
                if (m_POwner->PPet && m_POwner->PPet->objtype == TYPE_PET && ((CPetEntity*)m_POwner->PPet)->m_PetID == m_LatentEffectList.at(i)->GetConditionsValue())
                {
                    m_LatentEffectList.at(i)->Activate();
                }
                else
                {
                    m_LatentEffectList.at(i)->Deactivate();
                }
                break;
            case LATENT_SUBJOB:
                if (m_POwner->GetSJob() == m_LatentEffectList.at(i)->GetConditionsValue())
                {
                    m_LatentEffectList.at(i)->Activate();
                }
                break;
            case LATENT_WEAPON_BROKEN:
            {
                CItemWeapon* PWeaponMain = (CItemWeapon*)m_POwner->getEquip(SLOT_MAIN);
                CItemWeapon* PWeaponSub = (CItemWeapon*)m_POwner->getEquip(SLOT_SUB);
                CItemWeapon* PWeaponRanged = (CItemWeapon*)m_POwner->getEquip(SLOT_RANGED);
                if (PWeaponMain && PWeaponMain->isUnlocked() && m_LatentEffectList.at(i)->GetSlot() == SLOT_MAIN)
                {
                    m_LatentEffectList.at(i)->Activate();
                }
                if (PWeaponSub && PWeaponSub->isUnlocked() && m_LatentEffectList.at(i)->GetSlot() == SLOT_SUB)
                {
                    m_LatentEffectList.at(i)->Activate();
                }
                if (PWeaponRanged && PWeaponRanged->isUnlocked() && m_LatentEffectList.at(i)->GetSlot() == SLOT_RANGED)
                {
                    m_LatentEffectList.at(i)->Activate();
                }
                break;
            }
            case LATENT_ZONE:
                if (m_LatentEffectList.at(i)->GetConditionsValue() == m_POwner->getZone())
                {
                    m_LatentEffectList.at(i)->Activate();
                }
                else
                {
                    m_LatentEffectList.at(i)->Deactivate();
                }
                break;
            case LATENT_ZONE_HOME_NATION:
                CheckLatentsZone();
                break;
            case LATENT_IN_DYNAMIS:
                if (m_POwner->isInDynamis())
                {
                    m_LatentEffectList.at(i)->Activate();
                }
                else
                {
                    m_LatentEffectList.at(i)->Deactivate();
                }
                break;
            case LATENT_FOOD_ACTIVE:
            case LATENT_NO_FOOD_ACTIVE:
                CheckLatentsFoodEffect();
                break;
            case LATENT_STATUS_EFFECT_ACTIVE:
                CheckLatentsStatusEffect();
                break;
            case LATENT_JOB_IN_PARTY:
                CheckLatentsPartyJobs();
                break;
            case LATENT_PARTY_MEMBERS:
            case LATENT_PARTY_MEMBERS_IN_ZONE:
            {
                if (m_POwner->PParty != nullptr)
                    CheckLatentsPartyMembers(m_POwner->PParty->members.size());
            }
            break;
            case LATENT_AVATAR_IN_PARTY:
                CheckLatentsPartyAvatar();
                break;
            case LATENT_MOON_PHASE:
                CheckLatentsMoonPhase();
                break;
            case LATENT_TIME_OF_DAY:
                CheckLatentsDay();
                break;
            case LATENT_HOUR_OF_DAY:
                CheckLatentsHours();
                break;

            case LATENT_FIRESDAY:
            case LATENT_EARTHSDAY:
            case LATENT_WATERSDAY:
            case LATENT_WINDSDAY:
            case LATENT_DARKSDAY:
            case LATENT_ICEDAY:
            case LATENT_LIGHTNINGSDAY:
            case LATENT_LIGHTSDAY:
                CheckLatentsWeekDay();
                break;
            case LATENT_JOB_LEVEL_EVEN:
                if (m_POwner->GetMLevel() % 2 == 0)
                {
                    m_LatentEffectList.at(i)->Activate();
                }
                else
                {
                    m_LatentEffectList.at(i)->Deactivate();
                }
                break;
            case LATENT_JOB_LEVEL_ODD:
                if (m_POwner->GetMLevel() % 2 == 1)
                {
                    m_LatentEffectList.at(i)->Activate();
                }
                else
                {
                    m_LatentEffectList.at(i)->Deactivate();
                }
                break;
            case LATENT_JOB_MULTIPLE_5:
                if (m_POwner->GetMLevel() % 5 == 0)
                {
                    m_LatentEffectList.at(i)->Activate();
                }
                else
                {
                    m_LatentEffectList.at(i)->Deactivate();
                }
                break;
            case LATENT_JOB_MULTIPLE_10:
                if (m_POwner->GetMLevel() % 10 == 0)
                {
                    m_LatentEffectList.at(i)->Activate();
                }
                else
                {
                    m_LatentEffectList.at(i)->Deactivate();
                }
                break;
            case LATENT_JOB_MULTIPLE_13_NIGHT:
            {
                TIMETYPE VanadielTOTD = CVanaTime::getInstance()->SyncTime();
                if (m_POwner->GetMLevel() % 13 == 0 && (VanadielTOTD == TIME_NIGHT))
                {
                    m_LatentEffectList.at(i)->Activate();
                }
                else
                {
                    m_LatentEffectList.at(i)->Deactivate();
                }
            }
            break;
            case LATENT_JOB_LEVEL_BELOW:
                if (m_POwner->GetMLevel() < m_LatentEffectList.at(i)->GetConditionsValue())
                {
                    m_LatentEffectList.at(i)->Activate();
                }
                else
                {
                    m_LatentEffectList.at(i)->Deactivate();
                }
                break;
            case LATENT_JOB_LEVEL_ABOVE:
                if (m_POwner->GetMLevel() >= m_LatentEffectList.at(i)->GetConditionsValue())
                {
                    m_LatentEffectList.at(i)->Activate();
                }
                else
                {
                    m_LatentEffectList.at(i)->Deactivate();
                }
                break;
            case LATENT_WEATHER_ELEMENT:
                if (zoneutils::GetWeatherElement(zoneutils::GetZone(m_POwner->getZone())->GetWeather()) == m_LatentEffectList.at(i)->GetConditionsValue())
                {
                    m_LatentEffectList.at(i)->Activate();
                }
                else
                {
                    m_LatentEffectList.at(i)->Deactivate();
                }
                break;
            case LATENT_NATION_CONTROL:
                CheckLatentsZone();
                break;
            case LATENT_WEAPON_DRAWN:
            case LATENT_WEAPON_DRAWN_HP_UNDER:
            case LATENT_WEAPON_SHEATHED:
            {
                CheckLatentsWeaponDraw(m_POwner->animation == ANIMATION_ATTACK);
            }
            break;
            case LATENT_SONG_ROLL_ACTIVE:
                    CheckLatentsRollSong(m_POwner->StatusEffectContainer->HasStatusEffectByFlag(EFFECTFLAG_ROLL | EFFECTFLAG_SONG));
                break;
            default:
                ShowWarning("Latent ID %d unhandled in CheckLatentsEquip\n", m_LatentEffectList.at(i)->GetConditionsID());
                break;
            }
        }
    }
    m_POwner->UpdateHealth();
}

/************************************************************************
*																		*
*  Checks all latents that are affected by drawn weapon and activates  	*
*  them if the conditions are met.										*
*																		*
************************************************************************/

//easy: when animationType changes to ANIMATION_ATTACK or to something else
void CLatentEffectContainer::CheckLatentsWeaponDraw(bool drawn)
{
    if (drawn)
    {
        for (uint16 i = 0; i < m_LatentEffectList.size(); ++i)
        {
            switch (m_LatentEffectList.at(i)->GetConditionsID())
            {
            case LATENT_WEAPON_DRAWN:
                m_LatentEffectList.at(i)->Activate();
                break;
            case LATENT_WEAPON_DRAWN_HP_UNDER:
                //todo: hp drain
                break;
            case LATENT_WEAPON_SHEATHED:
                m_LatentEffectList.at(i)->Deactivate();
            default:
                break;
            }
        }
    }
    else
    {
        for (uint16 i = 0; i < m_LatentEffectList.size(); ++i)
        {
            switch (m_LatentEffectList.at(i)->GetConditionsID())
            {
            case LATENT_WEAPON_DRAWN:
            case LATENT_WEAPON_DRAWN_HP_UNDER:
                m_LatentEffectList.at(i)->Deactivate();
                break;
            case LATENT_WEAPON_SHEATHED:
                m_LatentEffectList.at(i)->Activate();
            default:
                break;
            }
        }
    }
}

/************************************************************************
*																		*
*  Checks all latents that are affected by status effects and activates	*
*  them if the conditions are met.										*
*																		*
************************************************************************/

void CLatentEffectContainer::CheckLatentsStatusEffect()
{
    for (uint16 i = 0; i < m_LatentEffectList.size(); ++i)
    {
        if (m_LatentEffectList.at(i)->GetConditionsID() == LATENT_STATUS_EFFECT_ACTIVE)
        {
            if (m_POwner->StatusEffectContainer->HasStatusEffect((EFFECT)m_LatentEffectList.at(i)->GetConditionsValue()))
            {
                m_LatentEffectList.at(i)->Activate();
            }
            else
            {
                m_LatentEffectList.at(i)->Deactivate();
            }
        }
    }
}

/************************************************************************
*																		*
*  Checks latents that are affected by food effects. Usage:				*
*  LATENT_FOOD_ACTIVE: (49,foodItemId)									*
*  LATENT_NO_FOOD_ACTIVE: (14,0)										*
*																		*
************************************************************************/

void CLatentEffectContainer::CheckLatentsFoodEffect()
{

    for (uint16 i = 0; i < m_LatentEffectList.size(); ++i)
    {
        if (m_LatentEffectList.at(i)->GetConditionsID() == LATENT_FOOD_ACTIVE)
        {
            if (m_POwner->StatusEffectContainer->HasStatusEffect(EFFECT_FOOD) &&
                m_POwner->StatusEffectContainer->GetStatusEffect(EFFECT_FOOD)->GetSubID() == m_LatentEffectList.at(i)->GetConditionsValue())
            {
                m_LatentEffectList.at(i)->Activate();
            }
            else
            {
                m_LatentEffectList.at(i)->Deactivate();
            }
        }
        if (m_LatentEffectList.at(i)->GetConditionsID() == LATENT_NO_FOOD_ACTIVE)
        {
            if (!m_POwner->StatusEffectContainer->HasStatusEffect(EFFECT_FOOD))
            {
                m_LatentEffectList.at(i)->Activate();
            }
            else
            {
                m_LatentEffectList.at(i)->Deactivate();
            }
        }
    }
    m_POwner->UpdateHealth();
}

/************************************************************************
*																		*
*  Checks all latents that are affected by rolls or songs and activates *
*  them if the conditions are met.										*
*																		*
************************************************************************/

void CLatentEffectContainer::CheckLatentsRollSong(bool active)
{
    for (uint16 i = 0; i < m_LatentEffectList.size(); ++i)
    {
        if (m_LatentEffectList.at(i)->GetConditionsID() == LATENT_SONG_ROLL_ACTIVE)
        {
            if (active)
            {
                m_LatentEffectList.at(i)->Activate();
            }
            else
            {
                m_LatentEffectList.at(i)->Deactivate();
            }
        }
    }
}

/************************************************************************
*																		*
*  Checks all latents that are affected by day or moon and activates	*
*  them if the conditions are met.										*
*																		*
************************************************************************/

//probably call this at 00:00 vana time only
void CLatentEffectContainer::CheckLatentsDay()
{

    TIMETYPE VanadielTOTD = CVanaTime::getInstance()->SyncTime();
    uint32 VanadielHour = CVanaTime::getInstance()->getHour();

    for (uint16 i = 0; i < m_LatentEffectList.size(); ++i)
    {
        /* Time of Day */

        if (m_LatentEffectList.at(i)->GetConditionsID() == LATENT_TIME_OF_DAY)
        {

            //daytime: 06:00 to 18:00
            if (m_LatentEffectList.at(i)->GetConditionsValue() == 0)
            {
                if (VanadielHour > 5 && VanadielHour < 18)
                {
                    if (m_LatentEffectList.at(i)->IsActivated())
                        m_LatentEffectList.at(i)->Deactivate();

                    m_LatentEffectList.at(i)->Activate();
                }
                else
                {
                    if (m_LatentEffectList.at(i)->IsActivated())
                    {
                        m_LatentEffectList.at(i)->Deactivate();
                    }
                }
            }

            //nighttime: 18:00 to 06:00
            if (m_LatentEffectList.at(i)->GetConditionsValue() == 1)
            {
                if ((VanadielHour >= 18) || (VanadielHour < 6))
                {
                    if (m_LatentEffectList.at(i)->IsActivated())
                        m_LatentEffectList.at(i)->Deactivate();

                    m_LatentEffectList.at(i)->Activate();
                }
                else
                {
                    if (m_LatentEffectList.at(i)->IsActivated())
                    {
                        m_LatentEffectList.at(i)->Deactivate();
                    }
                }
            }

            //dusk - dawn: 17:00 to 7:00
            if (m_LatentEffectList.at(i)->GetConditionsValue() == 2)
            {
                if ((VanadielHour >= 17) || (VanadielHour < 7))
                {
                    if (m_LatentEffectList.at(i)->IsActivated())
                        m_LatentEffectList.at(i)->Deactivate();

                    m_LatentEffectList.at(i)->Activate();
                }
                else
                {
                    if (m_LatentEffectList.at(i)->IsActivated())
                    {
                        m_LatentEffectList.at(i)->Deactivate();
                    }
                }
            }
        }
    }
    m_POwner->UpdateHealth();
}

/************************************************************************
*																		*
*  Checks latents affected by the moon phase and activates them			*
*																		*
************************************************************************/
void CLatentEffectContainer::CheckLatentsMoonPhase()
{
    for (uint16 i = 0; i < m_LatentEffectList.size(); ++i)
    {
        if (m_LatentEffectList.at(i)->GetConditionsID() == LATENT_MOON_PHASE)
        {
            uint32 MoonPhase = CVanaTime::getInstance()->getMoonPhase();
            uint32 MoonDirection = CVanaTime::getInstance()->getMoonDirection(); //directions: 1 = waning, 2 = waxing, 0 = neither
            //New Moon - 10% waning -> 5% waxing
            if (m_LatentEffectList.at(i)->GetConditionsValue() == 0)
            {
                if (MoonPhase <= 5)
                {
                    if (!m_LatentEffectList.at(i)->IsActivated())
                    {
                        m_LatentEffectList.at(i)->Activate();
                    }
                }
                else if (MoonPhase <= 10 && MoonDirection == 1) //only 10%- if waning
                {
                    if (!m_LatentEffectList.at(i)->IsActivated())
                    {
                        m_LatentEffectList.at(i)->Activate();
                    }
                }
                else
                {
                    if (m_LatentEffectList.at(i)->IsActivated())
                    {
                        m_LatentEffectList.at(i)->Deactivate();
                    }
                }
            }
            //Waxing Crescent - 7% -> 38% waxing
            if (m_LatentEffectList.at(i)->GetConditionsValue() == 1)
            {
                if (MoonPhase >= 7 && MoonPhase <= 38 && MoonDirection == 2)
                {
                    if (!m_LatentEffectList.at(i)->IsActivated())
                    {
                        m_LatentEffectList.at(i)->Activate();
                    }
                }
                else
                {
                    if (m_LatentEffectList.at(i)->IsActivated())
                    {
                        m_LatentEffectList.at(i)->Deactivate();
                    }
                }
            }
            //First Quarter - 40%% -> 55% waxing
            if (m_LatentEffectList.at(i)->GetConditionsValue() == 2)
            {
                if (MoonPhase >= 40 && MoonPhase <= 55 && MoonDirection == 2)
                {
                    if (!m_LatentEffectList.at(i)->IsActivated())
                    {
                        m_LatentEffectList.at(i)->Activate();
                    }
                }
                else
                {
                    if (m_LatentEffectList.at(i)->IsActivated())
                    {
                        m_LatentEffectList.at(i)->Deactivate();
                    }
                }
            }
            //Waxing Gibbous - 57% -> 88%
            if (m_LatentEffectList.at(i)->GetConditionsValue() == 3)
            {
                if (MoonPhase >= 57 && MoonPhase <= 88 && MoonDirection == 2)
                {
                    if (!m_LatentEffectList.at(i)->IsActivated())
                    {
                        m_LatentEffectList.at(i)->Activate();
                    }
                }
                else
                {
                    if (m_LatentEffectList.at(i)->IsActivated())
                    {
                        m_LatentEffectList.at(i)->Deactivate();
                    }
                }
            }
            //Full Moon - waxing 90% -> waning 95%
            if (m_LatentEffectList.at(i)->GetConditionsValue() == 4)
            {
                if (MoonPhase >= 95)
                {
                    if (!m_LatentEffectList.at(i)->IsActivated())
                    {
                        m_LatentEffectList.at(i)->Activate();
                    }
                }
                else if (MoonPhase >= 90 && MoonDirection == 2) //only 90%+ if waxing
                {
                    if (!m_LatentEffectList.at(i)->IsActivated())
                    {
                        m_LatentEffectList.at(i)->Activate();
                    }
                }
                else
                {
                    if (m_LatentEffectList.at(i)->IsActivated())
                    {
                        m_LatentEffectList.at(i)->Deactivate();
                    }
                }
            }
            //Waning Gibbous - 93% -> 62%
            if (m_LatentEffectList.at(i)->GetConditionsValue() == 5)
            {
                if (MoonPhase >= 62 && MoonPhase <= 93 && MoonDirection == 1)
                {
                    if (!m_LatentEffectList.at(i)->IsActivated())
                    {
                        m_LatentEffectList.at(i)->Activate();
                    }
                }
                else
                {
                    if (m_LatentEffectList.at(i)->IsActivated())
                    {
                        m_LatentEffectList.at(i)->Deactivate();
                    }
                }
            }
            //Last Quarter - 60% -> 45%
            if (m_LatentEffectList.at(i)->GetConditionsValue() == 6)
            {
                if (MoonPhase >= 45 && MoonPhase <= 60 && MoonDirection == 1)
                {
                    if (!m_LatentEffectList.at(i)->IsActivated())
                    {
                        m_LatentEffectList.at(i)->Activate();
                    }
                }
                else
                {
                    if (m_LatentEffectList.at(i)->IsActivated())
                    {
                        m_LatentEffectList.at(i)->Deactivate();
                    }
                }
            }
            //Waning Crescent - 43% -> 12%
            if (m_LatentEffectList.at(i)->GetConditionsValue() == 7)
            {
                if (MoonPhase >= 12 && MoonPhase <= 43 && MoonDirection == 1)
                {
                    if (!m_LatentEffectList.at(i)->IsActivated())
                    {
                        m_LatentEffectList.at(i)->Activate();
                    }
                }
                else
                {
                    if (m_LatentEffectList.at(i)->IsActivated())
                    {
                        m_LatentEffectList.at(i)->Deactivate();
                    }
                }
            }
        }
    }
    m_POwner->UpdateHealth();
}

/************************************************************************
*																		*
*  Checks latents that are affected by the day of the week and			*
*  activates them if the conditions are met.							*
*																		*
************************************************************************/

void CLatentEffectContainer::CheckLatentsWeekDay()
{

    uint8 WeekDay = (uint8)CVanaTime::getInstance()->getWeekday();

    for (uint16 i = 0; i < m_LatentEffectList.size(); ++i)
    {

        if (m_LatentEffectList.at(i)->GetConditionsID() == LATENT_FIRESDAY)
        {
            if (WeekDay == FIRESDAY)
            {
                if (!m_LatentEffectList.at(i)->IsActivated())
                {
                    m_LatentEffectList.at(i)->Activate();
                }
            }
            else
            {
                if (m_LatentEffectList.at(i)->IsActivated())
                {
                    m_LatentEffectList.at(i)->Deactivate();
                }
            }
        }

        if (m_LatentEffectList.at(i)->GetConditionsID() == LATENT_EARTHSDAY)
        {
            if (WeekDay == EARTHSDAY)
            {
                if (!m_LatentEffectList.at(i)->IsActivated())
                {
                    m_LatentEffectList.at(i)->Activate();
                }
            }
            else
            {
                if (m_LatentEffectList.at(i)->IsActivated())
                {
                    m_LatentEffectList.at(i)->Deactivate();
                }
            }
        }

        if (m_LatentEffectList.at(i)->GetConditionsID() == LATENT_WATERSDAY)
        {
            if (WeekDay == WATERSDAY)
            {
                if (!m_LatentEffectList.at(i)->IsActivated())
                {
                    m_LatentEffectList.at(i)->Activate();
                }
            }
            else
            {
                if (m_LatentEffectList.at(i)->IsActivated())
                {
                    m_LatentEffectList.at(i)->Deactivate();
                }
            }
        }

        if (m_LatentEffectList.at(i)->GetConditionsID() == LATENT_WINDSDAY)
        {
            if (WeekDay == WINDSDAY)
            {
                if (!m_LatentEffectList.at(i)->IsActivated())
                {
                    m_LatentEffectList.at(i)->Activate();
                }
            }
            else
            {
                if (m_LatentEffectList.at(i)->IsActivated())
                {
                    m_LatentEffectList.at(i)->Deactivate();
                }
            }
        }

        if (m_LatentEffectList.at(i)->GetConditionsID() == LATENT_DARKSDAY)
        {
            if (WeekDay == DARKSDAY)
            {
                if (!m_LatentEffectList.at(i)->IsActivated())
                {
                    m_LatentEffectList.at(i)->Activate();
                }
            }
            else
            {
                if (m_LatentEffectList.at(i)->IsActivated())
                {
                    m_LatentEffectList.at(i)->Deactivate();
                }
            }
        }

        if (m_LatentEffectList.at(i)->GetConditionsID() == LATENT_ICEDAY)
        {
            if (WeekDay == ICEDAY)
            {
                if (!m_LatentEffectList.at(i)->IsActivated())
                {
                    m_LatentEffectList.at(i)->Activate();
                }
            }
            else
            {
                if (m_LatentEffectList.at(i)->IsActivated())
                {
                    m_LatentEffectList.at(i)->Deactivate();
                }
            }
        }

        if (m_LatentEffectList.at(i)->GetConditionsID() == LATENT_LIGHTNINGSDAY)
        {
            if (WeekDay == LIGHTNINGDAY)
            {
                if (!m_LatentEffectList.at(i)->IsActivated())
                {
                    m_LatentEffectList.at(i)->Activate();
                }
            }
            else
            {
                if (m_LatentEffectList.at(i)->IsActivated())
                {
                    m_LatentEffectList.at(i)->Deactivate();
                }
            }
        }

        if (m_LatentEffectList.at(i)->GetConditionsID() == LATENT_LIGHTSDAY)
        {
            if (WeekDay == LIGHTSDAY)
            {
                if (!m_LatentEffectList.at(i)->IsActivated())
                {
                    m_LatentEffectList.at(i)->Activate();
                }
            }
            else
            {
                if (m_LatentEffectList.at(i)->IsActivated())
                {
                    m_LatentEffectList.at(i)->Deactivate();
                }
            }
        }
    }
    m_POwner->UpdateHealth();
}

/************************************************************************
*																		*
*  Checks latents that are affected the hour and activates them			*
*  if the conditions are met.											*
*																		*
************************************************************************/
void CLatentEffectContainer::CheckLatentsHours()
{
    uint32 VanadielHour = CVanaTime::getInstance()->getHour();

    for (uint16 i = 0; i < m_LatentEffectList.size(); ++i)
    {
        if (m_LatentEffectList.at(i)->GetConditionsID() == LATENT_HOUR_OF_DAY)
        {
            //new day
            if (m_LatentEffectList.at(i)->GetConditionsValue() == 1)
            {
                if (VanadielHour == 4)
                {
                    if (m_LatentEffectList.at(i)->IsActivated())
                        m_LatentEffectList.at(i)->Deactivate();

                    m_LatentEffectList.at(i)->Activate();
                }
                else
                {
                    if (m_LatentEffectList.at(i)->IsActivated())
                        m_LatentEffectList.at(i)->Deactivate();
                }
            }

            //dawn
            if (m_LatentEffectList.at(i)->GetConditionsValue() == 2)
            {
                if (VanadielHour == 6)
                {
                    if (m_LatentEffectList.at(i)->IsActivated())
                        m_LatentEffectList.at(i)->Deactivate();

                    m_LatentEffectList.at(i)->Activate();
                }
                else
                {
                    if (m_LatentEffectList.at(i)->IsActivated())
                        m_LatentEffectList.at(i)->Deactivate();
                }
            }

            //day
            if (m_LatentEffectList.at(i)->GetConditionsValue() == 3)
            {
                if (VanadielHour >= 7 && VanadielHour < 17)
                {
                    if (m_LatentEffectList.at(i)->IsActivated())
                        m_LatentEffectList.at(i)->Deactivate();

                    m_LatentEffectList.at(i)->Activate();
                }
                else
                {
                    if (m_LatentEffectList.at(i)->IsActivated())
                        m_LatentEffectList.at(i)->Deactivate();
                }
            }

            //dusk
            if (m_LatentEffectList.at(i)->GetConditionsValue() == 4)
            {
                if (VanadielHour >= 16 && VanadielHour < 18)
                {
                    if (m_LatentEffectList.at(i)->IsActivated())
                        m_LatentEffectList.at(i)->Deactivate();

                    m_LatentEffectList.at(i)->Activate();
                }
                else
                {
                    if (m_LatentEffectList.at(i)->IsActivated())
                        m_LatentEffectList.at(i)->Deactivate();
                }
            }

            //evening
            if (m_LatentEffectList.at(i)->GetConditionsValue() == 5)
            {
                if (VanadielHour >= 18 && VanadielHour < 20)
                {
                    if (m_LatentEffectList.at(i)->IsActivated())
                        m_LatentEffectList.at(i)->Deactivate();

                    m_LatentEffectList.at(i)->Activate();
                }
                else
                {
                    if (m_LatentEffectList.at(i)->IsActivated())
                        m_LatentEffectList.at(i)->Deactivate();
                }
            }

            //dead of night
            if (m_LatentEffectList.at(i)->GetConditionsValue() == 6)
            {
                if ((VanadielHour < 4) || (VanadielHour <= 20))
                {
                    if (m_LatentEffectList.at(i)->IsActivated())
                        m_LatentEffectList.at(i)->Deactivate();

                    m_LatentEffectList.at(i)->Activate();
                }
                else
                {
                    if (m_LatentEffectList.at(i)->IsActivated())
                        m_LatentEffectList.at(i)->Deactivate();
                }
            }
        }
    }
    m_POwner->UpdateHealth();
}

/************************************************************************
*																		*
*  Checks all latents that are affected by party members and			*
*  activates them if the conditions are met.							*
*																		*
************************************************************************/

void CLatentEffectContainer::CheckLatentsPartyMembers(uint8 members)
{

    for (uint16 i = 0; i < m_LatentEffectList.size(); ++i)
    {

        if (m_LatentEffectList.at(i)->GetConditionsID() == LATENT_PARTY_MEMBERS)
        {

            if (m_LatentEffectList.at(i)->GetConditionsValue() <= members)
            {
                m_LatentEffectList.at(i)->Activate();
            }
            else
            {
                m_LatentEffectList.at(i)->Deactivate();
            }
        }

        if (m_LatentEffectList.at(i)->GetConditionsID() == LATENT_PARTY_MEMBERS_IN_ZONE)
        {
            int inZone = 0;

            if (m_LatentEffectList.at(i)->GetConditionsValue() <= members)
            {
                for (uint8 m = 0; m < members; ++m)
                {
                    CCharEntity* PMember = (CCharEntity*)m_POwner->PParty->members.at(m);
                    if (PMember->getZone() == m_POwner->getZone())
                    {
                        inZone++;
                    }
                }

                if (inZone == m_LatentEffectList.at(i)->GetConditionsValue())
                    m_LatentEffectList.at(i)->Activate();
                else
                    m_LatentEffectList.at(i)->Deactivate();
            }
            else
            {
                if (m_LatentEffectList.at(i)->IsActivated())
                    m_LatentEffectList.at(i)->Deactivate();
            }
        }

    }

    m_POwner->UpdateHealth();
}

void CLatentEffectContainer::CheckLatentsPartyJobs()
{
    for (uint16 i = 0; i < m_LatentEffectList.size(); ++i)
    {
        if (m_LatentEffectList.at(i)->GetConditionsID() == LATENT_JOB_IN_PARTY)
        {
            if (m_POwner->PParty == nullptr)
            {
                if (m_LatentEffectList.at(i)->IsActivated() == true)
                {
                    m_LatentEffectList.at(i)->Deactivate();
                }
            }

            bool ActivateLatent = false;

            if (m_POwner->PParty != nullptr)
            {
                for (uint8 m = 0; m < m_POwner->PParty->members.size(); m++)
                {
                    CCharEntity* PMember = (CCharEntity*)m_POwner->PParty->members[m];
                    if (PMember->id != m_POwner->id)
                    {
                        if (PMember->GetMJob() == m_LatentEffectList.at(i)->GetConditionsValue())
                        {
                            ActivateLatent = true;
                            break;
                        }
                    }
                }

                if (ActivateLatent == true)
                    m_LatentEffectList.at(i)->Activate();
            }

            if (ActivateLatent == false)
                m_LatentEffectList.at(i)->Deactivate();
        }
    }

    m_POwner->UpdateHealth();
}

/************************************************************************
*																		*
*  Checks all latents that are affected by an avatar in party and		*
*  activates them if the conditions are met.							*
*																		*
************************************************************************/

void CLatentEffectContainer::CheckLatentsPartyAvatar()
{

    for (uint16 i = 0; i < m_LatentEffectList.size(); ++i)
    {
        if (m_LatentEffectList.at(i)->GetConditionsID() == LATENT_AVATAR_IN_PARTY)
        {
            bool ActivateLatent = false;
            if (m_POwner->PParty != nullptr)
            {
                for (uint8 m = 0; m < m_POwner->PParty->members.size(); ++m)
                {
                    CCharEntity* PMember = (CCharEntity*)m_POwner->PParty->members.at(m);
                    if (PMember->PPet != nullptr)
                    {
                        CPetEntity* PPet = (CPetEntity*)PMember->PPet;

                        if (PPet->m_PetID == m_LatentEffectList.at(i)->GetConditionsValue() &&
                            PPet->PAI->IsSpawned())
                        {
                            ActivateLatent = true;
                            break;
                        }
                    }
                }
            }
            if (m_POwner->PParty == nullptr && m_POwner->PPet != nullptr)
            {
                CPetEntity* PPet = (CPetEntity*)m_POwner->PPet;

                if (PPet->m_PetID == m_LatentEffectList.at(i)->GetConditionsValue() &&
                    !PPet->isDead())
                {
                    ActivateLatent = true;
                }
            }

            if (ActivateLatent == true)
                m_LatentEffectList.at(i)->Activate();

            if (ActivateLatent == false)
                m_LatentEffectList.at(i)->Deactivate();
        }
    }
    m_POwner->UpdateHealth();
}

/************************************************************************
*																		*
*  Checks all latents that are affected by job level and			    *
*  activates them if the conditions are met.							*
*																		*
************************************************************************/

void CLatentEffectContainer::CheckLatentsJobLevel()
{
    for (uint16 i = 0; i < m_LatentEffectList.size(); ++i)
    {
        switch (m_LatentEffectList.at(i)->GetConditionsID())
        {
        case LATENT_JOB_LEVEL_EVEN:
            if (m_POwner->GetMLevel() % 2 == 0)
            {
                m_LatentEffectList.at(i)->Activate();
            }
            else
            {
                m_LatentEffectList.at(i)->Deactivate();
            }
            break;
        case LATENT_JOB_LEVEL_ODD:
            if (m_POwner->GetMLevel() % 2 == 1)
            {
                m_LatentEffectList.at(i)->Activate();
            }
            else
            {
                m_LatentEffectList.at(i)->Deactivate();
            }
            break;
        case LATENT_JOB_MULTIPLE_5:
            if (m_POwner->GetMLevel() % 5 == 0)
            {
                m_LatentEffectList.at(i)->Activate();
            }
            else
            {
                m_LatentEffectList.at(i)->Deactivate();
            }
            break;
        case LATENT_JOB_MULTIPLE_10:
            if (m_POwner->GetMLevel() % 10 == 0)
            {
                m_LatentEffectList.at(i)->Activate();
            }
            else
            {
                m_LatentEffectList.at(i)->Deactivate();
            }
            break;
        case LATENT_JOB_MULTIPLE_13_NIGHT:
        {
            TIMETYPE VanadielTOTD = CVanaTime::getInstance()->SyncTime();
            if (m_POwner->GetMLevel() % 13 == 0 && (VanadielTOTD == TIME_NIGHT))
            {
                m_LatentEffectList.at(i)->Activate();
            }
            else
            {
                m_LatentEffectList.at(i)->Deactivate();
            }
        }
        break;
        case LATENT_JOB_LEVEL_BELOW:
            if (m_POwner->GetMLevel() < m_LatentEffectList.at(i)->GetConditionsValue())
            {
                m_LatentEffectList.at(i)->Activate();
            }
            else
            {
                m_LatentEffectList.at(i)->Deactivate();
            }
            break;
        case LATENT_JOB_LEVEL_ABOVE:
            if (m_POwner->GetMLevel() >= m_LatentEffectList.at(i)->GetConditionsValue())
            {
                m_LatentEffectList.at(i)->Activate();
            }
            else
            {
                m_LatentEffectList.at(i)->Deactivate();
            }
        default:
            break;
        }
    }
}

/************************************************************************
*																		*
*  Checks all latents that are affected by players pet type and			*
*  activates them if the conditions are met.							*
*																		*
************************************************************************/

void CLatentEffectContainer::CheckLatentsPetType(uint8 petID)
{
    for (uint16 i = 0; i < m_LatentEffectList.size(); ++i)
    {
        if (m_LatentEffectList.at(i)->GetConditionsID() == LATENT_PET_ID)
        {
            CLatentEffect* latent = m_LatentEffectList.at(i);
            if (latent->GetConditionsValue() == petID)
            {
                latent->Activate();
            }
            else
            {
                latent->Deactivate();
            }
        }
    }
}

/************************************************************************
*																		*
*  Checks all latents that are affected by time of vana day and			*
*  activates them if the conditions are met.							*
*																		*
************************************************************************/

//will probably only call this at transition points in the day
void CLatentEffectContainer::CheckLatentsTime()
{

}

/************************************************************************
*																		*
*  Checks all latents that are affected by weapon skill points			*
*																		*
************************************************************************/

void CLatentEffectContainer::CheckLatentsWeaponBreak(uint8 slot)
{
    for (uint16 i = 0; i < m_LatentEffectList.size(); ++i)
    {
        if (m_LatentEffectList.at(i)->GetConditionsID() == LATENT_WEAPON_BROKEN && m_LatentEffectList.at(i)->GetConditionsValue() == slot)
        {
            CItemWeapon* PWeaponMain = (CItemWeapon*)m_POwner->getEquip((SLOTTYPE)slot);
            if (PWeaponMain && PWeaponMain->isUnlocked() && m_LatentEffectList.at(i)->GetSlot() == slot)
            {
                m_LatentEffectList.at(i)->Activate();
            }
        }
    }
}

/************************************************************************
*																		*
*  Checks all latents regarding current zone							*
*																		*
************************************************************************/

void CLatentEffectContainer::CheckLatentsZone()
{
    for (uint16 i = 0; i < m_LatentEffectList.size(); ++i)
    {
        switch (m_LatentEffectList.at(i)->GetConditionsID())
        {
        case LATENT_ZONE:
            if (m_LatentEffectList.at(i)->GetConditionsValue() == m_POwner->getZone())
            {
                m_LatentEffectList.at(i)->Activate();
            }
            else
            {
                m_LatentEffectList.at(i)->Deactivate();
            }
            break;
        case LATENT_IN_DYNAMIS:
            if (m_POwner->isInDynamis())
            {
                m_LatentEffectList.at(i)->Activate();
            }
            else
            {
                m_LatentEffectList.at(i)->Deactivate();
            }
            break;
        case LATENT_WEATHER_ELEMENT:
            if (zoneutils::GetWeatherElement(zoneutils::GetZone(m_POwner->getZone())->GetWeather()) == m_LatentEffectList.at(i)->GetConditionsValue())
            {
                m_LatentEffectList.at(i)->Activate();
            }
            else
            {
                m_LatentEffectList.at(i)->Deactivate();
            }
            break;
        case LATENT_NATION_CONTROL:
        {
            //player is logging in/zoning
            if (m_POwner->loc.zone == nullptr)
            {
                continue;
            }

            bool ActivateLatent = false;

            REGIONTYPE region = m_POwner->loc.zone->GetRegionID();

            bool hasSignet = m_POwner->StatusEffectContainer->HasStatusEffect(EFFECT_SIGNET);
            bool hasSanction = m_POwner->StatusEffectContainer->HasStatusEffect(EFFECT_SANCTION);
            bool hasSigil = m_POwner->StatusEffectContainer->HasStatusEffect(EFFECT_SIGIL);

            //under own nation's control
            if (m_LatentEffectList.at(i)->GetConditionsValue() == 0)
            {
                if (region < 28)
                {
                    if (conquest::GetRegionOwner(region) == m_POwner->profile.nation && (hasSignet || hasSanction || hasSigil))
                        ActivateLatent = true;
                }
            }

            //outside of own nation's control
            if (m_LatentEffectList.at(i)->GetConditionsValue() == 1)
            {
                if (region < 28)
                {

                    if (m_POwner->profile.nation != conquest::GetRegionOwner(region) && (hasSignet || hasSanction || hasSigil))
                        ActivateLatent = true;
                }

            }

            if (ActivateLatent == true)
                m_LatentEffectList.at(i)->Activate();
            else
                m_LatentEffectList.at(i)->Deactivate();

        }
        break;
        case LATENT_ZONE_HOME_NATION:
        {
            //player is logging in/zoning
            if (m_POwner->loc.zone == nullptr)
            {
                continue;
            }

            CZone* PZone = m_POwner->loc.zone;

            bool ActivateLatent = false;

            //sandoria
            if (m_POwner->profile.nation == 0 && PZone->GetRegionID() == REGION_SANDORIA && m_LatentEffectList.at(i)->GetConditionsValue() == REGION_SANDORIA)
            {
                ActivateLatent = true;
            }
            //bastok
            else if (m_POwner->profile.nation == 1 && PZone->GetRegionID() == REGION_BASTOK && m_LatentEffectList.at(i)->GetConditionsValue() == REGION_BASTOK)
            {
                ActivateLatent = true;
            }
            //windurst
            else if (m_POwner->profile.nation == 2 && PZone->GetRegionID() == REGION_WINDURST && m_LatentEffectList.at(i)->GetConditionsValue() == REGION_WINDURST)
            {
                ActivateLatent = true;
            }

            if (ActivateLatent)
                m_LatentEffectList.at(i)->Activate();
            else
                m_LatentEffectList.at(i)->Deactivate();
        }
        break;
        default:
            break;
        }
    }
    m_POwner->UpdateHealth();
}
