-----------------------------------
--
-- Zone: Vunkerl_Inlet_[S] (83)
--
-----------------------------------
package.loaded["scripts/zones/Vunkerl_Inlet_[S]/TextIDs"] = nil;
-----------------------------------
require("scripts/zones/Vunkerl_Inlet_[S]/TextIDs");
require("scripts/zones/Vunkerl_Inlet_[S]/MobIDs");
require("scripts/globals/weather");
require("scripts/globals/status");

function onInitialize(zone)
end;

function onZoneIn(player,prevZone)
    local cs = -1;
    if ((player:getXPos() == 0) and (player:getYPos() == 0) and (player:getZPos() == 0)) then
        player:setPos(-393.238,-50.034,741.199,2);
    end
    return cs;
end;

function onZoneWeatherChange(weather)
    local npc = GetNPCByID(VUNKERL_INDESCRIPT_MARKINGS); -- Indescript Markings
    if (npc ~= nil) then
        if (weather == WEATHER_FOG or weather == WEATHER_THUNDER) then
            npc:setStatus(STATUS_DISAPPEAR);
        elseif (VanadielHour() >= 16 or VanadielHour() <= 6) then
            npc:setStatus(STATUS_NORMAL);
        end
    end
end;

function onGameHour(zone)
    local npc = GetNPCByID(VUNKERL_INDESCRIPT_MARKINGS); -- Indescript Markings
    if (npc ~= nil) then
        if (VanadielHour() == 16) then
            npc:setStatus(STATUS_DISAPPEAR);
        end
        if (VanadielHour() == 6) then
            npc:setStatus(STATUS_NORMAL);
        end
    end
end;

function onRegionEnter(player,region)
end;

function onEventUpdate(player,csid,option)
end;

function onEventFinish(player,csid,option)
end;
