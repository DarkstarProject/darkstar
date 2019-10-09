-----------------------------------
-- Area: Dynamis-Jeuno
--  NPC: ??? (qm0)
-- Note: Spawns Goblin Golem / Arch Goblin Golem
-----------------------------------
require("scripts/globals/dynamis")
-----------------------------------

function onTrade(player, npc, trade)
    dynamis.qmOnTrade(player, npc, trade)
end

function onTrigger(player, npc)
    dynamis.qmOnTrigger(player, npc)
end
