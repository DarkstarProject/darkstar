----------------------------------
--  Area: Windurst Walls
--  NPC: Selulu
--  Type: Item Deliverer
--  @zone: 239
--  @pos 58.027 -2.5 -60.548
--
-----------------------------------

package.loaded["scripts/zones/Windurst_Walls/TextIDs"] = nil;
require("scripts/zones/Windurst_Walls/TextIDs");

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

