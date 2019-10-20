-----------------------------------
--
-- Zone: Temenos (37)
--
-----------------------------------
local ID = require("scripts/zones/Temenos/IDs")
require("scripts/globals/conquest")
require("scripts/globals/settings")
-----------------------------------

function onInitialize(zone)
end

function onConquestUpdate(zone, updatetype)
    dsp.conq.onConquestUpdate(zone, updatetype)
end

function onZoneIn(player, prevZone)
    local cs = -1
    player:setPos(580, -1.5, 4.452, 192)
    return cs
end

function onRegionEnter(player, region)
end

function onRegionLeave(player, region)
end

function onEventUpdate(player, csid, option)
end

function onEventFinish(player, csid, option)
end