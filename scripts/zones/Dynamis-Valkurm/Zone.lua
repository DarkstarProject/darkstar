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
    for i,v in ipairs (TE5_RANDOM) do
        DisallowRespawn(v, true)
    end
    local randomTE5 = TE5_RANDOM[math.random(#TE5_RANDOM)]
    DisallowRespawn(randomTE5, false)
    SpawnMob(randomTE5)
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

    player:addListener("DYNAMIS_TIME_UPDATE", "DYNAMIS_TIME_UPDATE", function(player, time)
        local minutes = 0
        if time >= 60 then
            minutes = 1
            time = time / 60
        end
        if time == 1 then
            player:messageSpecial(DYNAMIS_TIME_UPDATE_1, time, minutes)
        else
            player:messageSpecial(DYNAMIS_TIME_UPDATE_2, time, minutes)
        end
    end)

    if player:getVar("Dynamis_Entry") == 1 then
        if player:getVar("Dynamis_subjob") == 1 then
            player:messageBasic(107)
            player:addStatusEffect(dsp.effect.SJ_RESTRICTION, 0, 0, 0, 7200)
        end
        player:addStatusEffectEx(dsp.effect.DYNAMIS, 0, 0, 3, 3600)
        player:messageSpecial(DYNAMIS_TIME_BEGIN, 60, dsp.ki.PRISMATIC_HOURGLASS)
        player:setVar("Dynamis_Entry", 0)
        player:setVar("Dynamis_subjob", 0)
    else
        if not player:hasStatusEffect(dsp.effect.DYNAMIS) then
            cs = 100
        end
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
