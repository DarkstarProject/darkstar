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

#ifndef _CITEMARMOR_H
#define _CITEMARMOR_H

#include "../../common/utils.h"

#include <vector>

#include "item_usable.h"

#include "../modifier.h"
#include "../status_effect.h"
#include "../latent_effect.h"

// типы событий, в которых участвует логика предмета

enum SCRIPTTYPE : std::uint16_t
{
	SCRIPT_NONE			= 0x0000,
	SCRIPT_EQUIP		= 0x0001,
	SCRIPT_CHANGESJOB	= 0x0002,
	SCRIPT_CHANGEZONE	= 0x0004,
	SCRIPT_TIME_DAWN	= 0x0008,
	SCRIPT_TIME_DAY		= 0x0010,
	SCRIPT_TIME_DUSK	= 0x0020,
	SCRIPT_TIME_EVENING	= 0x0040
	//...
};

class CItemArmor : public CItemUsable
{
public:

	CItemArmor(std::uint16_t);
	virtual ~CItemArmor();

    struct itemLatent
    {
        LATENT ConditionsID;
        std::uint16_t ConditionsValue;
        Mod ModValue;
        std::int16_t ModPower;
    };

    uint8	getReqLvl();
    uint8   getILvl();
	std::uint32_t	getJobs();
	std::uint16_t	getModelId();
	std::uint16_t	getScriptType();
	uint8	getShieldSize();
	std::uint16_t	getEquipSlotId();
	std::uint16_t	getRemoveSlotId();
    uint8   getShieldAbsorption();
	std::int16_t	getModifier(Mod mod);
    uint8   getSlotType();
    std::uint16_t  getAugment(uint8 slot);
	std::uint16_t  getTrialNumber();

    bool    IsShield();

	void	setReqLvl(uint8 lvl);
    void    setILvl(uint8 lvl);
	void	setJobs(std::uint32_t jobs);
	void	setModelId(std::uint16_t mdl);
	void	setShieldSize(uint8 shield);
	void	setScriptType(std::uint16_t isScripted);
	void	setEquipSlotId(std::uint16_t equipSlot);
	void	setRemoveSlotId(std::uint16_t removSlot);
    void    setAugment(uint8 slot, std::uint16_t type, uint8 value);
	void    setTrialNumber(std::uint16_t);

    void    LoadAugment(uint8 slot, std::uint16_t augment);
    void    ApplyAugment(uint8 slot);

    void    addModifier(CModifier modifier);
    void    addPetModifier(CPetModifier modifier);
	void	addLatent(LATENT ConditionsID, std::uint16_t ConditionsValue, Mod ModValue, std::int16_t ModPower);

	std::vector<CModifier> modList;			// список модификаторов
    std::vector<CPetModifier> petModList;         // mod list for pets
	std::vector<itemLatent> latentList;     // contains latents

private:

	uint8	m_reqLvl;
    uint8   m_iLvl;
	std::uint32_t  m_jobs;
	std::uint16_t	m_modelID;
	std::uint16_t	m_scriptType;
	uint8	m_shieldSize;
    uint8   m_absorption;
	std::uint16_t	m_equipSlotID;
	std::uint16_t	m_removeSlotID;

    void    SetAugmentMod(std::uint16_t type, uint8 value);
};

#endif