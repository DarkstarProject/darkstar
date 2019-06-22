-----------------------------------
-- Area: Mamook
--  NPC: Logging Point
-----------------------------------
require("scripts/globals/helm")
-----------------------------------

function onTrade(player,npc,trade)
    dsp.helm.onTrade(player, npc, trade, dsp.helm.type.LOGGING, 215)
end

function onTrigger(player,npc)
    dsp.helm.onTrigger(player, dsp.helm.type.LOGGING)
end

function onEventUpdate(player,csid,option)
end

function onEventFinish(player,csid,option)
end