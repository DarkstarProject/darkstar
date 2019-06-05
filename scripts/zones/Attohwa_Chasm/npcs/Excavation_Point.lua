-----------------------------------
-- Area: Attohwa Chasm
--  NPC: Excavation Point
-----------------------------------
require("scripts/globals/helm")
-----------------------------------

function onTrade(player,npc,trade)
    dsp.helm.onTrade(player, npc, trade, dsp.helm.type.EXCAVATION, 10)
end

function onTrigger(player,npc)
    dsp.helm.onTrigger(player, dsp.helm.type.EXCAVATION)
end

function onEventUpdate(player,csid,option)
end

function onEventFinish(player,csid,option)
end