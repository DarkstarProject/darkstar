-----------------------------------
-- Area: West Ronfaure
--  NPC: Laillera
-- !pos -127.297 -62.000 266.800 100
-----------------------------------
local ID = require("scripts/zones/West_Ronfaure/IDs")
-----------------------------------

function onTrade(player, npc, trade)
end

function onTrigger(player, npc)
    player:showText(npc, ID.text.LAILLERA_DIALOG)
end

function onEventUpdate(player, csid, option)
end

function onEventFinish(player, csid, option)
end
