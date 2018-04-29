-----------------------------------
-- Area: Sacrarium
--  MOB: Balor
-----------------------------------
mixins = {require("scripts/mixins/job_special")};

function onMobSpawn(mob)
    mob:setLocalVar("mainSpec", dsp.jsa.EES_SHADE);
end;

function onMobDeath(mob, player, isKiller)
end;