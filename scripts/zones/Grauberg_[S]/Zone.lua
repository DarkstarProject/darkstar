-----------------------------------
--
-- Zone: Grauberg_[S] (89)
--
-----------------------------------
package.loaded["scripts/zones/Grauberg_[S]/TextIDs"] = nil;
-----------------------------------
require("scripts/zones/Grauberg_[S]/TextIDs");
require("scripts/globals/settings");
require("scripts/globals/weather");
require("scripts/globals/status");
-----------------------------------

function onInitialize(zone)
end;

function onZoneIn(player,prevZone)
    local cs = -1;
    if (player:getXPos() == 0 and player:getYPos() == 0 and player:getZPos() == 0) then
        player:setPos(495.063,69.903,924.102,23);
    end
    return cs;
end;

function onRegionEnter(player,region)
end;

function onZoneWeatherChange(weather)

    local npc = GetNPCByID(17142586); -- Indescript Markings
    if (npc ~= nil) then
        if (weather == WEATHER_WIND or weather == WEATHER_GALES) then
            npc:setStatus(STATUS_NORMAL);
        else
            npc:setStatus(STATUS_DISAPPEAR);
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