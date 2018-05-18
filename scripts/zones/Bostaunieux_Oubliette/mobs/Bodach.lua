----------------------------------
-- Area: Bostaunieux Oubliette (167)
--  MOB: Bodach
--   ID: 17461479
-- Note: Popped by qm1
-- Involved in Quest: The Walls of Your Mind
-- !pos 29 16 -140 167
-----------------------------------
require("scripts/globals/wsquest")

function onMobInitialize(mob)
    mob:setMobMod(dsp.mobMod.EXP_BONUS,-100)
    mob:setMobMod(dsp.mobMod.IDLE_DESPAWN,180)
end

function onMobDeath(mob,player,isKiller)
    dsp.wsquest.handleWsnmDeath(dsp.wsquest.asuran_fists,player)
end