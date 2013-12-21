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

#ifndef _CATTACK_H
#define _CATTACK_H

#include "../common/cbasetypes.h"
#include "entities/battleentity.h"
#include "utils/battleutils.h"
#include "utils/attackutils.h"
#include <vector>


enum PHYSICAL_ATTACK_TYPE
{
	ATTACK_NORMAL		= 0,
	DOUBLE_ATTACK		= 1,
	TRIPLE_ATTACK		= 2,
	ZANSHIN_ATTACK		= 3,
	KICK_ATTACK			= 4,
	RANGED_ATTACK		= 5,
	RAPID_SHOT_ATTACK	= 6,
	SAMBA_ATTACK		= 7,
};

enum PHYSICAL_ATTACK_DIRECTION
{
	LEFTATTACK = 0,
	RIGHTATTACK = 1,
};

class CAttackRound;

/************************************************************************
*																		*
*  A single attack object												*
*																		*
************************************************************************/
class CAttack
{
public:
	CAttack(CBattleEntity* attacker, PHYSICAL_ATTACK_TYPE type, PHYSICAL_ATTACK_DIRECTION direction, CAttackRound* attackRound);

	uint8						GetAnimationID();		// Returns the animation ID.
	PHYSICAL_ATTACK_TYPE		GetAttackType();		// Returns the attack type (Double, Triple, Zanshin ect).
	PHYSICAL_ATTACK_DIRECTION	GetAttackDirection();	// Returns the attack direction.
	uint8						GetWeaponSlot();		// Returns the attacking slot.
	uint8						GetHitRate();			// Returns the hitrate for this swing.
	int32						GetDamage();			// Returns the damage for this attack.
	void						SetDamage(int32);		// Sets the damage for this attack.
	bool						IsCritical();			// Returns the isCritical flag.
	void						SetCritical(bool);		// Sets the isCritical flag;
	bool						IsFirstSwing();			// Returns the isFirstSwing flag.
	void						SetAsFirstSwing();		// Sets this attack as the first swing.
	float						GetDamageRatio();		// Gets the damage ratio.
	void						SetGuarded(bool);		// Sets the isGuarded flag.
	bool						IsGuarded();			// Sets the isGuarded flag. Also alters the damage ratio accordingly. 
	bool						IsEvaded();				// Gets the evaded flag.
	void						SetEvaded(bool value);	// Sets the evaded flag.
	bool						IsBlocked();			// Gets the blocked flag.
	void						ProcessDamage();		// Processes the damage for this swing.

	void						SetAttackType(PHYSICAL_ATTACK_TYPE type); // Sets the attack type.

private:
	CBattleEntity*				m_attacker;				// The attacker.
	CBattleEntity*				m_victim;				// The victim.
	CAttackRound*				m_attackRound;			// Reference to the parent attack round.
	PHYSICAL_ATTACK_TYPE		m_attackType;			// The attack type (Double, Triple, Zanshin ect).
	PHYSICAL_ATTACK_DIRECTION	m_attackDirection;		// The attack direction (Left, Right).				
	uint8						m_hitRate;				// This attack's hitrate.	
	bool						m_isCritical;			// Flag: Is this attack a critical attack?
	bool						m_isGuarded;			// Flag: Is this attack guarded by the victim?
	bool						m_isBlocked;			// Flag: Is this attack blocked by the victim?
	bool						m_isEvaded;				// Flag: Is this attack evaded by the victim?
	bool						m_isFirstSwing;			// Flag: Is this attack the first swing?
	float						m_damageRatio;			// The damage ratio.
	int32						m_damage;				// The damage for this attack.
	int32						m_trickAttackDamage;	// The damage from trick attack.
	int32						m_naturalH2hDamage;		// The damage from natural H2H.
	int32						m_baseDamage;			// The base damage.

};

#endif