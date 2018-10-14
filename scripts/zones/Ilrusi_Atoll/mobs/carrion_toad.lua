-----------------------------------
-- Area: Ilrusi Atoll (Extermination)
--  MOB: Carrion Toad
-----------------------------------

function onMobSpawn(mob)
end;

function onMobDeath(mob, player, isKiller)
end;

function onMobDespawn(mob)
    local instance = mob:getInstance()
    local CRAB = instance:getEntity(bit.band(17002544, 0xFFF), dsp.objType.MOB)
    local RAND = math.random(1,5)
    
    if RAND == 1 and CRAB:getLocalVar("ToadSpawned") == 0 then
        SpawnMob(17002544, instance)
        CRAB:setLocalVar("ToadSpawned", 1)
    else
        instance:setProgress(instance:getProgress() + 1)
    end
end;