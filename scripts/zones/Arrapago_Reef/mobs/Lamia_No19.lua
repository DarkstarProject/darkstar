-----------------------------------
-- Area: Arrapago Reef
--  MOB: Medusa
-----------------------------------

function onMobSpawn(mob)
end;

function onMobEngaged(mob,target)
    local mobId = mob:getID();
    SpawnMob(mobId+1):updateEnmity(target);
    SpawnMob(mobId+2):updateEnmity(target);
end;

function onMobDeath(mob, player, isKiller)
end;
