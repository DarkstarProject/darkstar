-----------------------------------
-- Area: Dynamis-San_dOria
--  NPC: ??? (qm1)
-- Note: Spawns Bladeburner Rokgevok
-----------------------------------
require("scripts/globals/dynamis")
-----------------------------------

function onTrade(player, npc, trade)
    dynamis.qmOnTrade(player, npc, trade)
end

function onTrigger(player, npc)
    dynamis.qmOnTrigger(player, npc)
end
