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

#include "charentity.h"
#include "mobentity.h"


CInstance::CInstance(uint16 id){
	m_BcnmID = id;
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

bool CInstance::isPlayerInBcnm(CCharEntity* PChar){
	for(int i=0; i<m_PlayerList.size(); i++){
		if(PChar->id == m_PlayerList.at(i)->id){
			return PChar->m_insideBCNM;
		}
	}
	return false;
}

bool CInstance::addPlayerToBcnm(CCharEntity* PChar){
	if(m_PlayerList.size() >= m_MaxParticipants){
		return false;
	}
	m_PlayerList.push_back(PChar);
	return true;
}

bool CInstance::delPlayerFromBcnm(CCharEntity* PChar){
	for(int i=0; i<m_PlayerList.size(); i++){
		if(m_PlayerList.at(i)->id == PChar->id){
			PChar->m_insideBCNM = false;
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

//==================BCNM FUNCTIONS=====================================================//

void CInstance::init(){
	m_PlayerList.clear();
	m_StartTime = 0;
}

bool CInstance::isPlayersFighting(){
	for(int i=0; i<m_EnemyList.size(); i++){
		if(m_EnemyList.at(i)->PEnmityContainer->GetHighestEnmity() != NULL){
			return true;
		}
	}
	return false;
}

bool CInstance::exceededTimeLimit(uint32 tick){
	if(tick - m_StartTime > m_TimeLimit){
		return true;
	}
	return false;
}

bool CInstance::isReserved(){
	if(m_PlayerList.size()>0){return true;}
	return false;
}


bool CInstance::winBcnm(){
	return true;
}

bool CInstance::loseBcnm(){
	return true;
}

