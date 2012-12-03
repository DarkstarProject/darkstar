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
#include "merit_list.h"
#include "charentity.h"

/************************************************************************
*                                                                       *
*                                                                       *
*                                                                       *
************************************************************************/

CMeritPoints::CMeritPoints(CCharEntity* PChar)
{
    memset(merits, 0, sizeof(merits));

    for (uint8 m = 0, i = 0; i < sizeof(Categories)/sizeof(Merit_t*); ++i)
    {
        Categories[i] = &merits[m];

        for (uint8 t = 0; t < count[i].MaxMerits; ++t)
        {
			merits[m].count = PChar->m_AppliedMerits[m];
			merits[m].next = upgrade[count[i].UpgradeID][merits[m].count];
            //merits[m].next = upgrade[count[i].UpgradeID][0];
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
	uint8 meritValue = dsp_min(GetMeritPointer(merit)->count, cap[lvl]);  

	MeritEntry* MeritEntry = meritEntries::GetMeritEntry(merit);

	meritValue *= MeritEntry->m_value;

	return meritValue;

	/* коэффициент */; // TODO: умножаем текущее количество усилений на коэффициент
}