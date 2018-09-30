-----------------------------------
-- Area: Yuhtunga Jungle
--  MOB: Overgrown Rose
-----------------------------------
local ID = require("scripts/zones/Yuhtunga_Jungle/IDs");

function disturbMob(mob)
    if (mob:getID() == ID.mob.ROSE_GARDEN_PH) then
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
    if (mob:getID() == ID.mob.ROSE_GARDEN_PH and os.time() > mob:getLocalVar("timeToGrow")) then
        DisallowRespawn(ID.mob.ROSE_GARDEN_PH, true);
        DespawnMob(ID.mob.ROSE_GARDEN_PH);
        DisallowRespawn(ID.mob.ROSE_GARDEN, false);
        SpawnMob(ID.mob.ROSE_GARDEN);
    end
end;

function onMobDeath(mob, player, isKiller)
end;

function onMobDespawn(mob)
end;
