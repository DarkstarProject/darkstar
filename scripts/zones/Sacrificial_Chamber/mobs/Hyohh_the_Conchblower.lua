-----------------------------------
-- Area: Sacrificial Chamber
--  MOB: Hyohh the Conchblower
-- BCNM: Amphibian Assault
-----------------------------------
mixins = {require("scripts/mixins/job_special")}
require("scripts/globals/status")
-----------------------------------

function onMobSpawn(mob)
    mob:setMobMod(dsp.mobMod.SUPERLINK, GetMobByID(mob:getID() - 2):getShortID())
end

function onMobDeath(mob, player, isKiller)
end
