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

    std::uint8_t	getReqLvl();
    std::uint8_t   getILvl();
	uint32	getJobs();
	std::uint16_t	getModelId();
	std::uint16_t	getScriptType();
	std::uint8_t	getShieldSize();
	std::uint16_t	getEquipSlotId();
	std::uint16_t	getRemoveSlotId();
    std::uint8_t   getShieldAbsorption();
	std::int16_t	getModifier(Mod mod);
    std::uint8_t   getSlotType();
    std::uint16_t  getAugment(std::uint8_t slot);
	std::uint16_t  getTrialNumber();

    bool    IsShield();

	void	setReqLvl(std::uint8_t lvl);
    void    setILvl(std::uint8_t lvl);
	void	setJobs(uint32 jobs);
	void	setModelId(std::uint16_t mdl);
	void	setShieldSize(std::uint8_t shield);
	void	setScriptType(std::uint16_t isScripted);
	void	setEquipSlotId(std::uint16_t equipSlot);
	void	setRemoveSlotId(std::uint16_t removSlot);
    void    setAugment(std::uint8_t slot, std::uint16_t type, std::uint8_t value);
	void    setTrialNumber(std::uint16_t);

    void    LoadAugment(std::uint8_t slot, std::uint16_t augment);
    void    ApplyAugment(std::uint8_t slot);

    void    addModifier(CModifier modifier);
    void    addPetModifier(CPetModifier modifier);
	void	addLatent(LATENT ConditionsID, std::uint16_t ConditionsValue, Mod ModValue, std::int16_t ModPower);

	std::vector<CModifier> modList;			// список модификаторов
    std::vector<CPetModifier> petModList;         // mod list for pets
	std::vector<itemLatent> latentList;     // contains latents

private:

	std::uint8_t	m_reqLvl;
    std::uint8_t   m_iLvl;
	uint32  m_jobs;
	std::uint16_t	m_modelID;
	std::uint16_t	m_scriptType;
	std::uint8_t	m_shieldSize;
    std::uint8_t   m_absorption;
	std::uint16_t	m_equipSlotID;
	std::uint16_t	m_removeSlotID;

    void    SetAugmentMod(std::uint16_t type, std::uint8_t value);
};

#endif