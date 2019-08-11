-----------------------------------
-- Area: Dynamis-Xarcabard
--  NPC: ??? (qm10)
-- Note: Spawns Animated Great Axe
-----------------------------------
require("scripts/globals/dynamis")
-----------------------------------

function onTrade(player, npc, trade)
    dynamis.qmOnTrade(player, npc, trade)
end

function onTrigger(player, npc)
    dynamis.qmOnTrigger(player, npc)
end
