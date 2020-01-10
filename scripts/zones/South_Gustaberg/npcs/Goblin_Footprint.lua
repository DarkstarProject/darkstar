-----------------------------------
-- Area: South Gustaberg
--  NPC: Goblin Footprint
-- Type: NPC
-- !pos  274.225 0.242 -192.041 107
-----------------------------------
require("scripts/globals/goblinfootprint")
-----------------------------------

function onTrade(player, npc, trade)
    dsp.goblinfootprint.rewatch(player)
end

function onTrigger(player, npc)
    dsp.goblinfootprint.rewatch(player, true)
end

function onEventUpdate(player,csid,option)
end

function onEventFinish(player, csid, option)
    dsp.goblinfootprint.startEvent(player, csid, option)
end