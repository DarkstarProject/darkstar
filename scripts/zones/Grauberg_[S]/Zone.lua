-----------------------------------
--
-- Zone: Grauberg_[S] (89)
--
-----------------------------------
local ID = require("scripts/zones/Grauberg_[S]/IDs");
require("scripts/globals/weather");
require("scripts/globals/status");
require("scripts/globals/helm")
-----------------------------------

function onInitialize(zone)
    dsp.helm.initZone(zone, dsp.helm.type.HARVESTING)
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
    local npc = GetNPCByID(ID.npc.INDESCRIPT_MARKINGS);
    if (weather == dsp.weather.WIND or weather == dsp.weather.GALES) then
        npc:setStatus(dsp.status.NORMAL);
    else
        npc:setStatus(dsp.status.DISAPPEAR);
    end
end;

function onEventUpdate(player,csid,option)
end;

function onEventFinish(player,csid,option)
end;
