-----------------------------------
-- Area: Chamber of Oracles
-- MOB: Centurio XI-I
-- BCNM Fight: Legion XI Comitatensis
-----------------------------------
mixins = {require("scripts/mixins/job_special")};
require("scripts/globals/status");

function onMobSpawn(mob)
    mob:setLocalVar("mainSpec", jobSpec.EES_ANTICA);
end;

function onMobDeath(mob, player, isKiller)
end;
