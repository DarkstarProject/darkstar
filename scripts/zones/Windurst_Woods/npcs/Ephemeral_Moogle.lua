-----------------------------------
-- Area: Winurst Wood
--  NPC: Ephemeral Moogle
-- Type: Crystal Strage NPC
-- !pos -10.500 -5.250 -143.400 241 - Boneworker's Guild
-- !pos -34.840 -1.250 -114.490 241 - Weaver's Guild
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