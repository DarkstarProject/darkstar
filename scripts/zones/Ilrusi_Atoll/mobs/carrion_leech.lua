-----------------------------------
-- Area: Ilrusi Atoll (Extermination)
--  MOB: Carrion Leech
-----------------------------------

function onMobSpawn(mob)
end;

function onMobDeath(mob, player, isKiller)
end;

function onMobDespawn(mob)
    local instance = mob:getInstance()
    local CRAB = instance:getEntity(bit.band(17002542, 0xFFF), dsp.objType.MOB)
    local RAND = math.random(1,5)
    
    if RAND == 1 and CRAB:getLocalVar("LeechSpawned") == 0 then
        SpawnMob(17002542, instance)
        CRAB:setLocalVar("LeechSpawned", 1)
    else
        instance:setProgress(instance:getProgress() + 1)
    end
end;