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

#include "../../common/utils.h"
#include "attackutils.h"
#include "battleutils.h"
#include "../attack.h"


namespace attackutils
{

/************************************************************************
*                                                                       *
*  Multihit calculator.											        *
*                                                                       *
************************************************************************/
uint8 getHitCount(uint8 hits)
{
    uint8 distribution = dsprand::GetRandomNumber(100);
    uint8 num = 1;

	switch (hits)
    {
        case 0: break;
        case 1: break;
        case 2: // cdf = 55,100
		    if(distribution < 55){ break; }
		    else{ num+=1; break;}
		    break;
        case 3: // cdf = 30,80,100
		    if(distribution < 30){ break; }
		    else if(distribution < 80){ num+=1; break; }
		    else{ num+=2; break; }
		    break;
        case 4: // cdf = 20,50,80,100
		    if(distribution < 20){ break; }
		    else if(distribution < 50){ num+=1; break; }
		    else if(distribution < 80){ num+=2; break; }
		    else{ num+=3; break; }
		    break;
        case 5: // cdf = 10,30,60,90,100
		    if(distribution < 10){ break; }
		    else if(distribution < 30){ num+=1; break; }
		    else if(distribution < 60){ num+=2; break; }
		    else if(distribution < 90){ num+=3; break; }
		    else{ num+=4; break; }
		    break;
        case 6: // cdf = 10,30,50,70,90,100
            if(distribution < 10){ break; }
		    else if(distribution < 30){num+=1; break; }
		    else if(distribution < 50){num+=2; break; }
		    else if(distribution < 70){num+=3; break; }
		    else if(distribution < 90){num+=4; break; }
		    else{ num+=5; break; }
            break;
        case 7: // cdf = 5,20,45,70,85,95,100
            if(distribution < 5){ break; }
		    else if(distribution < 20){num+=1; break; }
		    else if(distribution < 45){num+=2; break; }
		    else if(distribution < 70){num+=3; break; }
		    else if(distribution < 85){num+=4; break; }
		    else if(distribution < 95){num+=5; break; }
		    else{ num+=6; break; }
            break;
        case 8: // cdf = 5,20,45,70,85,95,98,100
		    if(distribution < 5){ break; }
		    else if(distribution < 20){num+=1; break; }
		    else if(distribution < 45){num+=2; break; }
		    else if(distribution < 70){num+=3; break; }
		    else if(distribution < 85){num+=4; break; }
		    else if(distribution < 95){num+=5; break; }
		    else if(distribution < 98){num+=6; break; }
		    else{ num+=7; break; }
            break;
	}
    return dsp_min(num,8); // не более восьми ударов за одну атаку
}

/************************************************************************
*                                                                       *
*  Is parried.													        *
*                                                                       *
************************************************************************/
bool IsParried(CBattleEntity* PAttacker, CBattleEntity* PDefender)
{
    if(isFaceing(PDefender->loc.p, PAttacker->loc.p, 40))
    {
        return (dsprand::GetRandomNumber(100) < battleutils::GetParryRate(PAttacker, PDefender));
    }
    return false;
}

/************************************************************************
*                                                                       *
*  Is guarded.													        *
*                                                                       *
************************************************************************/
bool IsGuarded(CBattleEntity* PAttacker, CBattleEntity* PDefender)
{
    if(isFaceing(PDefender->loc.p, PAttacker->loc.p, 40))
    {
        return(dsprand::GetRandomNumber(100) < battleutils::GetGuardRate(PAttacker, PDefender));
    }
    return false;
}

/************************************************************************
*                                                                       *
*  Is blocked.													        *
*                                                                       *
************************************************************************/
bool IsBlocked(CBattleEntity* PAttacker, CBattleEntity* PDefender)
{
	if(isFaceing(PDefender->loc.p, PAttacker->loc.p, 40))
    {
        return(dsprand::GetRandomNumber(100) < battleutils::GetBlockRate(PAttacker, PDefender));
    }
    return false;
}

/************************************************************************
*                                                                       *
*  Handles damage multiplier, relic weapons etc.                        *
*                                                                       *
************************************************************************/
uint32 CheckForDamageMultiplier(CCharEntity* PChar, CItemWeapon* PWeapon, uint32 damage, PHYSICAL_ATTACK_TYPE attackType)
{
	if (PWeapon==nullptr)
	{
		return damage;
	}
	uint32 originalDamage = damage;

	if (PWeapon->getModifier(MOD_OCC_DO_EXTRA_DMG) > 0 && PWeapon->getModifier(MOD_EXTRA_DMG_CHANCE) > 0)
	{
		if (dsprand::GetRandomNumber(100) <= (PWeapon->getModifier(MOD_EXTRA_DMG_CHANCE)/10))
		{
			return (damage = (damage * (PWeapon->getModifier(MOD_OCC_DO_EXTRA_DMG)/100.f)));
		}
	}

	switch (attackType)
	{
		case ZANSHIN_ATTACK:	if (dsprand::GetRandomNumber(100) < PChar->getMod(MOD_ZANSHIN_DOUBLE_DAMAGE))		return originalDamage * 2;
		case TRIPLE_ATTACK:		if (dsprand::GetRandomNumber(100) < PChar->getMod(MOD_TA_TRIPLE_DAMAGE))			return originalDamage * 3;
		case DOUBLE_ATTACK:		if (dsprand::GetRandomNumber(100) < PChar->getMod(MOD_DA_DOUBLE_DAMAGE))			return originalDamage * 2;
		case RAPID_SHOT_ATTACK:	if (dsprand::GetRandomNumber(100) < PChar->getMod(MOD_RAPID_SHOT_DOUBLE_DAMAGE))	return originalDamage * 2;
		case SAMBA_ATTACK:		if (dsprand::GetRandomNumber(100) < PChar->getMod(MOD_SAMBA_DOUBLE_DAMAGE))		return originalDamage * 2;
		default: break;
	}
	return originalDamage;
}

}