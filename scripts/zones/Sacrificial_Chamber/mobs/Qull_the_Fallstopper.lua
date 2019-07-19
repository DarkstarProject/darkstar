-----------------------------------
-- Area: Sacrificial Chamber
--  Mob: Qull the Fallstopper
-- BCNM: Amphibian Assault
-----------------------------------
mixins = {require("scripts/mixins/job_special")}
require("scripts/globals/status")
-----------------------------------

function onMobSpawn(mob)
    mob:setMobMod(dsp.mobMod.SUPERLINK, mob:getShortID())
end

function onMobDeath(mob, player, isKiller)
end
