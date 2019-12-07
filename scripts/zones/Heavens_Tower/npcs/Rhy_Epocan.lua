-----------------------------------
-- Area: Heavens Tower
--  NPC: Rhy Epocan
-- Involved in Mission 3-1
-- !pos 2 -48 14 242
-----------------------------------
require("scripts/globals/missions")
-----------------------------------

function onTrade(player, npc, trade)
end

function onTrigger(player, npc)
    local currentMission = player:getCurrentMission(WINDURST)
    local missionStatus = player:getCharVar("MissionStatus")

    if currentMission == dsp.mission.id.windurst.TO_EACH_HIS_OWN_RIGHT and missionStatus == 1 then
        player:startEvent(107)
    elseif currentMission == dsp.mission.id.windurst.TO_EACH_HIS_OWN_RIGHT and missionStatus == 2 then
        player:startEvent(108)
    elseif currentMission == dsp.mission.id.windurst.TO_EACH_HIS_OWN_RIGHT and missionStatus == 4 then
        player:startEvent(114)
    elseif
        player:getCurrentMission(WINDURST) == dsp.mission.id.windurst.MOON_READING and
        (missionStatus >= 3 or player:hasCompletedMission(WINDURST, dsp.mission.id.windurst.MOON_READING))
    then
        player:startEvent(405)
    else
        player:startEvent(93)
    end
end

function onEventUpdate(player, csid, option)
end

function onEventFinish(player, csid, option)
    if csid == 107 then
        player:setCharVar("MissionStatus", 2)
    elseif csid == 114 then
        finishMissionTimeline(player, 2, csid, option)
    elseif csid == 405 then
        player:setCharVar("MilitaryStrength", 0)
    end
end