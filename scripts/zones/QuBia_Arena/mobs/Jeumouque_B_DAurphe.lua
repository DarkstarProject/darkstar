-----------------------------------
-- Area: Qu'Bia Arena
-- MOB: Jeumouque B D'Aurphe
-- BCNM Fight: Brothers D'Aurphe
-----------------------------------
mixins = {require("scripts/mixins/job_special")};
require("scripts/globals/status");

function onMobSpawn(mob)
    mob:setLocalVar("mainSpec", dsp.jsa.EES_SHADE);
end;

function onMobDeath(mob, player, isKiller)
end;
