﻿/*
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

enum SCRIPTTYPE : uint16
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

enum class ITEMCHECK
{
    NONE                = 0,
    EQUIP               = 1,
    UNEQUIP             = 2
};

class CItemArmor : public CItemUsable
{
public:

	CItemArmor(uint16);
	virtual ~CItemArmor();

    struct itemLatent
    {
        LATENT ConditionsID;
        uint16 ConditionsValue;
        Mod ModValue;
        int16 ModPower;
    };

    uint8	getReqLvl();
    uint8   getILvl();
	uint32	getJobs();
	uint16	getModelId();
	uint16	getScriptType();
	uint8	getShieldSize();
	uint16	getEquipSlotId();
	uint16	getRemoveSlotId();
    uint8   getShieldAbsorption();
	int16	getModifier(Mod mod);
    uint8   getSlotType();
    uint16  getAugment(uint8 slot);
	uint16  getTrialNumber();

    bool    IsShield();

	void	setReqLvl(uint8 lvl);
    void    setILvl(uint8 lvl);
	void	setJobs(uint32 jobs);
	void	setModelId(uint16 mdl);
	void	setShieldSize(uint8 shield);
	void	setScriptType(uint16 isScripted);
	void	setEquipSlotId(uint16 equipSlot);
	void	setRemoveSlotId(uint16 removSlot);
    void    setAugment(uint8 slot, uint16 type, uint8 value);
	void    setTrialNumber(uint16);

    void    LoadAugment(uint8 slot, uint16 augment);
    bool    PushAugment(uint16 type, uint8 value);
    void    ApplyAugment(uint8 slot);

    void    addModifier(CModifier modifier);
    void    addPetModifier(CPetModifier modifier);
	void	addLatent(LATENT ConditionsID, uint16 ConditionsValue, Mod ModValue, int16 ModPower);

	std::vector<CModifier> modList;			// список модификаторов
    std::vector<CPetModifier> petModList;         // mod list for pets
	std::vector<itemLatent> latentList;     // contains latents

private:

	uint8	m_reqLvl;
    uint8   m_iLvl;
	uint32  m_jobs;
	uint16	m_modelID;
	uint16	m_scriptType;
	uint8	m_shieldSize;
    uint8   m_absorption;
	uint16	m_equipSlotID;
	uint16	m_removeSlotID;

    void    SetAugmentMod(uint16 type, uint8 value);
};

#endif