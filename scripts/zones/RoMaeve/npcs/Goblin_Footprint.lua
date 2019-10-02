-----------------------------------
-- Area: RoMaeve
--  NPC: Goblin Footprint
-- Type: NPC
-- !pos  8.793 -8.000 -144.479 122
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