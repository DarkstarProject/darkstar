-----------------------------------
-- Area: Dynamis-Bastok
--  NPC: ??? (qm0)
-- Note: Spawns Gu'Dha Effigy / Arch Gu'Dha Effigy
-----------------------------------
require("scripts/globals/dynamis")
-----------------------------------

function onTrade(player, npc, trade)
    dynamis.qmOnTrade(player, npc, trade)
end

function onTrigger(player, npc)
    dynamis.qmOnTrigger(player, npc)
end
