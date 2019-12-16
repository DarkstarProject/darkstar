-----------------------------------
-- Area: Sealion's Den
-- Name: One to be Feared
-----------------------------------
require("scripts/globals/battlefield")
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
    if leavecode == dsp.battlefield.leaveCode.WON then
        local name, clearTime, partySize = battlefield:getRecord()
        local arg8 = (player:getCurrentMission(COP) ~= dsp.mission.id.cop.ONE_TO_BE_FEARED or player:getCharVar("PromathiaStatus") ~= 2) and 1 or 0
        player:startEvent(32001, battlefield:getArea(), clearTime, partySize, battlefield:getTimeInside(), 1, battlefield:getLocalVar("[cs]bit"), arg8)
    elseif leavecode == dsp.battlefield.leaveCode.LOST then
        player:startEvent(32002)
    end
end

function onEventUpdate(player, csid, option)
end

function onEventFinish(player, csid, option)
    if csid == 32001 then
        if player:getCurrentMission(COP) == dsp.mission.id.cop.ONE_TO_BE_FEARED and player:getCharVar("PromathiaStatus") == 2 then
            player:completeMission(COP, dsp.mission.id.cop.ONE_TO_BE_FEARED)
            player:addMission(COP, dsp.mission.id.cop.CHAINS_AND_BONDS)
            player:setCharVar("PromathiaStatus", 0)
        end
        player:addExp(1500)
        player:setPos(438, 0, -18, 11, 24) -- Lufaise
    end
end
