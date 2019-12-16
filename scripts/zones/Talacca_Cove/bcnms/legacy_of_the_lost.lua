-----------------------------------
-- Area: Talacca Cove
-- BCNM: TOAU-34 Legacy of the Lost
-----------------------------------
require("scripts/globals/battlefield")
require("scripts/globals/missions")
require("scripts/globals/titles")
----------------------------------------

function onBattlefieldTick(battlefield, tick)
    dsp.battlefield.onBattlefieldTick(battlefield, tick)
end

function onBattlefieldRegister(player, battlefield)
end

function onBattlefieldEnter(player, battlefield)
end

function onBattlefieldLeave(player, battlefield, leavecode)
    if leavecode == dsp.battlefield.leaveCode.WON then -- play end CS. Need time and battle id for record keeping + storage
        local name, clearTime, partySize = battlefield:getRecord()
        local arg8 = (player:hasCompletedMission(TOAU, dsp.mission.id.toau.LEGACY_OF_THE_LOST)) and 1 or 0
        player:startEvent(32001, battlefield:getArea(), clearTime, partySize, battlefield:getTimeInside(), 1, battlefield:getLocalVar("[cs]bit"), arg8)
    elseif leavecode == dsp.battlefield.leaveCode.LOST then
        player:startEvent(32002)
    end
end

function onEventUpdate(player, csid, option)
end

function onEventFinish(player, csid, option)
    if csid == 32001 and not player:hasCompletedMission(TOAU, dsp.mission.id.toau.LEGACY_OF_THE_LOST) then
        player:completeMission(TOAU, dsp.mission.id.toau.LEGACY_OF_THE_LOST)
        player:setTitle(dsp.title.GESSHOS_MERCY)
        player:addMission(TOAU, dsp.mission.id.toau.GAZE_OF_THE_SABOTEUR)
    end
end
