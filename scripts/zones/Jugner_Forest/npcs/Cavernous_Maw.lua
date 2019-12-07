-----------------------------------
-- Area: Jugner Forest
--  NPC: Cavernous Maw
-- !pos -118 -8 -518 104
-- Teleports Players to Jugner Forest [S]
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