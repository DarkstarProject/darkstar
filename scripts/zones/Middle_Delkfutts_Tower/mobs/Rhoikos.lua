-----------------------------------
-- Area: Middle Delkfutt's Tower
--  MOB: Rhoikos
-----------------------------------
mixins = {require("scripts/mixins/job_special")};

function onMobSpawn(mob)
    mob:setLocalVar("mainSpec", jobSpec.EES_GIGA);
end;

function onMobDeath(mob, player, isKiller)
end;
