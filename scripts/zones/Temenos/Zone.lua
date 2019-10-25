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
    SetServerVariable("[Temenos_Northern_Tower]Time", 0)
    SetServerVariable("[Temenos_Eastern_Tower]Time", 0)
    SetServerVariable("[Temenos_Western_Tower]Time", 0)
    SetServerVariable("[Central_Temenos_4th_Floor]Time", 0)
    SetServerVariable("[Central_Temenos_3rd_Floor]Time", 0)
    SetServerVariable("[Central_Temenos_2nd_Floor]Time", 0)
    SetServerVariable("[Central_Temenos_1st_Floor]Time", 0)
    SetServerVariable("[Central_Temenos_Basement]Time", 0)
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