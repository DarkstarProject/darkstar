-----------------------------------
-- Area: Sea Serpent Grotto
--  Mob: Water Leaper
-- Note: Popped by qm1
-- !pos 112.5 0.8 -126.2 176
-- Involved in Quest: Methods Create Madness
-----------------------------------
require("scripts/globals/wsquest")
require("scripts/globals/status")
-----------------------------------

function onMobInitialize(mob)
    mob:setMobMod(dsp.mobMod.EXP_BONUS, -100)
    mob:setMobMod(dsp.mobMod.IDLE_DESPAWN, 180)
end

function onMobDeath(mob, player, isKiller)
    dsp.wsquest.handleWsnmDeath(dsp.wsquest.impulse_drive, player)
end