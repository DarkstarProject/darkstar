-----------------------------------
-- Area: Jugner Forest (S)
--  NPC: Glowing Pebbles
-----------------------------------
require("scripts/globals/keyitems")
require("scripts/globals/npc_util")
-----------------------------------

function onTrade(player, npc, trade)
    if npcUtil.tradeHas(trade, 2558) and player:getVar("roadToDivadomCS") == 3 then
        player:startEvent(107)
    end
end

function onTrigger(player, npc)
    if player:getVar("Lakeside_Minuet_Progress") == 3 and not player:hasKeyItem(dsp.ki.STARDUST_PEBBLE) then
        player:startEvent(100)
    elseif player:getVar("roadToDivadomCS") == 2 then
        player:startEvent(106)
    end
end

function onEventUpdate(player, csid, option)
end

function onEventFinish(player, csid, option)
    if csid == 100 then
        npcUtil.giveKeyItem(player, dsp.ki.STARDUST_PEBBLE)
    elseif csid == 106 then
        player:setVar("roadToDivadomCS", 3)
    elseif csid == 107 then
        player:confirmTrade()
        player:setVar("roadToDivadomCS", 4)
    end
end
