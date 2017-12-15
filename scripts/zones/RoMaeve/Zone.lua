-----------------------------------
--
-- Zone: RoMaeve (122)
--
-----------------------------------
package.loaded["scripts/zones/RoMaeve/TextIDs"] = nil;
-----------------------------------
require("scripts/zones/RoMaeve/TextIDs");
require("scripts/zones/RoMaeve/MobIDs");
require("scripts/globals/settings");
require("scripts/globals/npc_util");
require("scripts/globals/zone");

bastok71QM = 17277207;
bastok71QMPos =
{
     [1] = {  162.000, -8.000,   21.000}, -- L-7
     [2] = {  160.000, -6.000, -110.000}, -- L-10
     [3] = {  105.000, -4.000, -112.000}, -- K-11
     [4] = {  126.000, -3.000,   75.000}, -- K-10
     [5] = {   60.000, -6.000,    2.000}, -- I-8/J-8
     [6] = {  -48.000, -4.000,  -32.000}, -- G-9
     [7] = { -109.000, -4.000, -114.000}, -- E-11
     [8] = { -137.000,  1.000,  -90.000}, -- E-10
     [9] = { -105.000, -3.000,  -36.000}, -- E-9
    [10] = { -160.000, -6.000, -107.000}  -- D-10
}

function onInitialize(zone)
    local newPosition = npcUtil.pickNewPosition(bastok71QM, bastok71QMPos, true);
    GetNPCByID(bastok71QM):setPos(newPosition.x, newPosition.y, newPosition.z);
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
        player:setPos(-0.008,-33.595,123.478,62);
    end
    if (player:getCurrentMission(WINDURST) == VAIN and player:getVar("MissionStatus") ==1) then
        cs = 0x0003; -- doll telling "you're in the right area"
    end
    return cs;
end;

function onRegionEnter(player,region)
end;

function onGameDay()
    if (IsMoonFull() == true and GetNPCByID(MOONGATE_OFFSET):getWeather() == WEATHER_SUNSHINE) then
        for i = MOONGATE_OFFSET, MOONGATE_OFFSET+7 do
            GetNPCByID(i):openDoor(432);
        end
    end
end;

function onZoneWeatherChange(weather)
    if (weather ~= WEATHER_SUNSHINE and GetNPCByID(MOONGATE_OFFSET):getAnimation() ~= 9) then
        for i = MOONGATE_OFFSET, MOONGATE_OFFSET+7 do
            GetNPCByID(i):setAnimation(9);
        end
    elseif (weather == WEATHER_SUNSHINE and IsMoonFull() == true and VanadielHour() < 3) then -- reactivate things for the remainder of the time until 3AM
        local moonMinRemaining = math.floor(432 * (180 - VanadielHour() * 60 + VanadielMinute())/180) -- 180 minutes (ie 3AM) subtract the time that has passed since midnight
        for i = MOONGATE_OFFSET, MOONGATE_OFFSET+7 do
            GetNPCByID(i):openDoor(moonMinRemaining);
        end
    end
end;

function onEventUpdate(player,csid,option)
    -- printf("CSID: %u",csid);
    -- printf("RESULT: %u",option);
end;

function onEventFinish(player,csid,option)
    -- printf("CSID: %u",csid);
    -- printf("RESULT: %u",option);
end;