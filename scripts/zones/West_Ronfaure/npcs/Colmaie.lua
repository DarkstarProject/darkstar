-----------------------------------
-- Area: West Ronfaure
--  NPC: Colmaie
-- Type: Standard NPC
-- !pos -133.627 -61.999 272.373 100
-----------------------------------
local ID = require("scripts/zones/West_Ronfaure/IDs")
require("scripts/globals/quests")
-----------------------------------

function onTrade(player, npc, trade)
end

function onTrigger(player, npc)
    player:showText(npc, ID.text.COLMAIE_DIALOG)
end

function onEventUpdate(player, csid, option)
end

function onEventFinish(player, csid, option)
end
