-----------------------------------
-- Area: Horlais Peak
-- NPC:  Dread Dragon
-- Mission 2-3 BCNM Fight
-----------------------------------
package.loaded["scripts/zones/Horlais_Peak/TextIDs"] = nil;
-----------------------------------

require("scripts/globals/settings");
require("scripts/globals/titles");
require("scripts/globals/keyitems");
require("scripts/globals/missions");
require("scripts/zones/Horlais_Peak/TextIDs");

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
	killer:setTitle(DREAD_DRAGON_SLAYER);

	if(killer:getVar("BCNM_Killed") == 2) then
		if(killer:getCurrentMission(BASTOK) == 8 and killer:getVar("MissionStatus") == 18) then
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
		if(player:getCurrentMission(BASTOK) == 8 and player:getVar("MissionStatus") == 18) then
			player:addKeyItem(KINDRED_CREST);
			player:messageSpecial(KEYITEM_OBTAINED,KINDRED_CREST);
			player:setVar("MissionStatus",19);
		end
		player:levelRestriction(0);
	end
	
end;