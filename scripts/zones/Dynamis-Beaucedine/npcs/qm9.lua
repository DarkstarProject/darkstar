-----------------------------------
-- Area: Dynamis-Beaucedine
--  NPC: ??? (qm9)
-- Note: Spawns Dagourmarche
-----------------------------------
require("scripts/globals/dynamis")
-----------------------------------

function onTrade(player, npc, trade)
    dynamis.qmOnTrade(player, npc, trade)
end

function onTrigger(player, npc)
    dynamis.qmOnTrigger(player, npc)
end
