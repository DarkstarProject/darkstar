----------------------------------
--  Area: Crawlers' Nest [S]
--  NPC: Chodopopo
--  Type: Item Deliverer
--  @zone: 171
--  @pos 100.528    -32.272    -58.739

--
-----------------------------------

package.loaded["scripts/zones/Crawlers_Nest_[S]/TextIDs"] = nil;
require("scripts/zones/Crawlers_Nest_[S]/TextIDs");

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

