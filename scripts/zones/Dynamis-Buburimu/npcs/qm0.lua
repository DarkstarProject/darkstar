-----------------------------------
-- Area: Dynamis-Buburimu
--  NPC: ??? (qm0)
-- Note: Spawns Apocalyptic Beast / Arch Apocalyptic Beast
-----------------------------------
require("scripts/globals/dynamis")
-----------------------------------

function onTrade(player, npc, trade)
    dynamis.qmOnTrade(player, npc, trade)
end

function onTrigger(player, npc)
    dynamis.qmOnTrigger(player, npc)
end
