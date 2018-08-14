----------------------------------
-- Area: Crawlers' Nest [S]
--  NPC: Chodopopo
-- Type: Item Deliverer
-- !pos 100.528 -32.272 -58.739 171
--
-----------------------------------
package.loaded["scripts/zones/Crawlers_Nest_[S]/TextIDs"] = nil;
-----------------------------------
require("scripts/zones/Crawlers_Nest_[S]/TextIDs");
-----------------------------------

function onTrade(player,npc,trade)
end;

function onTrigger(player,npc)
    player:showText(npc, ITEM_DELIVERY_DIALOG);
    player:openSendBox();
end;

function onEventUpdate(player,csid,option)
end;

function onEventFinish(player,csid,option)
end;

