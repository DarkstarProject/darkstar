-----------------------------------
--  Area: Misareaux Coast
--  NPC:  Dilapidated Gate
--  Entrance to Misareaux Coast
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
	
	local z = player:getZPos();
	
	if(player:getCurrentMission(COP) == ANCIENT_VOWS and player:getVar("PromathiaStatus") == 0)then
		player:startEvent(0x0006);
	elseif(player:hasCompletedMission(COP,AN_ETERNAL_MELODY))then
		if(z > 330)then
			player:startEvent(0x0229);
		else
			player:startEvent(0x0228);
		end	     
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
	
	if(csid == 0x0006)then
		player:setVar("PromathiaStatus",1);
	end
end;