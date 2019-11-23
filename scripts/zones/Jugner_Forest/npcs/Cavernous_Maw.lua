-----------------------------------
-- Area: Jugner Forest
--  NPC: Cavernous Maw
-- Teleports Players to Jugner Forest [S]
-- !pos -118 -8 -518 104
-----------------------------------
require("scripts/globals/maws")
-----------------------------------

function onTrade(player, npc, trade)
end

function onTrigger(player, npc)
    dsp.maws.onTrigger(player, npc)
end

function onEventUpdate(player, csid, option)
end

function onEventFinish(player, csid, option)
    dsp.maws.onEventFinish(player, csid, option)
end