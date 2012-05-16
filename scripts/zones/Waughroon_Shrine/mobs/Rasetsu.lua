-----------------------------------
-- Area: Waughroon Shrine
-- NPC:  Rasetsu
-- a Thief in Norg BCNM Fight
-----------------------------------
package.loaded["scripts/zones/Balgas_Dais/TextIDs"] = nil;
-----------------------------------

require("scripts/globals/keyitems");
require("scripts/globals/quests");
require("scripts/zones/Balgas_Dais/TextIDs");

-----------------------------------
-- onMobSpawn Action
-----------------------------------

function OnMobSpawn(mob)
end;

-----------------------------------
-- onMobDeath Action
-----------------------------------

function onMobDeath(mob,killer)
	
	killer:setVar("BCNM_Killed",killer:getVar("BCNM_Killed") + 1);
	record = GetServerVariable("[BF]aThiefinNorg_record");
	partyMembers = 1;
	
	newtimer = os.time() - killer:getVar("BCNM_Timer");
		
	if(newtimer < record) then
		SetServerVariable("[BF]aThiefinNorg_record",newtimer);
	end
	
	if(killer:getVar("BCNM_Killed") == 3) then
		if(killer:getQuestStatus(OUTLANDS,A_THIEF_IN_NORG) == QUEST_ACCEPTED and killer:getVar("aThiefinNorgCS") == 6) then
			killer:startEvent(0x7d01,0,record,0,newtimer,partyMembers,4,0);
		else
			killer:startEvent(0x7d01,0,record,0,newtimer,partyMembers,4,1);
		end
	end
	
end;

-----------------------------------
-- onEventUpdate
-----------------------------------

function onEventUpdate(player,csid,option)
--printf("onUpdate CSID: %u",csid);
--printf("onUpdate RESULT: %u",option);
	
	if(csid == 0x7d01) then
		player:delStatusEffect(EFFECT_BATTLEFIELD);
	end
	
end;

-----------------------------------
-- onEventFinish Action
-----------------------------------

function onEventFinish(player,csid,option)
--printf("onFinish CSID: %u",csid);
--printf("onFinish RESULT: %u",option);

	pZone = player:getZone();
	
	if(csid == 0x7d01) then
		if(player:getQuestStatus(OUTLANDS,A_THIEF_IN_NORG) == QUEST_ACCEPTED and player:getVar("aThiefinNorgCS") == 6) then
			player:addKeyItem(CHARRED_HELM);
			player:messageSpecial(KEYITEM_OBTAINED,CHARRED_HELM);
			player:setVar("aThiefinNorgCS",7);
		end
	end
	
end;