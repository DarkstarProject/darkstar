-----------------------------------
-- 
-- Zone: Dynamis-Valkurm
-- 
-----------------------------------
package.loaded["scripts/zones/Dynamis-Valkurm/TextIDs"] = nil
-----------------------------------
require("scripts/zones/Dynamis-Valkurm/TextIDs")
require("scripts/zones/Dynamis-Valkurm/MobIDs")
require("scripts/globals/settings")
-----------------------------------

function onInitialize(zone)
    for i,v in pairs (TE5_RANDOM) do
        DisallowRespawn(v, true)
    end
    local randomTE5 = math.random(0,3)
    DisallowRespawn(TE5_RANDOM[randomTE5], false)
    SpawnMob(TE5_RANDOM[randomTE5])
end

function onConquestUpdate(zone, updatetype)
    local players = zone:getPlayers()
    
    for name, player in pairs(players) do
        conquestUpdate(zone, player, updatetype, CONQUEST_BASE)
    end
end

function onZoneIn(player,prevZone)
    local cs = -1

    player:addListener("DYNAMIS_EXPIRE", "DYNAMIS_EXPIRE", function(player)
        player:messageSpecial(DYNAMIS_TIME_EXPIRED)
    end)

    if not player:hasStatusEffect(dsp.effect.DYNAMIS) then
        cs = 100
    end

    return cs
end

function onRegionEnter(player,region)
end

function onEventUpdate(player,csid,option)
end

function onEventFinish(player,csid,option)
    if csid == 100 then
        player:setPos(117,-9,132,162,103)
    end
end