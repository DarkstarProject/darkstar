-----------------------------------
--
-- Zone: Kuftal_Tunnel (174)
--
-----------------------------------
package.loaded["scripts/zones/Kuftal_Tunnel/TextIDs"] = nil;
-----------------------------------
require("scripts/zones/Kuftal_Tunnel/TextIDs");
require("scripts/zones/Kuftal_Tunnel/MobIDs");
require("scripts/globals/conquest");
require("scripts/globals/weather");
require("scripts/globals/zone");
-----------------------------------

function onInitialize(zone)
    UpdateNMSpawnPoint(GUIVRE);
    GetMobByID(GUIVRE):setRespawnTime(math.random(900, 10800));

    UpdateTreasureSpawnPoint(17490304);
end;

function onConquestUpdate(zone, updatetype)
    local players = zone:getPlayers();

    for name, player in pairs(players) do
        conquestUpdate(zone, player, updatetype, CONQUEST_BASE);
    end
end;

function onZoneIn(player,prevZone)
    local cs = -1;
    if (player:getXPos() == 0 and player:getYPos() == 0 and player:getZPos() == 0) then
        player:setPos(20.37,-21.104,275.782,46);
    end
    return cs;
end;

function onRegionEnter(player,region)
end;

function onEventUpdate(player,csid,option)
    -- printf("CSID: %u",csid);
    -- printf("RESULT: %u",option);
end;

function onEventFinish(player,csid,option)
    -- printf("CSID: %u",csid);
    -- printf("RESULT: %u",option);
end;

function onZoneWeatherChange(weather)

    if (weather == WEATHER_WIND or weather == WEATHER_GALES) then
        GetNPCByID(DOOR_ROCK):setAnimation(9); -- Rock Up
    else
        GetNPCByID(DOOR_ROCK):setAnimation(8); -- Rock Down
    end

end;
