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

#ifndef _CTRAIT_H
#define _CTRAIT_H

#include "../common/cbasetypes.h"
#include "../common/mmo.h"
#include "battleentity.h"


enum TRAITTYPE
{
	ACCURACY_BONUS		=	385	,
	EVASION_BONUS		=	386	,
	ATTACK_BONUS		=	387	,
	DEFENSE_BONUS		=	388	,
	MAGIC_ATK_BONUS		=	389	,
	MAGIC_DEF_BONUS		=	390	,
	MAX_HP_BOOST		=	391	,
	MAX_MP_BOOST		=	392	,
	AUTO_REGEN			=	393	,
	AUTO_REFRESH		=	394	,
	RAPID_SHOT			=	395	,
	FAST_CAST			=	396	,
	CONSERVE_MP			=	397	,
	STORE_TP			=	398	,
	DOUBLE_ATTACK		=	399	,
	TRIPLE_ATTACK		=	400	,
	COUNTER				=	401	,
	DUAL_WIELD			=	402	,
	TREASURE_HUNTER		=	403	,
	GILFINDER			=	404	,
	ALERTNESS			=	405	,
	STEALTH				=	406	,
	MARTIAL_ARTS		=	407	,
	CLEAR_MIND			=	408	,
	SHIELD_MASTERY		=	409	,
	BEAST_KILLER		=	416	,
	PLANTOID_KILLER		=	417	,
	VERMIN_KILLER		=	418	,
	LIZARD_KILLER		=	419	,
	BIRD_KILLER			=	420	,
	AMORPH_KILLER		=	421	,
	AQUAN_KILLER		=	422	,
	UNDEAD_KILLER		=	423	,
	ARCANA_KILLER		=	425	,
	DEMON_KILLER		=	426	,
	DRAGON_KILLER		=	427	,
	RESIST_SLEEP		=	432	,
	RESIST_POISON		=	433	,
	RESIST_PARALYZE		=	434	,
	RESIST_BLIND		=	435	,
	RESIST_SILENCE		=	436	,
	RESIST_PETRIFY		=	437	,
	RESIST_VIRUS		=	438	,
	RESIST_CURSE		=	439	,
	RESIST_STUN			=	440	,
	RESIST_BIND			=	441	,
	RESIST_GRAVITY		=	442	,
	RESIST_SLOW			=	443	,
	RESIST_CHARM		=	444	,
	TREASURE_HUNTER_II	=	448	,
	GILFINDER_II		=	449	,
	KICK_ATTACKS		=	450	,
	SUBTLE_BLOW			=	451	,
	ASSASSIN			=	452	,
	DIVINE_VEIL			=	453	,
	ZANSHIN				=	454	,
	SAVAGERY			=	455	,
	AGGRESSIVE_AIM		=	456	,
	INVIGORATE			=	457	,
	PENANCE				=	458	,
	AURA_STEAL			=	459	,
	AMBUSH				=	460	,
	IRON_WILL			=	461	,
	GUARDIAN			=	462	,
	MUTED_SOUL			=	463	,
	DESPERATE_BLOWS		=	464	,
	BEAST_AFFINITY		=	465	,
	BEAST_HEALER		=	466	,
	SNAPSHOT			=	467	,
	RECYCLE				=	468	,
	IKISHOTEN			=	469	,
	OVERWHELM			=	470	,
	NINJA_TOOL_EXPERT	=	471	,
	EMPATHY				=	472	,
	STRAFE				=	473	,
	ENCHAINMENT			=	474	,
	ASSIMILATION		=	475	,
	WINNING_STREAK		=	476	,
	LOADED_DECK			=	477	,
	FINE_TUNING			=	478	,
	OPTIMIZATION		=	479	,
	CLOSED_POSITION		=	480	,
	STORMSURGE			=	481	,
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