-----------------------------------
-- Area: Dynamis Beaucedine
--  MOB: GuKhu_Dukesniper
-----------------------------------
mixins = {require("scripts/mixins/job_special")}
require("scripts/globals/status")
-----------------------------------

function onMobSpawn(mob)
    mob:setLocalVar("mainSpec", dsp.jsa.EES_QUADAV)
end

function onMobDeath(mob, player, isKiller)
end