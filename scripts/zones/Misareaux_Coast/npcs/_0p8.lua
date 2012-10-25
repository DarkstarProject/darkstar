-----------------------------------
--  Area: Misareaux Coast
--  NPC:  Iron Gate
--  Entrance to Sacrarium
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
	player:startEvent(0x01f6);
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
	
	if(csid == 0x01f6 and option == 1) then
		player:setPos(-219,-16,82,64,0x1C); -- Go to Sacrarium
	end
	
end;