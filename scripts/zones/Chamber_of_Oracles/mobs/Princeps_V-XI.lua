-----------------------------------
-- Area: Chamber of Oracles
--  MOB: Princeps V-XI
-- Zilart 6 Fight
-----------------------------------
mixins = {require("scripts/mixins/job_special")};
require("scripts/globals/status");

function onMobSpawn(mob)
    mob:setLocalVar("mainSpec", jobSpec.EES_ANTICA);
end;

function onMobDeath(mob, player, isKiller)
end;
