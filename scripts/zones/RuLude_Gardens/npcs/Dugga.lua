----------------------------------
-- Area: Ru'Lude Gardens
--  NPC: Dugga
-- Type: Item Deliverer
-- !pos -55.429 5.999 1.27 243
--
-----------------------------------
local ID = require("scripts/zones/RuLude_Gardens/IDs");
-----------------------------------

function onTrade(player,npc,trade)
end;

function onTrigger(player,npc)
    player:showText(npc, ID.text.ITEM_DELIVERY_DIALOG);
    player:openSendBox();
end;

function onEventUpdate(player,csid,option)
end;

function onEventFinish(player,csid,option)
end;
