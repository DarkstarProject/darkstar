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

#include "latent_effect_container.h"

#include "latent_effect.h"
#include "battleentity.h"

CLatentEffectContainer::CLatentEffectContainer(CBattleEntity* PEntity)
	:m_POwner(PEntity)
{
	m_LatentEffectList.reserve(32);
}

CLatentEffectContainer::~CLatentEffectContainer()
{
	for (uint16 i = 0; i < m_LatentEffectList.size(); ++i)
	{
		delete m_LatentEffectList.at(i);
	}
}

/************************************************************************
*																		*
*  Adds new latent effect to the character.								*
*																		*
************************************************************************/

void CLatentEffectContainer::AddLatentEffect(CLatentEffect* LatentEffect)
{
	m_LatentEffectList.push_back(LatentEffect);
}

/************************************************************************
*																		*
*  Removes all latent effects associated with a specified slot			*
*																		*
************************************************************************/

void CLatentEffectContainer::DelLatentEffect(uint8 slot)
{
	for (uint16 i = 0; i < m_LatentEffectList.size(); ++i) 
	{
		if (m_LatentEffectList.at(i)->GetSlot() == slot)
		{
			CLatentEffect* latent = m_LatentEffectList.at(i);
			if( latent->IsActivated() )
			{
				latent->Deactivate();
			}
			m_LatentEffectList.erase(m_LatentEffectList.begin() + i);
			delete latent;
		}
	}
}

/************************************************************************
*																		*
*  Checks all latents that are affected by HP and activates them if  	*
*  the conditions are met.												*
*																		*
************************************************************************/

void CLatentEffectContainer::CheckLatentsHP()
{
	//TODO: hook into this from anywhere HP changes: might need a real setter method for hp...
}

/************************************************************************
*																		*
*  Checks all latents that are affected by TP and activates them if  	*
*  the conditions are met.												*
*																		*
************************************************************************/

void CLatentEffectContainer::CheckLatentsTP()
{
	//TODO: hook into this from anywhere TP changes
}

/************************************************************************
*																		*
*  Checks all latents that are affected by MP and activates them if  	*
*  the conditions are met.												*
*																		*
************************************************************************/

void CLatentEffectContainer::CheckLatentsMP()
{
	//TODO: hook into this from anywhere MP changes
}

/************************************************************************
*																		*
*  Checks all latents that are affected by subjob and activates them if *
*  the conditions are met.												*
*																		*
************************************************************************/

void CLatentEffectContainer::CheckLatentsSubjob(uint8 jobId)
{
	for (uint16 i = 0; i < m_LatentEffectList.size(); ++i) 
	{
		if( m_LatentEffectList.at(i)->GetConditionsID() == LATENT_SUBJOB && jobId == m_LatentEffectList.at(i)->GetConditionsValue())
		{
			m_LatentEffectList.at(i)->Activate();
		}
		//Don't need to check to turn them off - changing sub rebuilds everything
	}
}

/************************************************************************
*																		*
*  Checks all latents that are affected by drawn weapon and activates  	*
*  them if the conditions are met.										*
*																		*
************************************************************************/

void CLatentEffectContainer::CheckLatentsWeaponDraw(bool drawn)
{
	if( drawn )
	{
		for (uint16 i = 0; i < m_LatentEffectList.size(); ++i) 
		{
			switch(m_LatentEffectList.at(i)->GetConditionsID())
			{
				case LATENT_WEAPON_DRAWN:
					m_LatentEffectList.at(i)->Activate();
					break;
				case LATENT_WEAPON_DRAWN_HP_UNDER:
					//todo: hp drain
					break;
				case LATENT_WEAPON_DRAWN_MP_DRAIN:
					//todo: mp drain
					break;
				case LATENT_WEAPON_DRAWN_TP_DRAIN:
					//todo: tp drain
					break;
				case LATENT_WEAPON_SHEATHED:
					m_LatentEffectList.at(i)->Deactivate();
				default:
					break;
			}
		}
	}
	else
	{
		for (uint16 i = 0; i < m_LatentEffectList.size(); ++i) 
		{
			switch(m_LatentEffectList.at(i)->GetConditionsID())
			{
				case LATENT_WEAPON_DRAWN:
				case LATENT_WEAPON_DRAWN_HP_UNDER:
				case LATENT_WEAPON_DRAWN_MP_DRAIN:
				case LATENT_WEAPON_DRAWN_TP_DRAIN:
					m_LatentEffectList.at(i)->Deactivate();
					break;
				case LATENT_WEAPON_SHEATHED:
					m_LatentEffectList.at(i)->Activate();
				default:
					break;
			}
		}
	}
}

/************************************************************************
*																		*
*  Checks all latents that are affected by status effects and activates	*
*  them if the conditions are met.										*
*																		*
************************************************************************/

void CLatentEffectContainer::CheckLatentsStatusEffect()
{
	for (uint16 i = 0; i < m_LatentEffectList.size(); ++i) 
	{
		if( m_LatentEffectList.at(i)->GetConditionsID() == LATENT_STATUS_EFFECT_ACTIVE)
		{
			if( m_POwner->StatusEffectContainer->HasStatusEffect((EFFECT)m_LatentEffectList.at(i)->GetConditionsValue()))
			{
				m_LatentEffectList.at(i)->Activate();
			}
			else
			{
				m_LatentEffectList.at(i)->Deactivate();
			}
		}
	}
}

/************************************************************************
*																		*
*  Checks all latents that are affected by rolls or songs and activates *
*  them if the conditions are met.										*
*																		*
************************************************************************/

void CLatentEffectContainer::CheckLatentsRollSong()
{
	
}

/************************************************************************
*																		*
*  Checks all latents that are affected by day or moon and activates	*
*  them if the conditions are met.										*
*																		*
************************************************************************/

void CLatentEffectContainer::CheckLatentsDay()
{
	
}

/************************************************************************
*																		*
*  Checks all latents that are affected by number of party members and  *
*  activates them if the conditions are met.							*
*																		*
************************************************************************/

void CLatentEffectContainer::CheckLatentsPartyMembers(uint8 members)
{
	for (uint16 i = 0; i < m_LatentEffectList.size(); ++i) 
	{
		if( m_LatentEffectList.at(i)->GetConditionsID() == LATENT_PARTY_MEMBERS)
		{
			CLatentEffect* latent = m_LatentEffectList.at(i);
			if( latent->GetConditionsValue() <= members )
			{
				latent->Activate();
			}
			else
			{
				latent->Deactivate();
			}
		}
	}
}

/************************************************************************
*																		*
*  Checks all latents that are affected by an avatar in party and		*
*  activates them if the conditions are met.							*
*																		*
************************************************************************/

void CLatentEffectContainer::CheckLatentsPartyAvatar()
{
	
}

/************************************************************************
*																		*
*  Checks all latents that are affected by job level and			    *
*  activates them if the conditions are met.							*
*																		*
************************************************************************/

void CLatentEffectContainer::CheckLatentsJobLevel()
{
	for (uint16 i = 0; i < m_LatentEffectList.size(); ++i) 
	{
		switch(m_LatentEffectList.at(i)->GetConditionsID())
		{
			case LATENT_JOB_LEVEL_EVEN:
				if( m_POwner->GetMLevel() % 2 == 0 )
				{
					m_LatentEffectList.at(i)->Activate();
				}
				else
				{
					m_LatentEffectList.at(i)->Deactivate();
				}
				break;
			case LATENT_JOB_LEVEL_ODD:
				if( m_POwner->GetMLevel() % 2 == 1 )
				{
					m_LatentEffectList.at(i)->Activate();
				}
				else
				{
					m_LatentEffectList.at(i)->Deactivate();
				}
				break;
			case LATENT_JOB_MULTIPLE_5:
				if( m_POwner->GetMLevel() % 5 == 0 )
				{
					m_LatentEffectList.at(i)->Activate();
				}
				else
				{
					m_LatentEffectList.at(i)->Deactivate();
				}
				break;
			case LATENT_JOB_MULTIPLE_10:
				if( m_POwner->GetMLevel() % 10 == 0 )
				{
					m_LatentEffectList.at(i)->Activate();
				}
				else
				{
					m_LatentEffectList.at(i)->Deactivate();
				}
				break;
			case LATENT_JOB_MULTIPLE_13_NIGHT:
				//TODO: night
				if( m_POwner->GetMLevel() % 13 == 0 )
				{
					m_LatentEffectList.at(i)->Activate();
				}
				else
				{
					m_LatentEffectList.at(i)->Deactivate();
				}
				break;
			default:
				break;
		}
	}
}

/************************************************************************
*																		*
*  Checks all latents that are affected by players pet type and			*
*  activates them if the conditions are met.							*
*																		*
************************************************************************/

void CLatentEffectContainer::CheckLatentsPetType()
{
	
}

/************************************************************************
*																		*
*  Checks all latents that are affected by time of vana day and			*
*  activates them if the conditions are met.							*
*																		*
************************************************************************/

void CLatentEffectContainer::CheckLatentsTime()
{
	
}