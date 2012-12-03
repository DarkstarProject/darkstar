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

#ifndef _CMERIT_LIST_H
#define _CMERIT_LIST_H

#include "../common/cbasetypes.h"
#include <vector>
#include "merit.h"


/************************************************************************
*                                                                       *
*  Две версии значений - до abyssea и после                             *
*                                                                       *
************************************************************************/

// массив больше на одно значение, заполняемое нулем

#ifdef ABYSSEA_EXPANSION
static uint8 upgrade[9][16] =
{
    {1,2,3,4,5,5,5,5,5,7,7,7,9,9,9},    // HP-MP
    {3,6,9,9,9,12,12,12,12,15,15,15},   // Attributes
    {1,2,3,3,3,3,3,3},                  // Combat Skills
    {1,2,3,3},                          // Defensive Skills 
    {1,2,3,3,3,3,3,3},                  // Magic Skills
    {1,2,3,4,5},                        // Others
    {1,2,3,4,5},                        // Job Group 1
    {3,4,5,5,5},                        // Job Group 2
    {10,15,20,25,30},                   // Weapon Skills
};
#define MAX_LIMIT_POINTS  10000         // количество опыта для получения одного merit
#define MAX_MERIT_POINTS  30            // максимальное количество неиспользованных merit
#else
static uint8 upgrade[9][9] =
{
    {1,2,3,4,5,5,5,5},			        // HP-MP
    {3,6,9,9,9},				        // Attributes
    {1,2,3,3,3,3,3,3},			        // Combat Skills	
    {1,2,3,3},					        // Defensive Skills 
    {1,2,3,3,3,3,3,3},			        // Magic Skills	
    {1,2,3,4},					        // Others
    {1,2,3,4,5},				        // Job Group 1
    {3,4,5,5,5},				        // Job Group 2
    {0},                               // Weapon Skills
};
#define MAX_LIMIT_POINTS  10000         // количество опыта для получения одного merit
#define MAX_MERIT_POINTS  10            // максимальное количество неиспользованных merit
#endif 

// TODO: скорее всего придется все это перенести в базу

/************************************************************************
*                                                                       *
*  Ограничение количества усилений metir                                *
*                                                                       *
************************************************************************/

static uint8 cap[100] =
{   
    0,0,0,0,0,0,0,0,0,0,    // 0-9   0 
    1,1,1,1,1,1,1,1,1,1,    // 10-19 1 
    2,2,2,2,2,2,2,2,2,2,    // 20-29 2 
    3,3,3,3,3,3,3,3,3,3,    // 30-39 3 
    4,4,4,4,4,4,4,4,4,4,    // 40-49 4 
    5,5,5,5,5,              // 50-54 5 
    6,6,6,6,6,              // 55-59 6 
    7,7,7,7,7,              // 60-64 7 
    8,8,8,8,8,              // 65-69 8
    8,8,8,8,8,8,8,8,8,8,    // 70-79 8
    8,8,8,8,8,8,8,8,8,8,    // 80-89 8
    8,8,8,8,8,8,8,8,8,8,    // 90-99 8
};

/************************************************************************
*                                                                       *
*  Количество элементов в каждой из категорий                           *
*                                                                       *
************************************************************************/

struct MeritCategoryInfo_t
{
    uint8 MaxMerits;    // количество элементов в группе
    uint8 MaxPoints;    // максимальное количество points, которые можно вложить в группу
    uint8 UpgradeID;    // индекс группы в массиве upgrade
};

static const MeritCategoryInfo_t count[] =
{
    {2,15,0},  //MCATEGORY_HP_MP      
    {7,12,1},  //MCATEGORY_ATTRIBUTES 
    {19,32,2}, //MCATEGORY_COMBAT 
    {12,24,4}, //MCATEGORY_MAGIC 
    {5,10,5},  //MCATEGORY_OTHERS 

    {5,10,6},  //MCATEGORY_WAR_1 
    {5,10,6},  //MCATEGORY_MNK_1 
    {5,10,6},  //MCATEGORY_WHM_1 
    {7,10,6},  //MCATEGORY_BLM_1 
    {7,10,6},  //MCATEGORY_RDM_1 
    {5,10,6},  //MCATEGORY_THF_1 
    {5,10,6},  //MCATEGORY_PLD_1 
    {5,10,6},  //MCATEGORY_DRK_1 
    {5,10,6},  //MCATEGORY_BST_1 
    {5,10,6},  //MCATEGORY_BRD_1 
    {5,10,6},  //MCATEGORY_RNG_1 
    {5,10,6},  //MCATEGORY_SAM_1 
    {7,10,6},  //MCATEGORY_NIN_1 
    {5,10,6},  //MCATEGORY_DRG_1 
    {5,10,6},  //MCATEGORY_SMN_1 
    {5,10,6},  //MCATEGORY_BLU_1 
    {5,10,6},  //MCATEGORY_COR_1 
    {5,10,6},  //MCATEGORY_PUP_1 
    {4,10,6},  //MCATEGORY_DNC_1 
    {4,10,6},  //MCATEGORY_SCH_1 

    {14,15,8}, //MCATEGORY_WS

    {0,0,0},   //MCATEGORY_UNK_0
    {0,0,0},   //MCATEGORY_UNK_1 
    {0,0,0},   //MCATEGORY_UNK_2 
    {0,0,0},   //MCATEGORY_UNK_3 
    {0,0,0},   //MCATEGORY_UNK_4 

    {4,10,7},  //MCATEGORY_WAR_2 
    {4,10,7},  //MCATEGORY_MNK_2 
    {4,10,7},  //MCATEGORY_WHM_2 
    {6,10,7},  //MCATEGORY_BLM_2 
    {6,10,7},  //MCATEGORY_RDM_2 
    {4,10,7},  //MCATEGORY_THF_2 
    {4,10,7},  //MCATEGORY_PLD_2 
    {4,10,7},  //MCATEGORY_DRK_2 
    {4,10,7},  //MCATEGORY_BST_2 
    {4,10,7},  //MCATEGORY_BRD_2 
    {4,10,7},  //MCATEGORY_RNG_2 
    {4,10,7},  //MCATEGORY_SAM_2 
    {8,10,7},  //MCATEGORY_NIN_2 
    {4,10,7},  //MCATEGORY_DRG_2 
    {6,10,7},  //MCATEGORY_SMN_2 
    {4,10,7},  //MCATEGORY_BLU_2 
    {4,10,7},  //MCATEGORY_COR_2 
    {4,10,7},  //MCATEGORY_PUP_2 
    {4,10,7},  //MCATEGORY_DNC_2 
    {6,10,7},  //MCATEGORY_SHC_2 
};

#define GetMeritCategory(merit) ((merit >> 6) - 1)      // получаем категорию из merit
#define GetMeritID(merit)       ((merit & 0x3F) >> 1)   // получаем смещение в категории из merit


/************************************************************************
*                                                                       *
*                                                                       *
*                                                                       *
************************************************************************/

struct MeritEntry
{
	uint16	m_meritid;
	uint8	m_numberOfUpgrades;
	uint8	m_value;
	uint32	m_jobs;
};

/************************************************************************
*                                                                       *
*  namespace merits				                                        *
*                                                                       *
************************************************************************/

namespace meritEntries
{
    void			LoadMeritList();
	MeritEntry*		GetMeritEntry(uint16 id);
};


#endif