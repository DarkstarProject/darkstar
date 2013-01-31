-----------------------------------
-- Area: Misareaux Coast
-- NPC:  Dilapidated Gate
-- @pos 260 9 -435 25
-----------------------------------
package.loaded["scripts/zones/Misareaux_Coast/TextIDs"] = nil;
-----------------------------------

require("scripts/globals/missions");
require("scripts/zones/Misareaux_Coast/TextIDs");

-----------------------------------
-- onTrade
-----------------------------------

function onTrade(player,npc,trade)
end;

-----------------------------------
-- onTrigger
-----------------------------------

function onTrigger(player,npc)
	
	if(player:getCurrentMission(COP) == AN_ETERNAL_MELODY and player:getVar("PromathiaStatus") == 1)then
		player:startEvent(0x0005);
	elseif(player:getCurrentMission(COP) == SHELTERING_DOUBT and player:getVar("PromathiaStatus") == 3)then
	    player:startEvent(0x0007);
	else
		player:messageSpecial(DOOR_CLOSED);
	end   
	
	return 1;
end;

-----------------------------------
-- onEventUpdate
-----------------------------------

function onEventUpdate(player,csid,option)
--printf("CSID: %u",csid);
--printf("RESULT: %u",option);
end;

-----------------------------------
-- onEventFinish
-----------------------------------

function onEventFinish(player,csid,option)
--printf("CSID: %u",csid);
--printf("RESULT: %u",option);
	
	if(csid == 0x0005)then
		player:setVar("PromathiaStatus",2);
	elseif(csid == 0x0007)then
		player:setVar("PromathiaStatus",0);
		player:completeMission(COP,SHELTERING_DOUBT);
		player:addMission(COP,THE_SAVAGE); 
	end
	
end;