-----------------------------------
-- Area: Fort Ghelsba
--  NPC: Elevator Lever (upper)
-- @zone 141
-- @pos  8.112 -52.665 96.084
-----------------------------------
package.loaded["scripts/zones/Fort_Ghelsba/TextIDs"] = nil;
-----------------------------------

require("scripts/globals/settings");
require("scripts/globals/treasure");
require("scripts/zones/Fort_Ghelsba/TextIDs");


-----------------------------------
-- onTrade Action
-----------------------------------

function onTrade(player,npc,trade)
end;

-----------------------------------
-- onTrigger Action
-----------------------------------

function onTrigger(player,npc)
	player:setPos( -0.652, -28.996, 97, 128)
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
end;