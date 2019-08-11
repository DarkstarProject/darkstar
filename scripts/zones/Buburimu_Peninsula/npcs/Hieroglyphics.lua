-----------------------------------
-- Area: Buburimu_Peninsula
--  NPC: Hieroglyphics
-- Dynamis Buburimu Enter
-- !pos 163 0 -174 118
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
