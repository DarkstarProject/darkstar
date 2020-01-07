-----------------------------------
-- Area: Dynamis-Beaucedine
--  NPC: ??? (qm7)
-- Note: Spawns Mildaunegeux
-----------------------------------
require("scripts/globals/dynamis")
-----------------------------------

function onTrade(player, npc, trade)
    dynamis.qmOnTrade(player, npc, trade)
end

function onTrigger(player, npc)
    dynamis.qmOnTrigger(player, npc)
end
