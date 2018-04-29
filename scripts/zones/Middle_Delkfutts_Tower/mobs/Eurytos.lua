-----------------------------------
-- Area: Middle Delkfutt's Tower
--  MOB: Eurytos
-----------------------------------
mixins = {require("scripts/mixins/job_special")};

function onMobSpawn(mob)
    mob:setLocalVar("mainSpec", dsp.jsa.EES_GIGA);
end;

function onMobDeath(mob, player, isKiller)
end;
