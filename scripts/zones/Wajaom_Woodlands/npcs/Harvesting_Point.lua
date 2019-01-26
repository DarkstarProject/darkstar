-----------------------------------
-- Area: Wajaom Woodlands
--  NPC: Harvesting Point
-----------------------------------
require("scripts/globals/helm")
-----------------------------------

function onTrade(player,npc,trade)
    dsp.helm.onTrade(player, npc, trade, dsp.helm.type.HARVESTING, 507)
end

function onTrigger(player,npc)
    dsp.helm.onTrigger(player, dsp.helm.type.HARVESTING)
end

function onEventUpdate(player,csid,option)
end

function onEventFinish(player,csid,option)
end