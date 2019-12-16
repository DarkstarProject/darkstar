-----------------------------------
--
-- Zone: King Ranperres Tomb (190)
--
-----------------------------------
local ID = require("scripts/zones/King_Ranperres_Tomb/IDs")
require("scripts/globals/conquest")
require("scripts/globals/treasure")
require("scripts/globals/zone")
-----------------------------------

function onInitialize(zone)
    zone:registerRegion(1, -84.302, 6.5, -120.997, -77, 7.5, -114) -- Used for stairs teleport -85.1, 7, -119.9

    UpdateNMSpawnPoint(ID.mob.VRTRA)
    GetMobByID(ID.mob.VRTRA):setRespawnTime(math.random(86400, 259200))

    UpdateNMSpawnPoint(ID.mob.BARBASTELLE)
    GetMobByID(ID.mob.BARBASTELLE):setRespawnTime(math.random(1800, 5400))

    dsp.treasure.initZone(zone)
end

function onZoneIn(player, prevZone)
    local cs = -1
    if player:getXPos() == 0 and player:getYPos() == 0 and player:getZPos() == 0 then
        player:setPos(242.012, 5.305, 340.059, 121)
    end
    return cs
end

function onConquestUpdate(zone, updatetype)
    dsp.conq.onConquestUpdate(zone, updatetype)
end

function onRegionEnter(player, region)
    if region:GetRegionID() == 1 then
        player:startEvent(9)
    end
end

function onRegionLeave(player, region)
end

function onEventUpdate(player, csid, option)
end

function onEventFinish(player, csid, option)
end
