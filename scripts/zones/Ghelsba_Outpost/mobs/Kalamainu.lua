-----------------------------------
-- Area: Ghelsba outpost
--  MOB: Kalamainu
-- BCNM: Petrifying Pair
-----------------------------------
require("scripts/globals/status")
-----------------------------------

function onMobSpawn (mob)
    mob:setMobMod(dsp.mobMod.SUPERLINK, mob:getShortID())
end

function onMobDeath(mob, player, isKiller)
end
