-----------------------------------
--  Area: Metalworks
--   NPC: Invincible Shield
--  Type: Ballista
-- @zone: 237
--  @pos: -51.083 -11 2.126
--
-- Auto-Script: Requires Verification (Verified by Brawndo)
-----------------------------------

package.loaded["scripts/zones/Metalworks/TextIDs"] = nil;
require("scripts/zones/Metalworks/TextIDs");

-----------------------------------
-- onTrade Action
-----------------------------------

function onTrade(player,npc,trade)
end;

-----------------------------------
-- onTrigger Action
-----------------------------------

function onTrigger(player,npc)
	player:startEvent(0x032a);
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

