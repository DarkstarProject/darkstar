-----------------------------------
-- Area: Upper Delkfutt's Tower
--  MOB: Mimas
-----------------------------------

require("scripts/globals/status");

function onMobSpawn(mob)
    mob:setLocalVar("jobSpecHPP", math.random(35,60));
end;

function onMobFight(mob, target)
    if (mob:getLocalVar("jobSpecUsed") == 0 and mob:getHPP() <= mob:getLocalVar("jobSpecHPP")) then
        mob:setLocalVar("jobSpecUsed", 1);
        mob:useMobAbility(jobSpec.HUNDRED_FISTS);
    end
end;

function onMobDisengage(mob, weather)
    mob:setLocalVar("jobSpecUsed", 0);
end;

function onMobDeath(mob, player, isKiller)
end;
