-----------------------------------
-- Area: Dynamis-San_dOria
--  NPC: ??? (qm4)
-- Note: Spawns Spellspear Djokvukk
-----------------------------------
require("scripts/globals/dynamis")
-----------------------------------

function onTrade(player, npc, trade)
    dynamis.qmOnTrade(player, npc, trade)
end

function onTrigger(player, npc)
    dynamis.qmOnTrigger(player, npc)
end
