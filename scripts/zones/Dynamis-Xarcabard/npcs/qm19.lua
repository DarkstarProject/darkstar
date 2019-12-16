-----------------------------------
-- Area: Dynamis-Xarcabard
--  NPC: ??? (qm19)
-- Note: Spawns Animated Horn
-----------------------------------
require("scripts/globals/dynamis")
-----------------------------------

function onTrade(player, npc, trade)
    dynamis.qmOnTrade(player, npc, trade)
end

function onTrigger(player, npc)
    dynamis.qmOnTrigger(player, npc)
end
