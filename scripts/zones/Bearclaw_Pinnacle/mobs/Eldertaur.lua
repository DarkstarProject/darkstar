-----------------------------------
-- Area: Bearclaw Pinnacle
--  Mob: Eldertaur
--  ENM: Brothers
-----------------------------------
require("scripts/globals/status")
-----------------------------------

function onMobInitialize(mob)
    mob:setMobMod(dsp.mobMod.DRAW_IN, 1)
    mob:setMod(dsp.mod.DMGMAGIC, -10)
    mob:setMod(dsp.mod.SLEEPRES, 75)
end

function onMobDeath(mob, player, isKiller)
end
