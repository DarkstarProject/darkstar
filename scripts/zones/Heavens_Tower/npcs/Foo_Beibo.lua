-----------------------------------
-- Area: Heavens Tower
--  NPC: Foo Beibo
-- Type: Standard NPC
-- !pos 10.717 -46 -28.629 242
-----------------------------------
require("scripts/globals/missions")
-----------------------------------

function onTrade(player, npc, trade)
end

function onTrigger(player, npc)
    local pNation = player:getNation()
    local currentMission = player:getCurrentMission(pNation)
    local missionStatus = player:getCharVar("MissionStatus")

    if
        (player:getCurrentMission(WINDURST) == dsp.mission.id.windurst.MOON_READING and missionStatus >= 3) or
        player:hasCompletedMission(WINDURST, dsp.mission.id.windurst.MOON_READING)
    then
        player:startEvent(403)
    else
        player:startEvent(87)
    end
end

function onEventUpdate(player, csid, option)
end

function onEventFinish(player, csid, option)
    if csid == 403 then
        player:setCharVar("TerribleEvents", 0)
    end
end
