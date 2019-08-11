-----------------------------------
-- Area: Dynamis-Qufim
--  NPC: ??? (qm0)
-- Note: Spawns Antaeus / Arch Antaeus
-----------------------------------
require("scripts/globals/dynamis")
-----------------------------------

function onTrade(player, npc, trade)
    dynamis.qmOnTrade(player, npc, trade)
end

function onTrigger(player, npc)
    dynamis.qmOnTrigger(player, npc)
end
