/*
===========================================================================

  Copyright (c) 2010-2012 Darkstar Dev Teams

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
class CMobSkill;


namespace battleutils
{
	void	LoadSkillTable();
	void	LoadAbilitiesList();
	void	LoadWeaponSkillsList(); 
	void	LoadMobSkillsList();
	void	LoadEnmityTable();

	uint8	GetSkillRank(SKILLTYPE SkillID, JOBTYPE JobID);
	uint16	GetMaxSkill(SKILLTYPE SkillID, JOBTYPE JobID, uint8 level);

	CAbility*     GetAbility(uint16 AbilityID);
	CWeaponSkill* GetWeaponSkill(uint16 WSkillID);
	CMobSkill*    GetMobSkill(uint16 SkillID);

	std::list<CAbility*>     GetAbilities(JOBTYPE JobID);
	std::list<CWeaponSkill*> GetWeaponSkills(uint8 skill);
	std::vector<CMobSkill*>  GetMobSkillsByFamily(uint16 FamilyID);

	bool	CanUseAbility(CBattleEntity* PAttacker, uint16 AbilityID);

	void	FreeAbilitiesList();
	void    FreeWeaponSkillsList();
	void	FreeMobSkillsList();

    SUBEFFECT	GetSkillChainEffect(CBattleEntity* PDefender, CWeaponSkill* PWeaponSkill);

	bool	IsParalised(CBattleEntity* PAttacker);
    bool    IsAbsorbByShadow(CBattleEntity* PDefender);
	bool	IsIntimidated(CBattleEntity* PAttacker, CBattleEntity* PDefender);

	int32	GetFSTR(CBattleEntity* PAttacker, CBattleEntity* PDefender);
	uint8	GetHitRate(CBattleEntity* PAttacker, CBattleEntity* PDefender);
	uint8	GetCritHitRate(CBattleEntity* PAttacker, CBattleEntity* PDefender);
	uint8   GetBlockRate(CBattleEntity* PAttacker,CBattleEntity* PDefender);
	float	GetDamageRatio(CBattleEntity* PAttacker, CBattleEntity* PDefender, bool isCritical); 
    uint16  TakeMagicDamage(CBattleEntity* PAttacker, CBattleEntity* PDefender);
	uint16	TakePhysicalDamage(CBattleEntity* PAttacker, CBattleEntity* PDefender, int16 damage, bool isBlocked); 
	uint32  MagicCalculateCure(CBattleEntity* PCaster, CBattleEntity* PTarget, CSpell* PSpell, int8 targetNumber, CZone* PZone);
	bool    SingSong(CBattleEntity* PCaster,CBattleEntity* PTarget,CSpell* PSpell);
	bool    IsParried(CBattleEntity* PAttacker, CBattleEntity* PDefender); 

    uint8	GetEnmityMod(uint8 level, uint8 modType);
	bool	Enfeeble(CBattleEntity* PCaster, CBattleEntity* PDefender, EFFECT Effect);
	void	MoveTo(CBattleEntity* PEntity, position_t pos, uint8 mode);
	bool	isValidSelfTargetWeaponskill(int wsid);
	bool	TryInterruptSpell(CBattleEntity* PAttacker, CBattleEntity* PDefender);
	float	CalculateBaseTP(int delay, int stp);
};

#endif