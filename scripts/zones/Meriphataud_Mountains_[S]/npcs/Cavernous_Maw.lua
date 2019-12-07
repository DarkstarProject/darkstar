-----------------------------------
-- Area: Meriphataud Mountains [S]
--  NPC: Cavernous Maw
-- !pos 597 -32 279 97
-- Teleports Players to Meriphataud Mountains
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