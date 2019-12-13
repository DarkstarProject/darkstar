-----------------------------------
-- Area: Dynamis-Xarcabard
--  NPC: ??? (qm1)
-- Note: Spawns Duke Haures
-----------------------------------
require("scripts/globals/dynamis")
-----------------------------------

function onTrade(player, npc, trade)
    dynamis.qmOnTrade(player, npc, trade)
end

function onTrigger(player, npc)
    dynamis.qmOnTrigger(player, npc)
end
