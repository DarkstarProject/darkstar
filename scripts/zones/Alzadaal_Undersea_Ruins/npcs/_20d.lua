-----------------------------------
-- Area: Alzadaal Undersea Ruins
-- Door: Gilded Doors (South)
-- !pos 180 0 -39 62 72
-----------------------------------
require("scripts/globals/keyitems")
local ID = require("scripts/zones/Alzadaal_Undersea_Ruins/IDs")
-----------------------------------

function onTrigger(player, npc)
    if player:hasKeyItem(dsp.keyItem.NYZUL_ISLE_ASSAULT_ORDERS) then
        player:messageSpecial(ID.text.CANNOT_LEAVE, dsp.keyItem.NYZUL_ISLE_ASSAULT_ORDERS)
    elseif player:getZPos() >= -39.1 and player:getZPos() <= -37 then
        player:messageSpecial(ID.text.STAGING_POINT_NYZUL)
        player:messageSpecial(ID.text.IMPERIAL_CONTROL)
        player:startEvent(115)
    elseif player:getZPos() >= -42 and player:getZPos() <= -40 then
        player:messageSpecial(ID.text.STAGING_POINT_NYZUL)
        player:messageSpecial(ID.text.IMPERIAL_CONTROL)
        player:startEvent(114)
    else
        player:messageSpecial(ID.text.MOVE_CLOSER)
    end
end

function onEventUpdate(player, csid, option)
end

function onEventFinish(player, csid, option)
--[[    if csid == 114 and option == 0 then
        Todo add function that when entering staging point that a player looses all agro on mobs
    end]]
end