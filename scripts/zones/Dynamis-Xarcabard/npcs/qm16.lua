-----------------------------------
-- Area: Dynamis-Xarcabard
--  NPC: ??? (qm16)
-- Note: Spawns Animated Staff
-----------------------------------
require("scripts/globals/dynamis")
-----------------------------------

function onTrade(player, npc, trade)
    dynamis.qmOnTrade(player, npc, trade)
end

function onTrigger(player, npc)
    dynamis.qmOnTrigger(player, npc)
end
