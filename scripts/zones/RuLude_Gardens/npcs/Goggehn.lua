-----------------------------------
-- Area: Ru'Lude Gardens
--  NPC: Goggehn
-- Involved in Mission: Bastok 3-3, 4-1
-- !pos 3 9 -76 243
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

    if pNation == dsp.nation.BASTOK then
        local currentMission = player:getCurrentMission(BASTOK)
        local missionStatus = player:getVar("MissionStatus")

        if currentMission == dsp.mission.id.bastok.JEUNO and missionStatus == 1 then
            player:startEvent(41)
        elseif currentMission == dsp.mission.id.bastok.JEUNO and missionStatus == 2 then
            player:startEvent(66)
        elseif currentMission == dsp.mission.id.bastok.JEUNO and missionStatus >= 3 then
            player:startEvent(139)
        elseif player:getRank() == 4 and currentMission == dsp.mission.id.bastok.NONE and getMissionRankPoints(player, 13) == 1 then
             player:startEvent(0)
        elseif currentMission == dsp.mission.id.bastok.MAGICITE and missionStatus == 1 then
            player:startEvent(132)
        elseif currentMission == dsp.mission.id.bastok.MAGICITE and missionStatus <= 5 then
            player:startEvent(135)
        elseif currentMission == dsp.mission.id.bastok.MAGICITE and missionStatus == 6 then
            player:startEvent(35)
        elseif player:hasKeyItem(dsp.ki.MESSAGE_TO_JEUNO_BASTOK) then
            player:startEvent(55)
        elseif player:getRank() == 10 then
            player:startEvent(105)
        else
            player:startEvent(4)
        end
    elseif pNation == dsp.nation.WINDURST then
        player:startEvent(2)
    elseif pNation == dsp.nation.SANDORIA then
        player:startEvent(1)
    end
end

function onEventUpdate(player,csid,option)
end

function onEventFinish(player,csid,option)
    if csid == 41 then
        player:setVar("MissionStatus",2)
        player:delKeyItem(dsp.ki.LETTER_TO_THE_AMBASSADOR)
    elseif csid == 139 then
        player:setVar("MissionStatus", 4)
    elseif csid == 35 then
        finishMissionTimeline(player,1,csid,option)
    end
end