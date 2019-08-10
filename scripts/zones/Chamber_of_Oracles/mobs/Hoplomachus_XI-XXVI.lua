-----------------------------------
-- Area: Chamber of Oracles
--  Mob: Hoplomachus XI-XXVI
-- BCNM: Legion XI Comitatensis
-----------------------------------
mixins = {require("scripts/mixins/job_special")}
-----------------------------------

function onMobSpawn(mob)
    mob:setMobMod(dsp.mobMod.SUPERLINK, GetMobByID(mob:getID() - 2):getShortID())
end

function onMobDeath(mob, player, isKiller)
end
