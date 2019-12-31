-----------------------------------
-- Area: Dynamis-Beaucedine
--  NPC: ??? (qm0)
-- Note: Spawns Angra Mainyu / Arch Angra Mainyu
-----------------------------------
require("scripts/globals/dynamis")
-----------------------------------

function onTrade(player, npc, trade)
    dynamis.qmOnTrade(player, npc, trade)
end

function onTrigger(player, npc)
    dynamis.qmOnTrigger(player, npc)
end
