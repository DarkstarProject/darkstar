-----------------------------------
-- Area: Dynamis-Xarcabard
--  NPC: ??? (qm0)
-- Note: Spawns Dynamis Lord / Arch Dynamis Lord
-----------------------------------
require("scripts/globals/dynamis")
-----------------------------------

function onTrade(player, npc, trade)
    dynamis.qmOnTrade(player, npc, trade)
end

function onTrigger(player, npc)
    dynamis.qmOnTrigger(player, npc)
end
