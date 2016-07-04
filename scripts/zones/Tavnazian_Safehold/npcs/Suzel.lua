----------------------------------
--  Area: Tavnazian Safehold
--  NPC: Suzel
--  Type: Item Deliverer
--  @zone: 26
--  @pos -72.701 -20.25 -64.058
--
-----------------------------------

package.loaded["scripts/zones/Tavnazian_Safehold/TextIDs"] = nil;
require("scripts/zones/Tavnazian_Safehold/TextIDs");

-----------------------------------
-- onTrade Action
-----------------------------------

function onTrade(player,npc,trade)
end;

-----------------------------------
-- onTrigger Action
-----------------------------------

function onTrigger(player,npc)
    player:showText(npc, ITEM_DELIVERY_DIALOG);
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

