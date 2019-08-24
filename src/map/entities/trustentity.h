/*
===========================================================================

  Copyright (c) 2018 Darkstar Dev Teams

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

#ifndef _CTRUSTENTITY_H
#define _CTRUSTENTITY_H

#include "battleentity.h"
#include "charentity.h"
#include "mobentity.h"
#include "../trait.h"

class CTrustSpellContainer;
class CTrustSpellList;
class CTrustWSList;
class CCharEntity;
class CTrustSkillState;
class CTrustAbilityState;
class CMeritPoints;

class CTrustEntity : public CMobEntity
{
public:
    CTrustEntity();
	~CTrustEntity();

	uint8       m_Element;
	uint32      m_TrustID;

    CTrustSpellList* m_TrustSpellListContainer;        // The spells list container for this mob
    CTrustWSList*    m_TrustWSListContainer;        // The spells list container for this mob


    CTrustSpellContainer* TrustSpellContainer;                // retrieves spells for the mob
    uint8     m_HasSpellScript;                        // 1 if they have a spell script to use for working out what to cast.
    uint16     m_SpellList;

    uint8     TPUseChance();                           // return % chance to use TP move

    void      setLastWs(uint32 value);
    uint32    getLastWs();
    void      setMobMod(uint16 type, int16 value);
    int16     getMobMod(uint16 type);
    void      addMobMod(uint16 type, int16 value);     // add
    void      defaultMobMod(uint16 type, int16 value); // set value if value has not been already set
    bool	  Rest(float rate); // heal an amount of hp / mp

    uint16    m_Behaviour;                // mob behaviour
    uint16    m_MobSkillList;             // Mob skill list defined from mob_pools

    uint8     m_name_prefix;
    //uint32    m_flags;                                 // includes the CFH flag and whether the HP bar should be shown or not (e.g. Yilgeban doesnt)
    string_t  packetName;                              // Used for battle allies

    virtual void OnEngage(CAttackState&) override;
    virtual void PostTick() override;
    virtual void FadeOut() override;
    virtual void Die() override;
    virtual void Spawn() override;
    virtual bool ValidTarget(CBattleEntity* PInitiator, uint16 targetFlags) override;
    virtual void OnDisengage(CAttackState&) override;
    virtual void OnDespawn(CDespawnState&) override;
    virtual void OnDeathTimer() override;public:
    virtual void OnCastFinished(CMagicState&, action_t&) override;
    virtual void OnAbility(CAbilityState& state, action_t& action) override;
    virtual void OnTrustSkillFinished(CTrustSkillState&, action_t&);
    virtual void addTrait(CTrait*);
    virtual void delTrait(CTrait*);

private:
    std::unordered_map<int, int16>     m_mobModStat;
    uint32 m_currentWS;
};

#endif
