/*
===========================================================================

  Copyright (c) 2010-2014 Darkstar Dev Teams

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
#ifndef _CMOBMODIFIER_H
#define _CMOBMODIFIER_H

/*
This is a list of mob specific modifiers. They can be added to pools / families / spawn points.
*/

enum MOBMODIFIER
{
  MOBMOD_NONE           = 0,
  MOBMOD_GIL_MIN        = 1,  // minimum gil drop -- spawn mod only
  MOBMOD_GIL_MAX        = 2,  // maximum gil drop -- spawn mod only
  MOBMOD_MP_BASE        = 3,  // Give mob mp. Used for mobs that are not mages, wyverns, avatars
  MOBMOD_SIGHT_RANGE    = 4,  // sight range
  MOBMOD_SOUND_RANGE    = 5,  // sound range
  MOBMOD_BUFF_CHANCE    = 6,  // % chance to buff (combat only)
  MOBMOD_GA_CHANCE      = 7,  // % chance to use -ga spell
  MOBMOD_HEAL_CHANCE    = 8,  // % chance to use heal
  MOBMOD_HP_HEAL_CHANCE = 9,  // can cast cures below this HP %
  MOBMOD_SUBLINK        = 10, // sub link group
  MOBMOD_LINK_RADIUS    = 11, // link radius
  MOBMOD_DRAW_IN        = 12, // 1 - player draw in, 2 - alliance draw in -- only add as a spawn mod!
  MOBMOD_RAGE           = 13, // define rage timer -- only add as a spawn mod!
  MOBMOD_SKILLS         = 14, // use a custom mob skill list
  MOBMOD_MUG_GIL        = 15, // amount gil carried for mugging
  MOBMOD_MAIN_2HOUR     = 16, // give mob its main job two hour, value can maybe be sent to skill
  MOBMOD_NO_DESPAWN     = 17, // do not despawn when too far from spawn. Gob Diggers have this.
  MOBMOD_VAR            = 18, // temp var for whatever
  MOBMOD_SUB_2HOUR      = 19, // give mob its sub job two hour (dynamis NM) -- not impl
  MOBMOD_TP_USE_CHANCE  = 20, // % chance to use tp
  MOBMOD_PET_SPELL_LIST = 21, // set pet spell list
  MOBMOD_NA_CHANCE      = 22, // % chance to cast -na
  MOBMOD_IMMUNITY       = 23, // immune to set status effects. This only works from the db, not scripts
  MOBMOD_GRADUAL_RAGE   = 24, // gradually rages -- not impl
  MOBMOD_BUILD_RESIST   = 25, // builds resistance to given effects -- not impl
  MOBMOD_SUPERLINK      = 26, // super link group. Only use this in mob_spawn_mods / scripts!
  MOBMOD_SPELL_LIST     = 27, // set spell list
  MOBMOD_EXP_BONUS      = 28, // bonus exp (bonus / 100)
  MOBMOD_ASSIST         = 29, // mobs will assist me
  MOBMOD_SPECIAL_SKILL  = 30, // give special skill
  MOBMOD_RAND_JOB       = 31, // can spawn as a random job depending on its family
  MOBMOD_2HOUR_MULTI    = 32, // can use two hour multiple times
  MOBMOD_SPECIAL_COOL   = 33, // cool down for special
  MOBMOD_MAGIC_COOL     = 34, // cool down for magic
  MOBMOD_STANDBACK_TIME = 35, // amount of time the mob stands back
  MOBMOD_ROAM_COOL      = 36, // cool down for roaming
  MOBMOD_ALWAYS_AGGRO   = 37, // aggro regardless of level. Spheroids
  MOBMOD_REFLECT        = 38, // colibri -- not impl
  MOBMOD_SHARE_POS      = 39, // share a pos with another mob (eald'narche exoplates)
  MOBMOD_TELEPORT_CD    = 40, // cooldown for teleport abilities (tarutaru AA, angra mainyu, eald'narche)
  MOBMOD_TELEPORT_START = 41, // mobskill ID to begin teleport
  MOBMOD_TELEPORT_END   = 42, // mobskill ID to end teleport
  MOBMOD_TELEPORT_TYPE  = 43, // teleport type - 1: on cooldown, 2 - to close distance
  MOBMOD_DUAL_WIELD     = 44, // enables a mob to use their offhand in attacks
  MOBMOD_ADD_EFFECT     = 45  // enables additional effect script to process on mobs attacks
};

#define MAX_MOBMODIFIER         46

#endif
