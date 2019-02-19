-----------------------------------
-- Area: Alzadaal Undersea Ruins
-- Door: Gilded Doors (North)
-- !pos 180 0 79 72
-----------------------------------
require("scripts/globals/keyitems")
require("scripts/globals/besieged")
local ID = require("scripts/zones/Alzadaal_Undersea_Ruins/IDs")
-----------------------------------

function onTrigger(player,npc)
    if player:hasKeyItem(dsp.keyItem.NYZUL_ISLE_ASSAULT_ORDERS) then
        player:messageSpecial(ID.text.CANNOT_LEAVE, dsp.keyItem.NYZUL_ISLE_ASSAULT_ORDERS)
    elseif player:getZPos() >= 77 and player:getZPos() <= 79 then
        player:messageSpecial(ID.text.STAGING_POINT)
        player:messageSpecial(ID.text.IMPERIAL_CONTROL)
        player:startEvent(107)
    elseif player:getZPos() >= 80 and player:getZPos() <= 82 then
        player:messageSpecial(ID.text.STAGING_POINT)
        player:messageSpecial(ID.text.IMPERIAL_CONTROL)
        player:startEvent(106)
    else
        player:messageSpecial(ID.text.MOVE_CLOSER)
    end
end

function onEventUpdate(player,csid,option,target)
end

function onEventFinish(player,csid,option,target)
end