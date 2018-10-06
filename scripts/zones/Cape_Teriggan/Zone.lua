-----------------------------------
--
-- Zone: Cape_Teriggan (113)
--
-----------------------------------
local ID = require("scripts/zones/Cape_Teriggan/IDs")
-----------------------------------
require("scripts/globals/icanheararainbow")
require("scripts/globals/conquest")
require("scripts/globals/weather")
require("scripts/globals/zone")
-----------------------------------

function onInitialize(zone)
    UpdateNMSpawnPoint(ID.mob.KREUTZET)
    GetMobByID(ID.mob.KREUTZET):setRespawnTime(math.random(32400,43200)) -- 9 to 12 hours
    GetMobByID(ID.mob.KREUTZET):setLocalVar("cooldown",os.time() + mob:getRespawnTime()/1000)
    DisallowRespawn(GetMobByID(ID.mob.KREUTZET):getID(), true) -- prevents accidental 'pop' during no wind weather and immediate despawn

    dsp.conq.setRegionalConquestOverseers(zone:getRegionID())
end

function onConquestUpdate(zone, updatetype)
    dsp.conq.onConquestUpdate(zone, updatetype)
end

function onZoneIn( player, prevZone)
    local cs = -1

    if player:getXPos() == 0 and player:getYPos() == 0 and player:getZPos() == 0 then
        player:setPos( 315.644, -1.517, -60.633, 108)
    end

    if triggerLightCutscene(player) then -- Quest: I Can Hear A Rainbow
        cs = 2
    end

    return cs
end

function onRegionEnter( player, region)
end

function onEventUpdate( player, csid, option)
    if csid == 2 then
        lightCutsceneUpdate(player) -- Quest: I Can Hear A Rainbow
    end
end

function onEventFinish( player, csid, option)
    if csid == 2 then
        lightCutsceneFinish(player) -- Quest: I Can Hear A Rainbow
    end
end

function onZoneWeatherChange(weather)
    if GetMobAction(ID.mob.KREUTZET) == 0 and os.time() > GetMobByID(ID.mob.KREUTZET):getLocalVar("cooldown") and
        (weather == dsp.weather.WIND or weather == dsp.weather.GALES) then
            DisallowRespawn(GetMobByID(ID.mob.KREUTZET):getID(), false)
            GetMobByID(ID.mob.KREUTZET):setRespawnTime(math.random(30,150)) -- pop 30-150 sec after wind weather starts
    end
end