-----------------------------------
-- Area: Winurst Waters
--  NPC: Ephemeral Moogle
-- Type: Crystal Strage NPC
-- !pos -117.250 -2.000 60.890 238
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