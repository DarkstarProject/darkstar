/*
===========================================================================

  Copyright (c) 2010-2014 Darkstar Dev Teams

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

#ifndef _CAICHARNORMAL_H
#define _CAICHARNORMAL_H

#include "../../common/cbasetypes.h"

#include "ai_general.h"
#include <math.h>

/************************************************************************
*																		*
*  AI поведения обычного персонажа										*
*																		*
************************************************************************/

class CCharEntity;

class CAICharNormal : public CAIGeneral
{
public:

	virtual void CheckCurrentAction(uint32 tick);
	void CheckActionAfterReceive(uint32 tick);
	virtual void WeatherChange(WEATHER weather, uint8 element);

	CAICharNormal(CCharEntity* PChar);

protected:
	virtual void TransitionBack(bool skipWait = false);

	CCharEntity* m_PChar;

	uint32 m_AttackMessageTime;
    uint32 m_LastCoolDown;

	void ActionEngage();
	void ActionDisengage();
	void ActionFall();
	void ActionDeath();
	void ActionItemStart();
	void ActionItemUsing();
	void ActionItemFinish();
	void ActionItemInterrupt();
	void ActionRangedStart();
	void ActionRangedFinish();
	void ActionRangedInterrupt();
	void ActionMagicStart();
	void ActionMagicCasting();
	void ActionMagicFinish();
	void ActionMagicInterrupt();
	void ActionJobAbilityStart();
	void ActionJobAbilityFinish();
	void ActionWeaponSkillStart();
	void ActionWeaponSkillFinish();
	void ActionSleep();
	void ActionAttack();
	void ActionChangeBattleTarget();
	void ActionRaiseMenuSelection();

    void MagicStartError();
    void WeaponSkillStartError(uint16 error);

	bool IsMobOwner(CBattleEntity* PBattleTarget);
	bool GetValidTarget(CBattleEntity** PBattleTarget, uint8 ValidTarget);
};

#endif
