-----------------------------------
--  Area: Feretory
--   NPC: Teyrnon
--  Type: Monstrsity Infamy point exchange npc
-- @zone: 285
--  @pos 
--
-- Auto-Script: Requires Verification
-----------------------------------

package.loaded["scripts/zones/Feretory/TextIDs"] = nil;
require("scripts/zones/Feretory/TextIDs");

-----------------------------------
-- onTrade Action
-----------------------------------

function onTrade(player,npc,trade)
end;

-----------------------------------
-- onTrigger Action
-----------------------------------

function onTrigger(player,npc)
	player:startEvent(0x0007);
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

