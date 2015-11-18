-----------------------------------
-- Area: Upper Delkfutt's Tower
-- NPC:  Door
-- @pos 315 16 20 158
-----------------------------------
package.loaded["scripts/zones/Upper_Delkfutts_Tower/TextIDs"] = nil;
-----------------------------------

require("scripts/globals/keyitems");
require("scripts/zones/Upper_Delkfutts_Tower/TextIDs");

-----------------------------------
-- onTrade Action
-----------------------------------

function onTrade(player,npc,trade)
end;

-----------------------------------
-- onTrigger Action
-----------------------------------

function onTrigger(player,npc)
	
	player:startEvent(0x0002);
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
	
	if (csid == 0x0002 and option == 1) then
		player:setPos(524, 16, 20, 0, 0xB8);	-- to Lower Delkfutt's Tower
	end
	
end;