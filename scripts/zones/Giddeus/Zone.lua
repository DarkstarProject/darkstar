-----------------------------------
--
-- Zone: Giddeus (145)
--
-----------------------------------
local ID = require("scripts/zones/Giddeus/IDs")
require("scripts/globals/conquest")
require("scripts/globals/treasure")
require("scripts/globals/helm")
-----------------------------------

function onInitialize(zone)
    dsp.treasure.initZone(zone)
    dsp.helm.initZone(zone, dsp.helm.type.HARVESTING)
end;

function onZoneIn(player,prevZone)
    local cs = -1;
    if (player:getXPos() == 0 and player:getYPos() == 0 and player:getZPos() == 0) then
        player:setPos(-135.904,-5.788,-300.668,2);
    end
    return cs;
end;

function onConquestUpdate(zone, updatetype)
    dsp.conq.onConquestUpdate(zone, updatetype)
end;

function onRegionEnter(player,region)
end;

function onEventUpdate(player,csid,option)
end;

function onEventFinish(player,csid,option)
end;
