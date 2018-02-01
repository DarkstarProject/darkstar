-----------------------------------
-- Area: Horlais Peak
-- MOB: Mind's-eyed Klugwug
-- BCNM Fight: Dismemberment Brigade
-----------------------------------
mixins = {require("scripts/mixins/job_special")};
require("scripts/globals/status");

function onMobSpawn(mob)
    mob:setLocalVar("mainSpec", jobSpec.EES_ORC);
end;

function onMobDeath(mob, player, isKiller)
end;
