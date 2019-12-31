-----------------------------------
-- Area: Ifrit's Cauldron
--  NPC: Treasure Coffer
-- !zone 205
-----------------------------------
require("scripts/globals/treasure")
-----------------------------------

function onTrade(player, npc, trade)
    dsp.treasure.onTrade(player, npc, trade, dsp.treasure.type.COFFER)
end

function onTrigger(player, npc)
    dsp.treasure.onTrigger(player, dsp.treasure.type.COFFER)
end

function onEventUpdate(player, csid, option)
end

function onEventFinish(player, csid, option)
end