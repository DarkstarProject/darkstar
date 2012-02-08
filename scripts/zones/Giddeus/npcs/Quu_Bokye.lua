-----------------------------------
--  Area: Giddeus
--   NPC: Quu Bokye
--  Type: Quest NPC
-- @zone: 145
--  @pos: -159.715 16.132 181.504
--
-- Auto-Script: Requires Verification (Verified by Brawndo)
-----------------------------------

package.loaded["scripts/zones/Giddeus/TextIDs"] = nil;
require("scripts/zones/Giddeus/TextIDs");

-----------------------------------
-- onTrade Action
-----------------------------------

function onTrade(player,npc,trade)
end;

-----------------------------------
-- onTrigger Action
-----------------------------------

function onTrigger(player,npc)
	player:startEvent(0x0038); 
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

