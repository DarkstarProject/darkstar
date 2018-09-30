-----------------------------------
--
-- Zone: Cape_Teriggan (113)
--
-----------------------------------
local ID = require("scripts/zones/Cape_Teriggan/IDs")
require("scripts/globals/icanheararainbow");
require("scripts/globals/conquest");
require("scripts/globals/weather");
require("scripts/globals/zone");
-----------------------------------

function onInitialize(zone)
    UpdateNMSpawnPoint(ID.mob.KREUTZET);
    GetMobByID(ID.mob.KREUTZET):setRespawnTime(math.random(900, 10800));

    dsp.conq.setRegionalConquestOverseers(zone:getRegionID())
end;

function onConquestUpdate(zone, updatetype)
    dsp.conq.onConquestUpdate(zone, updatetype)
end;

function onZoneIn( player, prevZone)
    local cs = -1;

    if (player:getXPos() == 0 and player:getYPos() == 0 and player:getZPos() == 0) then
        player:setPos( 315.644, -1.517, -60.633, 108);
    end

    if (triggerLightCutscene(player)) then -- Quest: I Can Hear A Rainbow
        cs = 2;
    end

    return cs;
end;

function onRegionEnter( player, region)
end;

function onEventUpdate( player, csid, option)
    if (csid == 2) then
        lightCutsceneUpdate(player); -- Quest: I Can Hear A Rainbow
    end
end;

function onEventFinish( player, csid, option)
    if (csid == 2) then
        lightCutsceneFinish(player); -- Quest: I Can Hear A Rainbow
    end
end;

function onZoneWeatherChange(weather)
    if (GetMobAction(ID.mob.KREUTZET) == 24 and (weather == dsp.weather.WIND or weather == dsp.weather.GALES)) then
        SpawnMob(ID.mob.KREUTZET); -- Kreutzet
    elseif (GetMobAction(ID.mob.KREUTZET) == 16 and (weather ~= dsp.weather.WIND and weather ~= dsp.weather.GALES)) then
        DespawnMob(ID.mob.KREUTZET);
    end
end;