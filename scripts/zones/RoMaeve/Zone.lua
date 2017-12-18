-----------------------------------
--
-- Zone: RoMaeve (122)
--
-----------------------------------
package.loaded["scripts/zones/RoMaeve/TextIDs"] = nil;
-----------------------------------

require("scripts/zones/RoMaeve/TextIDs");
require("scripts/globals/settings");
require("scripts/globals/npc_util");
require("scripts/globals/zone");

bastok71QM = 17277207;
bastok71QMPos =
{
    [1] = {162.000, -8.000, 21.000}, -- L-7
    [2] = {160.000, -6.000, -110.000}, -- L-10
    [3] = {105.000, -4.000, -112.000}, -- K-11
    [4] = {126.000, -3.000, 75.000}, -- K-10
    [5] = {60.000, -6.000, 2.000}, -- I-8/J-8
    [6] = {-48.000, -4.000, -32.000}, -- G-9
    [7] = {-109.000, -4.000, -114.000}, -- E-11
    [8] = {-137.000, 1.000, -90.000}, -- E-10
    [9] = {-105.000, -3.000, -36.000}, -- E-9
    [10] = {-160.000, -6.000, -107.000} -- D-10
}

-----------------------------------
-- onInitialize
-----------------------------------

function onInitialize(zone)
    local newPosition = npcUtil.pickNewPosition(bastok71QM, bastok71QMPos, true);
    GetNPCByID(bastok71QM):setPos(newPosition.x, newPosition.y, newPosition.z);
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
