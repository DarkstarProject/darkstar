-----------------------------------
--  Area: Metalworks
--   NPC: Vicious Eye
--  Type: Guild Merchant
-- @zone: 237
--  @pos: -106.132 0.999 -28.757
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
	player:showText(npc, VICIOUS_EYE_SHOP_DIALOG);
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

