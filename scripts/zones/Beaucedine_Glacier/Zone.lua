-----------------------------------
--
-- Zone: Beaucedine_Glacier (111)
--
-----------------------------------
local ID = require("scripts/zones/Beaucedine_Glacier/IDs")
require("scripts/globals/icanheararainbow")
require("scripts/globals/missions")
require("scripts/globals/conquest")
require("scripts/globals/zone")
-----------------------------------

function onInitialize(zone)
    UpdateNMSpawnPoint(ID.mob.HUMBABA)
    GetMobByID(ID.mob.HUMBABA):setRespawnTime(math.random(3600, 4200))

    dsp.conq.setRegionalConquestOverseers(zone:getRegionID())
end

function onZoneIn( player, prevZone)
    local cs = -1

    if prevZone == dsp.zone.DYNAMIS_BEAUCEDINE then -- warp player to a correct position after dynamis
        player:setPos(-284.751,-39.923,-422.948,235)
    end

    if player:getXPos() == 0 and player:getYPos() == 0 and player:getZPos() == 0 then
        player:setPos( -247.911, -82.165, 260.207, 248)
    end

    if player:getCurrentMission( COP) == dsp.mission.id.cop.DESIRES_OF_EMPTINESS and player:getCharVar( "PromathiaStatus") == 9 then
        cs = 206
    elseif triggerLightCutscene(player) then -- Quest: I Can Hear A Rainbow
        cs = 114
    elseif player:getCurrentMission(WINDURST) == dsp.mission.id.windurst.VAIN and player:getCharVar("MissionStatus") ==1 then
        cs = 116
    end

    return cs
end

function onConquestUpdate(zone, updatetype)
    dsp.conq.onConquestUpdate(zone, updatetype)
end

function onRegionEnter( player, region)
end

function onEventUpdate( player, csid, option)
    if csid == 114 then
        lightCutsceneUpdate(player) -- Quest: I Can Hear A Rainbow
    elseif csid == 116 then
        player:updateEvent(0,0,0,0,0,4)
    end
end

function onEventFinish( player, csid, option)
    if csid == 206 then
        player:setCharVar("PromathiaStatus",10)
    elseif csid == 114 then
        lightCutsceneFinish(player); -- Quest: I Can Hear A Rainbow
    end
end

function onZoneWeatherChange(weather)
    local mirrorPond = GetNPCByID(ID.npc.MIRROR_POND_J8) -- Quest: Love And Ice

    if weather ~= dsp.weather.SNOW and weather ~= dsp.weather.BLIZZARDS then
        mirrorPond:setStatus(dsp.status.NORMAL)
    else
        mirrorPond:setStatus(dsp.status.DISAPPEAR)
    end
end