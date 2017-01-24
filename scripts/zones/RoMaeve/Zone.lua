-----------------------------------
--
-- Zone: RoMaeve (122)
--
-----------------------------------
package.loaded["scripts/zones/RoMaeve/TextIDs"] = nil;
-----------------------------------

require("scripts/globals/settings");
require("scripts/zones/RoMaeve/TextIDs");
require("scripts/globals/zone");

-----------------------------------
-- onInitialize
-----------------------------------

function onInitialize(zone)
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
        player:setPos(-0.008,-33.595,123.478,62);
    end
    if (player:getCurrentMission(WINDURST) == VAIN and player:getVar("MissionStatus") ==1) then
        cs = 0x0003; -- doll telling "you're in the right area"
    end
    return cs;
end;

-----------------------------------
-- onRegionEnter
-----------------------------------

function onRegionEnter(player,region)
end;

-----------------------------------
-- onGameDay
-----------------------------------

function onGameDay()

    -- Full moon + "clear" weather stuff (actually "sunshine" weather, widespread misconception since Ro'Maeve does not have "clear" weather ever)
    local Moongate_Offset = 17277195; -- _3e0 in npc_list
    local hour = VanadielHour();

    if (IsMoonFull() == true and GetNPCByID(Moongate_Offset):getWeather() == WEATHER_SUNSHINE) then
        GetNPCByID(Moongate_Offset):openDoor(432); -- 3 game hours worth of seconds
        GetNPCByID(Moongate_Offset+1):openDoor(432);
        GetNPCByID(Moongate_Offset+7):openDoor(432); -- visual part of Qu'Hau Spring
    end
end;

-----------------------------------
-- onZoneWeatherChange
-----------------------------------

function onZoneWeatherChange(weather)

    local Moongate_Offset = 17277195;

    if (weather ~= WEATHER_SUNSHINE and GetNPCByID(Moongate_Offset):getAnimation() ~= 9) then -- return to inactive state
        GetNPCByID(Moongate_Offset):setAnimation(9);
        GetNPCByID(Moongate_Offset+1):setAnimation(9);
        GetNPCByID(Moongate_Offset+7):setAnimation(9);
    elseif (weather == WEATHER_SUNSHINE and IsMoonFull() == true and VanadielHour() < 3) then -- reactivate things for the remainder of the time until 3AM
        local moonMinRemaining = math.floor(432 * (180 - VanadielHour() * 60 + VanadielMinute())/180) -- 180 minutes (ie 3AM) subtract the time that has passed since midnight
        GetNPCByID(Moongate_Offset):openDoor(moonMinRemaining);
        GetNPCByID(Moongate_Offset+1):openDoor(moonMinRemaining);
        GetNPCByID(Moongate_Offset+7):openDoor(moonMinRemaining);
    end
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