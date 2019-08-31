-----------------------------------
-- Area: Dynamis-Xarcabard
--  NPC: ??? (qm20)
-- Note: Spawns Animated Shield
-----------------------------------
require("scripts/globals/dynamis")
-----------------------------------

function onTrade(player, npc, trade)
    dynamis.qmOnTrade(player, npc, trade)
end

function onTrigger(player, npc)
    dynamis.qmOnTrigger(player, npc)
end
