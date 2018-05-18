----------------------------------
-- Area: The Sanctuary of Zi'Tah (121)
--  MOB: Greenman
--   ID: 17273295
-- Note: Popped by qm1
-- Involved in Quest: The Weight Of Your Limits
-- !pos -325.406 -0.198 471.459 121
-----------------------------------
require("scripts/globals/wsquest")

function onMobInitialize(mob)
    mob:setMobMod(dsp.mobMod.EXP_BONUS,-100)
    mob:setMobMod(dsp.mobMod.IDLE_DESPAWN,180)
end

function onMobDeath(mob,player,isKiller)
    dsp.wsquest.handleWsnmDeath(dsp.wsquest.steel_cyclone,player)
end