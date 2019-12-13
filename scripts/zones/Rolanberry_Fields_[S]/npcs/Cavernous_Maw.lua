-----------------------------------
-- Area: Rolanberry Fields [S]
--  NPC: Cavernous Maw
-- !pos -198 8 360 91
-- Teleports Players to Rolanberry Fields
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