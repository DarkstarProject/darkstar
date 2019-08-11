-----------------------------------
-- Area: Dynamis-Bastok
--  NPC: ??? (qm2)
-- Note: Spawns Ra'Gho Darkfount
-----------------------------------
require("scripts/globals/dynamis")
-----------------------------------

function onTrade(player, npc, trade)
    dynamis.qmOnTrade(player, npc, trade)
end

function onTrigger(player, npc)
    dynamis.qmOnTrigger(player, npc)
end
