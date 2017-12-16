-----------------------------------
-- Area: QuBia_Arena
-- Mission 9-2 SANDO
-----------------------------------

require("scripts/zones/QuBia_Arena/TextIDs");
require("scripts/globals/missions");
require("scripts/globals/titles");
require("scripts/globals/status");

function onMobInitialize(mob)
    mob:setMobMod(MOBMOD_SCRIPTED_2HOUR, 1);
    mob:addMod(MOD_SLEEPRES,50);
end;

function onMobSpawn(mob)
    mob:setLocalVar("2HOUR_HPP",math.random(35,60));
end;

function onMobFight(mob,target)
    if (mob:getLocalVar("2HOUR_USED") == 0 and mob:getHPP() <= mob:getLocalVar("2HOUR_HPP")) then
        mob:setLocalVar("2HOUR_USED", 1);
        mob:useMobAbility(jobSpec.INVINCIBLE);
    end
end;

function onMobDisengage(mob, weather)
    mob:setLocalVar("2HOUR_USED", 0);
end;

function onMobDeath(mob, player, isKiller)
end;
