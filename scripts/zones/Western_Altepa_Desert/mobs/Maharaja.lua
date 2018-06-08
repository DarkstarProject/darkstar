----------------------------------
-- Area: Western Altepa Desert (125)
--  MOB: Maharaja
--   ID: 17289656
-- Note: Popped by qm1
-- Involved in Quest: Inheritance
-- !pos -652.3 0.2 -341.5 125
-----------------------------------
require("scripts/globals/wsquest")

function onMobInitialize(mob)
    mob:setMobMod(dsp.mobMod.EXP_BONUS,-100)
    mob:setMobMod(dsp.mobMod.IDLE_DESPAWN,180)
end

function onMobDeath(mob,player,isKiller)
    dsp.wsquest.handleWsnmDeath(dsp.wsquest.ground_strike,player)
end