-----------------------------------
-- Area: Dynamis-Windurst
--  NPC: ??? (qm2)
-- Note: Spawns Fuu Tzapo the Blessed
-----------------------------------
require("scripts/globals/dynamis")
-----------------------------------

function onTrade(player, npc, trade)
    dynamis.qmOnTrade(player, npc, trade)
end

function onTrigger(player, npc)
    dynamis.qmOnTrigger(player, npc)
end
