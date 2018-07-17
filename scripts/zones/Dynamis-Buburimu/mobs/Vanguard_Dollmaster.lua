-----------------------------------
-- Area: Dynamis Buburimu
--  MOB: Vanguard_Dollmaster
-----------------------------------
mixins = {require("scripts/mixins/job_special")}
require("scripts/globals/status")
-----------------------------------

function onMobSpawn(mob)
    mob:setLocalVar("mainSpec", dsp.jsa.ASTRAL_FLOW_MAAT)
end

function onMobDeath(mob, player, isKiller)
end