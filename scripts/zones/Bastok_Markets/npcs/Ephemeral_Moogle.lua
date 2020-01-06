-----------------------------------
-- Area: Bastok Markets
--  NPC: Ephemeral Moogle
-- Type: Crystal Strage NPC
-- !pos -185.750 -2.000 -3.860 230
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