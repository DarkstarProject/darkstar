-----------------------------------
-- Area: La Theine Plateau
--  NPC: Goblin Footprint
-- Type: NPC
-- !pos  -546.156 -3.934 651.590 102
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