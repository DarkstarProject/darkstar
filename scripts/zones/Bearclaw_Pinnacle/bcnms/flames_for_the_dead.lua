-----------------------------------
-- Flames for the Dead
-- Bearclaw Pinnacle mission battlefield
-----------------------------------
require("scripts/globals/battlefield")
require("scripts/globals/missions")
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
        local arg8 = (player:getCurrentMission(COP) ~= dsp.mission.id.cop.THREE_PATHS or player:getCharVar("COP_Ulmia_s_Path") ~= 6) and 1 or 0
        player:startEvent(32001, battlefield:getArea(), clearTime, partySize, battlefield:getTimeInside(), 1, battlefield:getLocalVar("[cs]bit"), arg8)
    elseif leavecode == dsp.battlefield.leaveCode.LOST then
        player:startEvent(32002)
    end
end

function onEventUpdate(player, csid, option)
end

function onEventFinish(player, csid, option)
    if csid == 32001 then
        if player:getCurrentMission(COP) == dsp.mission.id.cop.THREE_PATHS and player:getCharVar("COP_Ulmia_s_Path") == 6 then
            player:setCharVar("COP_Ulmia_s_Path", 7)
        end
        player:addExp(1000)
    end
end
