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

#ifndef _CPETENTITY_H
#define _CPETENTITY_H

#include "battleentity.h"

enum PETTYPE
{
	PETTYPE_AVATAR            = 0,
	PETTYPE_WYVERN            = 1,
	PETTYPE_JUG_PET           = 2,
	PETTYPE_CHARMED_MOB       = 3,
	PETTYPE_AUTOMATON         = 4,
	PETTYPE_ADVENTURING_FELLOW= 5,
	PETTYPE_CHOCOBO           = 6
};

enum WYVERNTYPE
{
    WYVERNTYPE_NONE = 0,
    WYVERNTYPE_DEFENSIVE = 1,
    WYVERNTYPE_MULTIPURPOSE = 2,
    WYVERNTYPE_OFFENSIVE = 3
};

class CPetEntity : public CBattleEntity
{
public:
	 CPetEntity(PETTYPE petType);						// конструктор
	~CPetEntity();						// деструктор
	PETTYPE getPetType();
    bool isBstPet();
	uint16 m_Family;
	uint16 m_MobSkillList;
	uint8 m_Element;
	uint32 m_PetID;

    uint8 m_name_prefix;

    WYVERNTYPE getWyvernType();
    void UpdateEntity() override;

	std::vector<uint16> PetSkills;
private:
	PETTYPE m_PetType;					//the type of pet e.g. avatar/wyvern/jugpet etc
};

#endif
