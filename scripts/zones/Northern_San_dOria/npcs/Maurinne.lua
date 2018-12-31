-----------------------------------
-- Area: Northern San d'Oria
--  NPC: Maurinne
-- Type: Standard Dialogue NPC
-- !pos -127.185 0.000 179.193 231
--
-----------------------------------
local ID = require("scripts/zones/Northern_San_dOria/IDs");
-----------------------------------

function onTrade(player,npc,trade)
end;

function onTrigger(player,npc)
    player:showText(npc,ID.text.MAURINNE_DIALOG);
end;

function onEventUpdate(player,csid,option)
end;

function onEventFinish(player,csid,option)
end;
