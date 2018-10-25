-----------------------------------
-- Area: Yuhtunga Jungle
--  MOB: Rose Garden
-----------------------------------
local ID = require("scripts/zones/Yuhtunga_Jungle/IDs");

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
        DisallowRespawn(ID.mob.ROSE_GARDEN, true);
        DespawnMob(ID.mob.ROSE_GARDEN);
        DisallowRespawn(ID.mob.VOLUPTUOUS_VILMA, false);
        SpawnMob(ID.mob.VOLUPTUOUS_VILMA);
    end
end;

function onMobDeath(mob, player, isKiller)
end;

function onMobDespawn(mob)
    DisallowRespawn(ID.mob.ROSE_GARDEN, true);
    DisallowRespawn(ID.mob.ROSE_GARDEN_PH, false);
    GetMobByID(ID.mob.ROSE_GARDEN_PH):setRespawnTime(GetMobRespawnTime(ID.mob.ROSE_GARDEN_PH));
end;