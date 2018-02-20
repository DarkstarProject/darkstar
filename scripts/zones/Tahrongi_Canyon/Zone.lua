-----------------------------------
--
-- Zone: Tahrongi_Canyon (117)
--
-----------------------------------
package.loaded["scripts/zones/Tahrongi_Canyon/TextIDs"] = nil;
-----------------------------------
require("scripts/zones/Tahrongi_Canyon/TextIDs");
require("scripts/zones/Tahrongi_Canyon/MobIDs");
require("scripts/globals/icanheararainbow");
require("scripts/globals/chocobo_digging");
require("scripts/globals/weather");
require("scripts/globals/zone");
-----------------------------------

local itemMap =
{
    -- itemid, abundance, requirement
                    { 880, 224, DIGREQ_NONE },
                    { 887, 39, DIGREQ_NONE },
                    { 645, 14, DIGREQ_NONE },
                    { 893, 105, DIGREQ_NONE },
                    { 737, 17, DIGREQ_NONE },
                    { 643, 64, DIGREQ_NONE },
                    { 17296, 122, DIGREQ_NONE },
                    { 942, 6, DIGREQ_NONE },
                    { 642, 58, DIGREQ_NONE },
                    { 864, 22, DIGREQ_NONE },
                    { 843, 4, DIGREQ_NONE },
                    { 4096, 100, DIGREQ_NONE },  -- all crystals
                    { 656, 95, DIGREQ_BURROW },
                    { 749, 26, DIGREQ_BURROW },
                    { 751, 33, DIGREQ_BURROW },
                    { 750, 89, DIGREQ_BURROW },
                    { 902, 6, DIGREQ_BORE },
                    { 886, 3, DIGREQ_BORE },
                    { 867, 3, DIGREQ_BORE },
                    { 1587, 19, DIGREQ_BORE },
                    { 888, 25, DIGREQ_BORE },
                    { 1586, 8, DIGREQ_BORE },
                    { 885, 10, DIGREQ_BORE },
                    { 866, 3, DIGREQ_BORE },
                    { 4570, 10, DIGREQ_MODIFIER },
                    { 4487, 11, DIGREQ_MODIFIER },
                    { 4409, 12, DIGREQ_MODIFIER },
                    { 1188, 10, DIGREQ_MODIFIER },
                    { 4532, 12, DIGREQ_MODIFIER },
};

local messageArray = { DIG_THROW_AWAY, FIND_NOTHING, ITEM_OBTAINED };

function onChocoboDig(player, precheck)
    return chocoboDig(player, itemMap, precheck, messageArray);
end;

function onInitialize(zone)
end;

function onZoneIn( player, prevZone)
    local cs = -1;

    if (player:getXPos() == 0 and player:getYPos() == 0 and player:getZPos() == 0) then
        player:setPos( 442.781, -1.641, -40.144, 160);
    end

    if (triggerLightCutscene(player)) then -- Quest: I Can Hear A Rainbow
        cs = 35;
    elseif (player:getCurrentMission(WINDURST) == VAIN and player:getVar("MissionStatus") ==1) then
        cs = 37;
    end

    return cs;
end;

function onConquestUpdate(zone, updatetype)
    local players = zone:getPlayers();

    for name, player in pairs(players) do
        conquestUpdate(zone, player, updatetype, CONQUEST_BASE);
    end
end;

function onRegionEnter( player, region)
end;

function onEventUpdate( player, csid, option)
    -- printf("CSID: %u",csid);
    -- printf("RESULT: %u",option);
    if (csid == 35) then
        lightCutsceneUpdate(player); -- Quest: I Can Hear A Rainbow
    elseif (csid == 37) then
        if (player:getPreviousZone() == 116 or player:getPreviousZone() == 118) then
            player:updateEvent(0,0,0,0,0,7);
        elseif (player:getPreviousZone() == 198) then
            player:updateEvent(0,0,0,0,0,6);
        end
    end
end;

function onEventFinish( player, csid, option)
    -- printf("CSID: %u",csid);
    -- printf("RESULT: %u",option);
    if (csid == 35) then
        lightCutsceneFinish(player); -- Quest: I Can Hear A Rainbow
    end
end;

function isHabrokWeather(weather)
    return (weather == WEATHER_DUST_STORM or weather == WEATHER_SAND_STORM or weather == WEATHER_WIND or weather == WEATHER_GALES);
end

function onZoneWeatherChange(weather)
    local habrok = GetMobByID(HABROK);
    if (habrok:isSpawned() and not isHabrokWeather(weather)) then
        DespawnMob(HABROK);
    elseif (not habrok:isSpawned() and isHabrokWeather(weather) and os.time() > habrok:getLocalVar("pop")) then
        SpawnMob(HABROK);
    end
end;