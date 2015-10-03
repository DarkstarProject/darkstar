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

#include "battlefield.h"

#include "../common/timer.h"
#include "entities/charentity.h"
#include "entities/mobentity.h"
#include "entities/baseentity.h"
#include "packets/entity_animation.h"
#include "packets/entity_update.h"
#include "packets/position.h"
#include "packets/message_basic.h"
#include "lua/luautils.h"
#include "utils/zoneutils.h"


CBattlefield::CBattlefield(CBattlefieldHandler* hand, uint16 id, BATTLEFIELDTYPE type){
	m_Type = type;
	m_BcnmID = id;
	m_Handler = hand;
	locked = false;
	m_FastestTime = 3600;
	m_DynaUniqueID = 0;
	treasureChestSpawned = false;
	fightTick = 0;
	m_entrance = 0;
	m_lost = false;
	m_won = false;
}

uint16 CBattlefield::getID(){
	return m_BcnmID;
}

uint8 CBattlefield::getBattlefieldNumber(){
	return m_BattlefieldNumber;
}

uint32 CBattlefield::getTimeLimit(){
	return m_TimeLimit;
}

BATTLEFIELDTYPE CBattlefield::getType()
{
	return m_Type;
}

uint16 CBattlefield::getZoneId(){
	return m_ZoneID;
}

uint8 CBattlefield::getMaxParticipants(){
	return m_MaxParticipants;
}

uint8 CBattlefield::getMaxPlayerInBCNM(){
	return m_PlayerList.size();
}

uint8 CBattlefield::getLevelCap(){
	return m_LevelCap;
}

uint16 CBattlefield::getLootId(){
	return m_LootId;
}

uint32 CBattlefield::getStartTime(){
	return m_StartTime;
}

uint32 CBattlefield::getDeadTime(){
	return m_AllDeadTime;
}

const int8* CBattlefield::getBcnmName(){
	return m_name.c_str();
}

uint8 CBattlefield::getEntrance(){
	return m_entrance;
}

void CBattlefield::setBcnmName(int8* name){
	m_name.clear();
	m_name.insert(0,name);
}

void CBattlefield::setTimeLimit(uint32 time){
	m_TimeLimit = time;
}

void CBattlefield::setDeadTime(uint32 time){
	m_AllDeadTime = time;
}

void CBattlefield::setBattlefieldNumber(uint8 battlefield){
	m_BattlefieldNumber = battlefield;
}

void CBattlefield::setZoneId(uint16 zone){
	m_ZoneID = zone;
}

void CBattlefield::setMaxParticipants(uint8 max){
	m_MaxParticipants = max;
}

void CBattlefield::setLevelCap(uint8 cap){
	m_LevelCap = cap;
}

void CBattlefield::setLootId(uint16 id){
	m_LootId = id;
}

void CBattlefield::setEntrance(uint8 entrance){
	m_entrance = entrance;
}

//========================PLAYER FUNCTIONS=============================================//

void CBattlefield::enableSubJob(){
	if(m_PlayerList.size()==0){
		ShowWarning("battlefield:enableSubjob - No players in battlefield!\n");
		return;
	}
	for(int i=0; i<m_PlayerList.size(); i++){
		m_PlayerList.at(i)->StatusEffectContainer->DelStatusEffectsByFlag(EFFECT_SJ_RESTRICTION);
	}
}

void CBattlefield::disableSubJob(){
	if(m_PlayerList.size()==0){
		ShowWarning("battlefield:disableSubjob - No players in battlefield!\n");
		return;
	}
	for(int i=0; i<m_PlayerList.size(); i++){
		m_PlayerList.at(i)->StatusEffectContainer->AddStatusEffect(new CStatusEffect(EFFECT_SJ_RESTRICTION,0,m_PlayerList.at(i)->GetSJob(),0,0),true);
	}
}

uint8 CBattlefield::getPlayerMainJob(){
	if(m_PlayerList.size()==0){
		ShowWarning("battlefield:getPlayerMainJob - No players in battlefield!\n");
		return 1;
	}
	return m_PlayerList.at(0)->GetMJob();
}

uint8 CBattlefield::getPlayerMainLevel(){
	if(m_PlayerList.size()==0){
		ShowWarning("battlefield:getPlayerMainLevel - No players in battlefield!\n");
		return 1;
	}
	return m_PlayerList.at(0)->GetMLevel();
}

void CBattlefield::capPlayerToBCNM(){ //adjust player's level to the appropriate cap and remove buffs
	if(m_PlayerList.size()==0){
		ShowWarning("battlefield:getPlayerMainLevel - No players in battlefield!\n");
		return;
	}
	uint8 cap = getLevelCap();
	if(cap != 0)
	{	// Other missions lines and things like dragoon quest battle can be done similarly to CoP_Battle_cap.
		// Might be better to add a type flag to the sql to tell bcnm/isnm/which expantions mission than doing by bcnmID like this.
		if((map_config.CoP_Battle_cap == 0) && (m_BcnmID == 768 || m_BcnmID == 800 || m_BcnmID == 832 || m_BcnmID == 960
		|| m_BcnmID == 704 || m_BcnmID == 961 || m_BcnmID == 864 || m_BcnmID == 672 || m_BcnmID == 736 || m_BcnmID == 992 || m_BcnmID == 640))
		{
		cap = 99;
		}
		if(cap < 99 && cap > 1)
		{
		cap = cap + map_config.Battle_cap_tweak;
		}
		if(cap > 99)
		{
		cap = 99;
		}
		if(cap < 1)
		{
		cap = 1;
		}
		for(int i=0; i<m_PlayerList.size(); i++)
		{
			m_PlayerList.at(i)->StatusEffectContainer->DelStatusEffectsByFlag(EFFECTFLAG_DISPELABLE);
			m_PlayerList.at(i)->StatusEffectContainer->DelStatusEffectsByFlag(EFFECTFLAG_ON_ZONE);
			m_PlayerList.at(i)->StatusEffectContainer->AddStatusEffect(new CStatusEffect(EFFECT_LEVEL_RESTRICTION,0,cap,0,0),true);
		}
	}
}


bool CBattlefield::isPlayerInBcnm(CCharEntity* PChar){
	for(int i=0; i<m_PlayerList.size(); i++){
		if(PChar->id == m_PlayerList.at(i)->id){
			return PChar->PBCNM != nullptr;
		}
	}
	return false;
}

void CBattlefield::pushMessageToAllInBcnm(uint16 msg, uint16 param){
	for(int i=0; i<m_PlayerList.size(); i++){
		if(m_PlayerList.at(i)->m_lastBcnmTimePrompt != param){
			m_PlayerList.at(i)->pushPacket(new CMessageBasicPacket(m_PlayerList.at(i),m_PlayerList.at(i),param,0,msg));
			m_PlayerList.at(i)->m_lastBcnmTimePrompt = param;
		}
	}
}

bool CBattlefield::addPlayerToBcnm(CCharEntity* PChar){
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
	PChar->StatusEffectContainer->AddStatusEffect(new CStatusEffect(EFFECT_BATTLEFIELD,EFFECT_BATTLEFIELD,this->m_BcnmID,0,0),true);
	this->capPlayerToBCNM();
	return true;
}

bool CBattlefield::delPlayerFromBcnm(CCharEntity* PChar){
	for(int i=0; i<m_PlayerList.size(); i++){
		if(m_PlayerList.at(i)->id == PChar->id){
			PChar->PBCNM = nullptr;
			PChar->StatusEffectContainer->DelStatusEffectSilent(EFFECT_SJ_RESTRICTION);
			PChar->StatusEffectContainer->DelStatusEffectSilent(EFFECT_BATTLEFIELD);
			PChar->StatusEffectContainer->DelStatusEffectSilent(EFFECT_LEVEL_RESTRICTION);
			PChar->PBattleAI->SetCurrentAction(ACTION_DISENGAGE);
			clearPlayerEnmity(PChar);
			m_PlayerList.erase(m_PlayerList.begin()+i);
			return true;
		}
	}
	return false;
}

bool CBattlefield::enterBcnm(CCharEntity* PChar){
	for(int i=0; i<m_PlayerList.size(); i++){
		if(m_PlayerList.at(i)->id == PChar->id){
			if (PChar->PBCNM){ ShowWarning("%s is already inside a BCNM!\n", PChar->GetName()); }
			PChar->PBCNM = this;
			ShowDebug("Entered ID %i Battlefield %i \n",this->m_BcnmID,this->m_BattlefieldNumber);
			//callback to lua
			luautils::OnBcnmEnter(PChar,this);
			return true;
		}
	}
	return false;
}

bool CBattlefield::isValidPlayerForBcnm(CCharEntity* PChar){
	for(int i=0; i<m_PlayerList.size(); i++){
		if(PChar->id == m_PlayerList.at(i)->id){
			return true;
		}
	}
	return false;
}

bool CBattlefield::allPlayersDead(){
	if(m_PlayerList.size()==0){ShowWarning("battlefield:allPlayersDead : No players in list!\n");}

	for(int i=0; i<m_PlayerList.size();i++){
		if(!m_PlayerList.at(i)->isDead()){
			return false;
		}
	}
	return true;
}

//==================BCNM FUNCTIONS=====================================================//

void CBattlefield::lockBcnm(){
	for(int i=0; i<m_PlayerList.size(); i++){
		if (!m_PlayerList.at(i)->PBCNM){
			ShowDebug("Removing %s from the valid players list for BCNMID %i Battlefield %i \n",m_PlayerList.at(i)->GetName(),
				this->m_BcnmID,this->m_BattlefieldNumber);
			if(this->delPlayerFromBcnm(m_PlayerList.at(i))){i--;}
		}
	}
}

void CBattlefield::init(){
	//reload from sql
	battlefieldutils::spawnMonstersForBcnm(this);
	m_StartTime = gettick();
	m_AllDeadTime = 0;
}

void CBattlefield::addEnemy(CMobEntity* PMob, uint8 condition){
	m_EnemyList.push_back(PMob);
	PMob->PBCNM = this;
	if (condition & CONDITION_WIN_REQUIREMENT)
	{
		MobVictoryCondition_t mobCondition = {PMob, false};
		m_EnemyVictoryList.push_back(mobCondition);
	}
    // TODO: move dynamis/limbus shit to a subclass (this is just ridiculous)
    if (!(m_ZoneID > 184 && m_ZoneID < 189) && !(m_ZoneID > 133 && m_ZoneID < 136) && !(m_ZoneID > 38 && m_ZoneID < 43))
    {
        PMob->StatusEffectContainer->AddStatusEffect(new CStatusEffect(EFFECT_BATTLEFIELD, EFFECT_BATTLEFIELD, this->m_BcnmID, 0, 0), true);
    }
}

void CBattlefield::addNpc(CBaseEntity* PNpc){
	m_NpcList.push_back(PNpc);
	PNpc->PBCNM = this;
}

bool CBattlefield::allEnemiesDefeated(){
	bool allDefeated = true;
	for(int i=0; i<m_EnemyVictoryList.size(); i++){
		if(m_EnemyVictoryList.at(i).MobEntity->PBattleAI->GetCurrentAction() >= 20 && m_EnemyVictoryList.at(i).MobEntity->PBattleAI->GetCurrentAction() <= 23){
			m_EnemyVictoryList.at(i).killed = true;
		}
		if(m_EnemyVictoryList.at(i).killed == false){
			allDefeated = false;
		}
	}
	return allDefeated;
}

bool CBattlefield::isPlayersFighting(){
	for(int i=0; i<m_EnemyList.size(); i++){
		if(m_EnemyList.at(i)->PEnmityContainer->GetHighestEnmity() != nullptr){
			return true;
		}
	}
	return false;
}

bool CBattlefield::isReserved(){
	if(m_PlayerList.size()>0){return true;}
	return false;
}

void CBattlefield::cleanup(){
	ShowDebug("bcnm cleanup id:%i inst:%i \n",this->getID(),this->getBattlefieldNumber());
	//wipe enmity from all mobs in list if needed
	for(int i=0; i<m_EnemyList.size(); i++){
		m_EnemyList.at(i)->PBattleAI->SetCurrentAction(ACTION_DESPAWN);
		m_EnemyList.at(i)->status = STATUS_DISAPPEAR;
		m_EnemyList.at(i)->PBCNM = nullptr;
	}
	//wipe mob list
	m_EnemyList.clear();

	//make chest vanish (if any)
	for(int i=0; i<m_NpcList.size(); i++){
		m_NpcList.at(i)->loc.zone->PushPacket(m_NpcList.at(i), CHAR_INRANGE, new CEntityAnimationPacket(m_NpcList.at(i), CEntityAnimationPacket::FADE_OUT));
		m_NpcList.at(i)->animation = ANIMATION_DEATH;
		m_NpcList.at(i)->status = STATUS_MOB;
		m_NpcList.at(i)->loc.zone->PushPacket(m_NpcList.at(i), CHAR_INRANGE, new CEntityUpdatePacket(m_NpcList.at(i), ENTITY_UPDATE, UPDATE_COMBAT));
	}
	//wipe npc list
	m_NpcList.clear();

	for (auto PAlly : m_AllyList)
	{
		zoneutils::GetZone(getZoneId())->DeletePET(PAlly);
		delete PAlly;
	}
	m_AllyList.clear();

	luautils::OnBcnmDestroy(this);

	locked = false;
	//delete battlefield
	if(m_Handler==nullptr){
		ShowError("Battlefield handler is null from Battlefield BCNM %i Inst %i \n",m_BcnmID,m_BattlefieldNumber);
	}

	m_Handler->wipeBattlefield(this);
	delete this;
}

void CBattlefield::beforeCleanup(){
	if(!(m_RuleMask & RULES_ALLOW_SUBJOBS)){
		// enable subjob
		enableSubJob();
	}
}

bool CBattlefield::winBcnm(){
	beforeCleanup();
	for(int i=0; i<m_PlayerList.size(); i++){
		luautils::OnBcnmLeave(m_PlayerList.at(i),this,LEAVE_WIN);
		if(this->delPlayerFromBcnm(m_PlayerList.at(i))){i--;}
	}
	cleanup();
	return true;
}

bool CBattlefield::spawnTreasureChest(){
	battlefieldutils::spawnTreasureForBcnm(this);
	return true;
}

void CBattlefield::OpenChestinBcnm(){
	battlefieldutils::getChestItems(this);
}

bool CBattlefield::loseBcnm(){
	beforeCleanup();
	for(int i=0; i<m_PlayerList.size(); i++){
		luautils::OnBcnmLeave(m_PlayerList.at(i),this,LEAVE_LOSE);
		if(this->delPlayerFromBcnm(m_PlayerList.at(i))){i--;}
	}

	cleanup();
	return true;
}

bool CBattlefield::isEnemyBelowHPP(uint8 hpp){
	for(int i=0; i<m_EnemyList.size(); i++){
		if(m_EnemyList.at(i)->GetHPP()>hpp){
			return false;
		}
	}
	return true;
}

//========================DYNAMIS FUNCTIONS=============================================//

//Create dynamis unique ID for player can't cheat by leaving a dynamis before the end and enter the next
void CBattlefield::setDynaUniqueID(){
	m_DynaUniqueID = m_BcnmID + m_StartTime;
	printf("uniqueid core: %u",m_DynaUniqueID);
}

uint16 CBattlefield::getDynaUniqueID(){
	return m_DynaUniqueID;
}

//Add player to dynamis
bool CBattlefield::addPlayerToDynamis(CCharEntity* PChar){
	//split to get the reason for debugging
	if(m_PlayerList.size() >= m_MaxParticipants){
		ShowDebug("Cannot add %s to Dynamis list, max size reached.\n",PChar->GetName());return false;
	}
	if(PChar->StatusEffectContainer->HasStatusEffect(EFFECT_DYNAMIS, 0) || PChar->StatusEffectContainer->HasStatusEffect(EFFECT_BATTLEFIELD)){
		ShowDebug("Cannot add %s to Dynamis list, they have BC effect.\n",PChar->GetName());return false;
	}
	if(PChar->getZone() != m_ZoneID){
		ShowDebug("Cannot add %s to Dynamis list, not in right zone.\n",PChar->GetName());return false;
	}

	m_PlayerList.push_back(PChar);
	PChar->StatusEffectContainer->AddStatusEffect(new CStatusEffect(EFFECT_DYNAMIS,0,this->m_BcnmID,0,0),true);
	return true;
}

//Add time on dynamis battlefield
void CBattlefield::addTimeLimit(uint32 time){
	m_TimeLimit += time;
}

bool CBattlefield::finishDynamis(){
	for(int i=0; i<m_PlayerList.size(); i++){
		luautils::OnBcnmLeave(m_PlayerList.at(i),this,LEAVE_LOSE);
		if(this->delPlayerFromDynamis(m_PlayerList.at(i))){i--;}
	}

	cleanupDynamis();
	return true;
}

void CBattlefield::cleanupDynamis(){
	ShowDebug("Dynamis cleanup id:%i \n",this->getID());

	//get all mob of this dyna zone
	const int8* fmtQuery = "SELECT msp.mobid \
							FROM mob_spawn_points msp \
							LEFT JOIN mob_groups mg ON mg.groupid = msp.groupid \
							WHERE zoneid = %u";

	int32 ret = Sql_Query(SqlHandle, fmtQuery, this->getZoneId());

	if (ret == SQL_ERROR || Sql_NumRows(SqlHandle) == 0) {
		ShowError("Dynamis cleanup : SQL error - Cannot find any ID for Dyna %i \n",this->getID());
	}else{
		while(Sql_NextRow(SqlHandle) == SQL_SUCCESS)
		{
			uint32 mobid = Sql_GetUIntData(SqlHandle,0);
			CMobEntity* PMob = (CMobEntity*)zoneutils::GetEntity(mobid, TYPE_MOB);

			if(PMob != nullptr)
				PMob->PBattleAI->SetCurrentAction(ACTION_FADE_OUT);
		}
	}

	//wipe mob list
	m_EnemyList.clear();
	m_MobList.clear();

	//delete battlefield
	if(m_Handler==nullptr){
		ShowError("Battlefield handler is null from Dynamis Battlefield %i \n",m_BcnmID);
	}
	m_Handler->wipeBattlefield(this);
	delete this;
}

bool CBattlefield::delPlayerFromDynamis(CCharEntity* PChar){
	for(int i=0; i<m_PlayerList.size(); i++){
		if(m_PlayerList.at(i)->id == PChar->id){
			PChar->PBCNM = nullptr;
			PChar->StatusEffectContainer->DelStatusEffectSilent(EFFECT_DYNAMIS);
			PChar->PBattleAI->SetCurrentAction(ACTION_DISENGAGE);
			m_PlayerList.erase(m_PlayerList.begin()+i);
			return true;
		}
	}
	return false;
}

void CBattlefield::addMonsterInList(CMobEntity* PMob)
{
	m_MobList.push_back(PMob);
}

bool CBattlefield::isMonsterInList(CMobEntity* PMob)
{
	for(int i=0; i < m_MobList.size(); i++)
	{
		if(PMob->id == m_MobList.at(i)->id)
		{
			return true;
		}
	}
	return false;
}

void CBattlefield::clearPlayerEnmity(CCharEntity* PChar)
{
	for (std::vector<CMobEntity*>::iterator it = m_MobList.begin() ; it != m_MobList.end(); ++it)
	{
		CMobEntity* PMob = *it;

		PMob->PEnmityContainer->Clear(PChar->id);
	}
}

bool CBattlefield::lost()
{
	return m_lost;
}

bool CBattlefield::won()
{
	return m_won;
}

void CBattlefield::lose()
{
	m_lost = true;
}

void CBattlefield::win()
{
	m_won = true;
}
