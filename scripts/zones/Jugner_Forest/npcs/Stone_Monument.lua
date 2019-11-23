-----------------------------------
-- Area: Jugner Forest
--  NPC: Stone Monument
-- Involved in quest "An Explorer's Footsteps"
-- !pos -65.976 -23.829 -661.362 104
-----------------------------------
require("scripts/globals/npc_util")
-----------------------------------

function onTrigger(player, npc)
    player:startEvent(900)
end

function onTrade(player, npc, trade)
    if npcUtil.tradeHas(trade, 571) and npcUtil.giveItem(player, 570) then
        player:setCharVar("anExplorer-CurrentTablet", 0x00010)
        player:confirmTrade()
    end
end

function onEventUpdate(player, csid, option)
end

function onEventFinish(player, csid, option)
end