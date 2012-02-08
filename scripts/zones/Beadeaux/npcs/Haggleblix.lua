-----------------------------------
--  Area: Beadeaux
--   NPC: Haggleblix
--  Type: Dynamis NPC
-- @zone: 147
--  @pos: -255.847 0.595 106.485
--
-- Auto-Script: Requires Verification
-----------------------------------

package.loaded["scripts/zones/Beadeaux/TextIDs"] = nil;
require("scripts/zones/Beadeaux/TextIDs");

-----------------------------------
-- onTrade Action
-----------------------------------

function onTrade(player,npc,trade)
end;

-----------------------------------
-- onTrigger Action
-----------------------------------

function onTrigger(player,npc)
	player:startEvent(0x0082);
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

