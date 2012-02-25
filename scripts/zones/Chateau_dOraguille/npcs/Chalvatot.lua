-----------------------------------
-- Area: Chateau d'Oraguille
-- NPC:  Chalvatot
-- Finish Mission "The Crystal Spring"
-- @zone 233
-- @pos -105.998 -0.602 72.233
-----------------------------------
package.loaded["scripts/zones/Chateau_dOraguille/TextIDs"] = nil;
-----------------------------------

require("scripts/globals/missions");
require("scripts/zones/Chateau_dOraguille/TextIDs");

-----------------------------------
-- onTrade Action
-----------------------------------

function onTrade(player,npc,trade)
end;

-----------------------------------
-- onTrigger Action
-----------------------------------

function onTrigger(player,npc)
	
	if(player:getCurrentMission(SANDORIA) == THE_CRYSTAL_SPRING and player:getVar("MissionStatus") == 3) then
		player:startEvent(0x022c);
	else
		player:startEvent(0x0213);
	end
	
end;

-----------------------------------
-- onEventUpdate
-----------------------------------

function onEventUpdate(player,csid,option)
-- printf("CSID: %u",csid);
-- printf("RESULT: %u",option);
end;

-----------------------------------
-- onEventFinish
-----------------------------------

function onEventFinish(player,csid,option)
-- printf("CSID: %u",csid);
-- printf("RESULT: %u",option);
	
	if(csid == 0x022c) then
		player:setVar("MissionStatus",0);
		player:completeMission(SANDORIA,THE_CRYSTAL_SPRING);
	end
	
end;