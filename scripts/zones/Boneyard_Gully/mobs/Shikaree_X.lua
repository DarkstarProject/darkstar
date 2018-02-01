-----------------------------------
-- Area: Boneyard_Gully
-- Name: Shikaree X
-----------------------------------
require("scripts/globals/titles");
require("scripts/globals/status");
-----------------------------------

function onMobInitialize(mob)
end;

function onMobEngaged(mob,target)

    local MobID = mob:getID();

    if (MobID == 16809987) then
        SpawnMob(MobID+2);
    elseif (MobID == 16809992) then
        SpawnMob(MobID+2);
    elseif (MobID == 16809997) then
        SpawnMob(MobID+2);
    end
end;

function onMobFight(mob,target)
end;

function onMobDeath(mob, player, isKiller)
end;