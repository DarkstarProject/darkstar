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

#ifndef _AUTOMATONCONTROLLER_H
#define _AUTOMATONCONTROLLER_H

#include "pet_controller.h"
#include "../../entities/automatonentity.h"
#include "../../status_effect.h"

enum AUTOMOVEMENT
{
    AUTOMOVEMENT_MELEE = 0,
    AUTOMOVEMENT_RANGED = 1,
    AUTOMOVEMENT_MAGIC = 2,
};

struct CurrentManeuvers
{
    int fire{ 0 };
    int earth{ 0 };
    int water{ 0 };
    int wind{ 0 };
    int ice{ 0 };
    int thunder{ 0 };
    int light{ 0 };
    int dark{ 0 };
};

class CAutomatonEntity;

class CAutomatonController : public CPetController
{
public:
    CAutomatonController(CAutomatonEntity* PPet);

    virtual void Disengage() override;
protected:
    virtual void DoCombatTick(time_point tick) override;
    void Move();

    void setCooldowns();
    void setMagicCooldowns();
    void setMovement();
    bool CanCastSpells();
    bool CastSpell(AUTOSPELL spellid, CBattleEntity* PCastTarget);

    bool m_deployed;
private:
    bool TryAction();
    bool TryShieldBash();
    bool TrySpellcast();
    bool TryHeal();
    bool TryElemental();
    bool TryEnfeeble();
    bool TryStatusRemoval();
    bool TryEnhance();
    bool TryTPMove();
    bool TryRangedAttack();
    bool TryAttachment();

    void GetCurrentManeuvers();
    CurrentManeuvers m_CurrentManeuvers;

    CAutomatonEntity* PAutomaton;

    duration m_actionCooldown{ 3s };
    duration m_rangedCooldown{ duration::zero() };
    static constexpr int m_RangedAbility{ 1949 };
    duration m_magicCooldown{ duration::zero() };
    duration m_enfeebleCooldown{ duration::zero() };
    duration m_elementalCooldown{ duration::zero() };
    duration m_healCooldown{ duration::zero() };
    duration m_enhanceCooldown{ duration::zero() };
    duration m_statusCooldown{ duration::zero() };
    duration m_shieldbashCooldown{ duration::zero() };
    static constexpr int m_ShieldBashAbility{ 1944 };

    std::array<bool, 12> m_checkAttachment; // If any of these are false then they will be skipped when checking if they enable a skill

    std::vector<AUTOSPELL> m_castPriority;
    std::vector<AUTOSPELL> m_defaultPriority;

    AUTOMOVEMENT m_movementType;

    time_point m_LastActionTime;
    time_point m_LastMagicTime;
    time_point m_LastEnfeebleTime;
    time_point m_LastElementalTime;
    time_point m_LastHealTime;
    time_point m_LastEnhanceTime;
    time_point m_LastStatusTime;
    time_point m_LastRangedTime;
    time_point m_LastShieldBashTime;
};

#endif