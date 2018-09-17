-----------------------------------
-- Area: Ilrusi Atoll (Extermination)
--  MOB: Carrion Crab
-----------------------------------

function onMobSpawn(mob)
end

function onMobDeath(mob, player, isKiller)
end

function onMobDespawn(mob)
    local instance = mob:getInstance()
    local CRAB = GetMobByID(17002541, instance)
    local RAND = math.random(1,4)
    
    if RAND == 1 and CRAB:getLocalVar("CrabSpawned") == 0 then
        SpawnMob(17002541, instance)
    else
        instance:setProgress(instance:getProgress() + 1)
    end
end