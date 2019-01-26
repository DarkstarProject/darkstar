-----------------------------------
-- Area: Dynamis Qufim
--  MOB: Vanguard_Salvager
-----------------------------------
mixins = {require("scripts/mixins/job_special")}
require("scripts/globals/status")
-----------------------------------

function onMobSpawn(mob)
    mob:setLocalVar("mainSpec", dsp.jsa.EES_YAGUDO)
end

function onMobDeath(mob, player, isKiller)
end