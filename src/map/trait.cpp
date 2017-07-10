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

#include <string.h>

#include "lua/luautils.h"

#include "entities/battleentity.h"
#include "map.h"
#include "trait.h"
#include "blue_trait.h"

/************************************************************************
*                                                                       *
*                                                                       *
*                                                                       *
************************************************************************/

CTrait::CTrait(uint8 id)
{
	m_id = id;

	m_level  = 0;
	m_job    = 0;
    m_mod    = Mod::NONE;
    m_value  = 0;
}

uint8 CTrait::getID()
{
	return m_id;
}

/************************************************************************
*                                                                       *
*                                                                       *
*                                                                       *
************************************************************************/

uint8 CTrait::getJob()
{
	return m_job;
}

void CTrait::setJob(int8 job)
{
    DSP_DEBUG_BREAK_IF(job > MAX_JOBTYPE);

	m_job = job;
}

/************************************************************************
*                                                                       *
*                                                                       *
*                                                                       *
************************************************************************/

uint8 CTrait::getLevel()
{
	return m_level;
}

void CTrait::setLevel(uint8 level)
{
	m_level = level;
}

/************************************************************************
*                                                                       *
*                                                                       *
*                                                                       *
************************************************************************/

Mod CTrait::getMod()
{
    return m_mod;
}

void CTrait::setMod(Mod mod)
{
    m_mod = mod;
}

/************************************************************************
*                                                                       *
*                                                                       *
*                                                                       *
************************************************************************/

int16 CTrait::getValue()
{
    return m_value;
}

void CTrait::setValue(int16 value)
{
    m_value = value;
}

/************************************************************************
*                                                                       *
*                                                                       *
*                                                                       *
************************************************************************/

uint8 CTrait::getRank()
{
    return m_rank;
}

void CTrait::setRank(uint8 rank)
{
    m_rank = rank;
}
/************************************************************************
*                                                                       *
*  Реализация namespase для работы с traits                             *
*                                                                       *
************************************************************************/

namespace traits
{
    TraitList_t PTraitsList[MAX_JOBTYPE]; // список traits, сгруппированный по профессиям

    /************************************************************************
    *                                                                       *
    *  Загружаем список traits                                              *
    *                                                                       *
    ************************************************************************/

    void LoadTraitsList()
    {
	    const int8* Query = "SELECT traitid, job, level, rank, modifier, value, content_tag \
							 FROM traits \
                             WHERE traitid < %u \
							 ORDER BY job, traitid ASC, rank DESC";

	    int32 ret = Sql_Query(SqlHandle, Query, MAX_TRAIT_ID);

	    if (ret != SQL_ERROR && Sql_NumRows(SqlHandle) != 0)
	    {
		    while (Sql_NextRow(SqlHandle) == SQL_SUCCESS)
		    {
				int8* contentTag;
				Sql_GetData(SqlHandle, 6, &contentTag, nullptr);

				if (luautils::IsContentEnabled(contentTag)==false){
					continue;
				}

			    CTrait* PTrait = new CTrait(Sql_GetIntData(SqlHandle,0));

			    PTrait->setJob(Sql_GetIntData(SqlHandle,1));
			    PTrait->setLevel(Sql_GetIntData(SqlHandle,2));
                PTrait->setRank(Sql_GetIntData(SqlHandle,3));
                PTrait->setMod(static_cast<Mod>(Sql_GetIntData(SqlHandle,4)));
                PTrait->setValue(Sql_GetIntData(SqlHandle,5));

			    PTraitsList[PTrait->getJob()].push_back(PTrait);
		    }
	    }

	    Query = "SELECT trait_category, trait_points_needed, traitid, modifier, value \
							 FROM blue_traits \
                             WHERE traitid < %u \
							 ORDER BY trait_category ASC, trait_points_needed DESC";

	    ret = Sql_Query(SqlHandle, Query, MAX_TRAIT_ID);

	    if (ret != SQL_ERROR && Sql_NumRows(SqlHandle) != 0)
	    {
		    while (Sql_NextRow(SqlHandle) == SQL_SUCCESS)
		    {
			    CBlueTrait* PTrait = new CBlueTrait(Sql_GetIntData(SqlHandle,0), Sql_GetIntData(SqlHandle,2));

			    PTrait->setJob(JOB_BLU);
                PTrait->setRank(1);
                PTrait->setPoints(Sql_GetIntData(SqlHandle,1));
                PTrait->setMod(static_cast<Mod>(Sql_GetIntData(SqlHandle,3)));
                PTrait->setValue(Sql_GetIntData(SqlHandle,4));

			    PTraitsList[JOB_BLU].push_back(PTrait);
		    }
	    }
    }

    /************************************************************************
    *                                                                       *
    *  Get List of Traits by Main Job or Sub Job                            *
    *                                                                       *
    ************************************************************************/

    TraitList_t* GetTraits(uint8 JobID)
    {
        DSP_DEBUG_BREAK_IF(JobID >= sizeof(PTraitsList));

	    return &PTraitsList[JobID];
    }

    /************************************************************************
    *                                                                       *
    *  Clear Traits List													*
    *                                                                       *
    ************************************************************************/

    void FreeTraitsList()
    {
	    // список освобождается операционной системой автоматически при завершении работы сервера
    }
};