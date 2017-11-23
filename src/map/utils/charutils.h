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

#ifndef _CHARUTILS_H
#define _CHARUTILS_H

#include "../../common/cbasetypes.h"

#include "../trait.h"
#include "../entities/charentity.h"
#include "../items/item_armor.h"

class CPetEntity;
class CMobEntity;
class CMeritPoints;
class CAbility;

namespace charutils
{

    void	LoadExpTable();
    void	LoadChar(CCharEntity* PChar);
    void    LoadSpells(CCharEntity* PChar);
    void	LoadInventory(CCharEntity* PChar);
    void    LoadEquip(CCharEntity* PChar);

    void	SendQuestMissionLog(CCharEntity* PChar);
    void	SendKeyItems(CCharEntity* PChar);
    void	SendInventory(CCharEntity* PChar);

    void	CalculateStats(CCharEntity* PChar);
    void    UpdateSubJob(CCharEntity* PChar);

    void	SetLevelRestriction(CCharEntity* PChar, std::uint8_t lvl);

    std::uint32_t	GetExpNEXTLevel(std::uint8_t charlvl);
    std::uint32_t	GetRealExp(std::uint8_t charlvl, std::uint8_t moblvl);

    void	DelExperiencePoints(CCharEntity* PChar, float retainpct, std::uint16_t forcedXpLoss);
    void	DistributeExperiencePoints(CCharEntity* PChar, CMobEntity* PMob);
    void	DistributeGil(CCharEntity* PChar, CMobEntity* PMob);
    void	AddExperiencePoints(bool expFromRaise, CCharEntity* PChar, CBaseEntity* PMob, std::uint32_t exp, std::uint32_t baseexp = 0, bool isexpchain = false);

    void	TrySkillUP(CCharEntity* PChar, SKILLTYPE SkillID, std::uint8_t lvl);
    void	BuildingCharSkillsTable(CCharEntity* PChar);
    void    BuildingCharWeaponSkills(CCharEntity* PChar);
    void	BuildingCharAbilityTable(CCharEntity* PChar);
    void	BuildingCharTraitsTable(CCharEntity* PChar);
    void    BuildingCharPetAbilityTable(CCharEntity* PChar, CPetEntity* PPet, std::uint32_t PetID);

    void    DoTrade(CCharEntity* PChar, CCharEntity* PTarget);
    bool    CanTrade(CCharEntity* PChar, CCharEntity* PTarget);

    void	CheckWeaponSkill(CCharEntity* PChar, std::uint8_t skill);
    bool    HasItem(CCharEntity* PChar, std::uint16_t ItemID);
    std::uint8_t   AddItem(CCharEntity* PChar, std::uint8_t LocationID, CItem* PItem, bool silence = false);
    std::uint8_t	AddItem(CCharEntity* PChar, std::uint8_t LocationID, std::uint16_t itemID, std::uint32_t quantity = 1, bool silence = false);
    std::uint8_t   MoveItem(CCharEntity* PChar, std::uint8_t LocationID, std::uint8_t SlotID, std::uint8_t NewSlotID);
    std::uint32_t	UpdateItem(CCharEntity* PChar, std::uint8_t LocationID, std::uint8_t slotID, std::int32_t quantity, bool force = false);
    void	CheckValidEquipment(CCharEntity* PChar);
    void	CheckEquipLogic(CCharEntity* PChar, SCRIPTTYPE ScriptType, std::uint32_t param);
    void	EquipItem(CCharEntity* PChar, std::uint8_t slotID, std::uint8_t equipSlotID, std::uint8_t containerID);
    void	UnequipItem(CCharEntity* PChar, std::uint8_t equipSlotID, bool update = true); //call with update == false to prevent calls to UpdateHealth() - used for correct handling of stats on armor swaps
    void    RemoveSub(CCharEntity* PChar);
    bool    EquipArmor(CCharEntity* PChar, std::uint8_t slotID, std::uint8_t equipSlotID, std::uint8_t containerID);
    void	CheckUnarmedWeapon(CCharEntity* PChar);
    void    SetStyleLock(CCharEntity* PChar, bool isStyleLocked);
    void    UpdateWeaponStyle(CCharEntity* PChar, std::uint8_t equipSlotID, CItemWeapon* PItem);
    void    UpdateArmorStyle(CCharEntity* PChar, std::uint8_t equipSlotID);

    bool	hasKeyItem(CCharEntity* PChar, std::uint16_t KeyItemID);	        // проверяем наличие ключевого предмета
    bool	seenKeyItem(CCharEntity* PChar, std::uint16_t KeyItemID);	        // проверяем, было ли описание ключевого предмета прочитано
    void	unseenKeyItem(CCharEntity* PChar, std::uint16_t KeyItemID);        // Attempt to remove keyitem from seen list
    void	addKeyItem(CCharEntity* PChar, std::uint16_t KeyItemID);	        // добавляем ключевой предмет
    void	delKeyItem(CCharEntity* PChar, std::uint16_t KeyItemID);	        // улаляем ключевой предмет

    std::int32_t	hasSpell(CCharEntity* PChar, std::uint16_t SpellID);		        // проверяем наличие заклинания
    std::int32_t	addSpell(CCharEntity* PChar, std::uint16_t SpellID);		        // добавляем заклинание
    std::int32_t	delSpell(CCharEntity* PChar, std::uint16_t SpellID);		        // улаляем заклинание

    std::int32_t	hasLearnedAbility(CCharEntity* PChar, std::uint16_t AbilityID);	// проверяем наличие заклинания
    std::int32_t	addLearnedAbility(CCharEntity* PChar, std::uint16_t AbilityID);	// добавляем заклинание
    std::int32_t	delLearnedAbility(CCharEntity* PChar, std::uint16_t AbilityID);	// улаляем заклинание

    bool	hasLearnedWeaponskill(CCharEntity* PChar, std::uint8_t wsid);
    void	addLearnedWeaponskill(CCharEntity* PChar, std::uint8_t wsid);
    void	delLearnedWeaponskill(CCharEntity* PChar, std::uint8_t wsid);

    std::int32_t	hasAbility(CCharEntity* PChar, std::uint16_t AbilityID);	        // проверяем наличие ключевого предмета
    std::int32_t	addAbility(CCharEntity* PChar, std::uint16_t AbilityID);	        // добавляем ключевой предмет
    std::int32_t	delAbility(CCharEntity* PChar, std::uint16_t AbilityID);	        // улаляем ключевой предмет

    std::int32_t   hasTitle(CCharEntity* PChar, std::uint16_t Title);
    std::int32_t   addTitle(CCharEntity* PChar, std::uint16_t Title);
    std::int32_t   delTitle(CCharEntity* PChar, std::uint16_t Title);
    void   setTitle(CCharEntity* PChar, std::uint16_t Title); // set title if not, save and update player

    std::int32_t	hasPetAbility(CCharEntity* PChar, std::uint16_t AbilityID);	        //same as Ability but for pet commands (e.g. Healing Ruby)
    std::int32_t	addPetAbility(CCharEntity* PChar, std::uint16_t AbilityID);
    std::int32_t	delPetAbility(CCharEntity* PChar, std::uint16_t AbilityID);

    std::int32_t	hasTrait(CCharEntity* PChar, std::uint8_t TraitID);	            // check if pchar has trait by traitid and jobid
    std::int32_t	addTrait(CCharEntity* PChar, std::uint8_t TraitID);	            // add trait by traitid and jobid
    std::int32_t	delTrait(CCharEntity* PChar, std::uint8_t TraitID);	            // delete trait by traitid and jobid

    std::int32_t	addWeaponSkill(CCharEntity* PChar, std::uint16_t WeaponSkillID);   // declaration of function to add weapon skill
    std::int32_t	hasWeaponSkill(CCharEntity* PChar, std::uint16_t WeaponSkillID);   // declaration of function to check for weapon skill
    std::int32_t	delWeaponSkill(CCharEntity* PChar, std::uint16_t WeaponSkillID);   // declaration of function to delete weapon skill

    void	SaveCharJob(CCharEntity* PChar, JOBTYPE job);		        // сохраняем уровень для выбранной профессий персонажа
    void	SaveCharExp(CCharEntity* PChar, JOBTYPE job);		        // сохраняем опыт для выбранной профессии персонажа
    void	SaveCharEquip(CCharEntity* PChar);					        // сохраняем экипировку и внешний вид персонажа
    void    SaveCharLook(CCharEntity* PChar);                           // Saves a character's appearance based on style locking.
    void	SaveCharPosition(CCharEntity* PChar);				        // сохраняем позицию персонажа
    void	SaveMissionsList(CCharEntity* PChar);                       // Save the missions list
    void	SaveQuestsList(CCharEntity* PChar);					        // сохраняем список ксевтов
    void    SaveFame(CCharEntity* PChar);                               // Save area fame / reputation
    void	SaveZonesVisited(CCharEntity* PChar);				        // сохраняем посещенные зоны
    void	SaveKeyItems(CCharEntity* PChar);					        // сохраняем ключевые предметы
    void	SaveCharInventoryCapacity(CCharEntity* PChar);              // Save Character inventory capacity
    void	SaveSpell(CCharEntity* PChar, std::uint16_t spellID);						        // сохраняем выученные заклинания
    void	DeleteSpell(CCharEntity* PChar, std::uint16_t spellID);
    void	SaveLearnedAbilities(CCharEntity* PChar);					// saved learned abilities (corsair rolls)
    void    SaveTitles(CCharEntity* PChar);						        // сохраняем заслуженные звания
    void	SaveCharStats(CCharEntity* PChar);					        // сохраняем флаги, текущие значения жихней, маны и профессий
    void    SaveCharGMLevel(CCharEntity* PChar);                        // saves the char's gm level and nameflags
    void    mentorMode(CCharEntity* PChar);                             // Changes char's mentor status
    void	SaveCharNation(CCharEntity* PChar);							// Save the character's nation of allegiance.
    void    SaveCampaignAllegiance(CCharEntity* PChar);                 // Save the character's campaign allegiance.
    void	SaveCharSkills(CCharEntity* PChar, std::uint8_t skillID);	        // сохраняем указанный skill персонажа
    void	SaveCharPoints(CCharEntity* PChar);							// Conquest point, Nation TP
    void	SaveDeathTime(CCharEntity* PChar);							// Saves when this character last died.
    void	SavePlayTime(CCharEntity* PChar);							// Saves this characters total play time.
    bool	hasMogLockerAccess(CCharEntity* PChar);						// true if have access, false otherwise.

    float  AddExpBonus(CCharEntity* PChar, float exp);

    void    RemoveAllEquipment(CCharEntity* PChar);

    std::uint16_t	AvatarPerpetuationReduction(CCharEntity* PChar);

    void    OpenSendBox(CCharEntity* PChar);

    bool    CheckAbilityAddtype(CCharEntity* PChar, CAbility* PAbility);

    void    RemoveStratagems(CCharEntity* PChar, CSpell* PSpell);

    void    RemoveAllEquipMods(CCharEntity* PChar);
    void    ApplyAllEquipMods(CCharEntity* PChar);

    void	ClearTempItems(CCharEntity* PChar);
    void	ReloadParty(CCharEntity* PChar);

    bool    IsAidBlocked(CCharEntity* PInitiator, CCharEntity* PTarget);

    void    AddPoints(CCharEntity* PChar, const char* type, std::int32_t amount, std::int32_t max = INT32_MAX);
    void    SetPoints(CCharEntity* PChar, const char* type, std::int32_t amount);
    std::int32_t   GetPoints(CCharEntity* PChar, const char* type);
    std::string GetConquestPointsName(CCharEntity* PChar);
    void    SendToZone(CCharEntity* PChar, std::uint8_t type, std::uint64_t ipp);
    void    HomePoint(CCharEntity* PChar);
    void    AddWeaponSkillPoints(CCharEntity*, SLOTTYPE, int);

    std::int32_t   GetVar(CCharEntity* PChar, const char* var);
};

#endif
