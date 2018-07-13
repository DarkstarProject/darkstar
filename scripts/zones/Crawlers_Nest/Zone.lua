-----------------------------------
--
-- Zone: Crawlers_Nest (197)
--
-----------------------------------
package.loaded["scripts/zones/Crawlers_Nest/TextIDs"] = nil
-----------------------------------
require("scripts/zones/Crawlers_Nest/TextIDs")
require("scripts/zones/Crawlers_Nest/MobIDs")
require("scripts/globals/conquest")
-----------------------------------

function onInitialize(zone)
    UpdateTreasureSpawnPoint(CNEST_TREASURE_CHEST)
    UpdateTreasureSpawnPoint(CNEST_TREASURE_COFFER)
end

function onZoneIn(player,prevZone)
    local cs = -1
    if (player:getXPos() == 0 and player:getYPos() == 0 and player:getZPos() == 0) then
        player:setPos(380.617,-34.61,4.581,59)
    end
    return cs
end

function onConquestUpdate(zone, updatetype)
    local players = zone:getPlayers()
    for name, player in pairs(players) do
        conquestUpdate(zone, player, updatetype, CONQUEST_BASE)
    end
end

function onRegionEnter(player,region)
end

function onEventUpdate(player,csid,option)
end

function onEventFinish(player,csid,option)
end