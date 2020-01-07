-----------------------------------
-- Area: Dynamis-Bastok
--  NPC: ??? (qm4)
-- Note: Spawns Bu'Bho Truesteel
-----------------------------------
require("scripts/globals/dynamis")
-----------------------------------

function onTrade(player, npc, trade)
    dynamis.qmOnTrade(player, npc, trade)
end

function onTrigger(player, npc)
    dynamis.qmOnTrigger(player, npc)
end
