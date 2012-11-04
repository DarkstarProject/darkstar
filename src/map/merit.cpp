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

#include <string.h>

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

CMeritPoints::CMeritPoints()
{
    memset(merits, 0, sizeof(merits));

    for (uint8 m = 0, i = 0; i < sizeof(Categories)/sizeof(Merit_t*); ++i)
    {
        Categories[i] = &merits[m];

        for (uint8 t = 0; t < count[i].MaxMerits; ++t)
        {
            merits[m].next = upgrade[count[i].UpgradeID][0];
            merits[m++].id = ((i + 1) << 6) + (t << 1);
		}
    }
    m_LimitPoints = 0;
    m_MeritPoints = 0;
}

/************************************************************************
*                                                                       *
*  Получаем текущие limit points                                        *
*                                                                       *
************************************************************************/

uint16 CMeritPoints::GetLimitPoints()
{
    return m_LimitPoints;
}

/************************************************************************
*                                                                       *
*  Получаем текущие merit points                                        *
*                                                                       *
************************************************************************/

uint8 CMeritPoints::GetMeritPoints()
{
    return m_MeritPoints;
}

/************************************************************************
*                                                                       *
*  Добавляем персонажу limit points                                     *
*                                                                       *
************************************************************************/

// true - если merit был добавлен

bool CMeritPoints::AddLimitPoints(uint16 points)
{
    m_LimitPoints += points;

    if (m_LimitPoints >= MAX_LIMIT_POINTS)
    {
        uint8 MeritPoints = dsp_min(m_MeritPoints + m_LimitPoints / MAX_LIMIT_POINTS, MAX_MERIT_POINTS);

        m_LimitPoints = m_LimitPoints % MAX_LIMIT_POINTS;

        if (m_MeritPoints != MeritPoints)
        {
            m_MeritPoints = MeritPoints;
            return true;
        }
    }
    return false;
}

/************************************************************************
*                                                                       *
*  set limit points				                                        *
*                                                                       *
************************************************************************/

void CMeritPoints::SetLimitPoints(uint16 points)
{
    m_LimitPoints = dsp_min(points, MAX_LIMIT_POINTS - 1);
}

/************************************************************************
*                                                                       *
*  set merit points				                                        *
*                                                                       *
************************************************************************/

void CMeritPoints::SetMeritPoints(uint16 points)
{
    m_MeritPoints = dsp_min(points, MAX_MERIT_POINTS);
}

/************************************************************************
*                                                                       *
*  Проверяем наличие merit. Необходимо использовать лишь в случае       *
*  получения meritid от персонажа                                       *
*                                                                       *
************************************************************************/

bool CMeritPoints::IsMeritExist(MERIT_TYPE merit)
{
    if (merit <  MCATEGORY_START) return false;
    if (merit >= MCATEGORY_COUNT) return false;

    if ((GetMeritID(merit)) >= count[GetMeritCategory(merit)].MaxMerits) return false;

    return true;
}

/************************************************************************
*                                                                       *
*  Получаем указатель на искомый const merit                            *
*                                                                       *
************************************************************************/

const Merit_t* CMeritPoints::GetMerit(MERIT_TYPE merit)
{
    return GetMeritPointer(merit);
}

/************************************************************************
*                                                                       *
*  Получаем указатель на искомый merit                                  *
*                                                                       *
************************************************************************/

Merit_t* CMeritPoints::GetMeritPointer(MERIT_TYPE merit)
{
    DSP_DEBUG_BREAK_IF(!IsMeritExist(merit));

    return &Categories[GetMeritCategory(merit)][GetMeritID(merit)];
}

/************************************************************************
*                                                                       *
*  Получаем указател на массив merits                                   *
*                                                                       *
************************************************************************/

const Merit_t* CMeritPoints::GetMerits()
{
    return merits;
}

/************************************************************************
*                                                                       *
*  Add upgrade, also removes merit point                                *
*                                                                       *
************************************************************************/

void CMeritPoints::RaiseMerit(MERIT_TYPE merit)
{
    Merit_t* PMerit = GetMeritPointer(merit);

    if (m_MeritPoints >= PMerit->next)
    {
        m_MeritPoints -= PMerit->next;

        PMerit->next = upgrade[count[GetMeritCategory(merit)].UpgradeID][++PMerit->count];
    }
}

/************************************************************************
*                                                                       *
*  Remove upgrade                                                       *
*                                                                       *
************************************************************************/

void CMeritPoints::LowerMerit(MERIT_TYPE merit)
{
    Merit_t* PMerit = GetMeritPointer(merit);

    if (PMerit->count > 0)
    {
        PMerit->next = upgrade[count[GetMeritCategory(merit)].UpgradeID][--PMerit->count];
    }
}

/************************************************************************
*                                                                       *
*  get next merit upgrade					                            *
*                                                                       *
************************************************************************/

//uint16 CMeritPoints::GetNextMeritUpgrade(uint16 catId, uint16 MeritCount)
//{
//	return upgrade[count[catId].UpgradeID][MeritCount];
//}

/************************************************************************
*                                                                       *
*  Получаем текущее значение указанного merit                           *
*                                                                       *
************************************************************************/

int32 CMeritPoints::GetMeritValue(MERIT_TYPE merit, uint8 lvl)
{
    return dsp_min(GetMerit(merit)->count, cap[lvl]) /* коэффициент */; // TODO: умножаем текущее количество усилений на коэффициент
}