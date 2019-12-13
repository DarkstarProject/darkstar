-----------------------------------
-- Temple of Uggalepih
-- Balga's Dais Mission Battlefield
-----------------------------------
local ID = require("scripts/zones/Sacrificial_Chamber/IDs")
require("scripts/globals/battlefield")
require("scripts/globals/keyitems")
require("scripts/globals/missions")
require("scripts/globals/titles")
-----------------------------------

function onBattlefieldTick(battlefield, tick)
    dsp.battlefield.onBattlefieldTick(battlefield, tick)
end

function onBattlefieldRegister(player, battlefield)
end

function onBattlefieldEnter(player, battlefield)
end

function onBattlefieldLeave(player, battlefield, leavecode)
    if leavecode == dsp.battlefield.leaveCode.WON then
        local name, clearTime, partySize = battlefield:getRecord()
        player:startEvent(32001, battlefield:getArea(), clearTime, partySize, battlefield:getTimeInside(), 1, battlefield:getLocalVar("[cs]bit"), 0)
    elseif leavecode == dsp.battlefield.leaveCode.LOST then
        player:startEvent(32002)
    end
end

function onEventUpdate(player, csid, option)
end

function onEventFinish(player, csid, option)
    if csid == 32001 then
        player:addTitle(dsp.title.BEARER_OF_THE_WISEWOMANS_HOPE)
        if player:getCurrentMission(ZILART) == dsp.mission.id.zilart.THE_TEMPLE_OF_UGGALEPIH then
            player:startEvent(7)
        end
    elseif csid == 7 then
        player:startEvent(8)
    elseif csid == 8 and player:getCurrentMission(ZILART) == dsp.mission.id.zilart.THE_TEMPLE_OF_UGGALEPIH then
        player:delKeyItem(dsp.ki.SACRIFICIAL_CHAMBER_KEY)
        player:addKeyItem(dsp.ki.DARK_FRAGMENT)
        player:messageSpecial(ID.text.KEYITEM_OBTAINED, dsp.ki.DARK_FRAGMENT)
        player:completeMission(ZILART, dsp.mission.id.zilart.THE_TEMPLE_OF_UGGALEPIH)
        player:addMission(ZILART, dsp.mission.id.zilart.HEADSTONE_PILGRIMAGE)
    end
end
