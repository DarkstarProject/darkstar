-----------------------------------
-- Area: Northern San d'Oria
--  NPC: Pepigort
-- Type: Standard Dialogue NPC
-- !pos -126.739 11.999 262.757 231
--
-----------------------------------
local ID = require("scripts/zones/Northern_San_dOria/IDs");
-----------------------------------

function onTrade(player,npc,trade)
end;

function onTrigger(player,npc)
    player:showText(npc,ID.text.PEPIGORT_DIALOG);
end;

function onEventUpdate(player,csid,option)
end;

function onEventFinish(player,csid,option)
end;
