-----------------------------------
-- Area: Temple of Uggalepih (159)
--   NM: Yallery Brown
-- Note: Popped by qm9
-- Involved in Quest: Axe The Competition
-- !pos 220 -8.11 205.38 159
-----------------------------------
require("scripts/globals/wsquest")
require("scripts/globals/status")
-----------------------------------

function onMobInitialize(mob)
    mob:setMobMod(dsp.mobMod.EXP_BONUS, -100)
    mob:setMobMod(dsp.mobMod.IDLE_DESPAWN, 180)
end

function onMobDeath(mob, player, isKiller)
    dsp.wsquest.handleWsnmDeath(dsp.wsquest.decimation, player)
end