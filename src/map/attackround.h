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

#ifndef _CATTACKROUND_H
#define _CATTACKROUND_H

#include "../common/cbasetypes.h"
#include "entities/battleentity.h"
#include "utils/charutils.h"
#include "utils/attackutils.h"
#include <vector>



#define MAX_ATTACKS 8

class CAttack;

/************************************************************************
*																		*
*  An attack round object (Can contain multiple swings)					*
*																		*
************************************************************************/
class CAttackRound
{
public:
	CAttackRound(CBattleEntity* attacker);
	~CAttackRound();

	void						AddAttackSwing(PHYSICAL_ATTACK_TYPE type, PHYSICAL_ATTACK_DIRECTION direction, uint8 count); // Adds an attack swing.
	void						CreateAttacks(CItemWeapon* PWeapon, PHYSICAL_ATTACK_DIRECTION direction);	// Creates up to many attacks for a particular hand.
	void						DeleteAttackSwing();		// Deletes the first attack in the list.
	void						CreateKickAttacks();		// Creates kick attacks for the round.
	void						CreateZanshinAttacks();		// Creates zanshin attacks.

	uint8						GetAttackSwingCount();		// Returns the attack list count.
	bool						IsH2H();					// Flag: Is the attacker using H2H?
	CAttack*					GetAttack(uint8);			// Returns an attack object pointer.
	CAttack*					GetCurrentAttack();			// Returns the current attack.
	void						SetSATA(bool value);		// Sets the SATA flag.
	bool						GetSATAOccured();			// Returns the SATA flag.
	void						SetMissOccured(bool value);	// Sets the miss occured flag.
	bool						GetMissOccured();			// Returns the miss occured flag.
	void						SetZanshinOccured(bool value);// Sets the zanshin occured flag.
	bool						GetZanshinOccured();		// Returns the zanshin occured flag.
	CBattleEntity*				GetTAEntity();				// Returns the TA entity.

private:
	CBattleEntity*				m_attacker;					// The attacker.
	CBattleEntity*				m_taEntity;					// The trick attack entity.
	std::vector<CAttack*>		m_attackSwings;				// The list of attacks for this round.
	bool						m_zanshinOccured;			// Flag: Did zanshin occur during the round?
	bool						m_sataOccured;				// Flag: Did SATA occur during the round?
	bool						m_doubleAttackOccured;		// Flag: Did a double attack occur during the round?
	bool						m_tripleAttackOccured;		// Flag: Did a triple attack occur during the round?
	bool						m_quadAttackOccured;		// Flag: Did a quadruple attack occur during the round?
	bool						m_kickAttackOccured;		// Flag: Did a kick attack occur during the round?
	bool						m_missOccured;				// Flag: Did a miss occur during the attack round?
	uint16						m_subWeaponType;			// The sub weapon type.

};

#endif