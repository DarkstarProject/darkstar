----------------------------------
-- Area: Gustav Tunnel (212)
--  MOB: Baronial Bat
--   ID: 17645809
-- Note: Popped by qm1
-- !pos 56 -1 16 212
-- Involved in Quest: Cloak and Dagger
-----------------------------------
require("scripts/globals/wsquest")

function onMobInitialize(mob)
    mob:setMobMod(dsp.mobMod.EXP_BONUS,-100)
    mob:setMobMod(dsp.mobMod.IDLE_DESPAWN,180)
end

function onMobDeath(mob,player,isKiller)
    dsp.wsquest.handleWsnmDeath(dsp.wsquest.evisceration,player)
end