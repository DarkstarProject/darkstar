-----------------------------------
--
-- Zone: Kuftal_Tunnel (174)
--
-----------------------------------
package.loaded["scripts/zones/Kuftal_Tunnel/TextIDs"] = nil;
-----------------------------------

require("scripts/globals/settings");
require("scripts/globals/zone");
require("scripts/zones/Kuftal_Tunnel/TextIDs");
require("scripts/globals/weather");

-----------------------------------
-- onInitialize
-----------------------------------

function onInitialize(zone)
    -- Guivre
    SetRespawnTime(17490234, 900, 10800);

    UpdateTreasureSpawnPoint(17490304);
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

function onZoneIn(player,prevZone)
    local cs = -1;
    if ((player:getXPos() == 0) and (player:getYPos() == 0) and (player:getZPos() == 0)) then
        player:setPos(20.37,-21.104,275.782,46);
    end
    return cs;
end;

-----------------------------------
-- onRegionEnter
-----------------------------------

function onRegionEnter(player,region)
end;

-----------------------------------
-- onEventUpdate
-----------------------------------

function onEventUpdate(player,csid,option)
    --printf("CSID: %u",csid);
    --printf("RESULT: %u",option);
end;

-----------------------------------
-- onEventFinish
-----------------------------------

function onEventFinish(player,csid,option)
    --printf("CSID: %u",csid);
    --printf("RESULT: %u",option);
end;

-----------------------------------
-- onZoneWeatherChange
-----------------------------------

function onZoneWeatherChange(weather)

    if (weather == WEATHER_WIND or weather == WEATHER_GALES) then
        GetNPCByID(17490280):setAnimation(9); -- Rock Up
    else
        GetNPCByID(17490280):setAnimation(8); -- Rock Down
    end

end;
