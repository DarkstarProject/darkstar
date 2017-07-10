-----------------------------------
--
-- Zone: Cape_Teriggan (113)
--
-----------------------------------
package.loaded[ "scripts/zones/Cape_Teriggan/TextIDs"] = nil;
-----------------------------------

require("scripts/zones/Cape_Teriggan/TextIDs");
require("scripts/globals/icanheararainbow");
require("scripts/globals/weather");
require("scripts/globals/zone");
require("scripts/globals/conquest");

-----------------------------------
-- onInitialize
-----------------------------------

function onInitialize(zone)
    -- Kreutzet
    SetRespawnTime(17240413, 900, 10800);

    SetRegionalConquestOverseers(zone:getRegionID())
end;

-----------------------------------
-- onConquestUpdate
-----------------------------------

function onConquestUpdate(zone, updatetype)
    local players = zone:getPlayers();

    for name, player in pairs(players) do
        conquestUpdate(zone, player, updatetype, CONQUEST_BASE);
    end
end;

-----------------------------------
-- onZoneIn
-----------------------------------

function onZoneIn( player, prevZone)
    local cs = -1;

    if (player:getXPos() == 0 and player:getYPos() == 0 and player:getZPos() == 0) then
        player:setPos( 315.644, -1.517, -60.633, 108);
    end

    if (triggerLightCutscene(player)) then -- Quest: I Can Hear A Rainbow
        cs = 0x0002;
    end

    return cs;
end;

-----------------------------------
-- onRegionEnter
-----------------------------------

function onRegionEnter( player, region)
end;

-----------------------------------
-- onEventUpdate
-----------------------------------

function onEventUpdate( player, csid, option)
    -- printf("CSID: %u",csid);
    -- printf("RESULT: %u",option);
    if (csid == 0x0002) then
        lightCutsceneUpdate(player); -- Quest: I Can Hear A Rainbow
    end
end;

-----------------------------------
-- onEventFinish
-----------------------------------

function onEventFinish( player, csid, option)
    -- printf("CSID: %u",csid);
    -- printf("RESULT: %u",option);
    if (csid == 0x0002) then
        lightCutsceneFinish(player); -- Quest: I Can Hear A Rainbow
    end
end;

-----------------------------------
-- onZoneWeatherChange
-----------------------------------

function onZoneWeatherChange(weather)
    if (GetMobAction(17240413) == 24 and (weather == WEATHER_WIND or weather == WEATHER_GALES)) then
        SpawnMob(17240413); -- Kreutzet
    elseif (GetMobAction(17240413) == 16 and (weather ~= WEATHER_WIND and weather ~= WEATHER_GALES)) then
        DespawnMob(17240413);
    end
end;