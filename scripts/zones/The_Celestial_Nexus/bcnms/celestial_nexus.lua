-----------------------------------
-- Area: The Celestial Nexus
-- Name: The Celestial Nexus (ZM16)
-----------------------------------
require("scripts/globals/battlefield")
require("scripts/globals/missions")
require("scripts/globals/titles")
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
        local arg8 = (player:hasCompletedMission(ZILART, dsp.mission.id.zilart.THE_CELESTIAL_NEXUS)) and 1 or 0
        player:startEvent(32001, battlefield:getArea(), clearTime, partySize, battlefield:getTimeInside(), 1, battlefield:getLocalVar("[cs]bit"), arg8)
    elseif leavecode == dsp.battlefield.leaveCode.LOST then
        player:startEvent(32002)
    end
end

function onEventUpdate(player, csid, option)
end

function onEventFinish(player, csid, option)
    if csid == 32001 then
        if player:getCurrentMission(ZILART) == dsp.mission.id.zilart.THE_CELESTIAL_NEXUS then
            player:completeMission(ZILART, dsp.mission.id.zilart.THE_CELESTIAL_NEXUS)
            player:addMission(ZILART, dsp.mission.id.zilart.AWAKENING)
            player:addTitle(dsp.title.BURIER_OF_THE_ILLUSION)
            player:setCharVar("ZilartStatus", 0)
        end
        player:setPos(0, -18, 137, 64, 251) -- Hall of the Gods
    end
end
