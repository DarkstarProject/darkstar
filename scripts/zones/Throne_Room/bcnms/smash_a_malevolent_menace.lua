------------------------------------
-- Area: Throne Room
-- Name: Smash A Malevolent Menace
-----------------------------------
require("scripts/globals/keyitems");
require("scripts/globals/missions");
require("scripts/globals/battlefield")
-----------------------------------

function onBattlefieldTick(battlefield, tick)
    dsp.battlefield.onBattlefieldTick(battlefield, tick)
end

function onBattlefieldRegister(player,battlefield)
end

function onBattlefieldEnter(player,battlefield)
end

function onBattlefieldLeave(player,battlefield,leavecode)
    if leavecode == dsp.battlefield.leaveCode.WON then
        local name, clearTime, partySize = battlefield:getRecord()
        if (player:hasCompletedMission(AMK, 14)) then
            player:startEvent(32001, battlefield:getArea(), clearTime, partySize, battlefield:getTimeInside(), 1, battlefield:getLocalVar("[cs]bit"), 1)
        else
            player:startEvent(32001, battlefield:getArea(), clearTime, partySize, battlefield:getTimeInside(), 1, battlefield:getLocalVar("[cs]bit"), 0)
        end
    elseif leavecode == dsp.battlefield.leaveCode.LOST then
        player:startEvent(32002);
    end
end

function onEventUpdate(player,csid,option)
end

function onEventFinish(player,csid,option)
    -- If !Mission status 15
    -- player:startEvent(5);
    -- After CS set mission status to 15
end