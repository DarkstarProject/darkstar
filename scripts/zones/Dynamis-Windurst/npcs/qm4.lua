-----------------------------------
-- Area: Dynamis-Windurst
--  NPC: ??? (qm4)
-- Note: Spawns Tee Zaksa the Ceaseless
-----------------------------------
require("scripts/globals/dynamis")
-----------------------------------

function onTrade(player, npc, trade)
    dynamis.qmOnTrade(player, npc, trade)
end

function onTrigger(player, npc)
    dynamis.qmOnTrigger(player, npc)
end
