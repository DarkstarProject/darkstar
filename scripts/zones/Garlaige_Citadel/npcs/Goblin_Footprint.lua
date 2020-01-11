-----------------------------------
-- Area: Garlaige Citadel
--  NPC: Goblin Footprint
-- Type: NPC
-- !pos  -382.632 -6.999 372.181 200
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