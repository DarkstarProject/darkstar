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
	LatentEffect->SetOwner(m_POwner);
}

void CLatentEffectContainer::AddLatentEffects(std::vector<CLatentEffect*> *latentList, uint8 slot)
{
	for (uint16 i = 0; i < latentList->size(); ++i)
	{
		if( latentList->at(i)->GetModValue() == MOD_MAIN_DMG_RATING && slot == SLOT_SUB )
		{
			AddLatentEffect(new CLatentEffect(latentList->at(i)->GetConditionsID(), 
				latentList->at(i)->GetConditionsValue(), slot, MOD_SUB_DMG_RATING,
				latentList->at(i)->GetModPower()));
		} else {
			AddLatentEffect(new CLatentEffect(latentList->at(i)->GetConditionsID(), 
				latentList->at(i)->GetConditionsValue(), slot, latentList->at(i)->GetModValue(),
				latentList->at(i)->GetModPower()));
		}
	}
}

/************************************************************************
*																		*
*  Removes all latent effects associated with a specified slot			*
*																		*
************************************************************************/

void CLatentEffectContainer::DelLatentEffects(uint8 slot)
{
	for (int16 i = m_LatentEffectList.size()-1; i >= 0; --i) 
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
	//TODO: hook into this from anywhere HP changes
	for (uint16 i = 0; i < m_LatentEffectList.size(); ++i) 
	{
		switch(m_LatentEffectList.at(i)->GetConditionsID())
		{
			case LATENT_HP_UNDER_PERCENT:
				if (((float)hp / m_POwner->health.maxhp )*100 <= m_LatentEffectList.at(i)->GetConditionsValue())
				{
					m_LatentEffectList.at(i)->Activate();
				}
				else
				{
					m_LatentEffectList.at(i)->Deactivate();
				}
				break;
			case LATENT_HP_OVER_PERCENT:
				if (((float)hp / m_POwner->health.maxhp )*100 >= m_LatentEffectList.at(i)->GetConditionsValue())
				{
					m_LatentEffectList.at(i)->Activate();
				}
				else
				{
					m_LatentEffectList.at(i)->Deactivate();
				}
				break;
			case LATENT_HP_UNDER_TP_UNDER_100:
				if (((float)hp / m_POwner->health.maxhp )*100 <= m_LatentEffectList.at(i)->GetConditionsValue() && m_POwner->health.tp < 100)
				{
					m_LatentEffectList.at(i)->Activate();
				}
				else
				{
					m_LatentEffectList.at(i)->Deactivate();
				}
				break;
			case LATENT_HP_OVER_TP_UNDER_100:
				if (((float)hp / m_POwner->health.maxhp )*100 >= m_LatentEffectList.at(i)->GetConditionsValue() && m_POwner->health.tp < 100)
				{
					m_LatentEffectList.at(i)->Activate();
				}
				else
				{
					m_LatentEffectList.at(i)->Deactivate();
				}
				break;
			//case LATENT_HP_OVER_VISIBLE_GEAR:
			//	{
			//	//TODO: figure out if this is actually right
			//	CItemArmor* head = (CItemArmor*)(m_POwner->getStorage(LOC_INVENTORY)->GetItem(m_POwner->equip[SLOT_HEAD]));
			//	CItemArmor* body = (CItemArmor*)(m_POwner->getStorage(LOC_INVENTORY)->GetItem(m_POwner->equip[SLOT_BODY]));
			//	CItemArmor* hands = (CItemArmor*)(m_POwner->getStorage(LOC_INVENTORY)->GetItem(m_POwner->equip[SLOT_HANDS]));
			//	CItemArmor* legs = (CItemArmor*)(m_POwner->getStorage(LOC_INVENTORY)->GetItem(m_POwner->equip[SLOT_LEGS]));
			//	CItemArmor* feet = (CItemArmor*)(m_POwner->getStorage(LOC_INVENTORY)->GetItem(m_POwner->equip[SLOT_FEET]));

			//	int32 visibleHp = 0;
			//	visibleHp += (head ? head->getModifier(MOD_HP) : 0);
			//	visibleHp += (body ? body->getModifier(MOD_HP) : 0);
			//	visibleHp += (hands ? hands->getModifier(MOD_HP) : 0);
			//	visibleHp += (legs ? legs->getModifier(MOD_HP) : 0);
			//	visibleHp += (feet ? feet->getModifier(MOD_HP) : 0);

			//	//TODO: add mp percent too
			//	if ((float)( hp / ((m_POwner->health.hp - m_POwner->health.modhp) + (m_POwner->PMeritPoints->GetMerit(MERIT_MAX_HP)->count * 10 ) + 
			//		visibleHp) ) <= m_LatentEffectList.at(i)->GetConditionsValue())
			//	{
			//		m_LatentEffectList.at(i)->Activate();
			//	}
			//	else
			//	{
			//		m_LatentEffectList.at(i)->Deactivate();
			//	}
			//	}
			//	break;
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
	for (uint16 i = 0; i < m_LatentEffectList.size(); ++i) 
	{
		switch(m_LatentEffectList.at(i)->GetConditionsID())
		{
			case LATENT_TP_UNDER_100:
				if (tp < 100)
				{
					m_LatentEffectList.at(i)->Activate();
				}
				else
				{
					m_LatentEffectList.at(i)->Deactivate();
				}
				break;
			case LATENT_TP_OVER_100:
				if (tp >= 100)
				{
					m_LatentEffectList.at(i)->Activate();
				}
				else
				{
					m_LatentEffectList.at(i)->Deactivate();
				}
				break;
			case LATENT_HP_UNDER_TP_UNDER_100:
				if ((float)(m_POwner->health.hp / m_POwner->health.hp )*100 <= m_LatentEffectList.at(i)->GetConditionsValue() && m_POwner->health.tp < 100)
				{
					m_LatentEffectList.at(i)->Activate();
				}
				else
				{
					m_LatentEffectList.at(i)->Deactivate();
				}
				break;
			case LATENT_HP_OVER_TP_UNDER_100:
				if ((float)(m_POwner->health.hp / m_POwner->health.hp )*100 >= m_LatentEffectList.at(i)->GetConditionsValue() && m_POwner->health.tp < 100)
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
				if ((float)(mp / m_POwner->health.maxmp ) <= m_LatentEffectList.at(i)->GetConditionsValue())
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
			//case LATENT_MP_UNDER_VISIBLE_GEAR:
			//	{
			//	//TODO: figure out if this is actually right
			//	CItemArmor* head = (CItemArmor*)(m_POwner->getStorage(LOC_INVENTORY)->GetItem(m_POwner->equip[SLOT_HEAD]));
			//	CItemArmor* body = (CItemArmor*)(m_POwner->getStorage(LOC_INVENTORY)->GetItem(m_POwner->equip[SLOT_BODY]));
			//	CItemArmor* hands = (CItemArmor*)(m_POwner->getStorage(LOC_INVENTORY)->GetItem(m_POwner->equip[SLOT_HANDS]));
			//	CItemArmor* legs = (CItemArmor*)(m_POwner->getStorage(LOC_INVENTORY)->GetItem(m_POwner->equip[SLOT_LEGS]));
			//	CItemArmor* feet = (CItemArmor*)(m_POwner->getStorage(LOC_INVENTORY)->GetItem(m_POwner->equip[SLOT_FEET]));

			//	int32 visibleMp = 0;
			//	visibleMp += (head ? head->getModifier(MOD_MP) : 0);
			//	visibleMp += (body ? body->getModifier(MOD_MP) : 0);
			//	visibleMp += (hands ? hands->getModifier(MOD_MP) : 0);
			//	visibleMp += (legs ? legs->getModifier(MOD_MP) : 0);
			//	visibleMp += (feet ? feet->getModifier(MOD_MP) : 0);

			//	//TODO: add mp percent too
			//	if ((float)( mp / ((m_POwner->health.mp - m_POwner->health.modmp) + (m_POwner->PMeritPoints->GetMerit(MERIT_MAX_MP)->count * 10 ) + 
			//		visibleMp) ) <= m_LatentEffectList.at(i)->GetConditionsValue())
			//	{
			//		m_LatentEffectList.at(i)->Activate();
			//	}
			//	else
			//	{
			//		m_LatentEffectList.at(i)->Deactivate();
			//	}
			//	}
			//	break;
			default:
				break;
		}
	}
}

/************************************************************************
*																		*
*  Checks all latents for a given slot (ie. on equip)					*
*																		*
************************************************************************/

void CLatentEffectContainer::CheckLatentsEquip(uint8 slot)
{
	for (uint16 i = 0; i < m_LatentEffectList.size(); ++i) 
	{
		if (m_LatentEffectList.at(i)->GetSlot() == slot)
		{
			switch(m_LatentEffectList.at(i)->GetConditionsID())
			{
				case LATENT_HP_UNDER_PERCENT:
					if (((float)m_POwner->health.hp / m_POwner->health.maxhp )*100 <= m_LatentEffectList.at(i)->GetConditionsValue())
					{
						m_LatentEffectList.at(i)->Activate();
					}
					else
					{
						m_LatentEffectList.at(i)->Deactivate();
					}
					break;
				case LATENT_HP_OVER_PERCENT:
					if (((float)m_POwner->health.hp / m_POwner->health.maxhp )*100 >= m_LatentEffectList.at(i)->GetConditionsValue())
					{
						m_LatentEffectList.at(i)->Activate();
					}
					else
					{
						m_LatentEffectList.at(i)->Deactivate();
					}
					break;
				case LATENT_HP_UNDER_TP_UNDER_100:
					if (((float)m_POwner->health.hp / m_POwner->health.maxhp )*100 <= m_LatentEffectList.at(i)->GetConditionsValue() && m_POwner->health.tp < 100)
					{
						m_LatentEffectList.at(i)->Activate();
					}
					else
					{
						m_LatentEffectList.at(i)->Deactivate();
					}
					break;
				case LATENT_HP_OVER_TP_UNDER_100:
					if (((float)m_POwner->health.hp / m_POwner->health.maxhp )*100 >= m_LatentEffectList.at(i)->GetConditionsValue() && m_POwner->health.tp < 100)
					{
						m_POwner->addHP(4);
						m_LatentEffectList.at(i)->Activate();
					}
					else
					{
						m_LatentEffectList.at(i)->Deactivate();
					}
					break;
				case LATENT_TP_UNDER_100:
					if (m_POwner->health.tp < 100)
					{
						m_LatentEffectList.at(i)->Activate();
					}
					else
					{
						m_LatentEffectList.at(i)->Deactivate();
					}
					break;
				case LATENT_TP_OVER_100:
					if (m_POwner->health.tp >= 100)
					{
						m_LatentEffectList.at(i)->Activate();
					}
					else
					{
						m_LatentEffectList.at(i)->Deactivate();
					}
					break;
				case LATENT_SUBJOB:
					if( m_POwner->GetSJob() == m_LatentEffectList.at(i)->GetConditionsValue())
					{
						m_LatentEffectList.at(i)->Activate();
					}
					break;
				case LATENT_WEAPON_BROKEN:
				{
					CItemWeapon* PWeaponMain = (m_POwner->equip[SLOT_MAIN] != 0) ? (CItemWeapon*)(m_POwner->getStorage(LOC_INVENTORY)->GetItem(m_POwner->equip[SLOT_MAIN])) : NULL;
					CItemWeapon* PWeaponSub = (m_POwner->equip[SLOT_SUB] != 0) ? (CItemWeapon*)(m_POwner->getStorage(LOC_INVENTORY)->GetItem(m_POwner->equip[SLOT_SUB])) : NULL;
					CItemWeapon* PWeaponRanged = (m_POwner->equip[SLOT_RANGED] != 0) ? (CItemWeapon*)(m_POwner->getStorage(LOC_INVENTORY)->GetItem(m_POwner->equip[SLOT_RANGED])) : NULL;
					if( PWeaponMain && m_POwner->unlockedWeapons[PWeaponMain->getUnlockId()-1].unlocked && m_LatentEffectList.at(i)->GetSlot() == SLOT_MAIN )
					{
						m_LatentEffectList.at(i)->Activate();
					}
					if( PWeaponSub && m_POwner->unlockedWeapons[PWeaponSub->getUnlockId()-1].unlocked && m_LatentEffectList.at(i)->GetSlot() == SLOT_SUB)
					{
						m_LatentEffectList.at(i)->Activate();
					}
					if( PWeaponRanged && m_POwner->unlockedWeapons[PWeaponRanged->getUnlockId()-1].unlocked && m_LatentEffectList.at(i)->GetSlot() == SLOT_RANGED)
					{
						m_LatentEffectList.at(i)->Activate();
					}
					break;
				}
				case LATENT_ZONE:
					if( m_LatentEffectList.at(i)->GetConditionsValue() == m_POwner->getZone())
					{
						m_LatentEffectList.at(i)->Activate();
					}
					else
					{
						m_LatentEffectList.at(i)->Deactivate();
					}
					break;
				case LATENT_IN_DYNAMIS:
					if (m_POwner->isInDynamis())
					{
						m_LatentEffectList.at(i)->Activate();
					}
					else
					{
						m_LatentEffectList.at(i)->Deactivate();
					}
					break;
			}
		}
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

/************************************************************************
*																		*
*  Checks all latents that are affected by weapon skill points			*
*																		*
************************************************************************/

void CLatentEffectContainer::CheckLatentsWeaponBreak(uint8 slot)
{
	for (uint16 i = 0; i < m_LatentEffectList.size(); ++i) 
	{
		if( m_LatentEffectList.at(i)->GetConditionsID() == LATENT_WEAPON_BROKEN && m_LatentEffectList.at(i)->GetConditionsValue() == slot)
		{
			CItemWeapon* PWeaponMain = (m_POwner->equip[slot] != 0) ? (CItemWeapon*)(m_POwner->getStorage(LOC_INVENTORY)->GetItem(m_POwner->equip[slot])) : NULL;
			if( PWeaponMain && m_POwner->unlockedWeapons[PWeaponMain->getUnlockId()-1].unlocked && m_LatentEffectList.at(i)->GetSlot() == slot )
			{
				m_LatentEffectList.at(i)->Activate();
			}
		}
	}
}

/************************************************************************
*																		*
*  Checks all latents regarding current zone							*
*																		*
************************************************************************/

void CLatentEffectContainer::CheckLatentsZone()
{
	for (uint16 i = 0; i < m_LatentEffectList.size(); ++i) 
	{
		switch(m_LatentEffectList.at(i)->GetConditionsID())
		{
			case LATENT_ZONE:
				if( m_LatentEffectList.at(i)->GetConditionsValue() == m_POwner->getZone())
				{
					m_LatentEffectList.at(i)->Activate();
				}
				else
				{
					m_LatentEffectList.at(i)->Deactivate();
				}
				break;
			case LATENT_IN_DYNAMIS:
				if (m_POwner->isInDynamis())
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