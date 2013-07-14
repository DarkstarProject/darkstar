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
#ifndef _CMOBMODIFIER_H
#define _CMOBMODIFIER_H

/*
This is a list of mob specific modifiers. They can be added to pools / families / spawn points.
*/

enum MOBMODIFIER
{
  MOBMOD_NONE = 0,
  MOBMOD_GIL_MIN = 1, // minimum gil drop
  MOBMOD_GIL_MAX = 2, // maximum gil drop
  MOBMOD_MP_BASE = 3, // Give mob mp. Used for mobs that are not mages, wyverns, avatars
  MOBMOD_SIGHT_RANGE = 4, // sight range
  MOBMOD_SOUND_RANGE = 5, // sound range
  MOBMOD_BUFF_CHANCE = 6, // % chance to buff (combat only)
  MOBMOD_GA_CHANCE = 7, // % chance to use -ga spell
  MOBMOD_HEAL_CHANCE = 8, // % chance to use heal
  MOBMOD_HP_HEAL_CHANCE = 9, // can cast cures below this HP %
  MOBMOD_SUBLINK = 10, // link with this family
  MOBMOD_UNUSED = 11, // 
  MOBMOD_DRAW_IN = 12, // 1 - player draw in, 2 - alliance draw in -- not impl
  MOBMOD_RAGE = 13, // define rage timer -- not impl
  MOBMOD_SKILLS = 14, // use a custom mob skill list
  MOBMOD_MUG_GIL = 15, // amount gil carried for mugging -- not impl
  MOBMOD_MAIN_2HOUR = 16, // give mob its main job two hour, value can maybe be sent to skill -- not impl
  MOBMOD_NO_DESPAWN = 17, // do not despawn when too far from spawn. Gob Diggers have this.
  MOBMOD_STEAL = 18, // set item can be stolen -- not impl
  MOBMOD_SUB_2HOUR = 19, // give mob its sub job two hour (dynamis NM) -- not impl
  MOBMOD_TP_USE_CHANCE = 20, // % chance to use tp
  MOBMOD_PET_SPELL_LIST = 21, // set pet spell list
  MOBMOD_NA_CHANCE = 22, // % chance to cast -na
  MOBMOD_IMMUNITY = 23, // immune to set status effects -- not impl
  MOBMOD_GRADUAL_RAGE = 24, // gradually rages -- not impl
  MOBMOD_BUILD_RESIST = 25, // builds resistance to given effects -- not impl
  MOBMOD_SUPERLINK = 26, // super link group. Only use this in mob_spawn_mods!
  MOBMOD_SPELL_LIST = 27, // set spell list
  MOBMOD_TITLE = 28, // set title to all party members on death. Only use this in mob_spawn_mods!
  MOBMOD_ASSIST = 29 // mobs will assist me
};

#define MAX_MOBMODIFIER         30

#endif
