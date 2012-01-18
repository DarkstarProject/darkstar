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

#ifndef _CTRAIT_H
#define _CTRAIT_H

#include "../common/cbasetypes.h"
#include "../common/mmo.h"
#include "battleentity.h"


enum TRAITTYPE
{
	ACCURACY_BONUS		=	1	,
	EVASION_BONUS		=	2	,
	ATTACK_BONUS		=	3	,
	DEFENSE_BONUS		=	4	,
	MAGIC_ATK_BONUS		=	5	,
	MAGIC_DEF_BONUS		=	6	,
	MAX_HP_BOOST		=	7	,
	MAX_MP_BOOST		=	8	,
	AUTO_REGEN			=	9	,
	AUTO_REFRESH		=	10	,
	RAPID_SHOT			=	11	,
	FAST_CAST			=	12	,
	CONSERVE_MP			=	13	,
	STORE_TP			=	14	,
	DOUBLE_ATTACK		=	15	,
	TRIPLE_ATTACK		=	16	,
	COUNTER				=	17	,
	DUAL_WIELD			=	18	,
	TREASURE_HUNTER		=	19	,
	GILFINDER			=	20	,
	ALERTNESS			=	21	,
	STEALTH				=	22	,
	MARTIAL_ARTS		=	23	,
	CLEAR_MIND			=	24	,
	SHIELD_MASTERY		=	25	,
	BEAST_KILLER		=	32	,
	PLANTOID_KILLER		=	33	,
	VERMIN_KILLER		=	34	,
	LIZARD_KILLER		=	35	,
	BIRD_KILLER			=	36	,
	AMORPH_KILLER		=	37	,
	AQUAN_KILLER		=	38	,
	UNDEAD_KILLER		=	39	,
	ARCANA_KILLER		=	41	,
	DEMON_KILLER		=	42	,
	DRAGON_KILLER		=	43	,
	RESIST_SLEEP		=	48	,
	RESIST_POISON		=	49	,
	RESIST_PARALYZE		=	50	,
	RESIST_BLIND		=	51	,
	RESIST_SILENCE		=	52	,
	RESIST_PETRIFY		=	53	,
	RESIST_VIRUS		=	54	,
	RESIST_CURSE		=	55	,
	RESIST_STUN			=	56	,
	RESIST_BIND			=	57	,
	RESIST_GRAVITY		=	58	,
	RESIST_SLOW			=	59	,
	RESIST_CHARM		=	60	,
	TREASURE_HUNTER_II	=	64	,
	GILFINDER_II		=	65	,
	KICK_ATTACKS		=	66	,
	SUBTLE_BLOW			=	67	,
	ASSASSIN			=	68	,
	DIVINE_VEIL			=	69	,
	ZANSHIN				=	70	,
	SAVAGERY			=	71	,
	AGGRESSIVE_AIM		=	72	,
	INVIGORATE			=	73	,
	PENANCE				=	74	,
	AURA_STEAL			=	75	,
	AMBUSH				=	76	,
	IRON_WILL			=	77	,
	GUARDIAN			=	78	,
	MUTED_SOUL			=	79	,
	DESPERATE_BLOWS		=	80	,
	BEAST_AFFINITY		=	81	,
	BEAST_HEALER		=	82	,
	SNAPSHOT			=	83	,
	RECYCLE				=	84	,
	IKISHOTEN			=	85	,
	OVERWHELM			=	86	,
	NINJA_TOOL_EXPERT	=	87	,
	EMPATHY				=	88	,
	STRAFE				=	89	,
	ENCHAINMENT			=	90	,
	ASSIMILATION		=	91	,
	WINNING_STREAK		=	92	,
	LOADED_DECK			=	93	,
	FINE_TUNING			=	94	,
	OPTIMIZATION		=	95	,
	CLOSED_POSITION		=	96	,
	STORMSURGE			=	97	,
};



#define MAX_TRAIT_ID	108

class CTrait
{
public:

	CTrait(uint16 id);
    uint16		getID();
	int8		getJob();
	int8		getLevel();
	
	void		setJob(int8 job);
	void		setLevel(uint8 level);
		
	const int8* getName();
	void		setName(int8* name);
	
private:

	uint16		m_id;
	int8		m_Job; 
	int8		m_Level;
	string_t	m_name;

};

#endif;