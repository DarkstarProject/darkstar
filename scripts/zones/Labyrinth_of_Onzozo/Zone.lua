-----------------------------------
--
-- Zone: Labyrinth of Onzozo (213)
--
-----------------------------------
local ID = require("scripts/zones/Labyrinth_of_Onzozo/IDs")
require("scripts/globals/conquest")
require("scripts/globals/treasure")
-----------------------------------

function onInitialize(zone)
    UpdateNMSpawnPoint(ID.mob.MYSTICMAKER_PROFBLIX)
    GetMobByID(ID.mob.MYSTICMAKER_PROFBLIX):setRespawnTime(math.random(900, 10800))

    dsp.treasure.initZone(zone)
end

function onZoneIn(player, prevZone)
    local cs = -1
    if player:getXPos() == 0 and player:getYPos() == 0 and player:getZPos() == 0 then
        player:setPos(-58.808, -21.364, -286.654, 190)
    end
    return cs
end

function onConquestUpdate(zone, updatetype)
    dsp.conq.onConquestUpdate(zone, updatetype)
end

function onRegionEnter(player, region)
end

function onEventUpdate(player, csid, option)
end

function onEventFinish(player, csid, option)
end
