-----------------------------------
-- Area: Horlais Peak
--  MOB: Jagidbod of Clan Reaper
-----------------------------------
require("scripts/globals/status");

function onMobInitialize(mob)
    mob:setMobMod(MOBMOD_SCRIPTED_2HOUR, 1);
end;

function onMobSpawn(mob)
    mob:setLocalVar("2HOUR_HPP", math.random(35,60));
end;

function onMobFight(mob, target)
    if (mob:getLocalVar("2HOUR_USED") == 0 and mob:getHPP() <= mob:getLocalVar("2HOUR_HPP")) then
        mob:setLocalVar("2HOUR_USED", 1);
        mob:useMobAbility(jobSpec.EES_ORC);
    end
end;

function onMobDisengage(mob, weather)
    mob:setLocalVar("2HOUR_USED", 0);
end;

function onMobDeath(mob, player, isKiller)
end;
