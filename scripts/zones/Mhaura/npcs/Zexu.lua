-----------------------------------
-- Area: Mhaura
-- NPC:  Zexu
-- Involved in Quests: The Sand Charm
-- @zone 249
-- @pos 30 -8 25
-----------------------------------

require("scripts/globals/settings");
package.loaded["scripts/zones/Mhaura/TextIDs"] = nil;
require("scripts/zones/Mhaura/TextIDs");

-----------------------------------
-- onTrade Action
-----------------------------------

function onTrade(player,npc,trade)
end; 

-----------------------------------
-- onTrigger Action
-----------------------------------

function onTrigger(player,npc)
	if(player:getVar("theSandCharmVar") == 1) then
		player:startEvent(0x007b); -- During quest "The Sand Charm" - 1st dialog
	else
		player:startEvent(0x0079); -- Standard dialog
	end
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
	if(csid == 0x007b) then 
		player:setVar("theSandCharmVar",2);
	end
end;