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

#ifndef _CMODIFIER_H
#define _CMODIFIER_H

#include "../common/cbasetypes.h"

enum MODIFIER
{
    MOD_NONE                      = 0, // Essential, but does nothing :)
    // MOD_ NAME                  = ID, // Comment
    MOD_DEF                       = 1, // Target's Defense
    MOD_HP                        = 2, // Target's HP
    MOD_HPP                       = 3, // HP Percentage
    MOD_CONVMPTOHP                = 4, // MP -> HP (Cassie Earring)
    MOD_MP                        = 5, // MP +/-
    MOD_MPP                       = 6, // MP Percentage
    MOD_CONVHPTOMP                = 7, // HP -> MP

    MOD_STR                       = 8, // Strength
    MOD_DEX                       = 9, // Dexterity
    MOD_VIT                       = 10, // Vitality
    MOD_AGI                       = 11, // Agility
    MOD_INT                       = 12, // Intelligence
    MOD_MND                       = 13, // Mind
    MOD_CHR                       = 14, // Charisma

    // Elemental Defenses
    // 128 = 128 / 256 = 50% reduction
    MOD_FIREDEF                   = 15, // Fire Defense
    MOD_ICEDEF                    = 16, // Ice Defense
    MOD_WINDDEF                   = 17, // Wind Defense
    MOD_EARTHDEF                  = 18, // Earth Defense
    MOD_THUNDERDEF                = 19, // Thunder Defense
    MOD_WATERDEF                  = 20, // Water Defense
    MOD_LIGHTDEF                  = 21, // Light Defense
    MOD_DARKDEF                   = 22, // Dark Defense

    MOD_ATT                       = 23, // Attack
    MOD_RATT                      = 24, // Ranged Attack

    MOD_ACC                       = 25, // Accuracy
    MOD_RACC                      = 26, // Ranged Accuracy

    MOD_ENMITY                    = 27, // Enmity
    MOD_ENMITY_LOSS_REDUCTION     = 502, // Reduces Enmity lost when taking damage

    MOD_MATT                      = 28, // Magic Attack
    MOD_MDEF                      = 29, // Magic Defense
    MOD_MACC                      = 30, // Magic Accuracy
    MOD_MEVA                      = 31, // Magic Evasion

    // Magic Accuracy and Elemental Attacks
    MOD_FIREATT                   = 32, // Fire Damage
    MOD_ICEATT                    = 33, // Ice Damage
    MOD_WINDATT                   = 34, // Wind Damage
    MOD_EARTHATT                  = 35, // Earth Damage
    MOD_THUNDERATT                = 36, // Thunder Damage
    MOD_WATERATT                  = 37, // Water Damage
    MOD_LIGHTATT                  = 38, // Light Damage
    MOD_DARKATT                   = 39, // Dark Damage
    MOD_FIREACC                   = 40, // Fire Accuracy
    MOD_ICEACC                    = 41, // Ice Accuracy
    MOD_WINDACC                   = 42, // Wind Accuracy
    MOD_EARTHACC                  = 43, // Earth Accuracy
    MOD_THUNDERACC                = 44, // Thunder Accuracy
    MOD_WATERACC                  = 45, // Water Accuracy
    MOD_LIGHTACC                  = 46, // Light Accuracy
    MOD_DARKACC                   = 47, // Dark Accuracy

    MOD_WSACC                     = 48, // Weaponskill Accuracy

    // Resistance to damage type
    // Value is stored as a percentage of damage reduction (to within 1000)
    // Example: 1000 = 100%, 875= 87.5%
    MOD_SLASHRES                  = 49, // Slash Resistance
    MOD_PIERCERES                 = 50, // Piercing Resistance
    MOD_IMPACTRES                 = 51, // Impact Resistance
    MOD_HTHRES                    = 52, // Hand-To-Hand Resistance

    // Damage Reduction to Elements
    // Value is stored as a percentage of damage reduction (to within 1000)
    // Example: 1000 = 100%, 875= 87.5%
    MOD_FIRERES                   = 54, // % Fire Resistance
    MOD_ICERES                    = 55, // % Ice Resistance
    MOD_WINDRES                   = 56, // % Wind Resistance
    MOD_EARTHRES                  = 57, // % Earth Resistance
    MOD_THUNDERRES                = 58, // % Thunder Resistance
    MOD_WATERRES                  = 59, // % Water Resistance
    MOD_LIGHTRES                  = 60, // % Light Resistance
    MOD_DARKRES                   = 61, // % Dark Resistance

    MOD_ATTP                      = 62, // % Attack
    MOD_DEFP                      = 63, // % Defense
    MOD_RATTP                     = 66, // % Ranged Attack

    MOD_EVA                       = 68, // Evasion
    MOD_RDEF                      = 69, // Ranged Defense
    MOD_REVA                      = 70, // Ranged Evasion
    MOD_MPHEAL                    = 71, // MP Recovered while healing
    MOD_HPHEAL                    = 72, // HP Recovered while healing
    MOD_STORETP                   = 73, // Increases the rate at which TP is gained
    MOD_TACTICAL_PARRY            = 486, // Tactical Parry Tp Bonus
    MOD_MAG_BURST_BONUS           = 487, // Magic Burst Bonus Modifier (percent)
    MOD_INHIBIT_TP                = 488, // Inhibits TP Gain (percent)

    // Working Skills (weapon combat skills)
    MOD_HTH                       = 80, // Hand To Hand Skill
    MOD_DAGGER                    = 81, // Dagger Skill
    MOD_SWORD                     = 82, // Sword Skill
    MOD_GSWORD                    = 83, // Great Sword Skill
    MOD_AXE                       = 84, // Axe Skill
    MOD_GAXE                      = 85, // Great Axe Skill
    MOD_SCYTHE                    = 86, // Scythe Skill
    MOD_POLEARM                   = 87, // Polearm Skill
    MOD_KATANA                    = 88, // Katana Skill
    MOD_GKATANA                   = 89, // Great Katana Skill
    MOD_CLUB                      = 90, // Club Skill
    MOD_STAFF                     = 91, // Staff Skill
    MOD_AUTO_MELEE_SKILL          = 101, // Automaton Melee Skill
    MOD_AUTO_RANGED_SKILL         = 102, // Automaton Range Skill
    MOD_AUTO_MAGIC_SKILL          = 103, // Automaton Magic Skill
    MOD_ARCHERY                   = 104, // Archery Skill
    MOD_MARKSMAN                  = 105, // Marksman Skill
    MOD_THROW                     = 106, // Throw Skill
    MOD_GUARD                     = 107, // Guard Skill
    MOD_EVASION                   = 108, // Evasion Skill
    MOD_SHIELD                    = 109, // Shield Skill
    MOD_PARRY                     = 110, // Parry Skill

    // Magic Skills
    MOD_DIVINE                    = 111, // Divine Magic Skill
    MOD_HEALING                   = 112, // Healing Magic Skill
    MOD_ENHANCE                   = 113, // Enhancing Magic Skill
    MOD_ENFEEBLE                  = 114, // Enfeebling Magic Skill
    MOD_ELEM                      = 115, // Elemental Magic Skill
    MOD_DARK                      = 116, // Dark Magic Skill
    MOD_SUMMONING                 = 117, // Summoning Magic Skill
    MOD_NINJUTSU                  = 118, // Ninjutsu Magic Skill
    MOD_SINGING                   = 119, // Singing Magic Skill
    MOD_STRING                    = 120, // String Magic Skill
    MOD_WIND                      = 121, // Wind Magic Skill
    MOD_BLUE                      = 122, // Blue Magic Skill

    // Synthesis Skills
    MOD_FISH                      = 127, // Fishing Skill
    MOD_WOOD                      = 128, // Woodworking Skill
    MOD_SMITH                     = 129, // Smithing Skill
    MOD_GOLDSMITH                 = 130, // Goldsmithing Skill
    MOD_CLOTH                     = 131, // Clothcraft Skill
    MOD_LEATHER                   = 132, // Leathercraft Skill
    MOD_BONE                      = 133, // Bonecraft Skill
    MOD_ALCHEMY                   = 134, // Alchemy Skill
    MOD_COOK                      = 135, // Cooking Skill
    MOD_SYNERGY                   = 136, // Synergy Skill
    MOD_RIDING                    = 137, // Riding Skill

    // Chance you will not make an hq synth (Impossibility of HQ synth)
    MOD_ANTIHQ_WOOD               = 144, // Woodworking Success Rate %
    MOD_ANTIHQ_SMITH              = 145, // Smithing Success Rate %
    MOD_ANTIHQ_GOLDSMITH          = 146, // Goldsmithing Success Rate %
    MOD_ANTIHQ_CLOTH              = 147, // Clothcraft Success Rate %
    MOD_ANTIHQ_LEATHER            = 148, // Leathercraft Success Rate %
    MOD_ANTIHQ_BONE               = 149, // Bonecraft Success Rate %
    MOD_ANTIHQ_ALCHEMY            = 150, // Alchemy Success Rate %
    MOD_ANTIHQ_COOK               = 151, // Cooking Success Rate %

    // Damage / Crit Damage / Delay
    MOD_DMG                       = 160, // Damage Taken %
    MOD_DMGPHYS                   = 161, // Physical Damage Taken %
    MOD_DMGBREATH                 = 162, // Breath Damage Taken %
    MOD_DMGMAGIC                  = 163, // Magic Damage Taken %
    MOD_DMGMAGIC_II               = 831, // Magic Damage Taken II % (Aegis)
    MOD_DMGRANGE                  = 164, // Range Damage Taken %

    MOD_UDMGPHYS                  = 387, // Uncapped Damage Multipliers
    MOD_UDMGBREATH                = 388, // Used in sentinal, invincible, physical shield etc
    MOD_UDMGMAGIC                 = 389, //
    MOD_UDMGRANGE                 = 390, //

    MOD_CRITHITRATE               = 165, // Raises chance to crit
    MOD_CRIT_DMG_INCREASE         = 421, // Raises the damage of critcal hit by percent %
    MOD_ENEMYCRITRATE             = 166, // Raises chance enemy will crit
    MOD_MAGIC_CRITHITRATE         = 562, // Raises chance to magic crit
    MOD_MAGIC_CRIT_DMG_INCREASE   = 563, // Raises damage done when criting with magic

    MOD_HASTE_MAGIC               = 167, // Haste (and Slow) from magic - 1024 base! (448 cap)
    MOD_HASTE_ABILITY             = 383, // Haste (and Slow) from abilities - 1024 base! (256 cap?)
    MOD_HASTE_GEAR                = 384, // Haste (and Slow) from equipment - 1024 base! (256 cap)
    MOD_SPELLINTERRUPT            = 168, // % Spell Interruption Rate
    MOD_MOVE                      = 169, // % Movement Speed
    MOD_FASTCAST                  = 170, // Increases Spell Cast Time (TRAIT)
    MOD_UFASTCAST                 = 407, // uncapped fast cast
    MOD_CURE_CAST_TIME            = 519, // cure cast time reduction
    MOD_DELAY                     = 171, // Increase/Decrease Delay
    MOD_RANGED_DELAY              = 172, // Increase/Decrease Ranged Delay
    MOD_MARTIAL_ARTS              = 173, // The integer amount of delay to reduce from H2H weapons' base delay. (TRAIT)
    MOD_SKILLCHAINBONUS           = 174, // Damage bonus applied to skill chain damage.  Modifier from effects/traits
    MOD_SKILLCHAINDMG             = 175, // Damage bonus applied to skill chain damage.  Modifier from gear (multiplicative after effect/traits)

    MOD_MAGIC_DAMAGE             = 311, // Magic damage added directly to the spell's base damage

    // FOOD!
    MOD_FOOD_HPP                  = 176, //
    MOD_FOOD_HP_CAP               = 177, //
    MOD_FOOD_MPP                  = 178, //
    MOD_FOOD_MP_CAP               = 179, //
    MOD_FOOD_ATTP                 = 180, //
    MOD_FOOD_ATT_CAP              = 181, //
    MOD_FOOD_DEFP                 = 182, //
    MOD_FOOD_DEF_CAP              = 183, //
    MOD_FOOD_ACCP                 = 184, //
    MOD_FOOD_ACC_CAP              = 185, //
    MOD_FOOD_RATTP                = 186, //
    MOD_FOOD_RATT_CAP             = 187, //
    MOD_FOOD_RACCP                = 188, //
    MOD_FOOD_RACC_CAP             = 189, //

    // Killer-Effects - (Most by Traits/JobAbility)
    MOD_VERMIN_KILLER             = 224, // Enhances "Vermin Killer" effect
    MOD_BIRD_KILLER               = 225, // Enhances "Bird Killer" effect
    MOD_AMORPH_KILLER             = 226, // Enhances "Amorph Killer" effect
    MOD_LIZARD_KILLER             = 227, // Enhances "Lizard Killer" effect
    MOD_AQUAN_KILLER              = 228, // Enhances "Aquan Killer" effect
    MOD_PLANTOID_KILLER           = 229, // Enhances "Plantiod Killer" effect
    MOD_BEAST_KILLER              = 230, // Enhances "Beast Killer" effect
    MOD_UNDEAD_KILLER             = 231, // Enhances "Undead Killer" effect
    MOD_ARCANA_KILLER             = 232, // Enhances "Arcana Killer" effect
    MOD_DRAGON_KILLER             = 233, // Enhances "Dragon Killer" effect
    MOD_DEMON_KILLER              = 234, // Enhances "Demon Killer" effect
    MOD_EMPTY_KILLER              = 235, // Enhances "Empty Killer" effect
    MOD_HUMANOID_KILLER           = 236, // Enhances "Humanoid Killer" effect
    MOD_LUMORIAN_KILLER           = 237, // Enhances "Lumorian Killer" effect
    MOD_LUMINION_KILLER           = 238, // Enhances "Luminion Killer" effect

    // Resistances to enfeebles - Traits/Job Ability
    MOD_SLEEPRES                  = 240, // Enhances "Resist Sleep" effect
    MOD_POISONRES                 = 241, // Enhances "Resist Poison" effect
    MOD_PARALYZERES               = 242, // Enhances "Resist Paralyze" effect
    MOD_BLINDRES                  = 243, // Enhances "Resist Blind" effect
    MOD_SILENCERES                = 244, // Enhances "Resist Silence" effect
    MOD_VIRUSRES                  = 245, // Enhances "Resist Virus" effect
    MOD_PETRIFYRES                = 246, // Enhances "Resist Petrify" effect
    MOD_BINDRES                   = 247, // Enhances "Resist Bind" effect
    MOD_CURSERES                  = 248, // Enhances "Resist Curse" effect
    MOD_GRAVITYRES                = 249, // Enhances "Resist Gravity" effect
    MOD_SLOWRES                   = 250, // Enhances "Resist Slow" effect
    MOD_STUNRES                   = 251, // Enhances "Resist Stun" effect
    MOD_CHARMRES                  = 252, // Enhances "Resist Charm" effect
    MOD_AMNESIARES                = 253, // Enhances "Resist Amnesia" effect
    MOD_LULLABYRES                = 254, // Enhances "Resist Lullaby" effect
    MOD_DEATHRES                  = 255, // Used by gear and ATMA that give resistance to instance KO

    MOD_PARALYZE                  = 257, // Paralyze -- percent chance to proc
    MOD_MIJIN_GAKURE              = 258, // Tracks whether or not you used this ability to die.
    MOD_DUAL_WIELD                = 259, // Percent reduction in dual wield delay.

    // Warrior
    MOD_DOUBLE_ATTACK             = 288, // Percent chance to proc
    MOD_WARCRY_DURATION           = 483, // Warcy duration bonus from gear

    // Monk
    MOD_SUBTLE_BLOW               = 289, // How much TP to reduce.
    MOD_COUNTER                   = 291, // Percent chance to counter
    MOD_KICK_ATTACK               = 292, // Percent chance to kick
    MOD_PERFECT_COUNTER_ATT       = 428, // TODO: Raises weapon damage by 20 when countering while under the Perfect Counter effect. This also affects Weapon Rank (though not if fighting barehanded).
    MOD_FOOTWORK_ATT_BONUS        = 429, // TODO: Raises the attack bonus of Footwork. (Tantra Gaiters +2 raise 100/1024 to 152/1024)

    // White Mage
    MOD_AFFLATUS_SOLACE           = 293, // Pool of HP accumulated during Afflatus Solace
    MOD_AFFLATUS_MISERY           = 294, // Pool of HP accumulated during Afflatus Misery
    MOD_AUSPICE_EFFECT            = 484, // Bonus to Auspice Subtle Blow Effect.
    MOD_AOE_NA                    = 524, // Set to 1 to make -na spells/erase always AoE w/ Divine Veil

    // Black Mage
    MOD_CLEAR_MIND                = 295, // Used in conjunction with MOD_HEALMP to increase amount between tics
    MOD_CONSERVE_MP               = 296, // Percent chance

    // Red Mage
    MOD_BLINK                     = 299, // Tracks blink shadows
    MOD_STONESKIN                 = 300, // Tracks stoneskin HP pool
    MOD_PHALANX                   = 301, // Tracks direct damage reduction

    // Thief
    MOD_STEAL                     = 298, // Increase/Decrease THF Steal chance
    MOD_TRIPLE_ATTACK             = 302, // Percent chance
    MOD_TREASURE_HUNTER           = 303, // Percent chance
    MOD_TRICK_ATK_AGI             = 520, // % AGI boost to Trick Attack (if gear mod, needs to be equipped on hit)

    // Paladin
    MOD_ABSORB_PHYSDMG_TO_MP      = 426, // Absorbs a percentage of physical damage taken to MP.
    MOD_ENMITY_REDUCTION_PHYSICAL = 427, // TODO: Reduces Enmity decrease when taking physical damage
    MOD_SHIELD_MASTERY_TP         = 485, // Shield mastery TP bonus when blocking with a shield

    // Dark Knight
    // Nothing here yet..

    // Beastmaster
    MOD_TAME                      = 304, // Additional percent chance to charm
    MOD_CHARM_TIME                = 360, // extends the charm time only, no effect of charm chance
    MOD_REWARD_HP_BONUS           = 364, // Percent to add to reward HP healed. (364)
    MOD_CHARM_CHANCE              = 391, // extra chance to charm (light+apollo staff ect)
    MOD_FERAL_HOWL_DURATION       = 503, // +20% duration per merit when wearing augmented Monster Jackcoat +2
    MOD_JUG_LEVEL_RANGE           = 564, // Decreases the level range of spawned jug pets. Maxes out at 2.

    // Bard
    MOD_MINNE_EFFECT              = 433, //
    MOD_MINUET_EFFECT             = 434, //
    MOD_PAEON_EFFECT              = 435, //
    MOD_REQUIEM_EFFECT            = 436, //
    MOD_THRENODY_EFFECT           = 437, //
    MOD_MADRIGAL_EFFECT           = 438, //
    MOD_MAMBO_EFFECT              = 439, //
    MOD_LULLABY_EFFECT            = 440, //
    MOD_ETUDE_EFFECT              = 441, //
    MOD_BALLAD_EFFECT             = 442, //
    MOD_MARCH_EFFECT              = 443, //
    MOD_FINALE_EFFECT             = 444, //
    MOD_CAROL_EFFECT              = 445, //
    MOD_MAZURKA_EFFECT            = 446, //
    MOD_ELEGY_EFFECT              = 447, //
    MOD_PRELUDE_EFFECT            = 448, //
    MOD_HYMNUS_EFFECT             = 449, //
    MOD_VIRELAI_EFFECT            = 450, //
    MOD_SCHERZO_EFFECT            = 451, //
    MOD_ALL_SONGS_EFFECT          = 452, //
    MOD_MAXIMUM_SONGS_BONUS       = 453, //
    MOD_SONG_DURATION_BONUS       = 454, //
    MOD_SONG_SPELLCASTING_TIME    = 455, //
    MOD_SONG_RECAST_DELAY         = 833, // Reduces song recast time (in milliseconds).

    // Ranger
    MOD_RECYCLE                   = 305, // Percent chance to recycle
    MOD_SNAP_SHOT                 = 365, // Percent reduction to range attack delay
    MOD_RAPID_SHOT                = 359, // Percent chance to proc rapid shot
    MOD_WIDESCAN                  = 340, //
    MOD_BARRAGE_ACC               = 420, // Barrage accuracy
    MOD_DOUBLE_SHOT_RATE          = 422, // The rate that double shot can proc. Without this, the default is 40%.
    MOD_VELOCITY_SNAPSHOT_BONUS   = 423, // Increases Snapshot whilst Velocity Shot is up.
    MOD_VELOCITY_RATT_BONUS       = 424, // Increases Ranged Attack whilst Velocity Shot is up.
    MOD_SHADOW_BIND_EXT           = 425, // Extends the time of shadowbind
    MOD_SCAVENGE_EFFECT           = 312, //
    MOD_SHARPSHOT                 = 314, //

    // Samurai
    MOD_ZANSHIN                   = 306, // Zanshin percent chance

    // Ninja
    MOD_UTSUSEMI                  = 307, // Everyone's favorite --tracks shadows.
    MOD_NINJA_TOOL                = 308, // Percent chance to not use a tool.
    MOD_NIN_NUKE_BONUS            = 522, // magic attack bonus for NIN nukes

    // Dragoon
    MOD_JUMP_TP_BONUS             = 361, // bonus tp player receives when using jump (must be divided by 10)
    MOD_JUMP_ATT_BONUS            = 362, // ATT% bonus for jump + high jump
    MOD_HIGH_JUMP_ENMITY_REDUCTION = 363, // for gear that reduces more enmity from high jump
    MOD_FORCE_JUMP_CRIT           = 828, // Critical hit rate bonus for jump and high jump
    MOD_WYVERN_EFFECTIVE_BREATH   = 829, // Increases the threshold for triggering healing breath/offensive breath more inclined to pick elemental weakness

    // Summoner
    MOD_AVATAR_PERPETUATION       = 371, // stores base cost of current avatar
    MOD_WEATHER_REDUCTION         = 372, // stores perpetuation reduction depending on weather
    MOD_DAY_REDUCTION             = 373, // stores perpetuation reduction depending on day
    MOD_PERPETUATION_REDUCTION    = 346, // stores the MP/tick reduction from gear
    MOD_BP_DELAY                  = 357, // stores blood pact delay reduction
    MOD_ENHANCES_ELEMENTAL_SIPHON = 540, // Bonus Base MP added to Elemental Siphon skill.
    MOD_BP_DELAY_II               = 541, // Blood Pact Delay Reduction II

    // Blue Mage
    MOD_BLUE_POINTS               = 309, // Tracks extra blue points

    // Corsair
    MOD_EXP_BONUS                 = 382, //
    MOD_ROLL_RANGE                = 528, // Additional range for COR roll abilities.
    MOD_JOB_BONUS_CHANCE          = 542, // Chance to apply job bonus to COR roll without having the job in the party.

    MOD_DMG_REFLECT               = 316, // Tracks totals
    MOD_ROLL_ROGUES               = 317, // Tracks totals
    MOD_ROLL_GALLANTS             = 318, // Tracks totals
    MOD_ROLL_CHAOS                = 319, // Tracks totals
    MOD_ROLL_BEAST                = 320, // Tracks totals
    MOD_ROLL_CHORAL               = 321, // Tracks totals
    MOD_ROLL_HUNTERS              = 322, // Tracks totals
    MOD_ROLL_SAMURAI              = 323, // Tracks totals
    MOD_ROLL_NINJA                = 324, // Tracks totals
    MOD_ROLL_DRACHEN              = 325, // Tracks totals
    MOD_ROLL_EVOKERS              = 326, // Tracks totals
    MOD_ROLL_MAGUS                = 327, // Tracks totals
    MOD_ROLL_CORSAIRS             = 328, // Tracks totals
    MOD_ROLL_PUPPET               = 329, // Tracks totals
    MOD_ROLL_DANCERS              = 330, // Tracks totals
    MOD_ROLL_SCHOLARS             = 331, // Tracks totals
    MOD_BUST                      = 332, // # of busts
    MOD_QUICK_DRAW_DMG            = 411, // Flat damage increase to base QD damage
    MOD_QUICK_DRAW_DMG_PERCENT    = 831, // Percentage increase to QD damage

    // Puppetmaster
    MOD_MANEUVER_BONUS            = 504, // Maneuver Stat Bonus
    MOD_OVERLOAD_THRESH           = 505, // Overload Threshold Bonus

    // Dancer
    MOD_FINISHING_MOVES           = 333, // Tracks # of finishing moves
    MOD_SAMBA_DURATION            = 490, // Samba duration bonus
    MOD_WALTZ_POTENTCY            = 491, // Waltz Potentcy Bonus
    MOD_CHOCO_JIG_DURATION        = 492, // Jig duration bonus
    MOD_VFLOURISH_MACC            = 493, // Violent Flourish accuracy bonus
    MOD_STEP_FINISH               = 494, // Bonus finishing moves from steps
    MOD_STEP_ACCURACY             = 403, // Bonus accuracy for Dancer's steps
    MOD_SPECTRAL_JIG              = 495, // Spectral Jig duration modifier (percent increase)
    MOD_WALTZ_RECAST              = 497, // Waltz recast modifier (percent)
    MOD_SAMBA_PDURATION           = 498, // Samba percent duration bonus

    //Scholar
    MOD_BLACK_MAGIC_COST          = 393, // MP cost for black magic (light/dark arts)
    MOD_WHITE_MAGIC_COST          = 394, // MP cost for white magic (light/dark arts)
    MOD_BLACK_MAGIC_CAST          = 395, // Cast time for black magic (light/dark arts)
    MOD_WHITE_MAGIC_CAST          = 396, // Cast time for black magic (light/dark arts)
    MOD_BLACK_MAGIC_RECAST        = 397, // Recast time for black magic (light/dark arts)
    MOD_WHITE_MAGIC_RECAST        = 398, // Recast time for white magic (light/dark arts)
    MOD_ALACRITY_CELERITY_EFFECT  = 399, // Bonus for celerity/alacrity effect
    MOD_LIGHT_ARTS_EFFECT         = 334, //
    MOD_DARK_ARTS_EFFECT          = 335, //
    MOD_LIGHT_ARTS_SKILL          = 336, //
    MOD_DARK_ARTS_SKILL           = 337, //
    MOD_REGEN_EFFECT              = 338, //
    MOD_REGEN_DURATION            = 339, //
    MOD_HELIX_EFFECT              = 478, //
    MOD_HELIX_DURATION            = 477, //
    MOD_STORMSURGE_EFFECT         = 400, //
    MOD_SUBLIMATION_BONUS         = 401, //
    MOD_GRIMOIRE_SPELLCASTING     = 489, // "Grimoire: Reduces spellcasting time" bonus

    MOD_ENSPELL                   = 341, // stores the type of enspell active (0 if nothing)
    MOD_ENSPELL_DMG               = 343, // stores the base damage of the enspell before reductions
    MOD_ENSPELL_DMG_BONUS         = 432, //
    MOD_SPIKES                    = 342, // store the type of spike spell active (0 if nothing)
    MOD_SPIKES_DMG                = 344, // stores the base damage of the spikes before reductions

    MOD_TP_BONUS                  = 345, //

    //stores the amount of elemental affinity (elemental staves mostly) - damage, acc, and perpetuation is all handled separately
    MOD_FIRE_AFFINITY_DMG         = 347, // They're stored separately due to Magian stuff - they can grant different levels of
    MOD_EARTH_AFFINITY_DMG        = 348, // the damage/acc/perp affinity on the same weapon, so they must be separated.
    MOD_WATER_AFFINITY_DMG        = 349, // Each level of damage affinity is +/-5% damage, acc is +/-10 acc, and perp is
    MOD_ICE_AFFINITY_DMG          = 350, // +/-1 mp/tic. This means that anyone adding these modifiers will have to add
    MOD_THUNDER_AFFINITY_DMG      = 351, // 1 to the wiki amount. For example, Fire Staff has 2 in fire affinity for
    MOD_WIND_AFFINITY_DMG         = 352, // DMG, ACC, and PERP, while the wiki lists it as having 1 in each.
    MOD_LIGHT_AFFINITY_DMG        = 353,
    MOD_DARK_AFFINITY_DMG         = 354,
    MOD_FIRE_AFFINITY_ACC         = 544,
    MOD_EARTH_AFFINITY_ACC        = 545,
    MOD_WATER_AFFINITY_ACC        = 546,
    MOD_ICE_AFFINITY_ACC          = 547,
    MOD_THUNDER_AFFINITY_ACC      = 548,
    MOD_WIND_AFFINITY_ACC         = 549,
    MOD_LIGHT_AFFINITY_ACC        = 550,
    MOD_DARK_AFFINITY_ACC         = 551,
    MOD_FIRE_AFFINITY_PERP        = 553,
    MOD_EARTH_AFFINITY_PERP       = 554,
    MOD_WATER_AFFINITY_PERP       = 555,
    MOD_ICE_AFFINITY_PERP         = 556,
    MOD_THUNDER_AFFINITY_PERP     = 557,
    MOD_WIND_AFFINITY_PERP        = 558,
    MOD_LIGHT_AFFINITY_PERP       = 559,
    MOD_DARK_AFFINITY_PERP        = 560,

    // Special Modifier+
    MOD_ADDS_WEAPONSKILL          = 355, //
    MOD_ADDS_WEAPONSKILL_DYN      = 356, // In Dynamis

    MOD_STEALTH                   = 358, //

    MOD_MAIN_DMG_RATING           = 366, // adds damage rating to main hand weapon (maneater/blau dolch etc hidden effects)
    MOD_SUB_DMG_RATING            = 367, // adds damage rating to off hand weapon
    MOD_REGAIN                    = 368, // auto regain TP (from items) | this is multiplied by 10 e.g. 20 is 2% TP
    MOD_REGAIN_DOWN               = 406, // plague, reduce tp
    MOD_REFRESH                   = 369, // auto refresh from equipment
    MOD_REFRESH_DOWN              = 405, // plague, reduce mp
    MOD_REGEN                     = 370, // auto regen from equipment
    MOD_REGEN_DOWN                = 404, // poison
    MOD_CURE_POTENCY              = 374, // % cure potency | bonus from gear is capped at 50
    MOD_CURE_POTENCY_RCVD         = 375, // % potency of received cure | healer's roll, some items have this
    MOD_RANGED_DMG_RATING         = 376, // adds damage rating to ranged weapon
    MOD_MAIN_DMG_RANK             = 377, // adds weapon rank to main weapon http://wiki.bluegartr.com/bg/Weapon_Rank
    MOD_SUB_DMG_RANK              = 378, // adds weapon rank to sub weapon
    MOD_RANGED_DMG_RANK           = 379, // adds weapon rank to ranged weapon
    MOD_DELAYP                    = 380, // delay addition percent (does not affect tp gain)
    MOD_RANGED_DELAYP             = 381, // ranged delay addition percent (does not affect tp gain)

    MOD_SHIELD_BASH               = 385, //
    MOD_KICK_DMG                  = 386, // increases kick attack damage
    MOD_WEAPON_BASH               = 392, //

    MOD_WYVERN_BREATH             = 402, //

    /// Gear set modifiers
    MOD_DA_DOUBLE_DAMAGE          = 408, // Double attack's double damage chance %.
    MOD_TA_TRIPLE_DAMAGE          = 409, // Triple attack's triple damage chance %.
    MOD_ZANSHIN_DOUBLE_DAMAGE     = 410, // Zanshin's double damage chance %.
    MOD_RAPID_SHOT_DOUBLE_DAMAGE  = 479, // Rapid shot's double damage chance %.
    MOD_ABSORB_DMG_CHANCE         = 480, // Chance to absorb damage %
    MOD_EXTRA_DUAL_WIELD_ATTACK   = 481, // Chance to land an extra attack when dual wielding
    MOD_EXTRA_KICK_ATTACK         = 482, // Occasionally allows a second Kick Attack during an attack round without the use of Footwork.
    MOD_SAMBA_DOUBLE_DAMAGE       = 415, // Double damage chance when samba is up.
    MOD_NULL_PHYSICAL_DAMAGE      = 416, // Chance to NULL physical damage.
    MOD_QUICK_DRAW_TRIPLE_DAMAGE  = 417, // Chance to do triple damage with quick draw.
    MOD_BAR_ELEMENT_NULL_CHANCE   = 418, // Bar Elemental spells will occasionally NULLify damage of the same element.
    MOD_GRIMOIRE_INSTANT_CAST     = 419, // Spells that match your current Arts will occasionally cast instantly, without recast.
    MOD_QUAD_ATTACK               = 430, // Quadruple attack chance.

    // Reraise (Auto Reraise, used by gear)
    MOD_RERAISE_I                 = 456, // Reraise.
    MOD_RERAISE_II                = 457, // Reraise II.
    MOD_RERAISE_III               = 458, // Reraise III.

    //Elemental Absorb Chance
    MOD_FIRE_ABSORB               = 459, //
    MOD_EARTH_ABSORB              = 460, //
    MOD_WATER_ABSORB              = 461, //
    MOD_WIND_ABSORB               = 462, //
    MOD_ICE_ABSORB                = 463, //
    MOD_LTNG_ABSORB               = 464, //
    MOD_LIGHT_ABSORB              = 465, //
    MOD_DARK_ABSORB               = 466, //

    //Elemental Null Chance
    MOD_FIRE_NULL                 = 467, //
    MOD_EARTH_NULL                = 468, //
    MOD_WATER_NULL                = 469, //
    MOD_WIND_NULL                 = 470, //
    MOD_ICE_NULL                  = 471, //
    MOD_LTNG_NULL                 = 472, //
    MOD_LIGHT_NULL                = 473, //
    MOD_DARK_NULL                 = 474, //

    MOD_MAGIC_ABSORB              = 475, //
    MOD_MAGIC_NULL                = 476, //
    MOD_PHYS_ABSORB               = 512, //
    MOD_ABSORB_DMG_TO_MP          = 516, // Unlike PLD gear mod, works on all damage types (Ethereal Earring)

    MOD_ADDITIONAL_EFFECT         = 431, //
    MOD_ITEM_SPIKES_TYPE          = 499, // Type spikes an item has
    MOD_ITEM_SPIKES_DMG           = 500, // Damage of an items spikes
    MOD_ITEM_SPIKES_CHANCE        = 501, // Chance of an items spike proc

    MOD_GOV_CLEARS                = 496, // 4% bonus per Grounds of Valor Page clear

    MOD_EXTRA_DMG_CHANCE          = 506, // Proc rate of MOD_OCC_DO_EXTRA_DMG. 111 would be 11.1%
    MOD_OCC_DO_EXTRA_DMG          = 507, // Multiplier for "Occasionally do x times normal damage". 250 would be 2.5 times damage.

    MOD_EAT_RAW_FISH              = 412, //
    MOD_EAT_RAW_MEAT              = 413, //

    MOD_ENHANCES_CURSNA           = 310, // Used by gear with the "Enhances Cursna" attribute
    MOD_RETALIATION               = 414, // Increases damage of Retaliation hits
    MOD_AUGMENTS_THIRD_EYE        = 508, // Adds counter to 3rd eye anticipates & if using Seigan counter rate is increased by 15%

    MOD_CLAMMING_IMPROVED_RESULTS = 509, //
    MOD_CLAMMING_REDUCED_INCIDENTS= 510, //

    MOD_CHOCOBO_RIDING_TIME       = 511, // Increases chocobo riding time

    MOD_HARVESTING_RESULT         = 513, // Improves harvesting results
    MOD_LOGGING_RESULT            = 514, // Improves logging results
    MOD_MINNING_RESULT            = 515, // Improves mining results

    MOD_EGGHELM                   = 517,

    MOD_SHIELDBLOCKRATE           = 518, // Affects shield block rate, percent based
    MOD_DIA_DOT                   = 313, // Increases the DoT damage of Dia
    MOD_ENH_DRAIN_ASPIR           = 315, // % damage boost to Drain and Aspir
    MOD_AUGMENTS_ABSORB           = 521, // Direct Absorb spell increase while Liberator is equipped (percentage based)
    MOD_AMMO_SWING                = 523, // Extra swing rate w/ ammo (ie. Jailer weapons). Use gearsets, and does nothing for non-players.
    MOD_AMMO_SWING_TYPE           = 826, // For the handedness of the weapon - 1h (1) vs. 2h/h2h (2). h2h can safely use the same function as 2h.
    MOD_AUGMENTS_CONVERT          = 525, // Convert HP to MP Ratio Multiplier. Value = MP multiplier rate.
    MOD_AUGMENTS_SA               = 526, // Adds Critical Attack Bonus to Sneak Attack, percentage based.
    MOD_AUGMENTS_TA               = 527, // Adds Critical Attack Bonus to Trick Attack, percentage based.
    MOD_ENHANCES_REFRESH          = 529, // "Enhances Refresh" adds +1 per modifier to spell's tick result.
    MOD_NO_SPELL_MP_DEPLETION     = 530, // % to not deplete MP on spellcast.
    MOD_FORCE_FIRE_DWBONUS        = 531, // Set to above 0 to force fire day/weather spell bonus/penalty.
    MOD_FORCE_EARTH_DWBONUS       = 532, // Set to above 0 to force earth day/weather spell bonus/penalty.
    MOD_FORCE_WATER_DWBONUS       = 533, // Set to above 0 to force water day/weather spell bonus/penalty.
    MOD_FORCE_WIND_DWBONUS        = 534, // Set to above 0 to force wind day/weather spell bonus/penalty.
    MOD_FORCE_ICE_DWBONUS         = 535, // Set to above 0 to force ice day/weather spell bonus/penalty.
    MOD_FORCE_LIGHTNING_DWBONUS   = 536, // Set to above 0 to force lightning day/weather spell bonus/penalty.
    MOD_FORCE_LIGHT_DWBONUS       = 537, // Set to above 0 to force light day/weather spell bonus/penalty.
    MOD_FORCE_DARK_DWBONUS        = 538, // Set to above 0 to force dark day/weather spell bonus/penalty.
    MOD_STONESKIN_BONUS_HP        = 539, // Bonus "HP" granted to Stoneskin spell.
    MOD_DAY_NUKE_BONUS            = 565, // Bonus damage from "Elemental magic affected by day" (Sorc. Tonban)
    MOD_IRIDESCENCE               = 566, // Iridesecnce trait (additional weather damage/penalty)
    MOD_BARSPELL_AMOUNT           = 567, // Additional elemental resistance granted by bar- spells
    MOD_BARSPELL_MDEF_BONUS       = 827, // Extra magic defense bonus granted to the bar- spell effect
    MOD_RAPTURE_AMOUNT            = 568, // Bonus amount added to Rapture effect
    MOD_EBULLIENCE_AMOUNT         = 569, // Bonus amount added to Ebullience effect
    MOD_AQUAVEIL_COUNT            = 832, // Modifies the amount of hits that Aquaveil absorbs before being removed

    // Weaponskill %damage modifiers
    // The following modifier should not ever be set, but %damage modifiers to weaponskills use the next 255 IDs (this modifier + the WSID)
    // For example, +10% damage to Chant du Cygne would be ID 570 + 225 (795)
    MOD_WEAPONSKILL_DAMAGE_BASE   = 570,

    // MOD_SPARE = 64, // stuff
    // MOD_SPARE = 65, // stuff
    // MOD_SPARE = 67, // stuff
    // MOD_SPARE = 92, // stuff
    // MOD_SPARE = 93, // stuff
    // MOD_SPARE = 94, // stuff
    // MOD_SPARE = 95, // stuff
    // MOD_SPARE = 96, // stuff
    // MOD_SPARE = 97, // stuff
    // MOD_SPARE = 98, // stuff
    // MOD_SPARE = 99, // stuff
    // MOD_SPARE = 100, // stuff
    // MOD_SPARE = 543, // stuff
    // MOD_SPARE = 552, // stuff
    // MOD_SPARE = 561, // stuff
    // MOD_SPARE = 834, // stuff
    // MOD_SPARE = 835, // stuff

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
