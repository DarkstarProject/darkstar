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

/*
    MOD_NAME                      =0xHEX#, // MOD DESCRIPTION (modId = DEC#)
*/

#ifndef _CMODIFIER_H
#define _CMODIFIER_H

#include "../common/cbasetypes.h"

enum MODIFIER
{
    MOD_NONE                      = 0x00,

    MOD_DEF                       = 0x01,  // Target's Defense (modId = 1)
    MOD_HP                        = 0x02,  // Target's HP (modId = 2)
    MOD_HPP                       = 0x03,  // HP Percentage (modId = 3)
    MOD_CONVMPTOHP                = 0x04,  // MP -> HP (Cassie Earring) (modId = 4)
    MOD_MP                        = 0x05,  // MP +/- (modId = 5)
    MOD_MPP                       = 0x06,  // MP Percentage (modId = 6)
    MOD_CONVHPTOMP                = 0x07,  // HP -> MP (modId = 7)

    MOD_STR                       = 0x08,  // Strength (modId = 8)
    MOD_DEX                       = 0x09,  // Dexterity (modId = 9)
    MOD_VIT                       = 0x0A,  // Vitality (modId = 10)
    MOD_AGI                       = 0x0B,  // Agility (modId = 11)
    MOD_INT                       = 0x0C,  // Intelligence (modId = 12)
    MOD_MND                       = 0x0D,  // Mind (modId = 13)
    MOD_CHR                       = 0x0E,  // Charisma (modId = 14)

    // Elemental Defenses
    MOD_FIREDEF                   = 0x0F,  // Fire Defense (modId = 15)
    MOD_ICEDEF                    = 0x10,  // Ice Defense (modId = 16)
    MOD_WINDDEF                   = 0x11,  // Wind Defense (modId = 17)
    MOD_EARTHDEF                  = 0x12,  // Earth Defense (modId = 18)
    MOD_THUNDERDEF                = 0x13,  // Thunder Defense (modId = 19)
    MOD_WATERDEF                  = 0x14,  // Water Defense (modId = 20)
    MOD_LIGHTDEF                  = 0x15,  // Light Defense (modId = 21)
    MOD_DARKDEF                   = 0x16,  // Dark Defense (modId = 22)

    MOD_ATT                       = 0x17,  // Attack (modId = 23)
    MOD_RATT                      = 0x18,  // Ranged Attack (modId = 24)

    MOD_ACC                       = 0x19,  // Accuracy (modId = 25)
    MOD_RACC                      = 0x1A,  // Ranged Accuracy (modId = 26)

    MOD_ENMITY                    = 0x1B,  // Enmity (modId = 27)
    MOD_ENMITY_LOSS_REDUCTION     = 0x1F6, // Reduces Enmity lost when taking damage

    MOD_MATT                      = 0x1C,  // Magic Attack (modId = 28)
    MOD_MDEF                      = 0x1D,  // Magic Defense (modId = 29)
    MOD_MACC                      = 0x1E,  // Magic Accuracy (modId = 30)
    MOD_MEVA                      = 0x1F,  // Magic Evasion (modId = 31)

    // Magic Accuracy and Elemental Attacks
    MOD_FIREATT                   = 0x20,  // Fire Damage (modId = 32)
    MOD_ICEATT                    = 0x21,  // Ice Damage (modId = 33)
    MOD_WINDATT                   = 0x22,  // Wind Damage (modId = 34)
    MOD_EARTHATT                  = 0x23,  // Earth Damage (modId = 35)
    MOD_THUNDERATT                = 0x24,  // Thunder Damage (modId = 36)
    MOD_WATERATT                  = 0x25,  // Water Damage (modId = 37)
    MOD_LIGHTATT                  = 0x26,  // Light Damage (modId = 38)
    MOD_DARKATT                   = 0x27,  // Dark Damage (modId = 39)
    MOD_FIREACC                   = 0x28,  // Fire Accuracy (modId = 40)
    MOD_ICEACC                    = 0x29,  // Ice Accuracy (modId = 41)
    MOD_WINDACC                   = 0x2A,  // Wind Accuracy (modId = 42)
    MOD_EARTHACC                  = 0x2B,  // Earth Accuracy (modId = 43)
    MOD_THUNDERACC                = 0x2C,  // Thunder Accuracy (modId = 44)
    MOD_WATERACC                  = 0x2D,  // Water Accuracy (modId = 45)
    MOD_LIGHTACC                  = 0x2E,  // Light Accuracy (modId = 46)
    MOD_DARKACC                   = 0x2F,  // Dark Accuracy (modId = 47)

    MOD_WSACC                     = 0x30,  // Weaponskill Accuracy (modId = 48)

    // Resistance to damage type
    // Value is stored as a percentage of damage reduction (to within 1000)
    // Example: 1000              = 100%, 875= 87.5%
    MOD_SLASHRES                  = 0x31,  // Slash Resistance (modId = 49)
    MOD_PIERCERES                 = 0x32,  // Piercing Resistance (modId = 50)
    MOD_IMPACTRES                 = 0x33,  // Impact Resistance (modId = 51)
    MOD_HTHRES                    = 0x34,  // Hand-To-Hand Resistance (modId = 52)


    // Damage Reduction to Elements
    // Value is stored as a percentage of damage reduction (to within 1000)
    // Example: 1000              = 100%, 875= 87.5%
    MOD_FIRERES                   = 0x36,  // % Fire Resistance (modId = 54)
    MOD_ICERES                    = 0x37,  // % Ice Resistance (modId = 55)
    MOD_WINDRES                   = 0x38,  // % Wind Resistance (modId = 56)
    MOD_EARTHRES                  = 0x39,  // % Earth Resistance (modId = 57)
    MOD_THUNDERRES                = 0x3A,  // % Thunder Resistance (modId = 58)
    MOD_WATERRES                  = 0x3B,  // % Water Resistance (modId = 59)
    MOD_LIGHTRES                  = 0x3C,  // % Light Resistance (modId = 60)
    MOD_DARKRES                   = 0x3D,  // % Dark Resistance (modId = 61)

    MOD_ATTP                      = 0x3E,  // % Attack (modId = 62)
    MOD_DEFP                      = 0x3F,  // % Defense (modId = 63)
    MOD_ACCP                      = 0x40,  // % Accuracy (modId = 64)
    MOD_EVAP                      = 0x41,  // % Evasion (modId = 65)
    MOD_RATTP                     = 0x42,  // % Ranged Attack (modId = 66)
    MOD_RACCP                     = 0x43,  // % Ranged Attack Accuracy (modId = 67)

    MOD_EVA                       = 0x44,  // Evasion (modId = 68)
    MOD_RDEF                      = 0x45,  // Ranged Defense (modId = 69)
    MOD_REVA                      = 0x46,  // Ranged Evasion (modId = 70)
    MOD_MPHEAL                    = 0x47,  // MP Recovered while healing (modId = 71)
    MOD_HPHEAL                    = 0x48,  // HP Recovered while healing (modId = 72)
    MOD_STORETP                   = 0x49,  // Increases the rate at which TP is gained (modId = 73)
    MOD_TACTICAL_PARRY            = 0x1E6, // Tactical Parry Tp Bonus (modId = 486)
    MOD_MAG_BURST_BONUS           = 0x1E7, // Magic Burst Bonus Modifier (percent) (modId = 487)
    MOD_INHIBIT_TP                = 0x1E8, // Inhibits TP Gain (percent) (modId = 488)

    // Working Skills (weapon combat skills)
    MOD_HTH                       = 0x50,  // Hand To Hand Skill (modId = 80)
    MOD_DAGGER                    = 0x51,  // Dagger Skill (modId = 81)
    MOD_SWORD                     = 0x52,  // Sword Skill (modId = 82)
    MOD_GSWORD                    = 0x53,  // Great Sword Skill (modId = 83)
    MOD_AXE                       = 0x54,  // Axe Skill (modId = 84)
    MOD_GAXE                      = 0x55,  // Great Axe Skill (modId = 85)
    MOD_SCYTHE                    = 0x56,  // Scythe Skill (modId = 86)
    MOD_POLEARM                   = 0x57,  // Polearm Skill (modId = 87)
    MOD_KATANA                    = 0x58,  // Katana Skill (modId = 88)
    MOD_GKATANA                   = 0x59,  // Great Katana Skill (modId = 89)
    MOD_CLUB                      = 0x5A,  // Club Skill (modId = 90)
    MOD_STAFF                     = 0x5B,  // Staff Skill (modId = 91)
    MOD_AUTO_MELEE_SKILL          = 0x65,  // Automaton Melee Skill (modId = 101)
    MOD_AUTO_RANGED_SKILL         = 0x66,  // Automaton Range Skill (modId = 102)
    MOD_AUTO_MAGIC_SKILL          = 0x67,  // Automaton Magic Skill (modId = 103)
    MOD_ARCHERY                   = 0x68,  // Archery Skill (modId = 104)
    MOD_MARKSMAN                  = 0x69,  // Marksman Skill (modId = 105)
    MOD_THROW                     = 0x6A,  // Throw Skill (modId = 106)
    MOD_GUARD                     = 0x6B,  // Guard Skill (modId = 107)
    MOD_EVASION                   = 0x6C,  // Evasion Skill (modId = 108)
    MOD_SHIELD                    = 0x6D,  // Shield Skill (modId = 109)
    MOD_PARRY                     = 0x6E,  // Parry Skill (modId = 110)

    // Magic Skills
    MOD_DIVINE                    = 0x6F,  // Divine Magic Skill (modId = 111)
    MOD_HEALING                   = 0x70,  // Healing Magic Skill (modId = 112)
    MOD_ENHANCE                   = 0x71,  // Enhancing Magic Skill (modId = 113)
    MOD_ENFEEBLE                  = 0x72,  // Enfeebling Magic Skill (modId = 114)
    MOD_ELEM                      = 0x73,  // Elemental Magic Skill (modId = 115)
    MOD_DARK                      = 0x74,  // Dark Magic Skill (modId = 116)
    MOD_SUMMONING                 = 0x75,  // Summoning Magic Skill (modId = 117)
    MOD_NINJUTSU                  = 0x76,  // Ninjutsu Magic Skill (modId = 118)
    MOD_SINGING                   = 0x77,  // Singing Magic Skill (modId = 119)
    MOD_STRING                    = 0x78,  // String Magic Skill (modId = 120)
    MOD_WIND                      = 0x79,  // Wind Magic Skill (modId = 121)
    MOD_BLUE                      = 0x7A,  // Blue Magic Skill (modId = 122)

    // Synthesis Skills
    MOD_FISH                      = 0x7F,  // Fishing Skill (modId = 127)
    MOD_WOOD                      = 0x80,  // Woodworking Skill (modId = 128)
    MOD_SMITH                     = 0x81,  // Smithing Skill (modId = 129)
    MOD_GOLDSMITH                 = 0x82,  // Goldsmithing Skill (modId = 130)
    MOD_CLOTH                     = 0x83,  // Clothcraft Skill (modId = 131)
    MOD_LEATHER                   = 0x84,  // Leathercraft Skill (modId = 132)
    MOD_BONE                      = 0x85,  // Bonecraft Skill (modId = 133)
    MOD_ALCHEMY                   = 0x86,  // Alchemy Skill (modId = 134)
    MOD_COOK                      = 0x87,  // Cooking Skill (modId = 135)
    MOD_SYNERGY                   = 0x88,  // Synergy Skill (modId = 136)
    MOD_RIDING                    = 0x89,  // Riding Skill (modId = 137)

    // Chance you will not make an hq synth (Impossibility of HQ synth)
    MOD_ANTIHQ_WOOD               = 0x90,  // Woodworking Success Rate % (modId = 144)
    MOD_ANTIHQ_SMITH              = 0x91,  // Smithing Success Rate % (modId = 145)
    MOD_ANTIHQ_GOLDSMITH          = 0x92,  // Goldsmithing Success Rate % (modId = 146)
    MOD_ANTIHQ_CLOTH              = 0x93,  // Clothcraft Success Rate % (modId = 147)
    MOD_ANTIHQ_LEATHER            = 0x94,  // Leathercraft Success Rate % (modId = 148)
    MOD_ANTIHQ_BONE               = 0x95,  // Bonecraft Success Rate % (modId = 149)
    MOD_ANTIHQ_ALCHEMY            = 0x96,  // Alchemy Success Rate % (modId = 150)
    MOD_ANTIHQ_COOK               = 0x97,  // Cooking Success Rate % (modId = 151)

    // Damage / Crit Damage / Delay
    MOD_DMG                       = 0xA0,  // Damage Taken % (modId = 160)
    MOD_DMGPHYS                   = 0xA1,  // Physical Damage Taken % (modId = 161)
    MOD_DMGBREATH                 = 0xA2,  // Breath Damage Taken % (modId = 162)
    MOD_DMGMAGIC                  = 0xA3,  // Magic Damage Taken % - 256 base! (value of -24 means -24/256 magic damage taken) (modId = 163)
    MOD_DMGRANGE                  = 0xA4,  // Range Damage Taken % (modId = 164)

    MOD_UDMGPHYS                  = 0x183, // Uncapped Damage Multipliers (modId = 387)
    MOD_UDMGBREATH                = 0x184, // Used in sentinal, invincible, physical shield etc (modId = 388)
    MOD_UDMGMAGIC                 = 0x185, // (modId = 389)
    MOD_UDMGRANGE                 = 0x186, // (modId = 390)

    MOD_CRITHITRATE               = 0xA5,  // Raises chance to crit (modId = 165)
    MOD_CRIT_DMG_INCREASE         = 0x1A5, // Raises the damage of critcal hit by percent % (modId = 421)
    MOD_ENEMYCRITRATE             = 0xA6,  // Raises chance enemy will crit (modId = 166)

    MOD_HASTE_MAGIC               = 0xA7,  // Haste (and Slow) from magic - 1024 base! (448 cap) (modId = 167)
    MOD_HASTE_ABILITY             = 0x17F, // Haste (and Slow) from abilities - 1024 base! (256 cap?) (modId = 383)
    MOD_HASTE_GEAR                = 0x180, // Haste (and Slow) from equipment - 1024 base! (256 cap) (modId = 384)
    MOD_SPELLINTERRUPT            = 0xA8,  // % Spell Interruption Rate (modId = 168)
    MOD_MOVE                      = 0xA9,  // % Movement Speed (modId = 169)
    MOD_FASTCAST                  = 0xAA,  // Increases Spell Cast Time (TRAIT) (modId = 170)
    MOD_UFASTCAST                 = 0x197, // uncapped fast cast (modId = 407)
    MOD_DELAY                     = 0xAB,  // Increase/Decrease Delay (modId = 171)
    MOD_RANGED_DELAY              = 0xAC,  // Increase/Decrease Ranged Delay (modId = 172)
    MOD_MARTIAL_ARTS              = 0xAD,  // The integer amount of delay to reduce from H2H weapons' base delay. (TRAIT) (modId = 173)
    MOD_SKILLCHAINBONUS           = 0xAE,  // Damage bonus applied to skill chain damage.  Modifier from effects/traits (modId = 174)
    MOD_SKILLCHAINDMG             = 0xAF,  // Damage bonus applied to skill chain damage.  Modifier from gear (multiplicative after effect/traits) (modId = 175)

    MOD_MAGIC_DAMAGE             = 0x137, // Magic damage added directly to the spell's base damage (modId = 311)

    // FOOD!
    MOD_FOOD_HPP                  = 0xB0,  // (modId = 176)
    MOD_FOOD_HP_CAP               = 0xB1,  // (modId = 177)
    MOD_FOOD_MPP                  = 0xB2,  // (modId = 178)
    MOD_FOOD_MP_CAP               = 0xB3,  // (modId = 179)
    MOD_FOOD_ATTP                 = 0xB4,  // (modId = 180)
    MOD_FOOD_ATT_CAP              = 0xB5,  // (modId = 181)
    MOD_FOOD_DEFP                 = 0xB6,  // (modId = 182)
    MOD_FOOD_DEF_CAP              = 0xB7,  // (modId = 183)
    MOD_FOOD_ACCP                 = 0xB8,  // (modId = 184)
    MOD_FOOD_ACC_CAP              = 0xB9,  // (modId = 185)
    MOD_FOOD_RATTP                = 0xBA,  // (modId = 186)
    MOD_FOOD_RATT_CAP             = 0xBB,  // (modId = 187)
    MOD_FOOD_RACCP                = 0xBC,  // (modId = 188)
    MOD_FOOD_RACC_CAP             = 0xBD,  // (modId = 190)

    // Killer-Effects - (Most by Traits/JobAbility)
    MOD_VERMIN_KILLER             = 0xE0,  // Enhances "Vermin Killer" effect (modId = 224)
    MOD_BIRD_KILLER               = 0xE1,  // Enhances "Bird Killer" effect (modId = 225)
    MOD_AMORPH_KILLER             = 0xE2,  // Enhances "Amorph Killer" effect (modId = 226)
    MOD_LIZARD_KILLER             = 0xE3,  // Enhances "Lizard Killer" effect (modId = 227)
    MOD_AQUAN_KILLER              = 0xE4,  // Enhances "Aquan Killer" effect (modId = 228)
    MOD_PLANTOID_KILLER           = 0xE5,  // Enhances "Plantiod Killer" effect (modId = 229)
    MOD_BEAST_KILLER              = 0xE6,  // Enhances "Beast Killer" effect (modId = 230)
    MOD_UNDEAD_KILLER             = 0xE7,  // Enhances "Undead Killer" effect (modId = 231)
    MOD_ARCANA_KILLER             = 0xE8,  // Enhances "Arcana Killer" effect (modId = 232)
    MOD_DRAGON_KILLER             = 0xE9,  // Enhances "Dragon Killer" effect (modId = 233)
    MOD_DEMON_KILLER              = 0xEA,  // Enhances "Demon Killer" effect (modId = 234)
    MOD_EMPTY_KILLER              = 0xEB,  // Enhances "Empty Killer" effect (modId = 235)
    MOD_HUMANOID_KILLER           = 0xEC,  // Enhances "Humanoid Killer" effect (modId = 236)
    MOD_LUMORIAN_KILLER           = 0xED,  // Enhances "Lumorian Killer" effect (modId = 237)
    MOD_LUMINION_KILLER           = 0xEE,  // Enhances "Luminion Killer" effect (modId = 238)

    // Resistances to enfeebles - Traits/Job Ability
    MOD_SLEEPRES                  = 0xF0,  // Enhances "Resist Sleep" effect (modId = 240)
    MOD_POISONRES                 = 0xF1,  // Enhances "Resist Poison" effect (modId = 241)
    MOD_PARALYZERES               = 0xF2,  // Enhances "Resist Paralyze" effect (modId = 242)
    MOD_BLINDRES                  = 0xF3,  // Enhances "Resist Blind" effect (modId = 243)
    MOD_SILENCERES                = 0xF4,  // Enhances "Resist Silence" effect (modId = 244)
    MOD_VIRUSRES                  = 0xF5,  // Enhances "Resist Virus" effect (modId = 245)
    MOD_PETRIFYRES                = 0xF6,  // Enhances "Resist Petrify" effect (modId = 246)
    MOD_BINDRES                   = 0xF7,  // Enhances "Resist Bind" effect (modId = 247)
    MOD_CURSERES                  = 0xF8,  // Enhances "Resist Curse" effect (modId = 248)
    MOD_GRAVITYRES                = 0xF9,  // Enhances "Resist Gravity" effect (modId = 249)
    MOD_SLOWRES                   = 0xFA,  // Enhances "Resist Slow" effect (modId = 250)
    MOD_STUNRES                   = 0xFB,  // Enhances "Resist Stun" effect (modId = 251)
    MOD_CHARMRES                  = 0xFC,  // Enhances "Resist Charm" effect (modId = 252)
    MOD_AMNESIARES                = 0xFD,  // Enhances "Resist Amnesia" effect (modId = 253)
    // PLACEHOLDER                   = 0xFE,  // placeholder for future resist effect (modId = 254)
    MOD_DEATHRES                  = 0xFF,  // Used by gear and ATMA that give resistance to instance KO (modId = 255)

    MOD_PARALYZE                  = 0x101, // Paralyze -- percent chance to proc (modId = 257)
    MOD_MIJIN_GAKURE              = 0x102, // Tracks whether or not you used this ability to die. (modId = 258)
    MOD_DUAL_WIELD                = 0x103, // Percent reduction in dual wield delay. (modId = 259)

    // Warrior
    MOD_DOUBLE_ATTACK             = 0x120, // Percent chance to proc (modId = 288)
    MOD_WARCRY_DURATION           = 0x1E3, // Warcy duration bonus from gear

    // Monk
    MOD_SUBTLE_BLOW               = 0x121, // How much TP to reduce. (modId = 289)
    MOD_COUNTER                   = 0x123, // Percent chance to counter (modId = 291)
    MOD_KICK_ATTACK               = 0x124, // Percent chance to kick (modId = 292)
    MOD_PERFECT_COUNTER_ATT       = 0x1AC, // TODO: Raises weapon damage by 20 when countering while under the Perfect Counter effect. This also affects Weapon Rank (though not if fighting barehanded). (modId = 428)
    MOD_FOOTWORK_ATT_BONUS        = 0x1AD, // TODO: Raises the attack bonus of Footwork. (Tantra Gaiters +2 raise 100/1024 to 152/1024) (modId = 429)

    // White Mage
    MOD_AFFLATUS_SOLACE           = 0x125, // Pool of HP accumulated during Afflatus Solace (modId = 293)
    MOD_AFFLATUS_MISERY           = 0x126, // Pool of HP accumulated during Afflatus Misery (modId = 294)
    MOD_AUSPICE_EFFECT            = 0x1E4, // Bonus to Auspice Subtle Blow Effect.

    // Black Mage
    MOD_CLEAR_MIND                = 0x127, // Used in conjunction with MOD_HEALMP to increase amount between tics (modId = 295)
    MOD_CONSERVE_MP               = 0x128, // Percent chance (modId = 296)

    // Red Mage
    MOD_BLINK                     = 0x12B, // Tracks blink shadows (modId = 299)
    MOD_STONESKIN                 = 0x12C, // Tracks stoneskin HP pool (modId = 300)
    MOD_PHALANX                   = 0x12D, // Tracks direct damage reduction (modId = 301)

    // Thief
    MOD_STEAL                     = 0x12A, // Increase/Decrease THF Steal chance (modId = 298)
    MOD_TRIPLE_ATTACK             = 0x12E, // Percent chance (modId = 302)
    MOD_TREASURE_HUNTER           = 0x12F, // Percent chance (modId = 303)

    // Paladin
    MOD_ABSORB_PHYSDMG_TO_MP      = 0x1AA, // Absorbs a percentage of physical damage taken to MP. (modId = 426)
    MOD_ENMITY_REDUCTION_PHYSICAL = 0x1AB, // TODO: Reduces Enmity decrease when taking physical damage (modId = 427)
    MOD_SHIELD_MASTERY_TP         = 0x1E5, // Shield mastery TP bonus when blocking with a shield (modId = 485)

    // Dark Knight
    // Nothing here yet..

    // Beastmaster
    MOD_TAME                      = 0x130, // Additional percent chance to charm (modId = 304)
    MOD_CHARM_TIME                = 0x168, // extends the charm time only, no effect of charm chance (modId = 360)
    MOD_REWARD_HP_BONUS           = 0x16C, // Percent to add to reward HP healed. (364) (modId = 364)
    MOD_CHARM_CHANCE              = 0x187, // extra chance to charm (light+apollo staff ect) (modId = 391)
    MOD_FERAL_HOWL_DURATION       = 0x1F7, // +20% duration per merit when wearing augmented Monster Jackcoat +2 (modId = 503)

    // Bard
    MOD_MINNE_EFFECT              = 0x1B1, // (modId = 433)
    MOD_MINUET_EFFECT             = 0x1B2, // (modId = 434)
    MOD_PAEON_EFFECT              = 0x1B3, // (modId = 435)
    MOD_REQUIEM_EFFECT            = 0x1B4, // (modId = 436)
    MOD_THRENODY_EFFECT           = 0x1B5, // (modId = 437)
    MOD_MADRIGAL_EFFECT           = 0x1B6, // (modId = 438)
    MOD_MAMBO_EFFECT              = 0x1B7, // (modId = 439)
    MOD_LULLABY_EFFECT            = 0x1B8, // (modId = 440)
    MOD_ETUDE_EFFECT              = 0x1B9, // (modId = 441)
    MOD_BALLAD_EFFECT             = 0x1BA, // (modId = 442)
    MOD_MARCH_EFFECT              = 0x1BB, // (modId = 443)
    MOD_FINALE_EFFECT             = 0x1BC, // (modId = 444)
    MOD_CAROL_EFFECT              = 0x1BD, // (modId = 445)
    MOD_MAZURKA_EFFECT            = 0x1BE, // (modId = 446)
    MOD_ELEGY_EFFECT              = 0x1BF, // (modId = 447)
    MOD_PRELUDE_EFFECT            = 0x1C0, // (modId = 448)
    MOD_HYMNUS_EFFECT             = 0x1C1, // (modId = 449)
    MOD_VIRELAI_EFFECT            = 0x1C2, // (modId = 450)
    MOD_SCHERZO_EFFECT            = 0x1C3, // (modId = 451)
    MOD_ALL_SONGS_EFFECT          = 0x1C4, // (modId = 452)
    MOD_MAXIMUM_SONGS_BONUS       = 0x1C5, // (modId = 453)
    MOD_SONG_DURATION_BONUS       = 0x1C6, // (modId = 454)
    MOD_SONG_SPELLCASTING_TIME    = 0x1C7, // (modId = 455)

    // Ranger
    MOD_RECYCLE                   = 0x131, // Percent chance to recycle (modId = 305)
    MOD_SNAP_SHOT                 = 0x16D, // Percent reduction to range attack delay (modId = 365)
    MOD_RAPID_SHOT                = 0x167, // Percent chance to proc rapid shot (modId = 359)
    MOD_WIDESCAN                  = 0x154, // (modId = 340)
    MOD_BARRAGE_ACC               = 0x1A4, // Barrage accuracy (modId = 420)
    MOD_DOUBLE_SHOT_RATE          = 0x1A6, // The rate that double shot can proc. Without this, the default is 40%. (modId = 422)
    MOD_VELOCITY_SNAPSHOT_BONUS   = 0x1A7, // Increases Snapshot whilst Velocity Shot is up. (modId = 423)
    MOD_VELOCITY_RATT_BONUS       = 0x1A8, // Increases Ranged Attack whilst Velocity Shot is up. (modId = 424)
    MOD_SHADOW_BIND_EXT           = 0x1A9, // Extends the time of shadowbind (modId = 425)
    MOD_SCAVENGE_EFFECT           = 0x138, // (modId = 312)
    MOD_SHARPSHOT                 = 0x13A, // (modId = 314)


    // Samurai
    MOD_ZANSHIN                   = 0x132, // Zanshin percent chance (modId = 306)

    // Ninja
    MOD_UTSUSEMI                  = 0x133, // Everyone's favorite --tracks shadows. (modId = 307)
    MOD_NINJA_TOOL                = 0x134, // Percent chance to not use a tool. (modId = 308)

    // Dragoon
    MOD_JUMP_TP_BONUS             = 0x169, // bonus tp player receives when using jump (must be divided by 10) (modId = 361)
    MOD_JUMP_ATT_BONUS            = 0x16A, // ATT% bonus for jump + high jump (modId = 362)
    MOD_HIGH_JUMP_ENMITY_REDUCTION = 0x16B, // for gear that reduces more enmity from high jump (modId = 363)

    // Summoner
    MOD_AVATAR_PERPETUATION       = 0x173, // stores base cost of current avatar (modId = 371)
    MOD_WEATHER_REDUCTION         = 0x174, // stores perpetuation reduction depending on weather (modId = 372)
    MOD_DAY_REDUCTION             = 0x175, // stores perpetuation reduction depending on day (modId = 373)
    MOD_PERPETUATION_REDUCTION    = 0x15A, // stores the MP/tick reduction from gear (modId = 346)
    MOD_BP_DELAY                  = 0x165, // stores blood pact delay reduction (modId = 357)

    // Blue Mage
    MOD_BLUE_POINTS               = 0x135, // Tracks extra blue points (modId = 309)

    // Corsair
    MOD_EXP_BONUS                 = 0x17E, // (modId = 382)

    MOD_DMG_REFLECT               = 0x13C, // Tracks totals (modId = 316)
    MOD_ROLL_ROGUES               = 0x13D, // Tracks totals (modId = 317)
    MOD_ROLL_GALLANTS             = 0x13E, // Tracks totals (modId = 318)
    MOD_ROLL_CHAOS                = 0x13F, // Tracks totals (modId = 319)
    MOD_ROLL_BEAST                = 0x140, // Tracks totals (modId = 320)
    MOD_ROLL_CHORAL               = 0x141, // Tracks totals (modId = 321)
    MOD_ROLL_HUNTERS              = 0x142, // Tracks totals (modId = 322)
    MOD_ROLL_SAMURAI              = 0x143, // Tracks totals (modId = 323)
    MOD_ROLL_NINJA                = 0x144, // Tracks totals (modId = 324)
    MOD_ROLL_DRACHEN              = 0x145, // Tracks totals (modId = 325)
    MOD_ROLL_EVOKERS              = 0x146, // Tracks totals (modId = 326)
    MOD_ROLL_MAGUS                = 0x147, // Tracks totals (modId = 327)
    MOD_ROLL_CORSAIRS             = 0x148, // Tracks totals (modId = 328)
    MOD_ROLL_PUPPET               = 0x149, // Tracks totals (modId = 329)
    MOD_ROLL_DANCERS              = 0x14A, // Tracks totals (modId = 330)
    MOD_ROLL_SCHOLARS             = 0x14B, // Tracks totals (modId = 331)
    MOD_BUST                      = 0x14C, // # of busts (modId = 332)
    MOD_QUICK_DRAW_DMG            = 0x19B, // (modId = 411)

    // Puppetmaster
    MOD_MANEUVER_BONUS            = 0x1F8, // (modId = 504) Maneuver Stat Bonus
    MOD_OVERLOAD_THRESH           = 0x1F9, // (modId = 505) Overload Threshold Bonus

    // Dancer
    MOD_FINISHING_MOVES           = 0x14D, // Tracks # of finishing moves (modId = 333)
    MOD_SAMBA_DURATION            = 0x1EA, // Samba duration bonus(modId = 490)
    MOD_WALTZ_POTENTCY            = 0x1EB, // Waltz Potentcy Bonus(modId = 491)
    MOD_CHOCO_JIG_DURATION        = 0x1EC, // Jig duration bonus (modId = 492)
    MOD_VFLOURISH_MACC            = 0x1ED, // Violent Flourish accuracy bonus (modId = 493)
    MOD_STEP_FINISH               = 0x1EE, // Bonus finishing moves from steps (modId = 494)
    MOD_STEP_ACCURACY             = 0x193, // Bonus accuracy for Dancer's steps (modId = 403)
    MOD_SPECTRAL_JIG              = 0x1EF, // Spectral Jig duration modifier (percent increase) (modId = 495)
    MOD_WALTZ_RECAST              = 0x1F1, // (modID = 497) Waltz recast modifier (percent)
    MOD_SAMBA_PDURATION           = 0x1F2, // (modID = 498) Samba percent duration bonus

    //Scholar
    MOD_BLACK_MAGIC_COST          = 0x189, // MP cost for black magic (light/dark arts) (modId = 393)
    MOD_WHITE_MAGIC_COST          = 0x18A, // MP cost for white magic (light/dark arts) (modId = 394)
    MOD_BLACK_MAGIC_CAST          = 0x18B, // Cast time for black magic (light/dark arts) (modId = 395)
    MOD_WHITE_MAGIC_CAST          = 0x18C, // Cast time for black magic (light/dark arts) (modId = 396)
    MOD_BLACK_MAGIC_RECAST        = 0x18D, // Recast time for black magic (light/dark arts) (modId = 397)
    MOD_WHITE_MAGIC_RECAST        = 0x18E, // Recast time for white magic (light/dark arts) (modId = 398)
    MOD_ALACRITY_CELERITY_EFFECT  = 0x18F, // Bonus for celerity/alacrity effect (modId = 399)
    MOD_LIGHT_ARTS_EFFECT         = 0x14E, // (modId = 334)
    MOD_DARK_ARTS_EFFECT          = 0x14F, // (modId = 335)
    MOD_LIGHT_ARTS_SKILL          = 0x150, // (modId = 336)
    MOD_DARK_ARTS_SKILL           = 0x151, // (modId = 337)
    MOD_REGEN_EFFECT              = 0x152, // (modId = 338)
    MOD_REGEN_DURATION            = 0x153, // (modId = 339)
    MOD_HELIX_EFFECT              = 0x1DE, // (modId = 478)
    MOD_HELIX_DURATION            = 0x1DD, // (modId = 477)
    MOD_STORMSURGE_EFFECT         = 0x190, // (modId = 400)
    MOD_SUBLIMATION_BONUS         = 0x191, // (modId = 401)
    MOD_GRIMOIRE_SPELLCASTING     = 0x1E9, // (modID = 489) "Grimoire: Reduces spellcasting time" bonus

    MOD_ENSPELL                   = 0x155, // stores the type of enspell active (0 if nothing) (modId = 341)
    MOD_ENSPELL_DMG               = 0x157, // stores the base damage of the enspell before reductions (modId = 343)
    MOD_ENSPELL_DMG_BONUS         = 0x1B0, // (modId = 432)
    MOD_SPIKES                    = 0x156, // store the type of spike spell active (0 if nothing) (modId = 342)
    MOD_SPIKES_DMG                = 0x158, // stores the base damage of the spikes before reductions (modId = 344)

    MOD_TP_BONUS                  = 0x159, // (modId = 345)

    //stores the amount of elemental affinity (elemental staves mostly)
    MOD_FIRE_AFFINITY             = 0x15B, // Fire Affinity (modId = 347)
    MOD_EARTH_AFFINITY            = 0x15C, // Earth Affinity (modId = 348)
    MOD_WATER_AFFINITY            = 0x15D, // Water Affinity (modId = 349)
    MOD_ICE_AFFINITY              = 0x15E, // Ice Affinity (modId = 350)
    MOD_THUNDER_AFFINITY          = 0x15F, // Lightning Affinity (modId = 351)
    MOD_WIND_AFFINITY             = 0x160, // Wind Affinity (modId = 352)
    MOD_LIGHT_AFFINITY            = 0x161, // Light Affinity (modId = 353)
    MOD_DARK_AFFINITY             = 0x162, // Dark Affinity (modId = 354)

    // Special Modifier+
    MOD_ADDS_WEAPONSKILL          = 0x163, // (modId = 355)
    MOD_ADDS_WEAPONSKILL_DYN      = 0x164, // In Dynamis (modId = 356)

    MOD_STEALTH                   = 0x166, // (modId = 358)

    MOD_MAIN_DMG_RATING           = 0x16E, // adds damage rating to main hand weapon (maneater/blau dolch etc hidden effects) (modId = 366)
    MOD_SUB_DMG_RATING            = 0x16F, // adds damage rating to off hand weapon (modId = 367)
    MOD_REGAIN                    = 0x170, // auto regain TP (from items) | this is multiplied by 10 e.g. 20 is 2% TP (modId = 368)
    MOD_REGAIN_DOWN               = 0x196, // plague, reduce tp (modId = 406)
    MOD_REFRESH                   = 0x171, // auto refresh from equipment (modId = 369)
    MOD_REFRESH_DOWN              = 0x195, // plague, reduce mp (modId = 405)
    MOD_REGEN                     = 0x172, // auto regen from equipment (modId = 370)
    MOD_REGEN_DOWN                = 0x194, // poison (modId = 404)
    MOD_CURE_POTENCY              = 0x176, // % cure potency | bonus from gear is capped at 50 (modId = 374)
    MOD_CURE_POTENCY_RCVD         = 0x177, // % potency of received cure | healer's roll, some items have this (modId = 375)
    MOD_RANGED_DMG_RATING         = 0x178, // adds damage rating to ranged weapon (modId = 376)
    MOD_MAIN_DMG_RANK             = 0x179, // adds weapon rank to main weapon (modId = 377) (http://wiki.bluegartr.com/bg/Weapon_Rank)
    MOD_SUB_DMG_RANK              = 0x17A, // adds weapon rank to sub weapon (modId = 378)
    MOD_RANGED_DMG_RANK           = 0x17B, // adds weapon rank to ranged weapon (modId = 379)
    MOD_DELAYP                    = 0x17C, // delay addition percent (does not affect tp gain) (modId = 380)
    MOD_RANGED_DELAYP             = 0x17D, // ranged delay addition percent (does not affect tp gain) (modId = 381)

    MOD_SHIELD_BASH               = 0x181, // (modId = 385)
    MOD_KICK_DMG                  = 0x182, // increases kick attack damage (modId = 386)
    MOD_WEAPON_BASH               = 0x188, // (modId = 392)

    MOD_WYVERN_BREATH             = 0x192, // (modId = 402)


    /// Gear set modifiers
    MOD_DA_DOUBLE_DAMAGE          = 0x198, // Double attack's double damage chance %. (modId = 408)
    MOD_TA_TRIPLE_DAMAGE          = 0x199, // Triple attack's triple damage chance %. (modId = 409)
    MOD_ZANSHIN_DOUBLE_DAMAGE     = 0x19A, // Zanshin's double damage chance %. (modId = 410)
    MOD_RAPID_SHOT_DOUBLE_DAMAGE  = 0x1DF, // Rapid shot's double damage chance %. (modId = 479)
    MOD_ABSORB_DMG_CHANCE         = 0x1E0, // Chance to absorb damage % (modId = 480)
    MOD_EXTRA_DUAL_WIELD_ATTACK   = 0x1E1, // Chance to land an extra attack when dual wielding (modId = 481)
    MOD_EXTRA_KICK_ATTACK         = 0x1E2, // Occasionally allows a second Kick Attack during an attack round without the use of Footwork.  (modId = 482)
    MOD_SAMBA_DOUBLE_DAMAGE       = 0x19F, // Double damage chance when samba is up. (modId = 415)
    MOD_NULL_PHYSICAL_DAMAGE      = 0x1A0, // Chance to NULL physical damage. (modId = 416)
    MOD_QUICK_DRAW_TRIPLE_DAMAGE  = 0x1A1, // Chance to do triple damage with quick draw. (modId = 417)
    MOD_BAR_ELEMENT_NULL_CHANCE   = 0x1A2, // Bar Elemental spells will occasionally NULLify damage of the same element. (modId = 418)
    MOD_GRIMOIRE_INSTANT_CAST     = 0x1A3, // Spells that match your current Arts will occasionally cast instantly, without recast. (modId = 419)
    MOD_QUAD_ATTACK               = 0x1AE, // Quadruple attack chance. (modId = 430)

    // Reraise (Auto Reraise, used by gear)
    MOD_RERAISE_I                 = 0x1C8, // Reraise. (modId = 456)
    MOD_RERAISE_II                = 0x1C9, // Reraise II. (modId = 457)
    MOD_RERAISE_III               = 0x1CA, // Reraise III. (modId = 458)

    //Elemental Absorb Chance
    MOD_FIRE_ABSORB               = 0x1CB, // (modId = 459)
    MOD_EARTH_ABSORB              = 0x1CC, // (modId = 460)
    MOD_WATER_ABSORB              = 0x1CD, // (modId = 461)
    MOD_WIND_ABSORB               = 0x1CE, // (modId = 462)
    MOD_ICE_ABSORB                = 0x1CF, // (modId = 463)
    MOD_LTNG_ABSORB               = 0x1D0, // (modId = 464)
    MOD_LIGHT_ABSORB              = 0x1D1, // (modId = 465)
    MOD_DARK_ABSORB               = 0x1D2, // (modId = 466)

    //Elemental Null Chance
    MOD_FIRE_NULL                 = 0x1D3, // (modId = 467)
    MOD_EARTH_NULL                = 0x1D4, // (modId = 468)
    MOD_WATER_NULL                = 0x1D5, // (modId = 469)
    MOD_WIND_NULL                 = 0x1D6, // (modId = 470)
    MOD_ICE_NULL                  = 0x1D7, // (modId = 471)
    MOD_LTNG_NULL                 = 0x1D8, // (modId = 472)
    MOD_LIGHT_NULL                = 0x1D9, // (modId = 473)
    MOD_DARK_NULL                 = 0x1DA, // (modId = 474)

    MOD_MAGIC_ABSORB              = 0x1DB, // (modId = 475)
    MOD_MAGIC_NULL                = 0x1DC, // (modId = 476)
    MOD_PHYS_ABSORB               = 0x200, // (modId = 512)
    MOD_ABSORB_DMG_TO_MP          = 0x204, // (modId = 516)  Unlike PLD gear mod, works on all damage types (Ethereal Earring)

    MOD_ADDITIONAL_EFFECT         = 0x1AF, // (modId = 431)
    MOD_ITEM_SPIKES_TYPE          = 0x1F3, // Type spikes an item has (modId = 499)
    MOD_ITEM_SPIKES_DMG           = 0x1F4, // Damage of an items spikes (modId = 500)
    MOD_ITEM_SPIKES_CHANCE        = 0x1F5, // Chance of an items spike proc (modId = 501)

    MOD_GOV_CLEARS                = 0x1F0, // 4% bonus per Grounds of Valor Page clear (modId = 496)

    MOD_EXTRA_DMG_CHANCE          = 0x1FA, // Proc rate of MOD_OCC_DO_EXTRA_DMG. 111 would be 11.1% (modId = 506)
    MOD_OCC_DO_EXTRA_DMG          = 0x1FB, // Multiplier for "Occasionally do x times normal damage". 250 would be 2.5 times damage. (modId = 507)

    MOD_EAT_RAW_FISH              = 0x19C, // (modId = 412)
    MOD_EAT_RAW_MEAT              = 0x19D, // (modId = 413)

    MOD_ENHANCES_CURSNA           = 0x136, // Used by gear with the "Enhances Cursna" attribute (modId = 310)
    MOD_RETALIATION               = 0x19E, // Increases damage of Retaliation hits (modId = 414)
    MOD_AUGMENTS_THIRD_EYE        = 0x1FC, // Adds counter to 3rd eye anticipates & if using Seigan counter rate is increased by 15% (modId = 508)

    MOD_CLAMMING_IMPROVED_RESULTS = 0x1FD, // (modId = 509)
    MOD_CLAMMING_REDUCED_INCIDENTS= 0x1FE, // (modId = 510)

    MOD_CHOCOBO_RIDING_TIME       = 0x1FF, // Increases chocobo riding time (modId = 511)

    MOD_HARVESTING_RESULT         = 0x201, // Improves harvesting results (modId = 513)
    MOD_LOGGING_RESULT            = 0x202, // Improves logging results (modId = 514)
    MOD_MINNING_RESULT            = 0x203, // Improves mining results (modId = 515)

    MOD_EGGHELM                   = 0x205,

    MOD_SHIELDBLOCKRATE           = 0x206, // Affects shield block rate, percent based (modID = 518)
    MOD_DIA_DOT                   = 0x139, //Increases the DoT damage of Dia (modId = 313)

    // MOD_SPARE = 0x13B, // (modId = 315)
    // MOD_SPARE = 0x207, // (modId = 519)
    // MOD_SPARE = 0x208, // (modId = 520)


};

/************************************************************************
*  Modifier Class                                                       *
************************************************************************/

class CModifier
{
public:

    uint16  getModID();
    int16   getModAmount();

    void    setModAmount(int16 amount);

     CModifier(uint16 type, int16 amount = 0);
    ~CModifier();

private:

    uint16  m_id;
    int16   m_amount;
};

#endif
