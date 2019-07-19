-----------------------------------
-- Area: Den of Rancor
--   NM: Mokumokuren
-- Note: Popped by qm2
-- !pos 117 36 -280 160
-- Involved in Quest: Souls in Shadow
-----------------------------------
require("scripts/globals/wsquest")
-----------------------------------

function onMobInitialize(mob)
    mob:setMobMod(dsp.mobMod.EXP_BONUS,-100)
    mob:setMobMod(dsp.mobMod.IDLE_DESPAWN,180)
end

function onMobDeath(mob,player,isKiller)
    dsp.wsquest.handleWsnmDeath(dsp.wsquest.spiral_hell,player)
end
