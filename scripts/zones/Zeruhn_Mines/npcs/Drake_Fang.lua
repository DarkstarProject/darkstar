-----------------------------------
--  Area: Zeruhn Mines
--   NPC: Drake Fang
--  Type: Mission NPC
-- @zone: 172
--  @pos: -77.049 -0.993 59.073
--
-- Auto-Script: Requires Verification (Verified by Brawndo)
-----------------------------------

package.loaded["scripts/zones/Zeruhn_Mines/TextIDs"] = nil;
require("scripts/zones/Zeruhn_Mines/TextIDs");

-----------------------------------
-- onTrade Action
-----------------------------------

function onTrade(player,npc,trade)
end;

-----------------------------------
-- onTrigger Action
-----------------------------------

function onTrigger(player,npc)
	player:startEvent(0x006c);
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

