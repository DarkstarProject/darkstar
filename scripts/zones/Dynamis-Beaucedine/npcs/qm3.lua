-----------------------------------
-- Area: Dynamis-Beaucedine
--  NPC: ??? (qm3)
-- Note: Spawns Hitaume
-----------------------------------
require("scripts/globals/dynamis")
-----------------------------------

function onTrade(player, npc, trade)
    dynamis.qmOnTrade(player, npc, trade)
end

function onTrigger(player, npc)
    dynamis.qmOnTrigger(player, npc)
end
