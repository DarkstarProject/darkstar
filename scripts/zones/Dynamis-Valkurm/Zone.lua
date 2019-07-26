-----------------------------------
--
-- Zone: Dynamis-Valkurm
--
-----------------------------------
local ID = require("scripts/zones/Dynamis-Valkurm/IDs")
require("scripts/globals/conquest")
require("scripts/globals/dynamis")
-----------------------------------

function onInitialize(zone)
    for i, v in ipairs (ID.mob.TE5_RANDOM) do
        DisallowRespawn(v, true)
    end
    local randomTE5 = ID.mob.TE5_RANDOM[math.random(#ID.mob.TE5_RANDOM)]
    DisallowRespawn(randomTE5, false)
    SpawnMob(randomTE5)
end

function onConquestUpdate(zone, updatetype)
    dsp.conq.onConquestUpdate(zone, updatetype)
end

function onZoneIn(player, prevZone)
    return dynamis.zoneOnZoneIn(player, prevZone)
end

function onRegionEnter(player, region)
end

function onEventUpdate(player, csid, option)
end

function onEventFinish(player, csid, option)
    dynamis.zoneOnEventFinish(player, csid, option)
end
