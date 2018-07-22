-----------------------------------
-- Area: Dynamis Tavnazia
--  MOB: Hydra_Ranger
-----------------------------------
mixins = {require("scripts/mixins/job_special")}
require("scripts/globals/status")
-----------------------------------

function onMobSpawn(mob)
    mob:setLocalVar("mainSpec", dsp.jsa.EES_SHADE)
end

function onMobDeath(mob, player, isKiller)
end