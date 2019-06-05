-----------------------------------
-- Area: Ordelles Caves
--  NPC: Treasure Chest
-- Involved In Quest: Signed In Blood and The Goblin Tailor
-- !zone 193
-----------------------------------
require("scripts/globals/treasure")
-----------------------------------

function onTrade(player, npc, trade)
    dsp.treasure.onTrade(player, npc, trade, dsp.treasure.type.CHEST)
end

function onTrigger(player, npc)
    dsp.treasure.onTrigger(player, dsp.treasure.type.CHEST)
end

function onEventUpdate(player, csid, option)
end

function onEventFinish(player, csid, option)
end