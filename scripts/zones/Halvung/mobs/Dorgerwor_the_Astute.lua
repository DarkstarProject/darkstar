-----------------------------------
-- Area: Halvung
--  MOB: Dorgerwor the Astute
-----------------------------------
mixins = {require("scripts/mixins/job_special")};
-----------------------------------

function onMobSpawn(mob)
    mob:setLocalVar("mainSpec", dsp.jsa.EES_TROLL);
end;

function onMobDeath(mob, player, isKiller)
end;