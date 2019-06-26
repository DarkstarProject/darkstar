-----------------------------------
-- Area: Ghelsba outpost
--  MOB: Colo-colo
-- BCNM: Wings of Fury
-----------------------------------
require("scripts/globals/status")
-----------------------------------

function onMobSpawn (mob)
    mob:setMobMod(dsp.mobMod.SUPERLINK, mob:getShortID())
end

function onMobDeath(mob, player, isKiller)
end
