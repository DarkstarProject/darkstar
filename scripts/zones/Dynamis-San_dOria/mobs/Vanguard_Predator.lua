-----------------------------------
-- Area: Dynamis San d'Oria
--  NPC: Vanguard Predator
-----------------------------------

mixins = {require("scripts/mixins/job_special")};
require("scripts/globals/status");


function onMobSpawn(mob)
    mob:setLocalVar("mainSpec", dsp.jsa.EES_ORC);
end;

function onMobDeath(mob, player, isKiller)
end;