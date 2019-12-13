-----------------------------------
--
-- Zone: Pashhow_Marshlands (109)
--
-----------------------------------
local ID = require("scripts/zones/Pashhow_Marshlands/IDs")
require("scripts/globals/icanheararainbow")
require("scripts/globals/chocobo_digging")
require("scripts/globals/conquest")
require("scripts/globals/missions")
require("scripts/globals/zone")
-----------------------------------

function onChocoboDig(player, precheck)
    return dsp.chocoboDig.start(player, precheck)
end

function onInitialize(zone)
    UpdateNMSpawnPoint(ID.mob.BOWHO_WARMONGER)
    GetMobByID(ID.mob.BOWHO_WARMONGER):setRespawnTime(75600 + math.random(600, 900)) -- 21 hours, plus 10 to 15 min

    dsp.conq.setRegionalConquestOverseers(zone:getRegionID())
end

function onZoneIn(player, prevZone)
    local cs = -1

    if player:getXPos() == 0 and player:getYPos() == 0 and player:getZPos() == 0 then
        player:setPos(547.841, 23.192, 696.323, 136)
    end

    if prevZone == dsp.zone.BEADEAUX and player:getCurrentMission(BASTOK) == dsp.mission.id.bastok.THE_FOUR_MUSKETEERS then
        local missionStatus = player:getCharVar("MissionStatus")

        if missionStatus > 0 and missionStatus < 22 then
            cs = 10
        elseif missionStatus == 22 then
            cs = 11
        end
    elseif triggerLightCutscene(player) then -- Quest: I Can Hear A Rainbow
        cs = 13
    elseif player:getCurrentMission(WINDURST) == dsp.mission.id.windurst.VAIN and player:getCharVar("MissionStatus") == 1 then
        cs = 15
    end

    return cs
end

function onConquestUpdate(zone, updatetype)
    dsp.conq.onConquestUpdate(zone, updatetype)
end

function onRegionEnter(player, region)
end

function onEventUpdate(player, csid, option)
    if csid == 13 then
        lightCutsceneUpdate(player) -- Quest: I Can Hear A Rainbow
    elseif csid == 15 then
        if player:getXPos() < 362 then
            player:updateEvent(0, 0, 0, 0, 0, 2)
        end
    end
end

function onEventFinish( player, csid, option)
    if csid == 10 then
        player:setPos(578, 25, -376, 126)
    elseif csid == 11 then
        finishMissionTimeline(player, 1, csid, option)
        player:setPos(578, 25, -376, 126)
    elseif csid == 13 then
        lightCutsceneFinish(player) -- Quest: I Can Hear A Rainbow
    end
end
