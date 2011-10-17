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

#include "../../common/showmsg.h"
#include "../../common/socket.h"
#include "../../common/utils.h"

#include <string.h>

#include "action.h"

#include "../battleentity.h"
#include "../spell.h"
#include "../weapon_skill.h"
#include "../ability.h"
#include "../mobskill.h"

/************************************************************************
*																		*
*  ActionTargetID содержит ID цели, над которой производится действие,	*
*  Если над целью необходимо произвести несколько действий, то в		*
*  последующих структурах это поле оставляется пустым (равным нулю),	*
*  это говорит о том, что это действие над ранее указанной целью		*
*																		*
************************************************************************/

CActionPacket::CActionPacket(CBattleEntity * PEntity) 
{
	this->type = 0x28;
	this->size = 0x12;

	WBUFL(data,(0x05)-4) = PEntity->id;

	ACTIONTYPE ActionType = PEntity->PBattleAI->GetCurrentAction();

	switch (ActionType)
	{
		case ACTION_ATTACK:
		{
			WBUFB(data,(0x0A)-4) = 0x44;
			WBUFB(data,(0x0B)-4) = 0x18;
			WBUFB(data,(0x0C)-4) = 0xDD;
			WBUFB(data,(0x0D)-4) = 0x1A;
			WBUFB(data,(0x0E)-4) = 0x0C;
		}
			break;
		case ACTION_WEAPONSKILL_START:
			{
				packBitsBE(data, PEntity->PBattleAI->GetCurrentWeaponSkill()->getID(), 54, 10);
			}
			break;
		case ACTION_WEAPONSKILL_FINISH:

			{
				packBitsBE(data, PEntity->PBattleAI->GetCurrentWeaponSkill()->getID(), 54, 10);
			}
			break;
		case ACTION_JOBABILITY_START:
			{

			}
			break;
		case ACTION_JOBABILITY_FINISH:
			{	
			packBitsBE(data, PEntity->PBattleAI->GetCurrentJobAbility()->getID()+16, 54, 10);
			packBitsBE(data, PEntity->PBattleAI->GetCurrentJobAbility()->getRecastTime(), 86, 10);
			}
			break;

		case ACTION_MOBABILITY_FINISH:
			{	
				packBitsBE(data, PEntity->PBattleAI->GetCurrentMobSkill()->getID() + 256,54 , 10);
			}
			break;
		case ACTION_ITEM_START:
		{	
			WBUFB(data,(0x0A)-4) = 0xE4;

			WBUFB(data,(0x0B)-4) = 0x58;
			WBUFB(data,(0x0C)-4) = 0x58;
			WBUFB(data,(0x0D)-4) = 0x1A;
			WBUFB(data,(0x0E)-4) = 0x1D;
		}
			break;
		case ACTION_ITEM_INTERRUPT:
		{
			WBUFB(data,(0x0A)-4) = 0xE4;
			WBUFB(data,(0x0B)-4) = 0x1C; 
			WBUFB(data,(0x0C)-4) = 0x5C;
			WBUFB(data,(0x0D)-4) = 0x1A;
			WBUFB(data,(0x0E)-4) = 0x1D;

			ActionType = ACTION_ITEM_START;
		}
			break;
		case ACTION_RANGED_START:
		{
			WBUFB(data,(0x0A)-4) = 0xF0;
			WBUFB(data,(0x0B)-4) = 0x58;
			WBUFB(data,(0x0C)-4) = 0x18;
			WBUFB(data,(0x0D)-4) = 0xDB;
			WBUFB(data,(0x0E)-4) = 0x19;
		}
			break;
		case ACTION_RANGED_FINISH:
		{
			WBUFB(data,(0x0A)-4) = 0xC8;
			WBUFB(data,(0x0B)-4) = 0x1C;
			WBUFB(data,(0x0C)-4) = 0x1A;
			WBUFB(data,(0x0D)-4) = 0xDB;
			WBUFB(data,(0x0E)-4) = 0x19;
		}
			break;
		case ACTION_RANGED_INTERRUPT:
		{
			WBUFB(data,(0x0A)-4) = 0xF0;
			WBUFB(data,(0x0B)-4) = 0x1C;
			WBUFB(data,(0x0C)-4) = 0x1C;
			WBUFB(data,(0x0D)-4) = 0xDB;
			WBUFB(data,(0x0E)-4) = 0x19;
			
			ActionType = ACTION_RANGED_START;
		}
			break;
		case ACTION_MAGIC_START:
		{
			WBUFB(data,(0x0A)-4) = 0xE0;
			WBUFB(data,(0x0B)-4) = 0x58;

			switch (PEntity->PBattleAI->GetCurrentSpell()->getSpellGroup())
			{
				case SPELLGROUP_WHITE:
				{
					WBUFB(data,(0x0C)-4) = 0xD8;
					WBUFB(data,(0x0D)-4) = 0x1D;
					WBUFB(data,(0x0E)-4) = 0x1A;
				}
					break;
				case SPELLGROUP_BLACK:
				{
					WBUFB(data,(0x0C)-4) = 0x98;
					WBUFB(data,(0x0D)-4) = 0xD8;
					WBUFB(data,(0x0E)-4) = 0x1A;
				}
					break;
				case SPELLGROUP_BLUE:
				{
					WBUFB(data,(0x0C)-4) = 0x98;
					WBUFB(data,(0x0D)-4) = 0x18;
					WBUFB(data,(0x0E)-4) = 0x1B;
				}
					break;
				case SPELLGROUP_SONG:
				{
					WBUFB(data,(0x0C)-4) = 0xD8;
					WBUFB(data,(0x0D)-4) = 0xDC;
					WBUFB(data,(0x0E)-4) = 0x1B;
				}
					break;
				case SPELLGROUP_NINJUTSU:
				{
					WBUFB(data,(0x0C)-4) = 0x98;
					WBUFB(data,(0x0D)-4) = 0x9B;
					WBUFB(data,(0x0E)-4) = 0x1A;
				}
					break;
				case SPELLGROUP_SUMMONING:
				{
					WBUFB(data,(0x0C)-4) = 0xD8;
					WBUFB(data,(0x0D)-4) = 0x5C;
					WBUFB(data,(0x0E)-4) = 0x1B;
				}
				break;
			}
		}
			break;
		case ACTION_MAGIC_FINISH:
		{
			packBitsBE(data, PEntity->PBattleAI->GetCurrentSpell()->getID(), 54, 10);
			packBitsBE(data, PEntity->PBattleAI->GetCurrentSpell()->getRecastTime(), 86, 10);
		}
			break;
		case ACTION_MAGIC_INTERRUPT:
		{
			WBUFB(data,(0x0A)-4) = 0xE0;
			WBUFB(data,(0x0B)-4) = 0x1C;

			switch (PEntity->PBattleAI->GetCurrentSpell()->getSpellGroup())
			{
				case SPELLGROUP_WHITE:
				{
					WBUFB(data,(0x0C)-4) = 0xDC;
					WBUFB(data,(0x0D)-4) = 0x1D;
					WBUFB(data,(0x0E)-4) = 0x1A;
				}
					break;
				case SPELLGROUP_BLACK:
				{
					WBUFB(data,(0x0C)-4) = 0x9C;
					WBUFB(data,(0x0D)-4) = 0xD8;
					WBUFB(data,(0x0E)-4) = 0x1A;
				}
					break;
				case SPELLGROUP_BLUE:
				{
					WBUFB(data,(0x0C)-4) = 0x9C;
					WBUFB(data,(0x0D)-4) = 0x18;
					WBUFB(data,(0x0E)-4) = 0x1B;
				}
					break;
				case SPELLGROUP_SONG:
				{
					WBUFB(data,(0x0C)-4) = 0xDC;
					WBUFB(data,(0x0D)-4) = 0xDC;
					WBUFB(data,(0x0E)-4) = 0x1B;
				}
					break;
				case SPELLGROUP_NINJUTSU:
				{
					WBUFB(data,(0x0C)-4) = 0x9C;
					WBUFB(data,(0x0D)-4) = 0x9B;
					WBUFB(data,(0x0E)-4) = 0x1A;
				}
					break;
				case SPELLGROUP_SUMMONING:
				{
					WBUFB(data,(0x0C)-4) = 0xDC;
					WBUFB(data,(0x0D)-4) = 0x5C;
					WBUFB(data,(0x0E)-4) = 0x1B;
				}
				break;
			}
			ActionType = ACTION_MAGIC_START;
		}
		break;
	}

	uint32 TargetNum = 0;
	uint32 ActionNum = 0;
	uint32 bitOffset = 50;

	bitOffset = packBitsBE(data, ActionType, bitOffset, 4);
	bitOffset += 64; 

	for (uint32 i = 0; i < PEntity->m_ActionList.size(); ++i)
	{
		apAction_t Action = PEntity->m_ActionList.at(i);

		if (Action.ActionTarget != NULL)
		{
			TargetNum++;
			
			bitOffset = packBitsBE(data, Action.ActionTarget->id, bitOffset, 32);	// тип совершаемого действия
			bitOffset = packBitsBE(data, 1, bitOffset, 4);							// количество действий над целью, в данном случае одно

			ActionNum = 0;
		}

		bitOffset = packBitsBE(data, Action.reaction,   bitOffset,  5);				// физическая реакция на урон
		bitOffset = packBitsBE(data, Action.animation,  bitOffset, 10);				// анимация специальных эффектов
		bitOffset = packBitsBE(data, Action.speceffect, bitOffset, 10);				// specialEffect					
		bitOffset = packBitsBE(data, Action.param,	    bitOffset, 16);				// параметр сообщения (урон)
		bitOffset += 1;
		bitOffset = packBitsBE(data, Action.messageID,  bitOffset, 10);				// сообщение
		bitOffset += 32;
		bitOffset = packBitsBE(data, Action.flag,		bitOffset,  2);				// флаг, ??? наличие дополнительного эффекта ???

		if (Action.flag != 0)
		{
			// all subeffect 9 bit
			// flag 2 subeffect 10 bit
			bitOffset = packBitsBE(data, Action.subeffect,		bitOffset,  9);		// анимация эффекта, точный размер не известен (эффектов не так уж и много, около десяти)
			bitOffset = packBitsBE(data, Action.subparam,		bitOffset, 16);		// параметр сообщения (урон)
			bitOffset += 1;
			bitOffset = packBitsBE(data, Action.submessageID,	bitOffset, 10);		// сообщение
		}
		
		ActionNum++;
	}
	
	if (ActionNum > 1)
	{
		packBitsBE(data, ActionNum, 150, 4);
	}

	uint8 WorkSize = ((bitOffset >> 3) + (bitOffset%8 == 0 ? 0 : 1));				

	this->size = ((((WorkSize + 7) >> 1) + 1) & 0xFE);

	WBUFB(data,(0x04)-4) = WorkSize; 												// Workload Size - 0x23 с дополнительным эффектом - 0x29 два удара монаха 
	WBUFB(data,(0x09)-4) = TargetNum;												// количество атакуемых целей
}

// 0xE0 0x58 0xD8 0x1D 0x1A - White Magic Start
// 0xE0 0x58 0x98 0xD8 0x1A - Dark Magic Start
// 0xE0 0x58 0x98 0x9B 0x1A - Ninjutsu Start
// 0xE0 0x58 0x98 0x18 0x1B - Blue Magic Start
// 0xE0 0x58 0xD8 0xDC 0x1B - Song Start

// 0xE0 0x1C 0xDC 0x1D 0x1A - White Magic Interrupt
// 0xE0 0x1C 0x9C 0xD8 0x1A - Dark Magic Interrupt
// 0xE0 0x1C 0x9C 0x9B 0x1A - Ninjutsu Interrupt
// 0xE0 0x1C 0x9C 0x18 0x1B - Blue Magic Interrupt
// 0xE0 0x1C 0xDC 0xDC 0x1B - Song Interrupt

//                                   -11.00011010.000110- ActionStart
//									 -11.00111000.001110- ActionInterrupt
//                                   -11.00111000.010110- ActionFinish

// 0xE0 0x58 0xD8 0x1D 0x1A - 00-0001-11.00011010.000110-11.10111000.01-011000 - White Magic Start
// 0xE0 0x58 0x98 0xD8 0x1A - 00-0001-11.00011010.000110-01.00011011.01-011000 - Dark Magic Start
// 0xE0 0x58 0x98 0x9B 0x1A - 00-0001-11.00011010.000110-01.11011001.01-011000 - Ninjutsu Start
// 0xE0 0x58 0x98 0x18 0x1B - 00-0001-11.00011010.000110-01.00011000.11-011000 - Blue Magic Start
// 0xE0 0x58 0xD8 0xDC 0x1B - 00-0001-11.00011010.000110-11.00111011.11-011000 - Song Start

// 0xE0 0x1C 0xDC 0x1D 0x1A - 00-0001-11.00111000.001110-11.10111000.01-011000 - White Magic Interrupt
// 0xE0 0x1C 0x9C 0xD8 0x1A - 00-0001-11.00111000.001110-01.00011011.01-011000 - Dark Magic Interrupt
// 0xE0 0x1C 0x9C 0x9B 0x1A - 00-0001-11.00111000.001110-01.11011001.01-011000 - Ninjutsu Interrupt
// 0xE0 0x1C 0x9C 0x18 0x1B - 00-0001-11.00111000.001110-01.00011000.11-011000 - Blue Magic Interrupt
// 0xE0 0x1C 0xDC 0xDC 0x1B - 00-0001-11.00111000.001110-11.00111011.11-011000 - Song Interrupt

// 0xF0 0x58 0x18 0xDB 0x19 - 00-0011-11.00011010.000110-00.11011011.10-011000 - ACTION_RANGED_START
// 0xC8 0x1C 0x1A 0xDB 0x19 - 00-0100-11.00111000.010110-00.11011011.10-011000 - ACTION_RANGED_FINISH
// 0xF0 0x1C 0x1C 0xDB 0x19 - 00-0011-11.00111000.001110-00.11011011.10-011000 - ACTION_RANGED_INTERRUPT

// 0xE4 0x58 0x58 0x1A 0x1D - 00-1001-11.00011010.000110-10.01011000.10-111000 - ACTION_ITEM_START

// 0x44 0x18 0xDD 0x1A 0x0C - 00-1000-10.00011000.101110-11.01011000.00-110000 - ACTION_ATTACK
