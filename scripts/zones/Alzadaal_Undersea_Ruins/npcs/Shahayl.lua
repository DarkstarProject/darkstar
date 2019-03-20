-----------------------------------
-- Area: Area: Alzadaal Undersea Ruins
--  NPC: Shahayl
-- Type: Assault Armband Giver
-- !pos 145 0 31 28
-----------------------------------
local ID = require("scripts/zones/Alzadaal_Undersea_Ruins/IDs")
require("scripts/globals/status")
require("scripts/globals/keyitems")
-----------------------------------

function onTrade(player,npc,trade)
end

function onTrigger(player,npc)
    local standing = player:getCurrency("imperial_standing")
    local tokens = player:getCurrency("nyzul_isle_assault_point")
    local floorProgress = player:getVar("NyzulFloorProgress")
    local cost = 0
    
    if standing >= 50 then
        cost = 50
    end
    
    if player:hasKeyItem(dsp.ki.NYZUL_ISLE_ASSAULT_ORDERS) and not player:hasKeyItem(dsp.ki.ASSAULT_ARMBAND) then
        player:startEvent(412,cost,tokens,floorProgress,standing,100,0,0,11)
    else
        player:startEvent(413)
    end
end

function onEventUpdate(player,csid,option)
end

function onEventFinish(player,csid,option)
    if csid == 412 and option == 1 then
        player:delCurrency("imperial_standing", 50)
        player:addKeyItem(dsp.ki.ASSAULT_ARMBAND)
        player:messageSpecial(ID.text.KEYITEM_OBTAINED,dsp.ki.ASSAULT_ARMBAND)
    end
end