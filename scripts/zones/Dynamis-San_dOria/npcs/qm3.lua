-----------------------------------
-- Area: Dynamis-San_dOria
--  NPC: ??? (qm3)
-- Note: Spawns Bloodfist Voshgrosh
-----------------------------------
require("scripts/globals/dynamis")
-----------------------------------

function onTrade(player, npc, trade)
    dynamis.qmOnTrade(player, npc, trade)
end

function onTrigger(player, npc)
    dynamis.qmOnTrigger(player, npc)
end
