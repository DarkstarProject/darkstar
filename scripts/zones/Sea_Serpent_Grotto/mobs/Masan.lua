-----------------------------------
-- Area: Sea Serpent Grotto
--   NM: Masan
-----------------------------------
require("scripts/globals/status")
-----------------------------------

function onMobInitialize(mob)
    mob:setMobMod(dsp.mobMod.GIL_MIN, 1500)
    mob:setMobMod(dsp.mobMod.GIL_MAX, 1800)
end

function onMobDeath(mob, player, isKiller)
end
