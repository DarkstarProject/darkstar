-----------------------------------
-- Area: Dynamis-Jeuno
--  NPC: ??? (qm3)
-- Note: Spawns Scourquix Scaleskin
-----------------------------------
require("scripts/globals/dynamis")
-----------------------------------

function onTrade(player, npc, trade)
    dynamis.qmOnTrade(player, npc, trade)
end

function onTrigger(player, npc)
    dynamis.qmOnTrigger(player, npc)
end
