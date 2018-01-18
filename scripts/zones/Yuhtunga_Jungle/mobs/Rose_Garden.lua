-----------------------------------
-- Area: Yuhtunga Jungle
-- MOB:  Rose Garden
-----------------------------------

require("scripts/zones/Yuhtunga_Jungle/MobIDs");

function disturbMob(mob)
    mob:setLocalVar("timeToGrow", os.time() + math.random(36000,37800)); -- 10:00:00 to 10:30:00
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
    -- Rose Garden has been left alone for 10.25 hours
    if (os.time() > mob:getLocalVar("timeToGrow")) then
        DisallowRespawn(ROSE_GARDEN, true);
        DespawnMob(ROSE_GARDEN);
        DisallowRespawn(VOLUPTUOUS_VILMA, false);
        SpawnMob(VOLUPTUOUS_VILMA);
    end
end;

function onMobDeath(mob, player, isKiller)
end;

function onMobDespawn(mob)
    DisallowRespawn(ROSE_GARDEN, true);
    DisallowRespawn(ROSE_GARDEN_PH, false);
    GetMobByID(ROSE_GARDEN_PH):setRespawnTime(GetMobRespawnTime(ROSE_GARDEN_PH));
end;