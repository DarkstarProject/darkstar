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

#ifndef _CITEMFURNISHING_H
#define _CITEMFURNISHING_H

#include "../../common/cbasetypes.h"

#include "item.h"

// List of Moghancements
// Synthesis: Material Salvage 		

enum MOGHOUSE_AURA
{
	MOGHANCEMENT_FIRE 				= 658,		// Reduces the chances of losing materials when synthesis attempts utilizing a fire crystal have failed
	MOGHANCEMENT_ICE 				= 659,		// Reduces the chances of losing materials when synthesis attempts utilizing a ice crystal have failed 
	MOGHANCEMENT_WIND 				= 660,		// Reduces the chances of losing materials when synthesis attempts utilizing a wind crystal have failed 
	MOGHANCEMENT_EARTH 				= 661,		// Reduces the chances of losing materials when synthesis attempts utilizing an earth crystal have failed 
	MOGHANCEMENT_LIGHTNING 			= 662,		// Reduces the chances of losing materials when synthesis attempts utilizing a lightning crystal have failed 
	MOGHANCEMENT_WATER 				= 663,		// Reduces the chances of losing materials when synthesis attempts utilizing a water crystal have failed 
	MOGHANCEMENT_LIGHT 				= 664,		// Reduces the chances of losing materials when synthesis attempts utilizing a light crystal have failed
	MOGHANCEMENT_DARK 				= 665,		// Reduces the chances of losing materials when synthesis attempts utilizing a dark crystal have failed 
	
// Crafting Skills 	

	MOGHANCEMENT_FISHING_ITEM 		= 680,		// Increases the chances of finding items when fishing

	MOGHANCEMENT_FISHING  			= 669,		// Increases your fishing skill
	MOGHANCEMENT_WOODWORKING  		= 670,		// Increases your woodworking skill
	MOGHANCEMENT_SMITHING  			= 671,		// Increases your smithing skill 
	MOGHANCEMENT_GOLDSMITHING		= 672,		// Increases your goldsmithing skill
	MOGHANCEMENT_CLOTHCRAFT  		= 673,		// Increases your clothcraft skill
	MOGHANCEMENT_LEATHERCRAFT  		= 674,		// Increases your leathercraft skill
	MOGHANCEMENT_BONECRAFT  		= 675,		// Increases your bonecraft skill
	MOGHANCEMENT_ALCHEMY 	 		= 676,		// Increases your alchemy skill 
	MOGHANCEMENT_COOKING  			= 677,		// Increases your cooking skill

// Crafting Skills & Material Salvage

	MOGLIFICATION_FISHING			= 686,		// Increases your fishing skill, and makes it slightly easier to reel in your catch
	MOGLIFICATION_WOODWORKING		= 687,		// Increases your woodworking skill, and reduces the chances of losing materials when synthesis attempts have failed
	MOGLIFICATION_SMITHING			= 688,		// Increases your smithing skill, and reduces the chances of losing materials when synthesis attempts have failed
	MOGLIFICATION_GOLDSMITHING		= 689,		// Increases your goldsmithing skill, and reduces the chances of losing materials when synthesis attempts have failed
	MOGLIFICATION_CLOTHCRAFT		= 690,		// Increases your clothcraft skill, and reduces the chances of losing materials when synthesis attempts have failed
	MOGLIFICATION_LEATHERCRAFT		= 691,		// Increases your leathercraft skill, and reduces the chances of losing materials when synthesis attempts have failed
	MOGLIFICATION_BONECRAFT			= 692,		// Increases your bonecraft skill, and reduces the chances of losing materials when synthesis attempts have failed
	MOGLIFICATION_ALCHEMY			= 693,		// Increases your alchemy skill, and reduces the chances of losing materials when synthesis attempts have failed
	MOGLIFICATION_COOKING			= 694,		// Increases your cooking skill, and reduces the chances of losing materials when synthesis attempts have failed

	MEGA_MOGLIFICATION_FISHING		= 695,		// Increases your fishing skill, and allows you to more quickly discern when you have a bite.
	MEGA_MOGLIFICATION_WOODWORKING	= 696,		// Increases your woodworking skill immensely
	MEGA_MOGLIFICATION_SMITHING		= 697,		// Increases your smithing skill immensely
	MEGA_MOGLIFICATION_GOLDSMITHING	= 698,		// Increases your goldsmithing skill immensely
	MEGA_MOGLIFICATION_CLOTHCRAFT	= 699,		// Increases your clothcrafting skill immensely
	MEGA_MOGLIFICATION_LEATHERCRAFT	= 700,		// Increases your leathercrafting skill immensely.
	MEGA_MOGLIFICATION_BONECRAFT	= 701,		// Increases your bonecrafting skill immensely
	MEGA_MOGLIFICATION_ALCHEMY		= 702,		// Increases your alchemy skill immensely
	MEGA_MOGLIFICATION_COOKING		= 703,		// Increases your cooking skill immensely

// Other 	

	MOGHANCEMENT_EXPERIENCE 		= 666,		// Reduces the amount of experience lost when KO'd
	MOGHANCEMENT_GARDENING 			= 667,		// Reduces the chances of plants withering when gardening 
	MOGHANCEMENT_DESYNTHESIS 		= 668,		// Increases the chances of success when attempting desynthesis
	MOGHANCEMENT_CONQUEST 			= 678,		// Increases the number of individual conquest points received
	MOGHANCEMENT_REGION 			= 679,		// Increases the number of region points awarded to your nation when participating in conquest
	MOGHANCEMENT_SANDORIA_CONQUEST	= 681,		// Increases the number of individual conquest points received for San d'Orian adventurers only 
	MOGHANCEMENT_BASTOK_CONQUEST 	= 682,		// Increases the number of individual conquest points received for Bastokan adventurers only 
	MOGHANCEMENT_WINDURST_CONQUEST 	= 683,		// Increases the number of individual conquest points received for Windurstian adventurers only
	MOGHANCEMENT_MONEY 				= 684,		// Increases the amount of Gil received
	MOGHANCEMENT_CAMPAIGN 			= 685		// Improves your evaluation for services rendered to the Allied Forces
};


class CItemFurnishing : public CItem
{
public:

	CItemFurnishing(uint16);
	virtual ~CItemFurnishing();

	uint8	getStorage();
	uint8	getMoghancement();
	uint8	getElement();
	uint8	getAura();

	uint8	getCol();
	uint8	getRow();
	uint8	getLevel();
	uint8	getRotation();

	void	setStorage(uint8 storage);
	void	setMoghancement(uint8 moghancement);
	void	setElement(uint8 element);
	void	setAura(uint8 aura);

	void	setCol(uint8 col);
	void	setRow(uint8 row);
	void	setLevel(uint8 level);
	void	setRotation(uint8 rotation);
	
private:

	uint8	m_storage;
	uint8	m_moghancement;
	uint8	m_element;
	uint8	m_aura;

	uint8	m_col;
	uint8	m_row;
	uint8	m_level;
	uint8	m_rotation;
};

#endif