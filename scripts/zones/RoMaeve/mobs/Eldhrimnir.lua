-----------------------------------
-- Area: Ro'Maeve (122)
--  Mob: Eldhrimnir
-- Note: Popped by qm1
-- Involved in Quest: Orastery Woes
-- !pos 200.3 -11 -24.8 122
-----------------------------------
require("scripts/globals/wsquest")
-----------------------------------

function onMobInitialize(mob)
    mob:setMobMod(dsp.mobMod.EXP_BONUS,-100)
    mob:setMobMod(dsp.mobMod.IDLE_DESPAWN,180)
end

function onMobDeath(mob,player,isKiller)
    dsp.wsquest.handleWsnmDeath(dsp.wsquest.black_halo,player)
end