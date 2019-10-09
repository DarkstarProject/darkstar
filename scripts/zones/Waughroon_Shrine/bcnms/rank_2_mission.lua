-----------------------------------
-- Rank 2 Mission
-- Waughroon Shrine mission battlefield
-- !pos -345 104 -260 144
-----------------------------------
require("scripts/globals/battlefield")
require("scripts/globals/keyitems")
require("scripts/globals/missions")
require("scripts/globals/npc_util")
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
        local arg8 = player:hasCompletedMission(player:getNation(), 5) and 1 or 0
        player:startEvent(32001, battlefield:getArea(), clearTime, partySize, battlefield:getTimeInside(), 1, battlefield:getLocalVar("[cs]bit"), arg8)
    elseif leavecode == dsp.battlefield.leaveCode.LOST then
        player:startEvent(32002)
    end
end

function onEventUpdate(player, csid, option)
end

function onEventFinish(player, csid, option)
    if csid == 32001 then
        if
            (
                player:getCurrentMission(WINDURST) == dsp.mission.id.windurst.THE_THREE_KINGDOMS_BASTOK2 or
                player:getCurrentMission(SANDORIA) == dsp.mission.id.sandoria.JOURNEY_TO_BASTOK2
            ) and
            player:getCharVar("MissionStatus") == 10
        then
            npcUtil.giveKeyItem(player, dsp.ki.KINDRED_CREST)
            player:setCharVar("MissionStatus", 11)
        end
    end
end
