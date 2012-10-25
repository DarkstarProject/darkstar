-----------------------------------
--  Area: Misareaux Coast
--  NPC:  Spacial Displacement
--  Entrance to Riverne Site #A01 and #B01
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
	player:startEvent(0x0227);
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
	
	if(csid == 0x227 and option == 1) then
		player:setPos(734,-32,-505,101,0x1E); -- Go to Riverne #A01
	elseif(csid == 0x227 and option == 2) then
		player:setPos(729,-20,410,88,0x1D); -- Go to Riverne #B01
	end;
	
end;