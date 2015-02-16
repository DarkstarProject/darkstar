-----------------------------------
-- Area: Fort Ghelsba
--  NPC: Elevator Lever (lower)
-- @zone 141
-- @pos  -0.652 -28.996 100.445
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
	player:setPos(8.112, -52.665, 98, 0)
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