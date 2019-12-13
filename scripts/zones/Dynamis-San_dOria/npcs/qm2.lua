-----------------------------------
-- Area: Dynamis-San_dOria
--  NPC: ??? (qm2)
-- Note: Spawns Steelshank Kratzvatz
-----------------------------------
require("scripts/globals/dynamis")
-----------------------------------

function onTrade(player, npc, trade)
    dynamis.qmOnTrade(player, npc, trade)
end

function onTrigger(player, npc)
    dynamis.qmOnTrigger(player, npc)
end
