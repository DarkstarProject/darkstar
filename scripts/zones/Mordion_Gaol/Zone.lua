-----------------------------------
--
-- Zone: Mordion_Gaol
--
-----------------------------------
local ID = require("scripts/zones/Mordion_Gaol/IDs")
require("scripts/globals/conquest")
-----------------------------------

function onInitialize(zone)
end;

function onConquestUpdate(zone, updatetype)
    dsp.conq.onConquestUpdate(zone, updatetype)
end;

function onZoneIn(player,prevZone)
    local cs = -1;

    if player:getVar("inJail") > 0 then
        player:jail()
    end

    return cs;
end;

function onRegionEnter(player,region)
end;

function onEventUpdate(player,csid,option)
end;

function onEventFinish(player,csid,option)
end;
