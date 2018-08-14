-----------------------------------
--
-- Zone: Den_of_Rancor (160)
--
-----------------------------------
package.loaded["scripts/zones/Den_of_Rancor/TextIDs"] = nil
-----------------------------------
require("scripts/zones/Den_of_Rancor/TextIDs")
require("scripts/zones/Den_of_Rancor/MobIDs")
require("scripts/globals/conquest")
-----------------------------------

function onInitialize(zone)
    UpdateTreasureSpawnPoint(RANCOR_TREASURE_COFFER)
end

function onConquestUpdate(zone, updatetype)
    dsp.conq.onConquestUpdate(zone, updatetype)
end

function onZoneIn(player,prevZone)
    local cs = -1
    if player:getXPos() == 0 and player:getYPos() == 0 and player:getZPos() == 0 then
        player:setPos(196.421,34.595,-60.319,110)
    end
    return cs
end

function onRegionEnter(player,region)
end

function onEventUpdate(player,csid,option)
end

function onEventFinish(player,csid,option)
end