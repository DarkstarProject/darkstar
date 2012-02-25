-----------------------------------
-- Area: Waughroon Shrine
-- NPC:  Searcher
-- Mission 2-3 BCNM Fight
-----------------------------------
package.loaded["scripts/zones/Balgas_Dais/TextIDs"] = nil;
-----------------------------------

require("scripts/globals/settings");
require("scripts/globals/keyitems");
require("scripts/globals/missions");
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
	record = 300;
	partyMembers = 6;
	
	if(killer:getVar("BCNM_Killed") == 2) then
		if(killer:hasCompletedMission(killer:getNation(),5)) then
			killer:startEvent(0x7d01,0,record,0,(os.time() - killer:getVar("BCNM_Timer")),partyMembers,0,1);
		else
			killer:startEvent(0x7d01,0,record,0,(os.time() - killer:getVar("BCNM_Timer")),partyMembers,0,0);
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
		if(player:getCurrentMission(SANDORIA) == JOURNEY_TO_BASTOK2 and player:getVar("MissionStatus") == 10) then
			player:addKeyItem(KINDRED_CREST);
			player:messageSpecial(KEYITEM_OBTAINED,KINDRED_CREST);
			player:setVar("MissionStatus",11);
		end
		player:levelRestriction(0);
	end
	
end;