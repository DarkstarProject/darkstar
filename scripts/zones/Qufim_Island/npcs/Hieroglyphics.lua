-----------------------------------
-- Area: Qufim_Island
--  NPC: Hieroglyphics
-- Dynamis Qufim Entrance
-- !pos 16 -19 162 126
-----------------------------------
require("scripts/globals/dynamis")
-----------------------------------

function onTrade(player, npc, trade)
end

function onTrigger(player, npc)
    dynamis.entryNpcOnTrigger(player, npc)
end

function onEventUpdate(player, csid, option)
end

function onEventFinish(player, csid, option)
    dynamis.entryNpcOnEventFinish(player, csid, option)
end
