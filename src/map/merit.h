/*
===========================================================================

  Copyright //(c) 2010-2012 Darkstar Dev Teams

  This program is free software: you can redistribute it and/or modify
  it under the terms of the GNU General Public License as published by
  the Free Software Foundation, either version 3 of the License, or
  //(at your option) any later version.

  This program is distributed in the hope that it will be useful,
  but WITHOUT ANY WARRANTY; without even the implied warranty of
  MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
  GNU General Public License for more details.

  You should have received a copy of the GNU General Public License
  along with this program.  If not, see http://www.gnu.org/licenses/

  This file is part of DarkStar-server source code.

===========================================================================
*/

#ifndef _CMERIT_H
#define _CMERIT_H

#include "../common/cbasetypes.h"

/************************************************************************
*                                                                       *
*                                                                       *
*                                                                       *
************************************************************************/

enum MERIT_CATEGORY
{
    MCATEGORY_HP_MP			=	0x0040,
	MCATEGORY_ATTRIBUTES	=	0x0080,
	MCATEGORY_COMBAT_SKILLS	=	0x00C0,
	MCATEGORY_MAGIC_SKILLS	=	0x0100,
	MCATEGORY_OTHERS		=	0x0140,
	MCATEGORY_WAR_1			=	0x0180,
	MCATEGORY_MNK_1			=	0x01C0,
	MCATEGORY_WHM_1			=	0x0200,
	MCATEGORY_BLM_1			=	0x0240,
	MCATEGORY_RDM_1			=	0x0280,
	MCATEGORY_THF_1			=	0x02C0,
	MCATEGORY_PLD_1			=	0x0300,
	MCATEGORY_DRK_1			=	0x0340,
	MCATEGORY_BST_1			=	0x0380,
	MCATEGORY_BRD_1			=	0x03C0,
	MCATEGORY_RNG_1			=	0x0400,
	MCATEGORY_SAM_1			=	0x0440,
	MCATEGORY_NIN_1			=	0x0480,
	MCATEGORY_DRG_1			=	0x04C0,
	MCATEGORY_SMN_1			=	0x0500,
	MCATEGORY_BLU_1			=	0x0540,
	MCATEGORY_COR_1			=	0x0580,
	MCATEGORY_PUP_1			=	0x05C0,
	MCATEGORY_DNC_1			=	0x0600,
	MCATEGORY_SCH_1			=	0x0640,
	//???					=	0x0680,
	//???					=	0x06C0,

	MCATEGORY_WAR_2			=	0x0800,
	MCATEGORY_MNK_2			=	0x0840,
	MCATEGORY_WHM_2			=	0x0880,
	MCATEGORY_BLM_2			=	0x08C0,
	MCATEGORY_RDM_2			=	0x0900,
	MCATEGORY_THF_2			=	0x0940,
	MCATEGORY_PLD_2			=	0x0980,
	MCATEGORY_DRK_2			=	0x09C0,
	MCATEGORY_BST_2			=	0x0A00,
	MCATEGORY_BRD_2			=	0x0A40,
	MCATEGORY_RNG_2			=	0x0A80,
	MCATEGORY_SAM_2			=	0x0AC0,
	MCATEGORY_NIN_2			=	0x0B00,
	MCATEGORY_DRG_2			=	0x0B40,
	MCATEGORY_SMN_2			=	0x0B80,
	MCATEGORY_BLU_2			=	0x0BC0,
	MCATEGORY_COR_2			=	0x0C00,
	MCATEGORY_PUP_2			=	0x0C40,
	MCATEGORY_DNC_2			=	0x0C80,
	MCATEGORY_PUP_2			=	0x0CC0,
};

/************************************************************************
*                                                                       *
*                                                                       *
*                                                                       *
************************************************************************/

enum MERIT_TYPE
{
    MERIT_MAX_HP = MCATEGORY_HP_MP + 0x00,
	MERIT_MAX_MP = MCATEGORY_HP_MP + 0x02,
};

/************************************************************************
*                                                                       *
*                                                                       *
*                                                                       *
************************************************************************/

struct Merit_t
{
    uint16 id;      // id мерита
    uint8  next;    // необходимое количество меритов для следующего усиления
    uint8  count;   // текущее количество усилений
};

#endif