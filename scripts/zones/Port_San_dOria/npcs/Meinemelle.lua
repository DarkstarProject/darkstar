-----------------------------------
-- Area: Port San d'Oria
--   NPC: Meinemelle
-- Type: Standard NPC
-- !pos -8.289 -9.3 -146.093 232
--
-- Auto-Script: Requires Verification (Verified by Brawndo)
-----------------------------------
local ID = require("scripts/zones/Port_San_dOria/IDs");
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
