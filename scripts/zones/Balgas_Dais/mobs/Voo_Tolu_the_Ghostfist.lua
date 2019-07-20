-----------------------------------
-- Area: Balga's Dais
--  Mob: Voo Tolu the Ghostfist
-- BCNM: Divine Punishers
-----------------------------------
mixins = {require("scripts/mixins/job_special")};
require("scripts/globals/status")
-----------------------------------

function onMobSpawn(mob)
    mob:setMobMod(dsp.mobMod.SUPERLINK, mob:getShortID())
end

function onMobDeath(mob, player, isKiller)
end
