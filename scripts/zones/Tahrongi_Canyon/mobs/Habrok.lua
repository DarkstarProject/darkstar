-----------------------------------
-- Area: Tahrongi Canyon
--  MOB: Habrok
-----------------------------------

function onMobInitialize(mob)
    mob:setLocalVar("pop", os.time() + math.random(1200,7200));
end;

function onMobDeath(mob, player, isKiller)
end;

function onMobDespawn(mob)
    UpdateNMSpawnPoint(mob:getID());
    mob:setLocalVar("pop", os.time() + math.random(1200,7200));
end;
