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

#ifndef _STATUSEFFECTCONTAINER_H
#define _STATUSEFFECTCONTAINER_H

#include "../common/cbasetypes.h"
#include "../common/taskmgr.h"

#include "status_effect.h"

/************************************************************************
*                                                                       *
*                                                                       *
*                                                                       *
************************************************************************/

class CBattleEntity;

class CStatusEffectContainer
{
public:

    std::uint64_t	m_Flags {0};											// биты переполнения байтов m_StatusIcons (по два бита на каждый эффект)
    uint8 m_StatusIcons[32];                  // иконки статус-эффектов

    bool ApplyBardEffect(CStatusEffect* PStatusEffect, uint8 maxSongs);
    bool CanGainStatusEffect(EFFECT statusEffect, std::uint16_t power); // returns true if the status effect will take effect
    bool AddStatusEffect(CStatusEffect* StatusEffect, bool silent = false);
    bool DelStatusEffect(EFFECT StatusID);
    bool DelStatusEffectSilent(EFFECT StatusID);
    bool DelStatusEffect(EFFECT StatusID, std::uint16_t SubID);
    void DelStatusEffectsByFlag(std::uint32_t flag, bool silent = false);                   // удаляем все эффекты с указанным типом
    void DelStatusEffectsByIcon(std::uint16_t IconID);                 // удаляем все эффекты с указанной иконкой
    void DelStatusEffectsByType(std::uint16_t Type);
    bool DelStatusEffectByTier(EFFECT StatusID, std::uint16_t power);
    void KillAllStatusEffect();

    bool HasStatusEffect(EFFECT StatusID);                      // проверяем наличие эффекта
    bool HasStatusEffect(EFFECT StatusID, std::uint16_t SubID);        // проверяем наличие эффекта с уникальным subid
    bool HasStatusEffect(std::initializer_list<EFFECT>);
    bool HasStatusEffectByFlag(std::uint32_t flag);

    EFFECT EraseStatusEffect();                                 // удаляем первый отрицательный эффект
    EFFECT HealingWaltz();				// dancers healing waltz
    uint8 EraseAllStatusEffect();               // erases all status effects
    EFFECT DispelStatusEffect(EFFECTFLAG flag);             // удаляем первый положительный эффект
    uint8 DispelAllStatusEffect(EFFECTFLAG flag);                // dispels all status effects
    CStatusEffect* StealStatusEffect();             // dispels one effect and returns it

    CStatusEffect* GetStatusEffect(EFFECT StatusID);
    CStatusEffect* GetStatusEffect(EFFECT StatusID, std::uint32_t SubID);

    void UpdateStatusIcons();                                   // пересчитываем иконки эффектов
    void CheckEffectsExpiry(time_point tick);
    void TickEffects(time_point tick);
    void TickRegen(time_point tick);

    void LoadStatusEffects();                                   // загружаем эффекты персонажа
    void SaveStatusEffects(bool logout = false);                // сохраняем эффекты персонажа

    uint8 GetEffectsCount(EFFECT ID);                        // получаем количество эффектов с указанным id

    bool ApplyCorsairEffect(CStatusEffect* PStatusEffect, uint8 maxRolls, uint8 bustDuration);
    bool CheckForElevenRoll();
    bool HasBustEffect(std::uint16_t id);
    bool HasCorsairEffect(std::uint32_t charid);
    void Fold(std::uint32_t charid);

    uint8 GetActiveManeuvers();
    void RemoveOldestManeuver();
    void RemoveAllManeuvers();

    void WakeUp(); // remove sleep effects
    bool IsAsleep();
    bool HasPreventActionEffect(); // checks if owner has an effect that prevents actions, like stun, petrify, sleep etc

    std::uint16_t GetConfrontationEffect(); // gets confrontation number (bcnm, confrontation, campaign, reive mark)
    void CopyConfrontationEffect(CBattleEntity* PEntity); // copies confrontation status (pet summoning, etc)

    template<typename F, typename... Args>
    void ForEachEffect(F func, Args&&... args)
    {
        for (auto&& PEffect : m_StatusEffectList)
        {
            func(PEffect, std::forward<Args>(args)...);
        }
    }

	CStatusEffectContainer(CBattleEntity* PEntity);
	~CStatusEffectContainer();

private:

	CBattleEntity* m_POwner;

    // void ReplaceStatusEffect(EFFECT effect); //this needs to be implemented
	void RemoveStatusEffect(std::uint32_t id, bool silent = false);	// удаляем эффект по его номеру в контейнере
	void SetEffectParams(CStatusEffect* StatusEffect);			// устанавливаем имя эффекта

    void OverwriteStatusEffect(CStatusEffect* StatusEffect);

	std::vector<CStatusEffect*>	m_StatusEffectList;
};

/************************************************************************
*                                                                       *
*                                                                       *
*                                                                       *
************************************************************************/

namespace effects
{
    void LoadEffectsParameters();
    std::uint16_t GetEffectElement(std::uint16_t effect);
};

#endif

