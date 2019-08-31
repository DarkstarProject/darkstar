-----------------------------------
-- Area: Dynamis-Qufim
--  NPC: ??? (qm3)
-- Note: Spawns Lost Suttung
-----------------------------------
require("scripts/globals/dynamis")
-----------------------------------

function onTrade(player, npc, trade)
    dynamis.qmOnTrade(player, npc, trade)
end

function onTrigger(player, npc)
    dynamis.qmOnTrigger(player, npc)
end
