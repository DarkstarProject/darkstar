-----------------------------------
-- Area: Qu'Bia Arena   
-- MOB: Nephiyl Pinnacletosser
-- Fight:  Demolition Squad
-----------------------------------
mixins = {require("scripts/mixins/job_special")};
require("scripts/globals/status");

function onMobSpawn(mob)
    mob:setLocalVar("mainSpec", jobSpec.EES_GIGA);
end;

function onMobDeath(mob, player, isKiller)
end;
