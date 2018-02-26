-----------------------------------
--
-- Zone: Pashhow_Marshlands_[S] (90)
--
-----------------------------------
package.loaded["scripts/zones/Pashhow_Marshlands_[S]/TextIDs"] = nil;
-----------------------------------
require("scripts/zones/Pashhow_Marshlands_[S]/TextIDs");
require("scripts/zones/Pashhow_Marshlands_[S]/MobIDs");
require("scripts/globals/weather");
require("scripts/globals/status");
-----------------------------------

function onInitialize(zone)
end;

function onZoneIn(player,prevZone)
    local cs = -1;
    if (player:getXPos() == 0 and player:getYPos() == 0 and player:getZPos() == 0) then
        player:setPos(547.841,23.192,696.323,134);
    end
    return cs;
end;

function onRegionEnter(player,region)
end;

function onZoneWeatherChange(weather)

    local npc = GetNPCByID(PASHHOW_S_MARKINGS_OFFSET + 1); -- Indescript Markings (BOOTS)
    if (npc ~= nil) then
        if (weather == WEATHER_RAIN or weather == WEATHER_THUNDER) then
            npc:setStatus(STATUS_DISAPPEAR);
        else
            npc:setStatus(STATUS_NORMAL);
        end
    end

    npc = GetNPCByID(PASHHOW_S_MARKINGS_OFFSET + 2); -- Indescript Markings (BODY)
    if (npc ~= nil) then
        if (weather == WEATHER_RAIN) then
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
