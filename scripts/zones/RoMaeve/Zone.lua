-----------------------------------
--
-- Zone: RoMaeve (122)
--
-----------------------------------
package.loaded["scripts/zones/RoMaeve/TextIDs"] = nil;
-----------------------------------
require("scripts/zones/RoMaeve/TextIDs");
require("scripts/zones/RoMaeve/MobIDs");
require("scripts/globals/conquest");
require("scripts/globals/missions");
require("scripts/globals/npc_util");
require("scripts/globals/weather");
require("scripts/globals/status");

function onInitialize(zone)
    local newPosition = npcUtil.pickNewPosition(BASTOK_7_1_QM, BASTOK_7_1_QM_POS, true);
    GetNPCByID(BASTOK_7_1_QM):setPos(newPosition.x, newPosition.y, newPosition.z);
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
    if (IsMoonFull() and GetNPCByID(MOONGATE_OFFSET):getWeather() == WEATHER_SUNSHINE) then
        for i = MOONGATE_OFFSET, MOONGATE_OFFSET+7 do
            GetNPCByID(i):openDoor(432);
        end
    end
end;

function onZoneWeatherChange(weather)
    if (weather ~= WEATHER_SUNSHINE and GetNPCByID(MOONGATE_OFFSET):getAnimation() ~= ANIMATION_CLOSE_DOOR) then
        for i = MOONGATE_OFFSET, MOONGATE_OFFSET+7 do
            GetNPCByID(i):setAnimation(ANIMATION_CLOSE_DOOR);
        end
    elseif (weather == WEATHER_SUNSHINE and IsMoonFull() == true and VanadielHour() < 3) then -- reactivate things for the remainder of the time until 3AM
        local moonMinRemaining = math.floor(432 * (180 - VanadielHour() * 60 + VanadielMinute())/180) -- 180 minutes (ie 3AM) subtract the time that has passed since midnight
        for i = MOONGATE_OFFSET, MOONGATE_OFFSET+7 do
            GetNPCByID(i):openDoor(moonMinRemaining);
        end
    end
end;

function onEventUpdate(player,csid,option)
end;

function onEventFinish(player,csid,option)
end;