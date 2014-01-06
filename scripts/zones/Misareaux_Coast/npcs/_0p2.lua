-----------------------------------
--  Area: Misareaux Coast
--  NPC:  Dilapidated Gate
--  Entrance to Riverne Site #B01
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
	if(player:getCurrentMission(COP) == THE_SAVAGE and player:getVar("PromathiaStatus") == 0)then
	       player:startEvent(0x0008);
	elseif(player:getCurrentMission(COP) == ANCIENT_VOWS and player:getVar("PromathiaStatus") == 0)then
		player:startEvent(0x0006);
	elseif(player:getCurrentMission(COP) == FLAMES_IN_THE_DARKNESS and player:getVar("PromathiaStatus") == 0)then
	   player:startEvent(0x000C);
	elseif(player:getCurrentMission(COP) > AN_ETERNAL_MELODY or hasCompletedMission(COP,THE_LAST_VERSE))then
		player:startEvent(0x0228);
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
	if(csid == 0x0006 or csid == 0x000C)then
		player:setVar("PromathiaStatus",1);
	elseif(csid == 0x0008 and option == 1)then
		player:setVar("PromathiaStatus",1);
		player:setPos(729,-20,410,88,0x1D); -- Go to Riverne #B01
	end
end;