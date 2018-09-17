-----------------------------------
-- Area: Ilrusi Atoll (Extermination)
--  MOB: Undead Crab
-----------------------------------

function onMobSpawn(mob)
    local instance = mob:getInstance()
    local CRAB = GetMobByID(17002541, instance)
    
    CRAB:setLocalVar("CrabSpawned", 1)
end

function onMobDeath(mob, player, isKiller)
end

function onMobDespawn(mob)
    local instance = mob:getInstance()

    instance:setProgress(instance:getProgress() + 1)
end