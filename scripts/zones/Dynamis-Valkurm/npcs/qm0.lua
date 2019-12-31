-----------------------------------
-- Area: Dynamis-Valkurm
--  NPC: ??? (qm0)
-- Note: Spawns Cirrate Christelle / Arch Christelle
-----------------------------------
require("scripts/globals/dynamis")
-----------------------------------

function onTrade(player, npc, trade)
    dynamis.qmOnTrade(player, npc, trade)
end

function onTrigger(player, npc)
    dynamis.qmOnTrigger(player, npc)
end
