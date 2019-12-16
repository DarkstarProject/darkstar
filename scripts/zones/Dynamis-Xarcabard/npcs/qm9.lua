-----------------------------------
-- Area: Dynamis-Xarcabard
--  NPC: ??? (qm9)
-- Note: Spawns Animated Tabar
-----------------------------------
require("scripts/globals/dynamis")
-----------------------------------

function onTrade(player, npc, trade)
    dynamis.qmOnTrade(player, npc, trade)
end

function onTrigger(player, npc)
    dynamis.qmOnTrigger(player, npc)
end
