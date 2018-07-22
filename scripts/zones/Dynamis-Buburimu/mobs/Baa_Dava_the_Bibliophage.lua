-----------------------------------
-- Area: Dynamis Buburimu
--  MOB: Baa_Dava_the_Bibliophage
-----------------------------------
mixins = {require("scripts/mixins/job_special")}
require("scripts/globals/status")
-----------------------------------

function onMobSpawn(mob)
    mob:setLocalVar("mainSpec", dsp.jsa.ASTRAL_FLOW_MAAT)
end

function onMobDeath(mob, player, isKiller)
end