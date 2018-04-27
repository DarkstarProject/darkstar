-----------------------------------
-- Area: Al'Taieu
--  MOB: Ru_aern
-----------------------------------
require("scripts/globals/missions");
require("scripts/globals/status");
-----------------------------------

function onMobInitialize(mob)
end;

function onMobSpawn(mob)
    mob:hideName(true);
    mob:untargetable(true);
    mob:AnimationSub(5);
    mob:wait(2000);
end;

function onMobEngaged(mob, target)
    mob:hideName(false);
    mob:untargetable(false);
    mob:AnimationSub(6);
    mob:wait(2000);
end;

function onMobDisengage(mob)
    mob:hideName(true);
    mob:untargetable(true);
    mob:AnimationSub(5);
end;

function onMobDeath(mob, player, isKiller)
end;