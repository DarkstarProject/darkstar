/*
===========================================================================

  Copyright (c) 2010-2011 Darkstar Dev Teams

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

	CAICharNormal(CCharEntity* PChar);
	virtual ~CAICharNormal() {};

protected:

	CCharEntity* m_PChar;	

	uint32 m_AttackMessageTime;

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
	void ActionAttack();
	void ActionChangeBattleTarget();
	void ActionRaiseMenuSelection();
	void UpdateHealth();

	bool IsMobOwner();
	bool IsMobSubOwner();
	bool GetValidTarget(CBattleEntity** PBattleTarget, uint8 ValidTarget);
	SUBEFFECT GetSkillChainEffect(CBattleEntity* PDefender, CWeaponSkill* PWeaponSkill);
};

#endif