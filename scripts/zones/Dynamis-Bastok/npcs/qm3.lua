-----------------------------------
-- Area: Dynamis-Bastok
--  NPC: ??? (qm3)
-- Note: Spawns Va'Zhe Pummelsong
-----------------------------------
require("scripts/globals/dynamis")
-----------------------------------

function onTrade(player, npc, trade)
    dynamis.qmOnTrade(player, npc, trade)
end

function onTrigger(player, npc)
    dynamis.qmOnTrigger(player, npc)
end
