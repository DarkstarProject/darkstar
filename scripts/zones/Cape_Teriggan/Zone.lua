-----------------------------------
--
-- Zone: Cape_Teriggan (113)
--
-----------------------------------
package.loaded[ "scripts/zones/Cape_Teriggan/TextIDs"] = nil;
-----------------------------------
require("scripts/zones/Cape_Teriggan/TextIDs");
require("scripts/zones/Cape_Teriggan/MobIDs");
require("scripts/globals/icanheararainbow");
require("scripts/globals/conquest");
require("scripts/globals/weather");
require("scripts/globals/zone");

-----------------------------------
-- onInitialize
-----------------------------------

function onInitialize(zone)
    UpdateNMSpawnPoint(KREUTZET);
    GetMobByID(KREUTZET):setRespawnTime(math.random(900, 10800));

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
        cs = 2;
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
    if (csid == 2) then
        lightCutsceneUpdate(player); -- Quest: I Can Hear A Rainbow
    end
end;

-----------------------------------
-- onEventFinish
-----------------------------------

function onEventFinish( player, csid, option)
    -- printf("CSID: %u",csid);
    -- printf("RESULT: %u",option);
    if (csid == 2) then
        lightCutsceneFinish(player); -- Quest: I Can Hear A Rainbow
    end
end;

-----------------------------------
-- onZoneWeatherChange
-----------------------------------

function onZoneWeatherChange(weather)
    if (GetMobAction(KREUTZET) == 24 and (weather == WEATHER_WIND or weather == WEATHER_GALES)) then
        SpawnMob(17240413); -- Kreutzet
    elseif (GetMobAction(KREUTZET) == 16 and (weather ~= WEATHER_WIND and weather ~= WEATHER_GALES)) then
        DespawnMob(KREUTZET);
    end
end;