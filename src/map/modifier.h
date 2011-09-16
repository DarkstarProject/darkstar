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

#ifndef _CMODIFIER_H
#define _CMODIFIER_H

#include "../common/cbasetypes.h"

/************************************************************************
*																		*
*  необходимые модификаторы:											*
*  bst,rng модификатор радиуса сканера									*
*																		*
************************************************************************/

enum MODIFIER
{
	MOD_NONE				= 0x00,

// Базовые

	MOD_DEF					= 0x01,
	MOD_HP					= 0x02,
	MOD_HPP					= 0x03,
	MOD_CONVMPTOHP			= 0x04,		// переход маны в жизни
	MOD_MP					= 0x05,
	MOD_MPP					= 0x06,
	MOD_CONVHPTOMP			= 0x07,		// переход жизней в ману

	MOD_STR					= 0x08,
	MOD_DEX					= 0x09,
	MOD_VIT					= 0x0A,
	MOD_AGI					= 0x0B,
	MOD_INT					= 0x0C,
	MOD_MND					= 0x0D,
	MOD_CHR					= 0x0E,

// Сопротивление стихиям

	MOD_FIREDEF				= 0x0F,
	MOD_ICEDEF				= 0x10,
	MOD_WINDDEF				= 0x11,
	MOD_EARTHDEF			= 0x12,
	MOD_THUNDERDEF			= 0x13,
	MOD_WATERDEF			= 0x14,
	MOD_LIGHTDEF			= 0x15,
	MOD_DARKDEF				= 0x16,

	MOD_ATT					= 0x17,		// атака
	MOD_RATT				= 0x18,		// дальняя атака

	MOD_ACC					= 0x19,		// точность атаки
	MOD_RACC				= 0x1A,		// точность дальных атак

	MOD_ENMITY				= 0x1B,		// ненависть монстров

	MOD_MATT				= 0x1C,		// магическая атака
	MOD_MDEF				= 0x1D,		// магическая защита
	MOD_MACC				= 0x1E,		// точность магических атак
	MOD_MEVA				= 0x1F,		// уклоняемость от магических атак

// Магические точность и атака стихий

	MOD_FIREATT				= 0x20,
	MOD_ICEATT				= 0x21,
	MOD_WINDATT				= 0x22,
	MOD_EARTHATT			= 0x23,
	MOD_THUNDERATT			= 0x24,
	MOD_WATERATT			= 0x25,
	MOD_LIGHTATT			= 0x26,
	MOD_DARKATT				= 0x27,
	MOD_FIREACC				= 0x28,
	MOD_ICEACC				= 0x29,
	MOD_WINDACC				= 0x2A,
	MOD_EARTHACC			= 0x2B,
	MOD_THUNDERACC			= 0x2C,
	MOD_WATERACC			= 0x2D,
	MOD_LIGHTACC			= 0x2E,
	MOD_DARKACC				= 0x2F,

	MOD_WSACC				= 0x30,		// точность Weaponskill

// Защита от физических атак
// значение хранится в процентах получаемого урона (с точностью до тысячных)
// пример: 1000 = 100%, 875 = 87,5%

	MOD_SLASHRES			= 0x31,
	MOD_PIERCERES			= 0x32,	
	MOD_IMPACTRES			= 0x33,
	MOD_HTHRES				= 0x34,

// Защита от стихий 
// значение хранится в процентах получаемого урона (с точностью до тысячных) 
// пример: 1000 = 100%, 875 = 87,5%

	MOD_FIRERES				= 0x36,
	MOD_ICERES				= 0x37,
	MOD_WINDRES				= 0x38,
	MOD_EARTHRES			= 0x39,
	MOD_THUNDERRES			= 0x3A,
	MOD_WATERRES			= 0x3B,
	MOD_LIGHTRES			= 0x3C,
	MOD_DARKRES				= 0x3D,

	MOD_ATTP				= 0x3E,		// % атака
	MOD_DEFP				= 0x3F,		// % защита
	MOD_ACCP				= 0x40,		// % точность
	MOD_EVAP				= 0x41,		// % уклонение
	MOD_RATTP				= 0x42,		// % дальная атака
	MOD_RACCP				= 0x43,		// % точность дальней атаки

	MOD_EVA					= 0x44,
	MOD_RDEF				= 0x45,		// Ranged Defense
	MOD_REVA				= 0x46,		// Ranged Evasion
	MOD_MPHEAL				= 0x47,		// MP Recovered while healing
	MOD_HPHEAL				= 0x48,		// HP Recovered while healing
	MOD_STORETP				= 0x49,		// Increases the rate at which TP is gained

// Умение владеть оружием

	MOD_HTH					= 0x50,
	MOD_DAGGER				= 0x51,
	MOD_SWORD				= 0x52,
	MOD_GSWORD				= 0x53,
	MOD_AXE					= 0x54,
	MOD_GAXE				= 0x55,
	MOD_SCYTHE				= 0x56,
	MOD_POLEARM				= 0x57,
	MOD_KATANA				= 0x58,
	MOD_GKATANA				= 0x59,
	MOD_CLUB				= 0x5A,
	MOD_STAFF				= 0x5B,
	MOD_ARCHERY				= 0x68,
	MOD_MARKSMAN			= 0x69,
	MOD_THROW				= 0x6A,
	MOD_GUARD				= 0x6B,
	MOD_EVASION				= 0x6C,
	MOD_SHIELD				= 0x6D,
	MOD_PARRY				= 0x6E,

// Умение читать заклинания

	MOD_DIVINE				= 0x6F,
	MOD_HEALING				= 0x70,
	MOD_ENHANCE				= 0x71,
	MOD_ENFEEBLE			= 0x72,
	MOD_ELEM				= 0x73,
	MOD_DARK				= 0x74,
	MOD_SUMMONING			= 0x75,
	MOD_NINJUTSU			= 0x76,
	MOD_SINGING				= 0x77,
	MOD_STRING				= 0x78,
	MOD_WIND				= 0x79,
	MOD_BLUE				= 0x7A,

// Умение создавать предметы

	MOD_FISH				= 0x7F,
	MOD_WOOD				= 0x80,
	MOD_SMITH				= 0x81,
	MOD_GOLDSMITH			= 0x82,
	MOD_CLOTH				= 0x83,
	MOD_LEATHER				= 0x84,
	MOD_BONE				= 0x85,
	MOD_ALCHEMY				= 0x86,
	MOD_COOK				= 0x87,
	MOD_SYNERGY				= 0x88,
	MOD_RIDING				= 0x89,

// Невозможность создания предметов высокого качества

	MOD_ANTIHQ_WOOD			= 0x90,
	MOD_ANTIHQ_SMITH		= 0x91,
	MOD_ANTIHQ_GOLDSMITH	= 0x92,
	MOD_ANTIHQ_CLOTH		= 0x93,
	MOD_ANTIHQ_LEATHER		= 0x94,
	MOD_ANTIHQ_BONE			= 0x95,
	MOD_ANTIHQ_ALCHEMY		= 0x96,
	MOD_ANTIHQ_COOK			= 0x97,

// Получаемый урон в процентах

	MOD_DMG					= 0xA0, 
	MOD_DMGPHYS				= 0xA1,
	MOD_DMGBREATH			= 0xA2,
	MOD_DMGMAGIC			= 0xA3,
	MOD_DMGRANGE			= 0xA4,

// Вероятность критического удара

	MOD_CRITHITRATE			= 0xA5,
	MOD_ENEMYCRITRATE		= 0xA6,

	MOD_HASTE				= 0xA7,		// % Percent Haste (and Slow)
	MOD_SPELLINTERRUPT		= 0xA8,		// % Spell Interruption Rate
	MOD_MOVE				= 0xA9,		// % изменения скорости
	MOD_FASTCAST			= 0xAA,
	MOD_DELAY				= 0xAB,
	MOD_RANGED_DELAY		= 0xAC,
	MOD_MARTIAL_ARTS		= 0xAD,		// The integer amount of delay to reduce from H2H weapons' base delay.

// Модификаторы еды

	MOD_FOOD_HPP			= 0xB0,
	MOD_FOOD_HP_CAP			= 0xB1,
	MOD_FOOD_MPP			= 0xB2,
	MOD_FOOD_MP_CAP			= 0xB3,
	MOD_FOOD_ATTP			= 0xB4,
	MOD_FOOD_ATT_CAP		= 0xB5,
	MOD_FOOD_DEFP			= 0xB6,
	MOD_FOOD_DEF_CAP		= 0xB7,
	MOD_FOOD_ACCP			= 0xB8,
	MOD_FOOD_ACC_CAP		= 0xB9,
	MOD_FOOD_RATTP			= 0xBA,
	MOD_FOOD_RATT_CAP		= 0xBB,
	MOD_FOOD_RACCP			= 0xBC,
	MOD_FOOD_RACC_CAP		= 0xBD,

// Killer-эффекты -- вероятность устрашения

	MOD_VERMIN_KILLER		= 0xE0,
	MOD_BIRD_KILLER			= 0xE1,
	MOD_AMORPH_KILLER		= 0xE2,
	MOD_LIZARD_KILLER		= 0xE3,
	MOD_AQUAN_KILLER		= 0xE4,
	MOD_PLANTOID_KILLER		= 0xE5,
	MOD_BEAST_KILLER		= 0xE6,
	MOD_UNDEAD_KILLER		= 0xE7,
	MOD_ARCANA_KILLER		= 0xE8,
	MOD_DRAGON_KILLER		= 0xE9,
	MOD_DEMON_KILLER		= 0xEA,
	MOD_EMPTY_KILLER		= 0xEB,
	MOD_HUMANOID_KILLER		= 0xEC,

	MOD_SLEEPRES			= 0xF0,
	MOD_POISONRES			= 0xF1,
	MOD_PARALYZERES			= 0xF2,
	MOD_BLINDRES			= 0xF3,
	MOD_SILENCERES			= 0xF4,
	MOD_VIRUSRES			= 0xF5,
	MOD_PETRIFYRES			= 0xF6,
	MOD_BINDRES				= 0xF7,
	MOD_CURSERES			= 0xF8,
	MOD_GRAVITYRES			= 0xF9,
	MOD_SLOWRES				= 0xFA,
	MOD_STUNRES				= 0xFB,
	MOD_CHARMRES			= 0xFC,

	MOD_UNKNOWN				= 0xFF,

	MOD_PARALYZE			= 0x101,	// Paralyze -- percent chance to proc
	MOD_MIJIN_GAKURE		= 0x102,	// Tracks whether or not you used this ability to die.
	MOD_DUAL_WIELD			= 0x103,	// Percent reduction in dual wield delay.

// Warrior

	MOD_DOUBLE_ATTACK		= 0x120,	// Percent chance to proc

// Monk

	MOD_SUBTLE_BLOW			= 0x121,	// How much TP to reduce.
	MOD_COUNTER				= 0x123,	// Percent chance to counter
	MOD_KICK_ATTACK			= 0x124,	// Percent chance to kick

// White Mage

	MOD_AFFLATUS_SOLACE		= 0x125,	// Pool of HP accumulated during Afflatus Solace
	MOD_AFFLATUS_MISERY		= 0x126,	// Pool of HP accumulated during Afflatus Misery 

// Black Mage

	MOD_CLEAR_MIND			= 0x127,	// Used in conjunction with MOD_HEALMP to increase amount between tics
	MOD_CONSERVE_MP			= 0x128,	// Percent chance

// Red Mage

	MOD_BLINK				= 0x12B,	// Tracks blink shadows
	MOD_STONESKIN			= 0x12C,	// Tracks stoneskin HP pool
	MOD_PHALANX				= 0x12D,	// Tracks direct damage reduction

// Thief

	MOD_TRIPLE_ATTACK		= 0x12E,	// Percent chance
	MOD_TREASURE_HUNTER     = 0x12F,	// Percent chance

// Paladin
// Dark Knight
// Beastmaster

	MOD_TAME				= 0x130,	// Additional percent chance to charm

// Bard
// Ranger

	MOD_RECYCLE				= 0x131,	// Percent chance to recycle

// Samurai

	MOD_ZANSHIN				= 0x132,	// Percent chance to counter

// Ninja

	MOD_UTSUSEMI			= 0x133,	// Everyone's favorite --tracks shadows.
	MOD_NINJA_TOOL			= 0x134,	// Percent chance to not use a tool.

// Dragoon
// Summoner
// Blue Mage

	MOD_BLUE_POINTS			= 0x135,	// Tracks extra blue points

// Corsair

	MOD_DEDICATION			= 0x136,	// % exp gain
	MOD_DEDICATION_CAP		= 0x137,	// Cap of dedicaiton effect

	MOD_ROLL_FIGHTERS		= 0x138,	// Tracks totals
	MOD_ROLL_MONKS			= 0x139,	// Tracks totals
	MOD_ROLL_HEALERS		= 0x13A,	// Tracks totals
	MOD_ROLL_WIZARDS		= 0x13B,	// Tracks totals
	MOD_ROLL_WARLOCKS		= 0x13C,	// Tracks totals
	MOD_ROLL_ROGUES			= 0x13D,	// Tracks totals
	MOD_ROLL_GALLANTS		= 0x13E,	// Tracks totals
	MOD_ROLL_CHAOS			= 0x13F,	// Tracks totals
	MOD_ROLL_BEAST			= 0x140,	// Tracks totals
	MOD_ROLL_CHORAL			= 0x141,	// Tracks totals
	MOD_ROLL_HUNTERS		= 0x142,	// Tracks totals
	MOD_ROLL_SAMURAI		= 0x143,	// Tracks totals
	MOD_ROLL_NINJA			= 0x144,	// Tracks totals
	MOD_ROLL_DRACHEN		= 0x145,	// Tracks totals
	MOD_ROLL_EVOKERS		= 0x146,	// Tracks totals
	MOD_ROLL_MAGUS			= 0x147,	// Tracks totals
	MOD_ROLL_CORSAIRS		= 0x148,	// Tracks totals
	MOD_ROLL_PUPPET			= 0x149,	// Tracks totals
	MOD_ROLL_DANCERS		= 0x14A,	// Tracks totals
	MOD_ROLL_SCHOLARS		= 0x14B,	// Tracks totals
	MOD_BUST				= 0x14C,	// # of busts

// Puppetmaster
// Dancer

	MOD_FINISHING_MOVES		= 0x14D,	// Tracks # of finishing moves

// Scholar

	MOD_SUBLIMATION			= 0x14E,	// Pool of MP to draw from after Sublimation charge is complete.
	MOD_STORMSURGE			= 0x14F,	// Tracks which element storm it is
	MOD_LIGHT_ARTS_MPCOST	= 0x150,
	MOD_LIGHT_ARTS_FASTCAST	= 0x151,
	MOD_DARK_ARTS_MPCOST	= 0x152,
	MOD_DARK_ARTS_FASTCAST	= 0x153
};

#define MAX_MODIFIER		  0x154


/************************************************************************
*																		*
*  Класс модификатора (в нем защищается поле id от выхода за пределы)	*
*																		*
************************************************************************/


class CModifier 
{
public:

	uint16	getModID();
	int16	getModAmount();

	void	setModAmount(int16 amount);

	 CModifier(uint16 type, int16 amount = 0);
	~CModifier();

private:

	uint16	m_id;
	int16	m_amount;
};

#endif