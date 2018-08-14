-----------------------------------
-- Area: Dynamis Jeuno
--  MOB: Prowlox_Barrelbelly
-----------------------------------
mixins = {require("scripts/mixins/job_special")}
require("scripts/globals/status")
-----------------------------------

function onMobSpawn(mob)
    mob:setLocalVar("mainSpec", dsp.jsa.EES_GOBLIN)
end

function onMobDeath(mob, player, isKiller)
end