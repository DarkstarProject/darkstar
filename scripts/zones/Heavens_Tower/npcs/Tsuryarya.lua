-----------------------------------
-- Area: Heavens Tower
--  NPC: Tsuryarya
-- Type: Standard NPC
-- !pos -0.881 -27 15.950 242
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
        player:startEvent(396)
    else
        player:startEvent(65)
    end
end

function onEventUpdate(player, csid, option)
end

function onEventFinish(player, csid, option)
    if csid == 396 then
        player:setCharVar("TinyException", 0)
    end
end
