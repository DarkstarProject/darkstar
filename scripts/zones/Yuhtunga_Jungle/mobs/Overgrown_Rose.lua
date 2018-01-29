-----------------------------------
-- Area: Yuhtunga Jungle
--  MOB: Overgrown Rose
-----------------------------------
require("scripts/zones/Yuhtunga_Jungle/MobIDs");

function disturbMob(mob)
    if (mob:getID() == ROSE_GARDEN_PH) then
        mob:setLocalVar("timeToGrow", os.time() + math.random(36000,37800)); -- 10:00:00 to 10:30:00
    end
end

function onMobSpawn(mob)
    disturbMob(mob);
end;

function onMobEngaged(mob, target)
    disturbMob(mob);
end;

function onMobFight(mob, target)
    disturbMob(mob);
end;

function onMobRoam(mob)
    -- Rose Garden PH has been left alone for 10.25 hours
    if (mob:getID() == ROSE_GARDEN_PH and os.time() > mob:getLocalVar("timeToGrow")) then
        DisallowRespawn(ROSE_GARDEN_PH, true);
        DespawnMob(ROSE_GARDEN_PH);
        DisallowRespawn(ROSE_GARDEN, false);
        SpawnMob(ROSE_GARDEN);
    end
end;

function onMobDeath(mob, player, isKiller)
end;

function onMobDespawn(mob)
end;
