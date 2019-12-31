-----------------------------------
-- Area: Yughott Grotto
--  NPC: Mining Point
-----------------------------------
require("scripts/globals/helm")
-----------------------------------

function onTrade(player, npc, trade)
    dsp.helm.onTrade(player, npc, trade, dsp.helm.type.MINING, 100)
end

function onTrigger(player, npc)
    dsp.helm.onTrigger(player, dsp.helm.type.MINING)
end

function onEventUpdate(player, csid, option)
end

function onEventFinish(player, csid, option)
end