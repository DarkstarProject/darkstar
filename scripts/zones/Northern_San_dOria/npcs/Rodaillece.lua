-----------------------------------
-- Area: Northern San d'Oria
--  NPC: Rodaillece
-- Type: Standard Dialogue NPC
-- !pos -246.943 7.000 46.836 231
--
-----------------------------------
local ID = require("scripts/zones/Northern_San_dOria/IDs");
-----------------------------------

function onTrade(player,npc,trade)
end;

function onTrigger(player,npc)
    player:showText(npc,ID.text.RODAILLECE_DIALOG);
end;

function onEventUpdate(player,csid,option)
end;

function onEventFinish(player,csid,option)
end;
