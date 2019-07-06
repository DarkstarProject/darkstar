-----------------------------------
-- Area: Ru'Lud Gardens
--  NPC: Pakh Jatalfih
-- !pos 34 8 -35 243
-----------------------------------
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
        elseif currentMission == dsp.mission.id.windurst.A_NEW_JOURNEY and MissionStatus == 3 then
            player:startEvent(141)
        elseif player:getRank() == 4 and MissionStatus == 0 then
            if getMissionRankPoints(player, 13) == 1 then
                player:startEvent(50)
            else
                player:startEvent(54)
            end
        elseif player:getRank() == 4 and currentMission == dsp.mission.id.windurst.NONE and MissionStatus ~= 0 and getMissionRankPoints(player, 13) == 1 then
            player:startEvent(134)
        elseif currentMission == dsp.mission.id.windurst.MAGICITE and MissionStatus == 2 then
            player:startEvent(137)
        elseif currentMission == dsp.mission.id.windurst.MAGICITE and MissionStatus == 6 then
            player:startEvent(37)
        elseif player:hasKeyItem(dsp.ki.MESSAGE_TO_JEUNO_WINDURST) then
            player:startEvent(57)
        elseif player:getRank() >= 5 then
            player:startEvent(57)
        else
            player:startEvent(107)
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
    elseif csid == 141 then
        player:setVar("MissionStatus", 4)
    elseif csid == 37 then
        finishMissionTimeline(player, 1, csid, option)
    end
end
