-----------------------------------
-- Area: Tavnazian_Safehold
--  NPC: Hieroglyphics
-- Notes: Dynamis Tavnazia Enter
-- !pos 3.674 -7.278 -27.856 26
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
