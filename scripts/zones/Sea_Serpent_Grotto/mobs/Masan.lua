-----------------------------------
-- Area: Sea Serpent Grotto
--   NM: Masan
-----------------------------------
require("scripts/globals/status")
-----------------------------------

function onMobInitialize(mob)
    mob:setMobMod(tpz.mobMod.GIL_MIN, 1500)
    mob:setMobMod(tpz.mobMod.GIL_MAX, 1800)
end

function onMobDeath(mob, player, isKiller)
end
