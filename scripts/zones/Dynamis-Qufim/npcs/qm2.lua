-----------------------------------
-- Area: Dynamis-Qufim
--  NPC: ??? (qm2)
-- Note: Spawns Lost Scolopendra
-----------------------------------
require("scripts/globals/dynamis")
-----------------------------------

function onTrade(player, npc, trade)
    dynamis.qmOnTrade(player, npc, trade)
end

function onTrigger(player, npc)
    dynamis.qmOnTrigger(player, npc)
end
