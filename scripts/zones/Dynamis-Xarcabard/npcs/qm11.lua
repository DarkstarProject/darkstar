-----------------------------------
-- Area: Dynamis-Xarcabard
--  NPC: ??? (qm11)
-- Note: Spawns Animated Spear
-----------------------------------
require("scripts/globals/dynamis")
-----------------------------------

function onTrade(player, npc, trade)
    dynamis.qmOnTrade(player, npc, trade)
end

function onTrigger(player, npc)
    dynamis.qmOnTrigger(player, npc)
end
