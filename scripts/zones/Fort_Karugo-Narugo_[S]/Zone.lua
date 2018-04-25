-----------------------------------
--
-- Zone: Fort_Karugo-Narugo_[S] (96)
--
-----------------------------------
require("scripts/zones/Fort_Karugo-Narugo_[S]/MobIDs");
require("scripts/globals/weather");
require("scripts/globals/status");
-----------------------------------

function onInitialize(zone)
end;

function onZoneIn(player,prevZone)
    local cs = -1;
    if (player:getXPos() == 0 and player:getYPos() == 0 and player:getZPos() == 0) then
        player:setPos(820,25.782,117.991,66);
    end
    return cs;
end;

function onRegionEnter(player,region)
end;

function onZoneWeatherChange(weather)
    npc = GetNPCByID(FORT_KN_INDESCRIPT_MARKINGS);
    if (npc ~= nil) then
        if (weather == WEATHER_DUST_STORM or weather == WEATHER_SAND_STORM) then
            npc:setStatus(STATUS_DISAPPEAR);
        else
            npc:setStatus(STATUS_NORMAL);
        end
    end
end;

function onEventUpdate(player,csid,option)
end;

function onEventFinish(player,csid,option)
end;
