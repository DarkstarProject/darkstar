-----------------------------------
-- Area: Ru'Lude Gardens
--  NPC: Nelcabrit
-- Involved in Mission: San d'Oria 3-3, 4-1
-- !pos -32 9 -49 243
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

    if pNation == dsp.nation.SANDORIA then
        local currentMission = player:getCurrentMission(SANDORIA)
        local missionStatus = player:getVar("MissionStatus")

        if currentMission == dsp.mission.id.sandoria.APPOINTMENT_TO_JEUNO and missionStatus == 1 then
            player:startEvent(42)
        elseif currentMission == dsp.mission.id.sandoria.APPOINTMENT_TO_JEUNO and missionStatus == 2 then
            player:startEvent(67)
        elseif currentMission == dsp.mission.id.sandoria.APPOINTMENT_TO_JEUNO and missionStatus == 3 then
            player:startEvent(140)
        elseif player:getRank() == 4 and currentMission == dsp.mission.id.sandoria.NONE and getMissionRankPoints(player, 13) == 1 then
            player:startEvent(45)
        elseif currentMission == dsp.mission.id.sandoria.MAGICITE and missionStatus == 1 then
            player:startEvent(133)
        elseif currentMission == dsp.mission.id.sandoria.MAGICITE and missionStatus <= 5 then
            player:startEvent(136)
        elseif currentMission == dsp.mission.id.sandoria.MAGICITE and missionStatus == 6 then
            player:startEvent(36)
        elseif player:hasKeyItem(dsp.ki.MESSAGE_TO_JEUNO_SANDORIA) then
            player:startEvent(56)
        elseif player:getRank() == 10 then
            player:startEvent(106)
        else
            player:startEvent(49)
        end
    elseif pNation == dsp.nation.WINDURST then
        player:startEvent(47)
    elseif pNation == dsp.nation.BASTOK then
        player:startEvent(46)
    end
end

function onEventUpdate(player,csid,option)
end

function onEventFinish(player,csid,option)
    if csid == 42 then
        player:setVar("MissionStatus",2)
        player:delKeyItem(dsp.ki.LETTER_TO_THE_AMBASSADOR)
    elseif csid == 140 then
        player:setVar("MissionStatus", 4)
    elseif csid == 36 then
        finishMissionTimeline(player, 3, csid, option)
    end
end