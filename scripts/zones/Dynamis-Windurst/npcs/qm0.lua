-----------------------------------
-- Area: Dynamis-Windurst
--  NPC: ??? (qm0)
-- Note: Spawns Tzee Xicu Idol / Arch Tzee Xicu Idol
-----------------------------------
require("scripts/globals/dynamis")
-----------------------------------

function onTrade(player, npc, trade)
    dynamis.qmOnTrade(player, npc, trade)
end

function onTrigger(player, npc)
    dynamis.qmOnTrigger(player, npc)
end
