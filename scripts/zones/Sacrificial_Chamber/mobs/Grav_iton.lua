-----------------------------------
-- Area: Sacrificial Chamber
--  MOB: Grav'Iton
-- Zilart Mission 4 BCNM Fight
-----------------------------------
mixins = {require("scripts/mixins/families/tonberry")}
mixins = {require("scripts/mixins/job_special")};

require("scripts/globals/status");

function onMobSpawn(mob)
    mob:addMod(MOD_SLEEPRES, 50);
    mob:addMod(MOD_LULLABYRES, 50);
    mob:setLocalVar("everyonesRancorHPP", math.random(20,30));
end;

function onMobFight(mob, target)
    if (mob:getLocalVar("everyonesRancorUsed") == 0 and mob:getHPP() <= mob:getLocalVar("everyonesRancorHPP")) then
        mob:setLocalVar("everyonesRancorUsed", 1);
        mob:useMobAbility(921);
    end
end;

function onMobDisengage(mob, weather)
    mob:setLocalVar("everyonesRancorUsed", 0);
end;

function onMobDeath(mob, player, isKiller)
end;
