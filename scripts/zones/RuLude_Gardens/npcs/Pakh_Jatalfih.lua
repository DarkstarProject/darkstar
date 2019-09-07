-----------------------------------
-- Area: Ru'Lud Gardens
--  NPC: Pakh Jatalfih
-- Involved in Mission: Windurst 3-3, 4-1
-- !pos 34 8 -35 243
-----------------------------------
local ID = require("scripts/zones/RuLude_Gardens/IDs")
require("scripts/globals/settings")
require("scripts/globals/keyitems")
require("scripts/globals/missions")
-----------------------------------

function onTrade(player,npc,trade)
end

function onTrigger(player,npc)
    local pNation = player:getNation()

    if pNation == dsp.nation.WINDURST then
        local currentMission = player:getCurrentMission(pNation)
        local MissionStatus = player:getVar("MissionStatus")

        if currentMission == dsp.mission.id.windurst.A_NEW_JOURNEY and MissionStatus == 1 then
            player:startEvent(43)
        elseif currentMission == dsp.mission.id.windurst.A_NEW_JOURNEY and MissionStatus == 2 then
            player:startEvent(68)
        elseif currentMission == dsp.mission.id.windurst.A_NEW_JOURNEY and MissionStatus >= 3 then
            player:startEvent(141)
        elseif player:getRank() == 4 and currentMission == dsp.mission.id.windurst.NONE and getMissionRankPoints(player, 13) == 1 then
            player:startEvent(50)
        elseif currentMission == dsp.mission.id.windurst.MAGICITE and missionStatus == 1 then
            player:startEvent(134)
        elseif currentMission == dsp.mission.id.windurst.MAGICITE and MissionStatus <= 5 then
            player:startEvent(137)
        elseif currentMission == dsp.mission.id.windurst.MAGICITE and MissionStatus == 6 then
            player:startEvent(37)
        elseif player:hasKeyItem(dsp.ki.MESSAGE_TO_JEUNO_WINDURST) then
            player:startEvent(57)
        elseif player:getRank() == 10 then
            player:startEvent(107)
        else
            player:startEvent(54)
        end
    elseif pNation == dsp.nation.SANDORIA then
        player:startEvent(52)
    elseif pNation == dsp.nation.BASTOK then
        player:startEvent(51)
    end
end

function onEventUpdate(player,csid,option)
end

function onEventFinish(player,csid,option)
    if csid == 43 then
        player:setVar("MissionStatus", 2)
        player:delKeyItem(dsp.ki.LETTER_TO_THE_AMBASSADOR)
    elseif csid == 141 then
        player:setVar("MissionStatus", 4)
    elseif csid == 37 then
        finishMissionTimeline(player, 1, csid, option)
    end
end