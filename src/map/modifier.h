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

#ifndef _CMODIFIER_H
#define _CMODIFIER_H

#include "../common/cbasetypes.h"

enum MODIFIER
{
	MOD_NONE				= 0x00,

	MOD_DEF					= 0x01,		// Target's Defense
	MOD_HP					= 0x02,		// Target's HP 
	MOD_HPP					= 0x03,		// HP Percentage
	MOD_CONVMPTOHP			= 0x04,		// MP -> HP (Cassie Earring)
	MOD_MP					= 0x05,		// MP +/-
	MOD_MPP					= 0x06,		// MP Percentage
	MOD_CONVHPTOMP			= 0x07,		// HP -> MP 

	MOD_STR					= 0x08,		// Strength
	MOD_DEX					= 0x09,		// Dexterity
	MOD_VIT					= 0x0A,		// Vitality	
	MOD_AGI					= 0x0B,		// Agility
	MOD_INT					= 0x0C,		// Intelligence
	MOD_MND					= 0x0D,		// Mind
	MOD_CHR					= 0x0E,		// Charisma

// Elemental Defenses

	MOD_FIREDEF				= 0x0F,		// Fire Defense
	MOD_ICEDEF				= 0x10,		// Ice Defense
	MOD_WINDDEF				= 0x11,		// Wind Defense
	MOD_EARTHDEF			= 0x12,		// Earth Defense
	MOD_THUNDERDEF			= 0x13,		// Thunder Defense
	MOD_WATERDEF			= 0x14,		// Water Defense
	MOD_LIGHTDEF			= 0x15,		// Light Defense
	MOD_DARKDEF				= 0x16,		// Dark Defense

	MOD_ATT					= 0x17,		// Attack
	MOD_RATT				= 0x18,		// Ranged Attack

	MOD_ACC					= 0x19,		// Accuracy
	MOD_RACC				= 0x1A,		// Ranged Accuracy

	MOD_ENMITY				= 0x1B,		// Enmity

	MOD_MATT				= 0x1C,		// Magic Attack
	MOD_MDEF				= 0x1D,		// Magic Defense
	MOD_MACC				= 0x1E,		// Magic Accuracy
	MOD_MEVA				= 0x1F,		// Magic Evasion

// Magic Accuracy and Elemental Attacks

	MOD_FIREATT				= 0x20,		// Fire Damage
	MOD_ICEATT				= 0x21,		// Ice Damage
	MOD_WINDATT				= 0x22,		// Wind Damage
	MOD_EARTHATT			= 0x23,		// Earth Damage
	MOD_THUNDERATT			= 0x24,		// Thunder Damage
	MOD_WATERATT			= 0x25,		// Water Damage
	MOD_LIGHTATT			= 0x26,		// Light Damage
	MOD_DARKATT				= 0x27,		// Dark Damage
	MOD_FIREACC				= 0x28,		// Fire Accuracy
	MOD_ICEACC				= 0x29,		// Ice Accuracy
	MOD_WINDACC				= 0x2A,		// Wind Accuracy
	MOD_EARTHACC			= 0x2B,		// Earth Accuracy
	MOD_THUNDERACC			= 0x2C,		// Thunder Accuracy
	MOD_WATERACC			= 0x2D,		// Water Accuracy
	MOD_LIGHTACC			= 0x2E,		// Light Accuracy
	MOD_DARKACC				= 0x2F,		// Dark Accuracy

	MOD_WSACC				= 0x30,		// Weaponskill Accuracy 

// Resistance to damage type 
// Value is stored as a percentage of damage reduction (to within 1000)
// Example: 1000 = 100%, 875 = 87.5%

	MOD_SLASHRES			= 0x31,  // Slash Resistance
	MOD_PIERCERES			= 0x32,	 // Piercing Resistance
	MOD_IMPACTRES			= 0x33,	 // Impact Resistance
	MOD_HTHRES				= 0x34,  // Hand-To-Hand Resistance


// Damage Reduction to Elements
// Value is stored as a percentage of damage reduction (to within 1000)
// Example: 1000 = 100%, 875 = 87.5%

	MOD_FIRERES				= 0x36,		// % Fire Resistance
	MOD_ICERES				= 0x37,		// % Ice Resistance
	MOD_WINDRES				= 0x38,		// % Wind Resistance
	MOD_EARTHRES			= 0x39,		// % Earth Resistance
	MOD_THUNDERRES			= 0x3A,		// % Thunder Resistance
	MOD_WATERRES			= 0x3B,		// % Water Resistance
	MOD_LIGHTRES			= 0x3C,		// % Light Resistance
	MOD_DARKRES				= 0x3D,		// % Dark Resistance

	MOD_ATTP				= 0x3E,		// % Attack
	MOD_DEFP				= 0x3F,		// % Defense
	MOD_ACCP				= 0x40,		// % Accuracy
	MOD_EVAP				= 0x41,		// % Evasion
	MOD_RATTP				= 0x42,		// % Ranged Attack
	MOD_RACCP				= 0x43,		// % Ranged Attack Accuracy

	MOD_EVA					= 0x44,		// Evasion
	MOD_RDEF				= 0x45,		// Ranged Defense
	MOD_REVA				= 0x46,		// Ranged Evasion
	MOD_MPHEAL				= 0x47,		// MP Recovered while healing
	MOD_HPHEAL				= 0x48,		// HP Recovered while healing
	MOD_STORETP				= 0x49,		// Increases the rate at which TP is gained

// Working Skills (weapon combat skills)

	MOD_HTH					= 0x50,		// Hand To Hand
	MOD_DAGGER				= 0x51,		// Dagger
	MOD_SWORD				= 0x52,		// Sword
	MOD_GSWORD				= 0x53,		// Great Sword
	MOD_AXE					= 0x54,		// Axe
	MOD_GAXE				= 0x55,		// Great Axe
	MOD_SCYTHE				= 0x56,		// Scythe
	MOD_POLEARM				= 0x57,		// Polearm
	MOD_KATANA				= 0x58,		// Katana
	MOD_GKATANA				= 0x59,		// Great Katana
	MOD_CLUB				= 0x5A,		// Club
	MOD_STAFF				= 0x5B,		// Staff
	MOD_ARCHERY				= 0x68,		// Archery
	MOD_MARKSMAN			= 0x69,		// Marksman
	MOD_THROW				= 0x6A,		// Throw
	MOD_GUARD				= 0x6B,		// Guard
	MOD_EVASION				= 0x6C,		// Evasion
	MOD_SHIELD				= 0x6D,		// Shield
	MOD_PARRY				= 0x6E,		// Parry

// Magic Skills

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

// Synthesis Skills

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

// Chance you will not make an hq synth (Impossibility of HQ synth)	

	MOD_ANTIHQ_WOOD			= 0x90,
	MOD_ANTIHQ_SMITH		= 0x91,
	MOD_ANTIHQ_GOLDSMITH	= 0x92,
	MOD_ANTIHQ_CLOTH		= 0x93,
	MOD_ANTIHQ_LEATHER		= 0x94,
	MOD_ANTIHQ_BONE			= 0x95,
	MOD_ANTIHQ_ALCHEMY		= 0x96,
	MOD_ANTIHQ_COOK			= 0x97,

// Damage / Crit Damage / Delay

	MOD_DMG					= 0xA0,	// Damage Multiplier 
	MOD_DMGPHYS				= 0xA1,	// Physical Damage Multiplier
	MOD_DMGBREATH			= 0xA2,	// Breath Damage Multiplier
	MOD_DMGMAGIC			= 0xA3, // Magic Damage Multiplier
	MOD_DMGRANGE			= 0xA4,	// Range Damage Multiplier

	MOD_CRITHITRATE			= 0xA5, // Raises chance to crit
	MOD_ENEMYCRITRATE		= 0xA6, // Raises chance enemy will crit

	MOD_HASTE				= 0xA7,		// % Percent Haste (and Slow)
	MOD_SPELLINTERRUPT		= 0xA8,		// % Spell Interruption Rate
	MOD_MOVE				= 0xA9,		// % Movement Speed
	MOD_FASTCAST			= 0xAA,		// Increases Spell Cast Time (TRAIT) 
	MOD_DELAY				= 0xAB,		// Increase/Decrease Delay (unused... )
	MOD_RANGED_DELAY		= 0xAC,		// (unused... )
	MOD_MARTIAL_ARTS		= 0xAD,		// The integer amount of delay to reduce from H2H weapons' base delay. (TRAIT)
    MOD_SKILLCHAINBONUS     = 0xAE,     // Damage bonus applied to skill chain damage.  Modifier from effects/traits
    MOD_SKILLCHAINDMG       = 0xAF,     // Damage bonus applied to skill chain damage.  Modifier from gear (multiplicative after effect/traits)

// FOOD!

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

// Killer-Effects - (Most by Traits/JobAbility)

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
    MOD_LUMORIAN_KILLER     = 0xED,
    MOD_LUMINION_KILLER     = 0xEE,

// Resistances to enfeebles - Traits/Job Ability

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

	MOD_AVATAR_PERPETUATION = 0x15A,  //stores the MP/tick reduction from gear

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
	MOD_DARK_ARTS_FASTCAST	= 0x153,

	MOD_WIDESCAN			= 0x154,
	MOD_ENSPELL				= 0x155, //stores the type of enspell active (0 if nothing)
	MOD_SPIKES				= 0x156, //store the type of spike spell active (0 if nothing)
	MOD_ENSPELL_DMG			= 0x157, //stores the base damage of the enspell before reductions
	MOD_SPIKES_DMG			= 0x158, //stores the base damage of the spikes before reductions

	MOD_TP_BONUS			= 0x159, 

	MOD_FIRE_AFFINITY		= 0x15B, //stores the amount of elemental affinity (elemental staves mostly)
	MOD_EARTH_AFFINITY		= 0x15C,
	MOD_WATER_AFFINITY		= 0x15D,
	MOD_ICE_AFFINITY		= 0x15E,
	MOD_THUNDER_AFFINITY	= 0x15F,
	MOD_WIND_AFFINITY		= 0x160,
	MOD_LIGHT_AFFINITY		= 0x161,
	MOD_DARK_AFFINITY		= 0x162
};

#define MAX_MODIFIER		  0x163


/************************************************************************
*  Modifier Class														*
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