-----------------------------------
-- Area: Cape Teriggan
--   NM: Stolas
-- Note: Popped by qm1
-- !pos -151.65 -8.5 191.37 113
-- Involved in Quest: From Saplings Grow
-----------------------------------
require("scripts/globals/wsquest")
-----------------------------------

function onMobInitialize(mob)
    mob:setMobMod(dsp.mobMod.EXP_BONUS,-100)
    mob:setMobMod(dsp.mobMod.IDLE_DESPAWN,180)
end

function onMobDeath(mob,player,isKiller)
    dsp.wsquest.handleWsnmDeath(dsp.wsquest.empyreal_arrow,player)
end