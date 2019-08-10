-----------------------------------
-- Area: Chamber of Oracles
--  Mob: Secutor XI-XXXII
-- BCNM: Legion XI Comitatensis
-----------------------------------
mixins = {require("scripts/mixins/job_special")}
-----------------------------------

function onMobSpawn(mob)
    mob:setMobMod(dsp.mobMod.SUPERLINK, mob:getShortID())
end

function onMobDeath(mob, player, isKiller)
end
