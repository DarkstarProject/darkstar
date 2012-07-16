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

#include "instance.h"

#include "../common/timer.h"
#include "charentity.h"
#include "mobentity.h"
#include "packets/position.h"
#include "packets/message_basic.h"
#include "lua/luautils.h"


CInstance::CInstance(CInstanceHandler* hand, uint16 id){
	m_BcnmID = id;
	m_Handler = hand;
	locked = false;
	m_FastestTime = 3600;
}
	
uint16 CInstance::getID(){
	return m_BcnmID;
}

uint8 CInstance::getInstanceNumber(){
	return m_InstanceNumber;
}

uint32 CInstance::getTimeLimit(){
	return m_TimeLimit;
}

uint8 CInstance::getZoneId(){
	return m_ZoneID;
}

uint8 CInstance::getMaxParticipants(){
	return m_MaxParticipants;
}

uint8 CInstance::getLevelCap(){
	return m_LevelCap;
}

uint16 CInstance::getDropId(){
	return m_DropId;
}

uint32 CInstance::getStartTime(){
	return m_StartTime;
}

uint32 CInstance::getDeadTime(){
	return m_AllDeadTime;
}

const int8* CInstance::getBcnmName(){
	return m_name.c_str();
}

void CInstance::setBcnmName(int8* name){
	m_name.clear();
	m_name.insert(0,name);
}

void CInstance::setTimeLimit(uint32 time){
	m_TimeLimit = time;
}

void CInstance::setDeadTime(uint32 time){
	m_AllDeadTime = time;
}

void CInstance::setInstanceNumber(uint8 instance){
	m_InstanceNumber = instance;
}

void CInstance::setZoneId(uint8 zone){
	m_ZoneID = zone;
}

void CInstance::setMaxParticipants(uint8 max){
	m_MaxParticipants = max;
}

void CInstance::setLevelCap(uint8 cap){
	m_LevelCap = cap;
}

void CInstance::setDropId(uint16 id){
	m_DropId = id;
}

//========================PLAYER FUNCTIONS=============================================//

uint8 CInstance::getPlayerMainJob(){
	if(m_PlayerList.size()==0){
		ShowWarning("instance:getPlayerMainJob - No players in battlefield!\n");
		return 1;
	}
	return m_PlayerList.at(0)->GetMJob();
}

bool CInstance::isPlayerInBcnm(CCharEntity* PChar){
	for(int i=0; i<m_PlayerList.size(); i++){
		if(PChar->id == m_PlayerList.at(i)->id){
			return PChar->m_insideBCNM;
		}
	}
	return false;
}

void CInstance::pushMessageToAllInBcnm(uint16 msg, uint16 param){
	for(int i=0; i<m_PlayerList.size(); i++){
		if(m_PlayerList.at(i)->m_lastBcnmTimePrompt != param){
			m_PlayerList.at(i)->pushPacket(new CMessageBasicPacket(m_PlayerList.at(i),m_PlayerList.at(i),param,0,msg));
			m_PlayerList.at(i)->m_lastBcnmTimePrompt = param;
		}
	}
}

bool CInstance::addPlayerToBcnm(CCharEntity* PChar){
	//split to get the reason for debugging
	if(m_PlayerList.size() >= m_MaxParticipants){
		ShowDebug("Cannot add %s to BCNM list, max size reached.\n",PChar->GetName());return false;
	}
	if(PChar->StatusEffectContainer->HasStatusEffect(EFFECT_BATTLEFIELD)){
		ShowDebug("Cannot add %s to BCNM list, they have BC effect.\n",PChar->GetName());return false;
	}
	if(PChar->getZone() != m_ZoneID){
		ShowDebug("Cannot add %s to BCNM list, not in right zone.\n",PChar->GetName());return false;
	}

	m_PlayerList.push_back(PChar);
	PChar->StatusEffectContainer->AddStatusEffect(new CStatusEffect(EFFECT_BATTLEFIELD,EFFECT_BATTLEFIELD,this->m_BcnmID,0,0));
	return true;
}

bool CInstance::delPlayerFromBcnm(CCharEntity* PChar){
	for(int i=0; i<m_PlayerList.size(); i++){
		if(m_PlayerList.at(i)->id == PChar->id){
			PChar->m_insideBCNM = false;
			PChar->StatusEffectContainer->DelStatusEffect(EFFECT_BATTLEFIELD);
			PChar->PBattleAI->SetCurrentAction(ACTION_DISENGAGE);
			m_PlayerList.erase(m_PlayerList.begin()+i);
			return true;
		}
	}
	return false;
}

bool CInstance::enterBcnm(CCharEntity* PChar){
	for(int i=0; i<m_PlayerList.size(); i++){
		if(m_PlayerList.at(i)->id == PChar->id){
			if(PChar->m_insideBCNM){ShowWarning("%s is already inside a BCNM!\n",PChar->GetName());}
			PChar->m_insideBCNM = true;
			ShowDebug("Entered ID %i Instance %i \n",this->m_BcnmID,this->m_InstanceNumber);
			//callback to lua
			luautils::OnBcnmEnter(PChar,this);
			return true;
		}
	}
	return false;
}

bool CInstance::isValidPlayerForBcnm(CCharEntity* PChar){
	for(int i=0; i<m_PlayerList.size(); i++){
		if(PChar->id == m_PlayerList.at(i)->id){
			return true;
		}
	}
	return false;
}

bool CInstance::allPlayersDead(){
	if(m_PlayerList.size()==0){ShowWarning("instance:allPlayersDead : No players in list!\n");}

	for(int i=0; i<m_PlayerList.size();i++){
		if(!m_PlayerList.at(i)->isDead()){
			return false;
		}
	}
	return true;
}

//==================BCNM FUNCTIONS=====================================================//

void CInstance::lockBcnm(){
	for(int i=0; i<m_PlayerList.size(); i++){
		if(!m_PlayerList.at(i)->m_insideBCNM){
			ShowDebug("Removing %s from the valid players list for BCNMID %i Instance %i \n",m_PlayerList.at(i)->GetName(),
				this->m_BcnmID,this->m_InstanceNumber);
			if(this->delPlayerFromBcnm(m_PlayerList.at(i))){i--;}
		}
	}
}

void CInstance::init(){
	//reload from sql
	instanceutils::spawnMonstersForBcnm(this);
	m_StartTime = gettick();
	m_AllDeadTime = 0;
}

void CInstance::addEnemy(CMobEntity* PMob){
	m_EnemyList.push_back(PMob);
}

bool CInstance::allEnemiesDefeated(){
	for(int i=0; i<m_EnemyList.size(); i++){
		if(!m_EnemyList.at(i)->isDead()){
			return false;
		}
	}
	return true;
}

bool CInstance::isPlayersFighting(){
	for(int i=0; i<m_EnemyList.size(); i++){
		if(m_EnemyList.at(i)->PEnmityContainer->GetHighestEnmity() != NULL){
			return true;
		}
	}
	return false;
}

bool CInstance::isReserved(){
	if(m_PlayerList.size()>0){return true;}
	return false;
}

void CInstance::cleanup(){
	ShowDebug("bcnm cleanup id:%i inst:%i \n",this->getID(),this->getInstanceNumber());
	//wipe enmity from all mobs in list if needed
	for(int i=0; i<m_EnemyList.size(); i++){
		m_EnemyList.at(i)->PEnmityContainer->Clear(0);
		m_EnemyList.at(i)->PBattleAI->SetCurrentAction(ACTION_FADE_OUT);
	}
	//wipe mob list
	m_EnemyList.clear();
	locked = false;
	//delete instance
	if(m_Handler==NULL){
		ShowError("Instance handler is NULL from Instance BCNM %i Inst %i \n",m_BcnmID,m_InstanceNumber);
	}
	m_Handler->wipeInstance(this);
	delete this;
}

bool CInstance::winBcnm(){ 
	for(int i=0; i<m_PlayerList.size(); i++){
		luautils::OnBcnmLeave(m_PlayerList.at(i),this,LEAVE_WIN);
		if(this->delPlayerFromBcnm(m_PlayerList.at(i))){i--;}
	}
	cleanup();
	return true;
}

bool CInstance::loseBcnm(){
	for(int i=0; i<m_PlayerList.size(); i++){
		luautils::OnBcnmLeave(m_PlayerList.at(i),this,LEAVE_LOSE);
		if(this->delPlayerFromBcnm(m_PlayerList.at(i))){i--;}
	}

	cleanup();
	return true;
}

bool CInstance::isEnemyBelowHPP(uint8 hpp){
	for(int i=0; i<m_EnemyList.size(); i++){
		if(m_EnemyList.at(i)->GetHPP()>hpp){
			return false;
		}
	}
	return true;
}
