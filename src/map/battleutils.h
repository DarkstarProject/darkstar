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

#ifndef _BATTLEUTILS_H
#define _BATTLEUTILS_H

#include "../common/cbasetypes.h"

#include <list>

#include "battleentity.h"

class CSpell;
class CAbility;
class CTrait;
class CWeaponSkill; 

namespace battleutils
{
	void	LoadSkillTable();
	void	LoadSpellList();
	void	LoadAbilitiesList();
	void	LoadWeaponSkillsList(); 
	void	LoadTraitsList();

	uint8	GetSkillRank(SKILLTYPE SkillID, JOBTYPE JobID);
	uint16	GetMaxSkill(SKILLTYPE SkillID, JOBTYPE JobID, uint8 level);

	CSpell*	GetSpell(uint16 SpellID);
	CAbility* GetAbility(uint16 AbilityID);
	CTrait* GetTrait(uint16 TraitID);
	CWeaponSkill* GetWeaponSkill(uint16 WSkillID);
	
	std::list<CAbility*> GetAbilities(JOBTYPE JobID);
	std::list<CTrait*> GetTraits(JOBTYPE JobID);
	std::list<CWeaponSkill*> GetWeaponSkills(uint8 skill);

	bool	CanUseSpell(CBattleEntity* PAttacker, uint16 SpellID);
	bool	CanUseAbility(CBattleEntity* PAttacker, uint16 AbilityID);

	void	FreeSpellList();
	void	FreeAbilitiesList();
	void	FreeTraitsList();
	void    FreeWeaponSkillsList();
	
	bool	IsParalised(CBattleEntity* PAttacker);
	bool	IsIntimidated(CBattleEntity* PAttacker, CBattleEntity* PDefender);
	int32	GetFSTR(CBattleEntity* PAttacker, CBattleEntity* PDefender);
	uint8	GetHitRate(CBattleEntity* PAttacker, CBattleEntity* PDefender);
	uint8	GetCritHitRate(CBattleEntity* PAttacker, CBattleEntity* PDefender);
	SUBEFFECT	GetSkillChainEffect(CBattleEntity* PDefender, CWeaponSkill* PWeaponSkill);
	float	GetDamageRatio(CBattleEntity* PAttacker, CBattleEntity* PDefender); 
	uint16	TakePhysicalDamage(CBattleEntity* PAttacker, CBattleEntity* PDefender, int16 damage);

	void	MoveTo(CBattleEntity* PEntity, position_t pos, uint8 mode);
};

#endif