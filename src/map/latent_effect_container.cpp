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
#include "charentity.h"
#include "battleentity.h"

CLatentEffectContainer::CLatentEffectContainer(CCharEntity* PEntity)
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

void CLatentEffectContainer::CheckLatentsHP(int32 hp)
{
	//TODO: hook into this from anywhere MP changes
	for (uint16 i = 0; i < m_LatentEffectList.size(); ++i) 
	{
		switch(m_LatentEffectList.at(i)->GetConditionsID())
		{
			case LATENT_HP_UNDER_PERCENT:
				if ((float)(hp / m_POwner->health.hp ) <= m_LatentEffectList.at(i)->GetConditionsValue())
				{
					m_LatentEffectList.at(i)->Activate();
				}
				else
				{
					m_LatentEffectList.at(i)->Deactivate();
				}
				break;
			case LATENT_HP_OVER_PERCENT:
				if ((float)(hp / m_POwner->health.hp ) >= m_LatentEffectList.at(i)->GetConditionsValue())
				{
					m_LatentEffectList.at(i)->Activate();
				}
				else
				{
					m_LatentEffectList.at(i)->Deactivate();
				}
				break;
			case LATENT_HP_OVER_VISIBLE_GEAR:
				{
				//TODO: figure out if this is actually right
				CItemArmor* head = (CItemArmor*)(m_POwner->getStorage(LOC_INVENTORY)->GetItem(m_POwner->equip[SLOT_HEAD]));
				CItemArmor* body = (CItemArmor*)(m_POwner->getStorage(LOC_INVENTORY)->GetItem(m_POwner->equip[SLOT_BODY]));
				CItemArmor* hands = (CItemArmor*)(m_POwner->getStorage(LOC_INVENTORY)->GetItem(m_POwner->equip[SLOT_HANDS]));
				CItemArmor* legs = (CItemArmor*)(m_POwner->getStorage(LOC_INVENTORY)->GetItem(m_POwner->equip[SLOT_LEGS]));
				CItemArmor* feet = (CItemArmor*)(m_POwner->getStorage(LOC_INVENTORY)->GetItem(m_POwner->equip[SLOT_FEET]));

				int32 visibleHp = 0;
				visibleHp += (head ? head->getModifier(MOD_HP) : 0);
				visibleHp += (body ? body->getModifier(MOD_HP) : 0);
				visibleHp += (hands ? hands->getModifier(MOD_HP) : 0);
				visibleHp += (legs ? legs->getModifier(MOD_HP) : 0);
				visibleHp += (feet ? feet->getModifier(MOD_HP) : 0);

				//TODO: add mp percent too
				if ((float)( hp / ((m_POwner->health.hp - m_POwner->health.modhp) + (m_POwner->PMeritPoints->GetMerit(MERIT_MAX_HP)->count * 10 ) + 
					visibleHp) ) <= m_LatentEffectList.at(i)->GetConditionsValue())
				{
					m_LatentEffectList.at(i)->Activate();
				}
				else
				{
					m_LatentEffectList.at(i)->Deactivate();
				}
				}
				break;
			default:
				break;
		}
	}
}

/************************************************************************
*																		*
*  Checks all latents that are affected by TP and activates them if  	*
*  the conditions are met.												*
*																		*
************************************************************************/

void CLatentEffectContainer::CheckLatentsTP(float tp)
{
	//TODO: hook into this from anywhere TP changes
}

/************************************************************************
*																		*
*  Checks all latents that are affected by MP and activates them if  	*
*  the conditions are met.												*
*																		*
************************************************************************/

void CLatentEffectContainer::CheckLatentsMP(int32 mp)
{
	//TODO: hook into this from anywhere MP changes
	for (uint16 i = 0; i < m_LatentEffectList.size(); ++i) 
	{
		switch(m_LatentEffectList.at(i)->GetConditionsID())
		{
			case LATENT_MP_UNDER_PERCENT:
				if ((float)(mp / m_POwner->health.mp ) <= m_LatentEffectList.at(i)->GetConditionsValue())
				{
					m_LatentEffectList.at(i)->Activate();
				}
				else
				{
					m_LatentEffectList.at(i)->Deactivate();
				}
				break;
			case LATENT_MP_UNDER:
				if (mp <= m_LatentEffectList.at(i)->GetConditionsValue())
				{
					m_LatentEffectList.at(i)->Activate();
				}
				else
				{
					m_LatentEffectList.at(i)->Deactivate();
				}
				break;
			case LATENT_MP_UNDER_VISIBLE_GEAR:
				{
				//TODO: figure out if this is actually right
				CItemArmor* head = (CItemArmor*)(m_POwner->getStorage(LOC_INVENTORY)->GetItem(m_POwner->equip[SLOT_HEAD]));
				CItemArmor* body = (CItemArmor*)(m_POwner->getStorage(LOC_INVENTORY)->GetItem(m_POwner->equip[SLOT_BODY]));
				CItemArmor* hands = (CItemArmor*)(m_POwner->getStorage(LOC_INVENTORY)->GetItem(m_POwner->equip[SLOT_HANDS]));
				CItemArmor* legs = (CItemArmor*)(m_POwner->getStorage(LOC_INVENTORY)->GetItem(m_POwner->equip[SLOT_LEGS]));
				CItemArmor* feet = (CItemArmor*)(m_POwner->getStorage(LOC_INVENTORY)->GetItem(m_POwner->equip[SLOT_FEET]));

				int32 visibleMp = 0;
				visibleMp += (head ? head->getModifier(MOD_MP) : 0);
				visibleMp += (body ? body->getModifier(MOD_MP) : 0);
				visibleMp += (hands ? hands->getModifier(MOD_MP) : 0);
				visibleMp += (legs ? legs->getModifier(MOD_MP) : 0);
				visibleMp += (feet ? feet->getModifier(MOD_MP) : 0);

				//TODO: add mp percent too
				if ((float)( mp / ((m_POwner->health.mp - m_POwner->health.modmp) + (m_POwner->PMeritPoints->GetMerit(MERIT_MAX_MP)->count * 10 ) + 
					visibleMp) ) <= m_LatentEffectList.at(i)->GetConditionsValue())
				{
					m_LatentEffectList.at(i)->Activate();
				}
				else
				{
					m_LatentEffectList.at(i)->Deactivate();
				}
				}
				break;
			default:
				break;
		}
	}
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

//easy: when animationType changes to ANIMATION_ATTACK or to something else
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

void CLatentEffectContainer::CheckLatentsRollSong(bool active)
{
	for (uint16 i = 0; i < m_LatentEffectList.size(); ++i) 
	{
		if( m_LatentEffectList.at(i)->GetConditionsID() == LATENT_SONG_ROLL_ACTIVE)
		{
			if( active )
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
*  Checks all latents that are affected by day or moon and activates	*
*  them if the conditions are met.										*
*																		*
************************************************************************/

//probably call this at 00:00 vana time only
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

void CLatentEffectContainer::CheckLatentsPetType(PETTYPE petID)
{
	for (uint16 i = 0; i < m_LatentEffectList.size(); ++i) 
	{
		if( m_LatentEffectList.at(i)->GetConditionsID() == LATENT_PET_ID)
		{
			CLatentEffect* latent = m_LatentEffectList.at(i);
			if( (PETTYPE)latent->GetConditionsValue() == petID )
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
*  Checks all latents that are affected by time of vana day and			*
*  activates them if the conditions are met.							*
*																		*
************************************************************************/

//will probably only call this at transition points in the day
void CLatentEffectContainer::CheckLatentsTime()
{
	
}