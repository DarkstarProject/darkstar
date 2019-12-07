-----------------------------------
-- Area: Throne Room
-- Name: Mission 5-2
-- !pos -111 -6 0.1 165
-----------------------------------
local ID = require("scripts/zones/Throne_Room/IDs")
require("scripts/globals/battlefield")
require("scripts/globals/keyitems")
require("scripts/globals/missions")
-----------------------------------

function onBattlefieldTick(battlefield, tick)
    dsp.battlefield.onBattlefieldTick(battlefield, tick)
end

function onBattlefieldInitialise(battlefield)
    battlefield:setLocalVar("loot", 1)
    battlefield:setLocalVar("lootSpawned", 1)
end

function onBattlefieldRegister(player, battlefield)
end

function onBattlefieldEnter(player, battlefield)
end

function onBattlefieldLeave(player, battlefield, leavecode)
    if leavecode == dsp.battlefield.leaveCode.WON then -- play end CS. Need time and battle id for record keeping + storage
        local name, clearTime, partySize = battlefield:getRecord()
        local arg8 = player:hasCompletedMission(player:getNation(), 15) and 1 or 0
        player:startEvent(32001, battlefield:getArea(), clearTime, partySize, battlefield:getTimeInside(), 1, battlefield:getLocalVar("[cs]bit"), arg8)
    elseif leavecode == dsp.battlefield.leaveCode.LOST then
        player:startEvent(32002)
    end
end

function onEventUpdate(player, csid, option)
end

function onEventFinish(player, csid, option)
    if csid == 32001 and player:getCurrentMission(player:getNation()) == 15 and player:getCharVar("MissionStatus") == 3 then
        if player:getCurrentMission(ZILART) ~= dsp.mission.id.zilart.THE_NEW_FRONTIER and not player:hasCompletedMission(ZILART, dsp.mission.id.zilart.THE_NEW_FRONTIER) then
            -- Don't add missions we already completed. Players who change nation will hit this.
            player:addMission(ZILART, dsp.mission.id.zilart.THE_NEW_FRONTIER)
        end
        player:startEvent(7)
    elseif csid == 7 then
        player:addKeyItem(dsp.ki.SHADOW_FRAGMENT)
        player:messageSpecial(ID.text.KEYITEM_OBTAINED, dsp.ki.SHADOW_FRAGMENT)
        player:setCharVar("MissionStatus", 4)
        player:setPos(378, -12, -20, 125, 161)
    end
end
