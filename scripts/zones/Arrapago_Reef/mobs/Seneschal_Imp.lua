-----------------------------------
-- Area: Arrapago Reef
--  MOB: Seneschal Imp
-----------------------------------
require("scripts/globals/status");
-----------------------------------

function onMobInitialize(mob)
end;

function onMobSpawn(mob)
end;

function onMobFight(mob, target)
end;

function onCriticalHit(mob)

    if (math.random(100) < 20 and mob:AnimationSub() == 0) then  -- 20% change to break that horn on crit
        mob:AnimationSub(1);
    end
end;

function onMobDeath(mob, player, isKiller)
end;
