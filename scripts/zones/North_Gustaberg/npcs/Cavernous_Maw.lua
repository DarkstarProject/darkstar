-----------------------------------
-- Area: North Gustaberg
--  NPC: Cavernous Maw
-- !pos 466 0 479 106
-- Teleports Players to North Gustaberg [S]
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