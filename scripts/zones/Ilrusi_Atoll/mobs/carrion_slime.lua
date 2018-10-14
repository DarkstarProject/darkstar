-----------------------------------
-- Area: Ilrusi Atoll (Extermination)
--  MOB: Carrion Slime
-----------------------------------

function onMobSpawn(mob)
end;

function onMobDeath(mob, player, isKiller)
end;

function onMobDespawn(mob)
    local instance = mob:getInstance()
    local CRAB = instance:getEntity(bit.band(17002543, 0xFFF), dsp.objType.MOB)
    local RAND = math.random(1,5)
    
    if RAND == 1 and CRAB:getLocalVar("SlimeSpawned") == 0 then
        SpawnMob(17002543, instance)
        CRAB:setLocalVar("SlimeSpawned", 1)
    else
        instance:setProgress(instance:getProgress() + 1)
    end
end;