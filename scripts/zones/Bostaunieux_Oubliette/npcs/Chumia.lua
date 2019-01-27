-----------------------------------
-- Area: Bostaunieux Oubliette
--  NPC: Chumia
-- Type: Standard NPC
-- !pos 102.420 -25.001 70.457 167
-----------------------------------
local ID = require("scripts/zones/Bostaunieux_Oubliette/IDs")
-----------------------------------

function onTrade(player, npc, trade)
end

function onTrigger(player, npc)
    player:showText(npc, ID.text.CHUMIA_DIALOG)
end

function onEventUpdate(player, csid, option)
end

function onEventFinish(player, csid, option)
end
