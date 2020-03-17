-----------------------------------
-- Area: Attohwa Chasm
--  NPC: Excavation Point
-----------------------------------
require("scripts/globals/helm")
-----------------------------------

function onTrade(player,npc,trade)
    tpz.helm.onTrade(player, npc, trade, tpz.helm.type.EXCAVATION, 10)
end

function onTrigger(player,npc)
    tpz.helm.onTrigger(player, tpz.helm.type.EXCAVATION)
end

function onEventUpdate(player,csid,option)
end

function onEventFinish(player,csid,option)
end