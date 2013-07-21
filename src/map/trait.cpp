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

#include "entities/battleentity.h"
#include "map.h"
#include "trait.h"

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
    m_mod    = 0;
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

uint16 CTrait::getMod()
{
    return m_mod;
}

void CTrait::setMod(uint16 mod)
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
	    const int8* Query = "SELECT traitid, job, level, modifier, value \
							 FROM traits \
                             WHERE traitid < %u \
							 ORDER BY job, traitid, level ASC";

	    int32 ret = Sql_Query(SqlHandle, Query, MAX_TRAIT_ID);

	    if (ret != SQL_ERROR && Sql_NumRows(SqlHandle) != 0)
	    {
		    while (Sql_NextRow(SqlHandle) == SQL_SUCCESS) 
		    {
			    CTrait* PTrait = new CTrait(Sql_GetIntData(SqlHandle,0));

			    PTrait->setJob(Sql_GetIntData(SqlHandle,1));
			    PTrait->setLevel(Sql_GetIntData(SqlHandle,2));
                PTrait->setMod(Sql_GetIntData(SqlHandle,3));
                PTrait->setValue(Sql_GetIntData(SqlHandle,4));

			    PTraitsList[PTrait->getJob()].push_back(PTrait);
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