----------------------------------
-- Area: Ru'Lude Gardens
--  NPC: Ghye Dachanthu
-- Type: Item Deliverer
-- !pos -62.789 11.999 -25.959 243
--
-----------------------------------
package.loaded["scripts/zones/RuLude_Gardens/TextIDs"] = nil;
-----------------------------------
require("scripts/zones/RuLude_Gardens/TextIDs");
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

