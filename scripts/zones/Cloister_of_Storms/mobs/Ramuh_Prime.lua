-----------------------------------
-- Area: Cloister of Storms
-- NPC:  Ramuh Prime
-- Involved in Quest: Trial by Lightning
-----------------------------------

require("scripts/globals/settings");
require("scripts/globals/keyitems");

-----------------------------------
-- OnMobSpawn Action
-----------------------------------

function onMobSpawn(mob)
end; 

-----------------------------------
-- OnMobDeath Action
-----------------------------------

function onMobDeath(mob, killer)
	
	killer:setVar("BCNM_Killed",1);
	record = 300;
	partyMembers = 6;
	pZone = killer:getZone();
	
	killer:startEvent(0x7d01,0,record,0,(os.time() - killer:getVar("BCNM_Timer")),partyMembers,0,0);
	
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
-- onEventFinish
-----------------------------------

function onEventFinish(player,csid,option)
--printf("onFinish CSID: %u",csid);
--printf("onFinish RESULT: %u",option);
	
	if(csid == 0x7d01) then
		player:delKeyItem(TUNING_FORK_OF_LIGHTNING);
		player:addKeyItem(WHISPER_OF_STORMS);
		player:messageSpecial(KEYITEM_OBTAINED,WHISPER_OF_STORMS);
	end
	
end;