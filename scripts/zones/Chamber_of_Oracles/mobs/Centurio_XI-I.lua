-----------------------------------
-- Area: Chamber of Oracles
--  Mob: Centurio XI-I
-- BCNM: Legion XI Comitatensis
-----------------------------------
mixins = {require("scripts/mixins/job_special")}
-----------------------------------

function onMobSpawn(mob)
    mob:setMobMod(dsp.mobMod.SUPERLINK, GetMobByID(mob:getID() - 3):getShortID())
end

function onMobDeath(mob, player, isKiller)
end
