-----------------------------------
-- Area: Dynamis Xarcabard
--  MOB: Kindred_Ranger
-----------------------------------
mixins = {require("scripts/mixins/job_special")}
require("scripts/globals/status")
-----------------------------------

function onMobSpawn(mob)
    mob:setLocalVar("mainSpec", dsp.jsa.EES_KINDRED)
end

function onMobDeath(mob, player, isKiller)
end