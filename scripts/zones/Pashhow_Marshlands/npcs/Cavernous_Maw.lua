-----------------------------------
-- Area: Pashhow Marshlands
--  NPC: Cavernous Maw
-- !pos 418 25 27 109
-- Teleports Players to Pashhow Marshlands [S]
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