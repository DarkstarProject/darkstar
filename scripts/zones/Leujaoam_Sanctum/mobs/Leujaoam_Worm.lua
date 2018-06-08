-----------------------------------
-- Area: Leujaoam Sanctum (Leujaoam Cleansing)
--  MOB: Leujaoam Worm
-----------------------------------

function onMobSpawn(mob)
end;

function onMobEngaged(mob,target)

end;

function onMobDeath(mob, player, isKiller)
end;

function onMobDespawn(mob)
    local instance = mob:getInstance();
    instance:setProgress(instance:getProgress() + 1);
end;