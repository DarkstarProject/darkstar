-----------------------------------
-- Area: Bearclaw Pinnacle
--  Mob: Eldertaur
--  ENM: Brothers
-----------------------------------
require("scripts/globals/status")
-----------------------------------

function onMobInitialize(mob)
    mob:setMobMod(tpz.mobMod.DRAW_IN, 1)
    mob:setMod(tpz.mod.DMGMAGIC, -10)
    mob:setMod(tpz.mod.SLEEPRES, 75)
end

function onMobDeath(mob, player, isKiller)
end
