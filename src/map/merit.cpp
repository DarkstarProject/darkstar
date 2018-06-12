﻿/*
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

#include <string.h>

#include "map.h"
#include "merit.h"
#include "entities/charentity.h"
#include "utils/charutils.h"
#include "packets/char_spells.h"

/************************************************************************
*                                                                       *
*  Две версии значений - до abyssea и после                             *
*                                                                       *
************************************************************************/

// массив больше на одно значение, заполняемое нулем

static uint8 upgrade[10][16] =
{
    {1,2,3,4,5,5,5,5,5,7,7,7,9,9,9},             // HP-MP
    {3,6,9,9,9,12,12,12,12,15,15,15,15,19,18},   // Attributes
    {1,2,3,3,3,3,3,3},                           // Combat Skills
    {1,2,3,3,3,3,3,3},                           // Defensive Skills
    {1,2,3,3,3,3,3,3},                           // Magic Skills
    {1,2,3,4,5},                                 // Others
    {1,2,3,4,5},                                 // Job Group 1
    {3,4,5,5,5},                                 // Job Group 2
    {20,22,24,27,30},                            // Weapon Skills
    {1,3,5,7,9,12,15,18,21,24,27,30,33,36,39}    // Max merits
};
#define MAX_LIMIT_POINTS  10000         // количество опыта для получения одного merit

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
    9,9,9,9,9,              // 70-74 9
    10,10,10,10,10,         // 75-79 10
    15,15,15,15,15,15,15,15,15,15,    // 80-89 15
    15,15,15,15,15,15,15,15,15,15,    // 90-99 15
};

/************************************************************************
*                                                                       *
*  Количество элементов в каждой из категорий                           *
*                                                                       *
************************************************************************/

struct MeritCategoryInfo_t
{
    int8 MeritsInCat;  // количество элементов в группе
    uint8 MaxPoints;    // максимальное количество points, которые можно вложить в группу
    uint8 UpgradeID;    // индекс группы в массиве upgrade
};

static const MeritCategoryInfo_t meritCatInfo[] =
{
    {3,45,0},  //MCATEGORY_HP_MP
    {7,60,1},  //MCATEGORY_ATTRIBUTES
    {19,112,2}, //MCATEGORY_COMBAT
    {14,80,4}, //MCATEGORY_MAGIC
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

	{0,0,8},   //MCATEGORY_UNK_0	26
    {0,0,8},   //MCATEGORY_UNK_1
    {0,0,8},   //MCATEGORY_UNK_2
    {0,0,8},   //MCATEGORY_UNK_3
    {0,0,8},   //MCATEGORY_UNK_4	30

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

CMeritPoints::CMeritPoints(CCharEntity* PChar)
{
	/*
	DSP_DEBUG_BREAK_IF(sizeof(merits) != sizeof(merits::GMeritsTemplate));

    memcpy(merits, merits::GMeritsTemplate, sizeof(merits));

    for (uint8 m = 0, i = 0; i < sizeof(Categories)/sizeof(Merit_t*); ++i)
    {
        Categories[i] = &merits[m];

        for (uint8 t = 0; t < count[i].MaxMerits; ++t)
        {
            merits[m].next = upgrade[count[i].UpgradeID][0];
            merits[m++].id = ((i + 1) << 6) + (t << 1);
		}
    }
	*/

	DSP_DEBUG_BREAK_IF(sizeof(merits) != sizeof(meritNameSpace::GMeritsTemplate));

    memcpy(merits, meritNameSpace::GMeritsTemplate, sizeof(merits));


    m_PChar = PChar;
	LoadMeritPoints(PChar->id);

    m_LimitPoints = 0;
    m_MeritPoints = 0;
}

/************************************************************************
*                                                                       *
*  Load character merits                                                *
*                                                                       *
************************************************************************/

void CMeritPoints::LoadMeritPoints(uint32 charid)
{
    uint8 catNumber = 0;

    for (uint16 i = 0; i < MERITS_COUNT; ++i)
    {
        if ((catNumber < 51 && i == meritNameSpace::groupOffset[catNumber]) || (catNumber > 25 && catNumber < 31))
        {

            if (catNumber > 25 && catNumber < 31) // point these to valid merits to prevent crash
                Categories[catNumber] = &merits[163];
            else
                Categories[catNumber] = &merits[i];

            catNumber++;
        }

        merits[i].count = 0;
        merits[i].next = upgrade[merits[i].upgradeid][merits[i].count];
    }

    if (Sql_Query(SqlHandle, "SELECT meritid, upgrades FROM char_merit WHERE charid = %u", charid) != SQL_ERROR)
    {
        for (uint16 j = 0; j < Sql_NumRows(SqlHandle); j++)
        {
            if (Sql_NextRow(SqlHandle) == SQL_SUCCESS)
            {
                uint32 meritID = Sql_GetUIntData(SqlHandle, 0);
                uint32 upgrades = Sql_GetUIntData(SqlHandle, 1);
                for (uint16 i = 0; i < MERITS_COUNT; i++)
                {
                    if (merits[i].id == meritID)
                    {
                        merits[i].count = upgrades;
                        merits[i].next = upgrade[merits[i].upgradeid][merits[i].count];
                    }
                }
            }
        }
    }
}

/************************************************************************
*                                                                       *
*  Save character merits                                                *
*                                                                       *
************************************************************************/

void CMeritPoints::SaveMeritPoints(uint32 charid)
{
    for (uint16 i = 0; i < MERITS_COUNT; ++i)
        if (merits[i].count > 0)
            Sql_Query(SqlHandle, "INSERT INTO char_merit (charid, meritid, upgrades) VALUES(%u, %u, %u) ON DUPLICATE KEY UPDATE upgrades = %u", charid, merits[i].id, merits[i].count, merits[i].count);
        else
            Sql_Query(SqlHandle, "DELETE FROM char_merit WHERE charid = %u AND meritid = %u", charid, merits[i].id);
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
		//check if player has reached cap
		if (m_MeritPoints == map_config.max_merit_points + GetMeritValue(MERIT_MAX_MERIT, m_PChar))
		{
			m_LimitPoints = MAX_LIMIT_POINTS -1;
			return false;
		}

        uint8 MeritPoints = std::min(m_MeritPoints + m_LimitPoints / MAX_LIMIT_POINTS, map_config.max_merit_points + GetMeritValue(MERIT_MAX_MERIT, m_PChar));

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
    m_LimitPoints = std::min<uint16>(points, MAX_LIMIT_POINTS - 1);
}

/************************************************************************
*                                                                       *
*  set merit points				                                        *
*                                                                       *
************************************************************************/

void CMeritPoints::SetMeritPoints(uint16 points)
{
    m_MeritPoints = std::min<uint8>((uint8)points, map_config.max_merit_points + GetMeritValue(MERIT_MAX_MERIT, m_PChar));
}

/************************************************************************
*                                                                       *
*  Проверяем наличие merit. Необходимо использовать лишь в случае       *
*  получения meritid от персонажа                                       *
*                                                                       *
************************************************************************/

bool CMeritPoints::IsMeritExist(MERIT_TYPE merit)
{
    if ((int16)merit <  MCATEGORY_START) return false;
    if ((int16)merit >= MCATEGORY_COUNT) return false;

    if ((GetMeritID(merit)) >= meritCatInfo[GetMeritCategory(merit)].MeritsInCat) return false;

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
*  Получаем указатель на искомый const merit по индексу                 *
*                                                                       *
************************************************************************/

const Merit_t* CMeritPoints::GetMeritByIndex(uint16 index)
{
    DSP_DEBUG_BREAK_IF(index >= MERITS_COUNT);

	return  &merits[index];
}

/************************************************************************
*                                                                       *
*  Получаем указатель на искомый merit                                  *
*                                                                       *
************************************************************************/

Merit_t* CMeritPoints::GetMeritPointer(MERIT_TYPE merit)
{
    if (IsMeritExist(merit))
    {
        return &Categories[GetMeritCategory(merit)][GetMeritID(merit)];
    }
    return nullptr;
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

		PMerit->next = upgrade[PMerit->upgradeid][PMerit->count+1];
        if (PMerit->spellid != 0)
        {
            if (charutils::addSpell(m_PChar, PMerit->spellid))
            {
                charutils::SaveSpell(m_PChar, PMerit->spellid);
                m_PChar->pushPacket(new CCharSpellsPacket(m_PChar));
            }
        }
		PMerit->count++;

        // Reset traits
        charutils::BuildingCharTraitsTable(m_PChar);
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
        PMerit->next = upgrade[meritCatInfo[GetMeritCategory(merit)].UpgradeID][--PMerit->count];
    }
    if (PMerit->spellid != 0 && PMerit->count == 0)
    {
        if (charutils::delSpell(m_PChar, PMerit->spellid))
        {
            charutils::DeleteSpell(m_PChar, PMerit->spellid);
            m_PChar->pushPacket(new CCharSpellsPacket(m_PChar));

            // Reset traits
            charutils::BuildingCharTraitsTable(m_PChar);
        }
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

int32 CMeritPoints::GetMeritValue(MERIT_TYPE merit, CCharEntity* PChar)
{
    Merit_t* PMerit = GetMeritPointer(merit);
	uint8 meritValue = 0;

    if (PMerit)
    {
        if (PMerit->catid < 5 || (PMerit->jobs & (1 << (PChar->GetMJob() - 1)) && PChar->GetMLevel() >= 75))
            meritValue = std::min(PMerit->count, cap[PChar->GetMLevel()]);

        if (PMerit->catid == 25 && PChar->GetMLevel() < 96) // categoryID 25 is for merit weaponskills, which only apply if the player is lv 96+
            meritValue = 0;

        meritValue *= PMerit->value;
    }

	return meritValue;
}


/************************************************************************
*                                                                       *
*  Реализация namespase для работы с Linkshells                         *
*                                                                       *
************************************************************************/


namespace meritNameSpace
{
	Merit_t GMeritsTemplate[MERITS_COUNT] = {0};		// global list of merits and their properties
	int16 groupOffset[MCATEGORY_COUNT/64-1] = {0};		// the first merit offset of each catagory

    /************************************************************************
    *                                                                       *
    *  Загружаем шаблон массива merits  /   Load pattern array merits       *
    *                                                                       *
    ************************************************************************/

    void LoadMeritsList()
    {

        int32 ret = Sql_Query(SqlHandle, "SELECT m.meritid, m.value, m.jobs, m.upgrade, m.upgradeid, m.catagoryid, sl.spellid FROM merits m LEFT JOIN \
            spell_list sl ON m.name = sl.name ORDER BY m.meritid ASC LIMIT %u", MERITS_COUNT);

	    if( ret != SQL_ERROR && Sql_NumRows(SqlHandle) != MERITS_COUNT )
	    {

			// issue with unknown catagories causing massive confusion

            uint16 index = 0;			// global merit template count (to 255)
			uint8 catIndex = 0;			// global merit catagory count (to 51)
			int8 previousCatIndex = 0;  // will be set on every loop, used for detecting a catagory change
			int8 catMeritIndex = 0;		// counts number of merits in a catagory


		    while( Sql_NextRow(SqlHandle) == SQL_SUCCESS )
		    {
                Merit_t Merit = {0};								// creat a new merit template.

				Merit.id		= Sql_GetUIntData(SqlHandle,0);		// set data from db.
                Merit.value		= Sql_GetUIntData(SqlHandle,1);
                Merit.jobs		= Sql_GetUIntData(SqlHandle,2);
                Merit.upgrade	= Sql_GetUIntData(SqlHandle,3);
				Merit.upgradeid = Sql_GetUIntData(SqlHandle,4);
				Merit.catid		= Sql_GetUIntData(SqlHandle,5);
				Merit.next      = upgrade[Merit.upgradeid][0];
                Merit.spellid   = Sql_GetUIntData(SqlHandle, 6);

				GMeritsTemplate[index] = Merit;						// add the merit to the array


				previousCatIndex = Merit.catid;						// previousCatIndex is set on everyloop to detect a catogory change.

				if (previousCatIndex != catIndex)					// check for catagory change.
				{
					groupOffset[catIndex] = index - catMeritIndex;	// set index offset, first merit of each group.
					catIndex++;										// now on next catagory.
					catMeritIndex = 0;								// reset the merit catagory count to 0.

					if (previousCatIndex != catIndex)				// this deals with the problem with unknown catagories.
						catIndex = previousCatIndex;
				}

				catMeritIndex++;									// next index within catagory.
				index++;											// next global template index.
		    }

			groupOffset[catIndex] = index - catMeritIndex;			// add the last offset manually since loop finishes before hand.

           /* ret = Sql_Query(SqlHandle, "SELECT meritid, spellid FROM merits INNER JOIN spell_list ON merits.name = spell_list.name");

            if (ret != SQL_ERROR)
            {
		        while( Sql_NextRow(SqlHandle) == SQL_SUCCESS )
		        {
                    GMeritsTemplate
		        }
            }*/

	    }
        else
        {
            ShowError(CL_RED"The merits table is damaged\n" CL_RESET);
        }
    }

};
