----------------------------------
-- Area: Quicksand Caves
--  NM:  Centurio X-I
-----------------------------------

require("scripts/globals/status");

function onMobInitialize(mob)
    mob:setMobMod(MOBMOD_ALWAYS_AGGRO, 1);
    mob:setMobMod(MOBMOD_SCRIPTED_2HOUR, 1);
end;

function onMobSpawn(mob)
    mob:addMod(MOD_SILENCERES, 35);
    mob:addMod(MOD_SLEEPRES, 50);
    mob:addMod(MOD_LULLABYRES, 50);
    mob:addMod(MOD_SPELLINTERRUPT, 25);
    mob:setLocalVar("2HOUR_HPP", math.random(35,60));
end;

function onMobFight(mob,target)
    if (mob:getLocalVar("2HOUR_USED") == 0 and mob:getHPP() <= mob:getLocalVar("2HOUR_HPP")) then
        mob:setLocalVar("2HOUR_USED", 1);
        mob:useMobAbility(jobSpec.MANAFONT);
    end
end;

function onMobDisengage(mob, weather)
    mob:setLocalVar("2HOUR_USED", 0);
end;

function onMobDeath(mob, player, isKiller)
end;

function onMobDespawn(mob)
end;
