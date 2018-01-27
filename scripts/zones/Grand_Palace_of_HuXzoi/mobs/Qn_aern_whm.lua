-----------------------------------
-- Area: Grand Palace of HuXzoi
--  MOB: Qn'aern (WHM)
-- ID: 16916817
-----------------------------------
require("scripts/globals/status");
-----------------------------------

function onMobInitialize(mob)
    mob:setMobMod(MOBMOD_MAIN_2HOUR,1);
    mob:setMobMod(MOBMOD_2HOUR_MULTI,1);
end;

function onMobSpawn(mob)
    mob:setMod(MOD_REGEN, 3);
end;

function onMobEngaged(mob,target)
end;

function onMobFight(mob,target)
end;

function onMobDeath(mob, player, isKiller)
end;