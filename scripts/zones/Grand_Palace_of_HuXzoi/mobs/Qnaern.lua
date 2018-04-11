-----------------------------------
-- Area: Grand Palace of HuXzoi
--  MOB: Qn'aern
-----------------------------------
mixins = {require("scripts/mixins/job_special")};
require("scripts/globals/status");
-----------------------------------

function onMobInitialize(mob)
    mob:setMobMod(MOBMOD_2HOUR_MULTI,1);
end;

function onMobSpawn(mob)
    local mJob = mob:getMainJob();
    if (mJob == JOBS.RDM) then
        mob:setMod(MOD_FASTCAST,15);
    elseif (mJob == JOBS.WHM) then
        mob:setMod(MOD_REGEN, 3);
    end
end;

function onMobDeath(mob, player, isKiller)
end;
