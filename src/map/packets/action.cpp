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

#include "../../common/showmsg.h"
#include "../../common/socket.h"
#include "../../common/utils.h"

#include <string.h>

#include "action.h"

#include "../entities/battleentity.h"
#include "../spell.h"
#include "../weapon_skill.h"
#include "../ability.h"
#include "../mobskill.h"
#include "../utils/battleutils.h"

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

	WBUFL(data,(0x05)) = PEntity->id;

	ACTIONTYPE ActionType = PEntity->PBattleAI->GetCurrentAction();

	switch (ActionType)
	{
		case ACTION_ATTACK:
		{
			WBUFB(data,(0x0A)) = 0x44;
			WBUFB(data,(0x0B)) = 0x18;
			WBUFB(data,(0x0C)) = 0xDD;
			WBUFB(data,(0x0D)) = 0x1A;
			WBUFB(data,(0x0E)) = 0x0C;
		}
			break;
		case ACTION_WEAPONSKILL_START:
		{
			packBitsBE(data, PEntity->PBattleAI->GetCurrentWeaponSkill()->getID(), 86, 10);
		}
			break;
		case ACTION_WEAPONSKILL_FINISH:
		{
			packBitsBE(data, PEntity->PBattleAI->GetCurrentWeaponSkill()->getID(), 86, 10);
		}
			break;
		case ACTION_JOBABILITY_START:
		{

		}
			break;
		case ACTION_JOBABILITY_FINISH:
		{
			if (PEntity->PBattleAI->GetCurrentJobAbility()->getID() == ABILITY_DOUBLE_UP)
			{
				packBitsBE(data, PEntity->PBattleAI->GetLastCorsairRoll() + 16, 86, 10);
			} else {
				packBitsBE(data, PEntity->PBattleAI->GetCurrentJobAbility()->getID() + 16, 86, 10);
			}
			packBitsBE(data, PEntity->PBattleAI->GetCurrentJobAbility()->getRecastTime(), 118, 10);
		}
			break;
        case ACTION_MOBABILITY_START:
        {
            WBUFB(data,(0x0A)) = 0xDC;
			WBUFB(data,(0x0B)) = 0x58;
			WBUFB(data,(0x0C)) = 0x18;
			WBUFB(data,(0x0D)) = 0x5D;
			WBUFB(data,(0x0E)) = 0x19;

            ActionType = ACTION_WEAPONSKILL_START;
        }
            break;
		case ACTION_MOBABILITY_INTERRUPT:
		{
			WBUFB(data,(0x0A)) = 0xDC;
			WBUFB(data,(0x0B)) = 0x1C;
			WBUFB(data,(0x0C)) = 0x1C;
			WBUFB(data,(0x0D)) = 0x5D;
			WBUFB(data,(0x0E)) = 0x19;
		}
			break;
		case ACTION_MOBABILITY_FINISH:
		{
			uint16 id = PEntity->PBattleAI->GetCurrentMobSkill()->getMsgForAction();

			//higher number of bits than anything else that we know of. CAP OF 4095 (2300ish is abyssea tp moves)!
			packBitsBE(data, id, 86, 12);
            if (PEntity->objtype == TYPE_PET && (((CPetEntity*)PEntity)->getPetType() == PETTYPE_AVATAR ||
                ((CPetEntity*)PEntity)->getPetType() == PETTYPE_WYVERN))
                //TODO: rename/add new - Action 13 is always used by Avatars and Wyverns when performing an ability
                ActionType = ACTION_RAISE_MENU_SELECTION;
		}
			break;
		case ACTION_ITEM_START:
		{
			WBUFB(data,(0x0A)) = 0xE4;
			WBUFB(data,(0x0B)) = 0x58;
			WBUFB(data,(0x0C)) = 0x58;
			WBUFB(data,(0x0D)) = 0x1A;
			WBUFB(data,(0x0E)) = 0x1D;
		}
			break;
		case ACTION_ITEM_INTERRUPT:
		{
			WBUFB(data,(0x0A)) = 0xE4;
			WBUFB(data,(0x0B)) = 0x1C;
			WBUFB(data,(0x0C)) = 0x5C;
			WBUFB(data,(0x0D)) = 0x1A;
			WBUFB(data,(0x0E)) = 0x1D;

			ActionType = ACTION_ITEM_START;
		}
			break;
		case ACTION_RANGED_START:
		{
			WBUFB(data,(0x0A)) = 0xF0;
			WBUFB(data,(0x0B)) = 0x58;
			WBUFB(data,(0x0C)) = 0x18;
			WBUFB(data,(0x0D)) = 0xDB;
			WBUFB(data,(0x0E)) = 0x19;
		}
			break;
		case ACTION_RANGED_FINISH:
		{
			WBUFB(data,(0x0A)) = 0xC8;
			WBUFB(data,(0x0B)) = 0x1C;
			WBUFB(data,(0x0C)) = 0x1A;
			WBUFB(data,(0x0D)) = 0xDB;
			WBUFB(data,(0x0E)) = 0x19;
		}
			break;
		case ACTION_RANGED_INTERRUPT:
		{
			WBUFB(data,(0x0A)) = 0xF0;
			WBUFB(data,(0x0B)) = 0x1C;
			WBUFB(data,(0x0C)) = 0x1C;
			WBUFB(data,(0x0D)) = 0xDB;
			WBUFB(data,(0x0E)) = 0x19;

			ActionType = ACTION_RANGED_START;
		}
			break;
		case ACTION_RAISE_MENU_SELECTION:
		{
			WBUFB(data,(0x0A)) = 0x10;

			ActionType = ACTION_MAGIC_FINISH;
		}
			break;
		case ACTION_MAGIC_START:
		{
			WBUFB(data,(0x0A)) = 0xE0;
			WBUFB(data,(0x0B)) = 0x58;

			switch (PEntity->PBattleAI->GetCurrentSpell()->getSpellGroup())
			{
				case SPELLGROUP_WHITE:
				{
					WBUFB(data,(0x0C)) = 0xD8;
					WBUFB(data,(0x0D)) = 0x1D;
					WBUFB(data,(0x0E)) = 0x1A;
				}
					break;
				case SPELLGROUP_BLACK:
				{
					WBUFB(data,(0x0C)) = 0x98;
					WBUFB(data,(0x0D)) = 0xD8;
					WBUFB(data,(0x0E)) = 0x1A;
				}
					break;
				case SPELLGROUP_BLUE:
				{
					WBUFB(data,(0x0C)) = 0x98;
					WBUFB(data,(0x0D)) = 0x18;
					WBUFB(data,(0x0E)) = 0x1B;
				}
					break;
				case SPELLGROUP_SONG:
				{
					WBUFB(data,(0x0C)) = 0xD8;
					WBUFB(data,(0x0D)) = 0xDC;
					WBUFB(data,(0x0E)) = 0x1B;
				}
					break;
				case SPELLGROUP_NINJUTSU:
				{
					WBUFB(data,(0x0C)) = 0x98;
					WBUFB(data,(0x0D)) = 0x9B;
					WBUFB(data,(0x0E)) = 0x1A;
				}
					break;
				case SPELLGROUP_SUMMONING:
				{
					WBUFB(data,(0x0C)) = 0xD8;
					WBUFB(data,(0x0D)) = 0x5C;
					WBUFB(data,(0x0E)) = 0x1B;
				}
				break;
			}
		}
			break;
		case ACTION_MAGIC_FINISH:
		{
			packBitsBE(data, PEntity->PBattleAI->GetCurrentSpell()->getID(), 86, 10);
			//either this way or enumerate all recast timers and compare the spell id.
			packBitsBE(data, PEntity->PBattleAI->GetCurrentSpell()->getModifiedRecast(), 118, 10);
		}
			break;
		case ACTION_MAGIC_INTERRUPT:
		{
			WBUFB(data,(0x0A)) = 0xE0;
			WBUFB(data,(0x0B)) = 0x1C;

			switch (PEntity->PBattleAI->GetCurrentSpell()->getSpellGroup())
			{
				case SPELLGROUP_WHITE:
				{
					WBUFB(data,(0x0C)) = 0xDC;
					WBUFB(data,(0x0D)) = 0x1D;
					WBUFB(data,(0x0E)) = 0x1A;
				}
					break;
				case SPELLGROUP_BLACK:
				{
					WBUFB(data,(0x0C)) = 0x9C;
					WBUFB(data,(0x0D)) = 0xD8;
					WBUFB(data,(0x0E)) = 0x1A;
				}
					break;
				case SPELLGROUP_BLUE:
				{
					WBUFB(data,(0x0C)) = 0x9C;
					WBUFB(data,(0x0D)) = 0x18;
					WBUFB(data,(0x0E)) = 0x1B;
				}
					break;
				case SPELLGROUP_SONG:
				{
					WBUFB(data,(0x0C)) = 0xDC;
					WBUFB(data,(0x0D)) = 0xDC;
					WBUFB(data,(0x0E)) = 0x1B;
				}
					break;
				case SPELLGROUP_NINJUTSU:
				{
					WBUFB(data,(0x0C)) = 0x9C;
					WBUFB(data,(0x0D)) = 0x9B;
					WBUFB(data,(0x0E)) = 0x1A;
				}
					break;
				case SPELLGROUP_SUMMONING:
				{
					WBUFB(data,(0x0C)) = 0xDC;
					WBUFB(data,(0x0D)) = 0x5C;
					WBUFB(data,(0x0E)) = 0x1B;
				}
				break;
			}
			ActionType = ACTION_MAGIC_START;
		}
		break;
	}

	uint32 TargetNum = 0;
	uint32 ActionNum = 0;
	uint32 bitOffset = 82;
	uint32 animOffset = 0;

	uint8 ActionTypeNumber = ActionType;


	//will probably move this to database, new column, animationtype?

	//override ability animations,
	if (ActionType == ACTION_JOBABILITY_FINISH)
	{
		switch (PEntity->PBattleAI->GetCurrentJobAbility()->getID())
		{
			//WS animations
			case 10:    // Eagle Eye Shot
			case 41:    // Shadowbind
				if( PEntity->m_Weapons[SLOT_RANGED]->getSkillType() == SKILL_MRK)
				{
					animOffset++;
				}
				ActionTypeNumber -= 3;
				break;
			case 25:	// Steal
			case 29:	// Mug
			case 30:	// Shield Bash
			case 50:	// Jump
			case 51:	// High Jump
			case 52:	// Super Jump
			case 61:	// Weapon Bash
			case 134:	// Tomahawk
			case 152:	// Blade Bash
			case 154:	// Angon
				ActionTypeNumber -= 3;
				break;

			//Dance animations
			case 174:	// waltz 1
			case 175:	// waltz 2
			case 176:	// waltz 3
			case 177:	// waltz 4
			case 168:	// drain samba 1
			case 169:	// drain samba 2
			case 170:	// drain samba 3
			case 171:	// aspir samba
			case 172:	// aspir samba 2
			case 173:	// haste samba
			case 178:	// healing waltz
			case 179:	// divine waltz
			case 180:	// spectral jig
			case 181:	// chocobo jig
            case 185:   // quickstep
            case 186:   // box step
            case 187:   // stutter step
            case 189:   // desperate flourish
            case 191:   // violent flourish
            case 193:   // wild flourish
            case 304:   // konzen-ittai

				ActionTypeNumber += 8;
				break;

			default:
				ActionTypeNumber = ActionType;
				break;
		}
	}
	else if (ActionType == ACTION_MOBABILITY_FINISH)
	{
		if (PEntity->PBattleAI->GetCurrentMobSkill()->getFlag() & SKILLFLAG_WS)
		{
                    ActionTypeNumber -= 8;
		}
	}


	bitOffset = packBitsBE(data, ActionTypeNumber, bitOffset, 4);
	bitOffset += 64;

	for (uint32 i = 0; i < PEntity->m_ActionList.size(); ++i)
	{
		apAction_t Action = PEntity->m_ActionList.at(i);

		if (Action.ActionTarget != nullptr)
		{
			TargetNum++;

			bitOffset = packBitsBE(data, Action.ActionTarget->id, bitOffset, 32);	// тип совершаемого действия
			bitOffset = packBitsBE(data, 1, bitOffset, 4);							// количество действий над целью, в данном случае одно

			ActionNum = 0;
		}

		bitOffset = packBitsBE(data, Action.reaction,   bitOffset,  5);				// физическая реакция на урон
		bitOffset = packBitsBE(data, Action.animation+animOffset,  bitOffset, 12);	// анимация специальных эффектов (monster TP animations are 1800+)
		bitOffset = packBitsBE(data, Action.speceffect, bitOffset, 7);				// specialEffect
        bitOffset = packBitsBE(data, Action.knockback, bitOffset, 3);               // knockback amount (mobskill only)
		bitOffset = packBitsBE(data, Action.param, bitOffset, 17);					// параметр сообщения (урон)
		bitOffset = packBitsBE(data, Action.messageID,  bitOffset, 10);				// сообщение
		bitOffset += 31;


        if (Action.additionalEffect != SUBEFFECT_NONE)
        {
            bitOffset = packBitsBE(data, 1, bitOffset, 1);
            bitOffset = packBitsBE(data, Action.additionalEffect, bitOffset, 10);
            bitOffset = packBitsBE(data, Action.addEffectParam, bitOffset, 17);
            bitOffset = packBitsBE(data, Action.addEffectMessage, bitOffset, 10);
        }
        else
        {
            bitOffset += 1;
        }
        if (Action.spikesEffect != SUBEFFECT_NONE)
        {
            bitOffset = packBitsBE(data, 1, bitOffset, 1);
            bitOffset = packBitsBE(data, Action.spikesEffect, bitOffset, 10);
            bitOffset = packBitsBE(data, Action.spikesParam, bitOffset, 14);
            bitOffset = packBitsBE(data, Action.spikesMessage, bitOffset, 10);
            battleutils::HandleSpikesStatusEffect(PEntity, &Action);
        }
        else
        {
            bitOffset += 1;
        }
		ActionNum++;
        if (TargetNum >= 15)
            break;
	}
    packBitsBE(data, ActionNum, 182, 4);

	uint8 WorkSize = ((bitOffset >> 3) + (bitOffset%8 != 0));

	this->size = ((((WorkSize + 7) >> 1) + 1) & -2);

	WBUFB(data,(0x04)) = WorkSize; 												// Workload Size - 0x23 с дополнительным эффектом - 0x29 два удара монаха
	WBUFB(data,(0x09)) = TargetNum;												// количество атакуемых целей
    
    PEntity->m_ActionList.clear();
}

CActionPacket::CActionPacket(uint32 id, uint32 targetid, uint8 ActionType, 
                             uint16 param, uint8 reaction, uint16 animation, uint8 speceffect, 
                             uint8 knockback, uint32 messageparam, uint16 messageID)
{
    this->type = 0x28;
    this->size = 0x12;

    WBUFL(data, (0x05) ) = id;

    switch (ActionType)
    {
    case ACTION_WEAPONSKILL_START:
    {
        packBitsBE(data, param, 86, 10);
    }
        break;
    case ACTION_WEAPONSKILL_FINISH:
    {
        packBitsBE(data, param, 86, 10);
    }
        break;

    case ACTION_JOBABILITY_FINISH:
    {
        packBitsBE(data, param + 16, 86, 10);
        packBitsBE(data, 0, 118, 10);
    }
        break;

    case ACTION_MOBABILITY_FINISH:
    case ACTION_RAISE_MENU_SELECTION:
    {
        packBitsBE(data, param, 86, 12);
    }
        break;
    case ACTION_MAGIC_FINISH:
    {
        packBitsBE(data, param, 86, 10);
        packBitsBE(data, 0, 118, 10);
    }
        break;
    }

    uint32 bitOffset = 82;

    bitOffset = packBitsBE(data, ActionType, bitOffset, 4);
    bitOffset += 64;

    bitOffset = packBitsBE(data, targetid, bitOffset, 32);
    bitOffset = packBitsBE(data, 1, bitOffset, 4);


    bitOffset = packBitsBE(data, reaction, bitOffset, 5);
    bitOffset = packBitsBE(data, animation, bitOffset, 12);
    bitOffset = packBitsBE(data, speceffect, bitOffset, 7);
    bitOffset = packBitsBE(data, knockback, bitOffset, 3);
    bitOffset = packBitsBE(data, messageparam, bitOffset, 17);
    bitOffset = packBitsBE(data, messageID, bitOffset, 10);
    bitOffset += 33;

    packBitsBE(data, 1, 182, 4);

    uint8 WorkSize = ((bitOffset >> 3) + (bitOffset % 8 != 0));

    this->size = ((((WorkSize + 7) >> 1) + 1) & -2);

    WBUFB(data, (0x04) ) = WorkSize;
    WBUFB(data, (0x09) ) = 1;
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
