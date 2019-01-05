-----------------------------------
-- Area: Northern San d'Oria
--  NPC: Gilipese
-- Type: Standard Dialogue NPC
-- !pos -155.088 0.000 120.300 231
--
-----------------------------------
local ID = require("scripts/zones/Northern_San_dOria/IDs");
-----------------------------------

function onTrade(player,npc,trade)
end;

function onTrigger(player,npc)
    player:showText(npc,ID.text.GILIPESE_DIALOG);
end;

function onEventUpdate(player,csid,option)
end;

function onEventFinish(player,csid,option)
end;
