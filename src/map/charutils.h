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

#ifndef _CHARUTILS_H
#define _CHARUTILS_H

#include "../common/cbasetypes.h"

#include "trait.h"
#include "charentity.h"

class CMobEntity;

namespace charutils
{
	
	void	LoadExpTable();
	void	LoadChar(CCharEntity* PChar);
	void	LoadInventory(CCharEntity* PChar);

	void	SendQuestMissionLog(CCharEntity* PChar);
	void	SendKeyItems(CCharEntity* PChar);
	void	SendInventory(CCharEntity* PChar); 
	
	void	CalculateStats(CCharEntity* PChar);

	void	SetLevelRestriction(CCharEntity* PChar, uint8 lvl);

	uint32	GetExpNEXTLevel(uint8 charlvl);
	uint32	GetRealExp(uint8 charlvl, uint8 moblvl);

	void	DelExperiencePoints(CCharEntity* PChar, float retainpct);
	void	DistributeExperiencePoints(CCharEntity* PChar, CMobEntity* PMob);
	void	DistributeGil(CCharEntity* PChar, CMobEntity* PMob);
    void	AddExperiencePoints(CCharEntity* PChar, CBaseEntity* PMob, uint32 exp, uint8 minlevel, uint8 maxlevel, bool limit = true);

	void	TrySkillUP(CCharEntity* PChar, SKILLTYPE SkillID, uint8 lvl);
	void	BuildingCharSkillsTable(CCharEntity* PChar);
	void    BuildingCharWeaponSkills(CCharEntity* PChar);
	void	BuildingCharAbilityTable(CCharEntity* PChar);
	void	BuildingCharTraitsTable(CCharEntity* PChar); 

	bool	hasInvalidJugPetAmmo(CCharEntity* PChar);

	void	CheckWeaponSkill(CCharEntity* PChar, uint8 skill);
    uint8   AddItem(CCharEntity* PChar, uint8 LocationID, CItem* PItem);
	uint8	AddItem(CCharEntity* PChar, uint8 LocationID, uint16 itemID, uint32 quantity = 1, bool silence = false);
	uint32	UpdateItem(CCharEntity* PChar, uint8 LocationID, uint8 slotID, int32 quantity);
	void	CheckValidEquipment(CCharEntity* PChar);
	void	CheckEquipLogic(CCharEntity* PChar, SCRIPTTYPE ScriptType, uint32 param);
	void	EquipItem(CCharEntity* PChar, uint8 slotID, uint8 equipSlotID);
	void	UnequipItem(CCharEntity* PChar, uint8 equipSlotID);
    void    UpdateHealth(CCharEntity* PChar);
	uint8   checkMultiHits(CCharEntity* PChar, uint16 weaponid); //returns the number of hits for multihit weapons if applicable

	int32	hasKeyItem(CCharEntity* PChar, uint16 KeyItemID);	        // проверяем наличие ключевого предмета
	int32	seenKeyItem(CCharEntity* PChar, uint16 KeyItemID);	        // проверяем, было ли описание ключевого предмета прочитано
	int32	unseenKeyItem(CCharEntity* PChar, uint16 KeyItemID);        // Attempt to remove keyitem from seen list
	int32	addKeyItem(CCharEntity* PChar, uint16 KeyItemID);	        // добавляем ключевой предмет
	int32	delKeyItem(CCharEntity* PChar, uint16 KeyItemID);	        // улаляем ключевой предмет

	int32	hasSpell(CCharEntity* PChar, uint16 SpellID);		        // проверяем наличие заклинания
	int32	addSpell(CCharEntity* PChar, uint16 SpellID);		        // добавляем заклинание
	int32	delSpell(CCharEntity* PChar, uint16 SpellID);		        // улаляем заклинание

	int32	hasAbility(CCharEntity* PChar, uint16 AbilityID);	        // проверяем наличие ключевого предмета
	int32	addAbility(CCharEntity* PChar, uint16 AbilityID);	        // добавляем ключевой предмет
	int32	delAbility(CCharEntity* PChar, uint16 AbilityID);	        // улаляем ключевой предмет

	int32	hasTrait(CCharEntity* PChar, uint8 TraitID);	            // check if pchar has trait by traitid and jobid
	int32	addTrait(CCharEntity* PChar, uint8 TraitID);	            // add trait by traitid and jobid
	int32	delTrait(CCharEntity* PChar, uint8 TraitID);	            // delete trait by traitid and jobid
	
	int32	addWeaponSkill(CCharEntity* PChar, uint16 WeaponSkillID);   // declaration of function to add weapon skill
	int32	hasWeaponSkill(CCharEntity* PChar, uint16 WeaponSkillID);   // declaration of function to check for weapon skill
	int32	delWeaponSkill(CCharEntity* PChar, uint16 WeaponSkillID);   // declaration of function to delete weapon skill

	void	SaveCharJob(CCharEntity* PChar, JOBTYPE job);		        // сохраняем уровень для выбранной профессий персонажа
	void	SaveCharExp(CCharEntity* PChar, JOBTYPE job);		        // сохраняем опыт для выбранной профессии персонажа
	void	SaveCharEquip(CCharEntity* PChar);					        // сохраняем экипировку и внешний вид персонажа
	void	SaveCharPosition(CCharEntity* PChar);				        // сохраняем позицию персонажа
	void	SaveMissionsList(CCharEntity* PChar);                       // Save the missions list 
	void	SaveQuestsList(CCharEntity* PChar);					        // сохраняем список ксевтов
	void	SaveZonesVisited(CCharEntity* PChar);				        // сохраняем посещенные зоны
	void	SaveKeyItems(CCharEntity* PChar);					        // сохраняем ключевые предметы
	void	SaveCharInventoryCapacity(CCharEntity* PChar);              // Save Character inventory capacity
	void	SaveSpells(CCharEntity* PChar);						        // сохраняем выученные заклинания
	void	SaveCharStats(CCharEntity* PChar);					        // сохраняем флаги, текущие значения жихней, маны и профессий
	void	SaveCharSkills(CCharEntity* PChar, uint8 skillID);	        // сохраняем указанный skill персонажа
};

#endif