-----------------------------------
-- Area: Dynamis-Tavnazia
--  NPC: ??? (qm0)
-- Note: Spawns Diabolos [Spade|Heart|Diamond|Club] / Diabolos [Somnus|Nox|Umbra|Letum]
-----------------------------------
require("scripts/globals/dynamis")
-----------------------------------

function onTrade(player, npc, trade)
    dynamis.qmOnTrade(player, npc, trade)
end

function onTrigger(player, npc)
    dynamis.qmOnTrigger(player, npc)
end
