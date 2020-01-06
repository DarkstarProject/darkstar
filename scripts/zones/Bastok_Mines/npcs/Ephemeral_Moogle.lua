-----------------------------------
-- Area: Bastok Mines
--  NPC: Ephemeral Moogle
-- Type: Crystal Strage NPC
-- !pos 118.870 2.020 4.290 234
-----------------------------------
require("scripts/globals/ephemeral")

function onTrade(player, npc, trade)
    dsp.ephemeral.onTrade(player, npc, trade)
end

function onTrigger(player, npc)
    dsp.ephemeral.onTrigger(player, npc)
end

function onEventUpdate(player, csid, option)
    dsp.ephemeral.onEventUpdate(player)
end

function onEventFinish(player, csid, option)
    dsp.ephemeral.onEventFinish(player, csid, option)
end