-----------------------------------
-- Area: Sacrificial Chamber
-- NPC:  Molyb'Iton
-- Zilart Mission 4 BCNM Fight
-----------------------------------
package.loaded["scripts/zones/Sacrificial_Chamber/TextIDs"] = nil;
-----------------------------------

require("scripts/globals/titles");
require("scripts/globals/keyitems");
require("scripts/globals/missions");
require("scripts/zones/Sacrificial_Chamber/TextIDs");

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
	record = GetServerVariable("[BF]Zilart_Mission_4_record");
	partyMembers = 6;
	
	newtimer = os.time() - killer:getVar("BCNM_Timer");
		
	if(newtimer < record) then
		SetServerVariable("[BF]Zilart_Mission_4_record",newtimer);
	end
	
	if(killer:getVar("BCNM_Killed") >= 3) then
		if(killer:hasCompletedMission(ZILART,THE_TEMPLE_OF_UGGALEPIH)) then
			killer:startEvent(0x7d01,0,record,0,newtimer,partyMembers,0,1);
		else
			killer:startEvent(0x7d01,0,record,0,newtimer,partyMembers,0,0);
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
		player:setTitle(BEARER_OF_THE_WISEWOMANS_HOPE);
		if(player:hasKeyItem(SACRIFICIAL_CHAMBER_KEY)) then
			player:delKeyItem(SACRIFICIAL_CHAMBER_KEY);
			player:addKeyItem(DARK_FRAGMENT);
			player:messageSpecial(KEYITEM_OBTAINED,DARK_FRAGMENT);
			player:completeMission(ZILART,THE_TEMPLE_OF_UGGALEPIH);
			player:addMission(ZILART,HEADSTONE_PILGRIMAGE);
		end
	end
	
end;