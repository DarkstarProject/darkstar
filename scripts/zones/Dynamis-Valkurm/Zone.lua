-----------------------------------
-- 
-- Zone: Dynamis-Valkurm
-- 
-----------------------------------
local ID = require("scripts/zones/Dynamis-Valkurm/IDs")
require("scripts/globals/keyitems")
require("scripts/globals/settings")
-----------------------------------

function onInitialize(zone)
    for i,v in ipairs (ID.mob.TE5_RANDOM) do
        DisallowRespawn(v, true)
    end
    local randomTE5 = ID.mob.TE5_RANDOM[math.random(#ID.mob.TE5_RANDOM)]
    DisallowRespawn(randomTE5, false)
    SpawnMob(randomTE5)
end

function onConquestUpdate(zone, updatetype)
    local players = zone:getPlayers()
    
    for name, player in pairs(players) do
        conquestUpdate(zone, player, updatetype, ID.text.CONQUEST_BASE)
    end
end

function onZoneIn(player,prevZone)
    local cs = -1

    if player:getVar("Dynamis_Entry") == 1 then
        if player:getVar("Dynamis_subjob") == 1 then
            player:timer(5000, function(player) player:messageBasic(107) end)
            player:addStatusEffect(dsp.effect.SJ_RESTRICTION, 0, 0, 0, 7200)
        end
        player:addStatusEffectEx(dsp.effect.DYNAMIS, 0, 0, 3, 3600)
        player:timer(5500, function(player) player:messageSpecial(ID.text.DYNAMIS_TIME_BEGIN, 60, dsp.ki.PRISMATIC_HOURGLASS) end)
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
