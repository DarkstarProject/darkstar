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

#ifndef _CABILITY_H
#define _CABILITY_H

#include "../common/cbasetypes.h"
#include "../common/mmo.h"

#include "battleentity.h"

enum ABILITY
{
	ABILITY_MIGHTY_STRIKES     = 0,
    ABILITY_HUNDRED_FISTS      = 1,
    ABILITY_BENEDICTION        = 2,
    ABILITY_MANAFONT           = 3,
    ABILITY_CHAINSPELL         = 4,
    ABILITY_PERFECT_DODGE      = 5,
    ABILITY_INVINCIBLE         = 6,
    ABILITY_BLOOD_WEAPON       = 7,
    ABILITY_FAMILIAR           = 8,
    ABILITY_SOUL_VOICE         = 9,
    ABILITY_EAGLE_EYE_SHOT     = 10,
    ABILITY_MEIKYO_SHISUI      = 11,
    ABILITY_MIJIN_GAKURE       = 12,
    ABILITY_SPIRIT_SURGE       = 13,
    ABILITY_ASTRAL_FLOW        = 14,
    ABILITY_BERSERK            = 15,
    ABILITY_WARCRY             = 16,
    ABILITY_DEFENDER           = 17,
    ABILITY_AGGRESSOR          = 18,
    ABILITY_PROVOKE            = 19,
    ABILITY_FOCUS              = 20,
    ABILITY_DODGE              = 21,
    ABILITY_CHAKRA             = 22,
    ABILITY_BOOST              = 23,
    ABILITY_COUNTERSTANCE      = 24,
    ABILITY_STEAL              = 25,
    ABILITY_FLEE               = 26,
    ABILITY_HIDE               = 27,
    ABILITY_SNEAK_ATTACK       = 28,
    ABILITY_MUG                = 29,
    ABILITY_SHIELD_BASH        = 30,
    ABILITY_HOLY_CIRCLE        = 31,
    ABILITY_SENTINEL           = 32,
    ABILITY_SOULEATER          = 33,
    ABILITY_ARCANE_CIRCLE      = 34,
    ABILITY_LAST_RESORT        = 35,
    ABILITY_CHARM              = 36,
    ABILITY_GAUGE              = 37,
    ABILITY_TAME               = 38,
    ABILITY_PET_COMMANDS       = 39,
    ABILITY_SCAVENGE           = 40,
    ABILITY_SHADOWBIND         = 41,
    ABILITY_CAMOUFLAGE         = 42,
    ABILITY_SHARPSHOT          = 43,
    ABILITY_BARRAGE            = 44,
    ABILITY_CALL_WYVERN        = 45,
    ABILITY_THIRD_EYE          = 46,
    ABILITY_MEDITATE           = 47,
    ABILITY_WARDING_CIRCLE     = 48,
    ABILITY_ANCIENT_CIRCLE     = 49,
    ABILITY_JUMP               = 50,
    ABILITY_HIGH_JUMP          = 51,
    ABILITY_SUPER_JUMP         = 52,
    ABILITY_FIGHT              = 53,
    ABILITY_HEEL               = 54,
    ABILITY_LEAVE              = 55,
    ABILITY_SIC                = 56,
    ABILITY_STAY               = 57,
    ABILITY_DIVINE_SEAL        = 58,
    ABILITY_ELEMENTAL_SEAL     = 59,
    ABILITY_TRICK_ATTACK       = 60,
    ABILITY_WEAPON_BASH        = 61,
    ABILITY_REWARD             = 62,
    ABILITY_COVER              = 63,
    ABILITY_SPIRIT_LINK        = 64,
    ABILITY_CHI_BLAST          = 66,
    ABILITY_CONVERT            = 67,
    ABILITY_ACCOMPLICE         = 68,
    ABILITY_CALL_BEAST         = 69,
    ABILITY_UNLIMITED_SHOT     = 70,
    ABILITY_DISMISS            = 71,
    ABILITY_ASSAULT            = 72,
    ABILITY_RETREAT            = 73,
    ABILITY_RELEASE            = 74,
    ABILITY_BLOOD_PACT_RAGE    = 75,
    ABILITY_RAMPART            = 76,
    ABILITY_AZURE_LORE         = 77,
    ABILITY_CHAIN_AFFINITY     = 78,
    ABILITY_BURST_AFFINITY     = 79,
    ABILITY_WILD_CARD          = 80,
    ABILITY_PHANTOM_ROLL       = 81,
    ABILITY_FIGHTERS_ROLL      = 82,
    ABILITY_MONKS_ROLL         = 83,
    ABILITY_HEALERS_ROLL       = 84,
    ABILITY_WIZARDS_ROLL       = 85,
    ABILITY_WARLOCKS_ROLL      = 86,
    ABILITY_ROGUES_ROLL        = 87,
    ABILITY_GALLANTS_ROLL      = 88,
    ABILITY_CHAOS_ROLL         = 89,
    ABILITY_BEAST_ROLL         = 90,
    ABILITY_CHORAL_ROLL        = 91,
    ABILITY_HUNTERS_ROLL       = 92,
    ABILITY_SAMURAI_ROLL       = 93,
    ABILITY_NINJA_ROLL         = 94,
    ABILITY_DRACHEN_ROLL       = 95,
    ABILITY_EVOKERS_ROLL       = 96,
    ABILITY_MAGUSS_ROLL        = 97,
    ABILITY_CORSAIRS_ROLL      = 98,
    ABILITY_PUPPET_ROLL        = 99,
    ABILITY_DANCERS_ROLL       = 100,
    ABILITY_SCHOLARS_ROLL      = 101,
    ABILITY_DOUBLE_UP          = 107,
    ABILITY_QUICK_DRAW         = 108,
    ABILITY_FIRE_SHOT          = 109,
    ABILITY_ICE_SHOT           = 110,
    ABILITY_WIND_SHOT          = 111,
    ABILITY_EARTH_SHOT         = 112,
    ABILITY_THUNDER_SHOT       = 113,
    ABILITY_WATER_SHOT         = 114,
    ABILITY_LIGHT_SHOT         = 115,
    ABILITY_DARK_SHOT          = 116,
    ABILITY_RANDOM_DEAL        = 117,
    ABILITY_OVERDRIVE          = 119,
    ABILITY_ACTIVATE           = 120,
    ABILITY_REPAIR             = 121,
    ABILITY_DEPLOY             = 122,
    ABILITY_DEACTIVATE         = 123,
    ABILITY_RETRIEVE           = 124,
    ABILITY_FIRE_MANEUVER      = 125,
    ABILITY_ICE_MANEUVER       = 126,
    ABILITY_WIND_MANEUVER      = 127,
    ABILITY_EARTH_MANEUVER     = 128,
    ABILITY_THUNDER_MANEUVER   = 129,
    ABILITY_WATER_MANEUVER     = 130,
    ABILITY_LIGHT_MANEUVER     = 131,
    ABILITY_DARK_MANEUVER      = 132,
    ABILITY_WARRIORS_CHARGE    = 133,
    ABILITY_TOMAHAWK           = 134,
    ABILITY_MANTRA             = 135,
    ABILITY_FORMLESS_STRIKES   = 136,
    ABILITY_MARTYR             = 137,
    ABILITY_DEVOTION           = 138,
    ABILITY_ASSASSINS_CHARGE   = 139,
    ABILITY_FEINT              = 140,
    ABILITY_FEALTY             = 141,
    ABILITY_CHIVALRY           = 142,
    ABILITY_DARK_SEAL          = 143,
    ABILITY_DIABOLIC_EYE       = 144,
    ABILITY_FERAL_HOWL         = 145,
    ABILITY_KILLER_INSTINCT    = 146,
    ABILITY_NIGHTINGALE        = 147,
    ABILITY_TROUBADOUR         = 148,
    ABILITY_STEALTH_SHOT       = 149,
    ABILITY_FLASHY_SHOT        = 150,
    ABILITY_SHIKIKOYO          = 151,
    ABILITY_BLADE_BASH         = 152,
    ABILITY_DEEP_BREATHING     = 153,
    ABILITY_ANGON              = 154,
    ABILITY_SANGE              = 155,
    ABILITY_BLOOD_PACT_WARD    = 156,
    ABILITY_HASSO              = 157,
    ABILITY_SEIGAN             = 158,
    ABILITY_CONVERGENCE        = 159,
    ABILITY_DIFFUSION          = 160,
    ABILITY_SNAKE_EYE          = 161,
    ABILITY_FOLD               = 162,
    ABILITY_ROLE_REVERSAL      = 163,
    ABILITY_VENTRILOQUY        = 164,
    ABILITY_TRANCE             = 165,
    ABILITY_SAMBAS             = 166,
    ABILITY_WALTZES            = 167,
    ABILITY_DRAIN_SAMBA        = 168,
    ABILITY_DRAIN_SAMBA_II     = 169,
    ABILITY_DRAIN_SAMBA_III    = 170,
    ABILITY_ASPIR_SAMBA        = 171,
    ABILITY_ASPIR_SAMBA_II     = 172,
    ABILITY_HASTE_SAMBA        = 173,
    ABILITY_CURING_WALTZ       = 174,
    ABILITY_CURING_WALTZ_II    = 175,
    ABILITY_CURING_WALTZ_III   = 176,
    ABILITY_CURING_WALTZ_IV    = 177,
    ABILITY_HEALING_WALTZ      = 178,
    ABILITY_DIVINE_WALTZ       = 179,
    ABILITY_SPECTRAL_JIG       = 180,
    ABILITY_CHOCOBO_JIG        = 181,
    ABILITY_JIGS               = 182,
    ABILITY_STEPS              = 183,
    ABILITY_FLOURISHES_I       = 184,
    ABILITY_QUICKSTEP          = 185,
    ABILITY_BOX_STEP           = 186,
    ABILITY_STUTTER_STEP       = 187,
    ABILITY_ANIMATED_FLOURISH  = 188,
    ABILITY_DESPERATE_FLOURISH = 189,
    ABILITY_REVERSE_FLOURISH   = 190,
    ABILITY_VIOLENT_FLOURISH   = 191,
    ABILITY_BUILDING_FLOURISH  = 192,
    ABILITY_WILD_FLOURISH      = 193,
    ABILITY_TABULA_RASA        = 194,
    ABILITY_LIGHT_ARTS         = 195,
    ABILITY_DARK_ARTS          = 196,
    ABILITY_FLOURISHES_II      = 197,
    ABILITY_MODUS_VERITAS      = 198,
    ABILITY_PENURY             = 199,
    ABILITY_CELERITY           = 200,
    ABILITY_RAPTURE            = 201,
    ABILITY_ACCESSION          = 202,
    ABILITY_PARSIMONY          = 203,
    ABILITY_ALACRITY           = 204,
    ABILITY_EBULLIENCE         = 205,
    ABILITY_MANIFESTATION      = 206,
    ABILITY_STRATAGEMS         = 207,
    ABILITY_VELOCITY_SHOT      = 208,
    ABILITY_SNARL              = 209,
    ABILITY_RETALIATION        = 210,
    ABILITY_FOOTWORK           = 211,
    ABILITY_PIANISSIMO         = 213,
    ABILITY_SEKKANOKI          = 214,
    ABILITY_ELEMENTAL_SIPHON   = 216,
    ABILITY_SUBLIMATION        = 217,
    ABILITY_ADDENDUM_WHITE     = 218,
    ABILITY_ADDENDUM_BLACK     = 219,
    ABILITY_COLLABORATOR       = 220,
    ABILITY_SABER_DANCE        = 221,
    ABILITY_FAN_DANCE          = 222,
    ABILITY_NO_FOOT_RISE       = 223,
    ABILITY_ALTRUISM           = 224,
    ABILITY_FOCALIZATION       = 225,
    ABILITY_TRANQUILITY        = 226,
    ABILITY_EQUANIMITY         = 227,
    ABILITY_ENLIGHTENMENT      = 228,
    ABILITY_AFFLATUS_SOLACE    = 229,
    ABILITY_AFFLATUS_MISERY    = 230,
    ABILITY_COMPOSURE          = 231,
    ABILITY_YONIN              = 232,
    ABILITY_INNIN              = 233,
    ABILITY_HEALING_RUBY       = 496,
    ABILITY_POISON_NAILS       = 497,
    ABILITY_SHINING_RUBY       = 498,
    ABILITY_GLITTERING_RUBY    = 499,
    ABILITY_METEORITE          = 500,
    ABILITY_HEALING_RUBY_II    = 501,
	ABILITY_SEARING_LIGHT	   = 502,
	ABILITY_MOONLIT_CHARGE	   = 512,
	ABILITY_CRESCENT_FANG	   = 513,
	ABILITY_LUNAR_CRY		   = 514,
	ABILITY_LUNAR_ROAR		   = 515,
	ABILITY_ECLIPTIC_GROWL	   = 516,
	ABILITY_ECLIPTIC_HOWL	   = 517,
	ABILITY_ECLIPSE_BITE	   = 518,
	ABILITY_HOWLING_MOON	   = 520,
	ABILITY_PUNCH			   = 528,
	ABILITY_FIRE_II			   = 529,
	ABILITY_BURNING_STRIKE	   = 530,
	ABILITY_DOUBLE_PUNCH	   = 531,
	ABILITY_CRIMSON_HOWL	   = 532,
	ABILITY_FIRE_IV			   = 533,
	ABILITY_FLAMING_CRUSH	   = 534,
	ABILITY_METEOR_STRIKE	   = 535,
	ABILITY_INFERNO			   = 536,
	ABILITY_ROCK_THROW		   = 544,
	ABILITY_STONE_II		   = 545,
	ABILITY_ROCK_BUSTER		   = 546,
	ABILITY_MEGALITH_THROW	   = 547,
	ABILITY_EARTHEN_WARD	   = 548,
	ABILITY_STONE_IV		   = 549,
	ABILITY_MOUNTAIN_BUSTER	   = 550,
	ABILITY_GEOCRUSH		   = 551,
	ABILITY_EARTHEN_FURY	   = 552,
	ABILITY_BARRACUDA_DIVE	   = 560,
	ABILITY_WATER_II		   = 561,
	ABILITY_TAIL_WHIP		   = 562,
	ABILITY_SLOWGA			   = 564,
	ABILITY_SPRING_WATER	   = 563,
	ABILITY_WATER_IV		   = 565,
	ABILITY_SPINNING_DIVE	   = 566,
	ABILITY_GRAND_FALL		   = 567,
	ABILITY_TIDAL WAVE		   = 568,
    ABILITY_CLAW               = 576,
    ABILITY_AERO_II            = 577,
    ABILITY_WHISPERING_WIND    = 578,
    ABILITY_HASTEGA            = 579,
    ABILITY_AERIAL_ARMOR       = 580,
    ABILITY_AERO_IV            = 581,
    ABILITY_PREDATOR_CLAWS     = 582,
    ABILITY_WIND_BLADE         = 583,
	ABILITY_AERIAL_BLAST	   = 584,
	ABILITY_AXE_KICK		   = 592,
	ABILITY_BLIZZARD_II		   = 593,
	ABILITY_FROST_ARMOR		   = 594,
	ABILITY_SLEEPGA			   = 595,
	ABILITY_DOUBLE_SLAP		   = 596,
	ABILITY_BLIZZARD_IV		   = 597,
	ABILITY_RUSH			   = 598,
	ABILITY_HEAVENLY_STRIKE	   = 599,
	ABILITY_DIAMOND_DUST	   = 600,
	ABILITY_SHOCK_STRIKE	   = 608,
	ABILITY_THUNDER_II		   = 609,
	ABILITY_THUNDERSPARK	   = 611,
	ABILITY_ROLLING_THUNDER	   = 610,
	ABILITY_LIGHTNING_ARMOR	   = 612,
	ABILITY_THUNDER_IV		   = 613,
	ABILITY_CHAOTIC_STRIKE	   = 614,
	ABILITY_THUNDERSTORM	   = 615,
	ABILITY_JUDGMENT_BOLT	   = 616
};

#define MAX_ABILITY_ID	617

/************************************************************************
*                                                                       *
*                                                                       *
*                                                                       *
************************************************************************/

class CAbility
{
public:

	CAbility(uint16 id);

	uint16		getID();
	JOBTYPE		getJob();
	uint8		getLevel();
	uint8		getAnimationID();
	uint8		getRange();
	uint8		getAOE();
	uint8		getValidTarget();
	uint16		getRecastTime();
	uint16		getRecastId();
	uint16		getCE();
	uint16		getVE();

	void		setID(uint16 id);
	void		setJob(JOBTYPE Job);
	void		setLevel(uint8 level);
	void		setAnimationID(uint8 animationID);
	void		setRange(uint8 range);
	void		setAOE(uint8 aoe);
	void		setValidTarget(uint8 validTarget);
	void		setRecastTime(uint16 recastTime);
	void		setRecastId(uint16 recastId); 
	void		setCE(uint16 CE);
	void		setVE(uint16 VE);

	const int8* getName();
	void		setName(int8* name);
	
private:

	uint16		m_ID;
	JOBTYPE		m_Job;
	uint8		m_level;
	uint8		m_animationID;
	uint8		m_range;
	uint8		m_aoe;
	uint8		m_validTarget;
	uint16		m_recastTime;
	uint16		m_recastId;
	uint16		m_CE;
	uint16		m_VE;
	string_t	m_name;
};

/************************************************************************
*                                                                       *
*  namespase для работы со способностями                                *
*                                                                       *
************************************************************************/

namespace ability
{
    void    LoadAbilitiesList();

    CAbility* GetAbility(uint16 AbilityID);
    CAbility* GetTwoHourAbility(JOBTYPE JobID);

    std::vector<CAbility*> GetAbilities(JOBTYPE JobID);
};

#endif