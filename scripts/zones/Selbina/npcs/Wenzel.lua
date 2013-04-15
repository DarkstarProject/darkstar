----------------------------------
--  Area: Selbina
--  NPC: Wenzel
--  Type: Item Deliverer
--  @zone: 248
--  @pos: 31.961 -14.661 57.997
--
-----------------------------------

package.loaded["scripts/zones/Selbina/TextIDs"] = nil;
require("scripts/zones/Selbina/TextIDs");

-----------------------------------
-- onTrade Action
-----------------------------------

function onTrade(player,npc,trade)
end;

-----------------------------------
-- onTrigger Action
-----------------------------------

function onTrigger(player,npc)
	player:showText(npc, WENZEL_DELIVERY_DIALOG);
	player:openSendBox();
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

