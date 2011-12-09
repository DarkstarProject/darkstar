-----------------------------------
--  Area: Bastok Markets
--   NPC: Horatius
--  Type: Quest Giver
-- @zone: 235
--  @pos: -158.392 -5.839 -117.061
--
-- Starts and Finishes: Breaking Stones
--
-- Auto-Script: Requires Verification. Verfied standard dialog - thrydwolf 12/8/2011
-----------------------------------

package.loaded["scripts/zones/Bastok_Markets/TextIDs"] = nil;
require("scripts/zones/Bastok_Markets/TextIDs");

-----------------------------------
-- onTrade Action
-----------------------------------

function onTrade(player,npc,trade)
end;

-----------------------------------
-- onTrigger Action
-----------------------------------

function onTrigger(player,npc)
	player:startEvent(0x006e);
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

