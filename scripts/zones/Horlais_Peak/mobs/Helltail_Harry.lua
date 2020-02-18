-----------------------------------
-- Area: Horlais Peak
--  Mob: Helltail Harry
-- BCNM: Tails of Woe
-----------------------------------
require("scripts/globals/status")
-----------------------------------

function onMobInitialize(mob)
    mob:setMobMod(tpz.mobMod.NO_DROPS, 1)
end

function onMobSpawn(mob)
    mob:setMod(tpz.mod.SLEEPRES, 1000) -- needs to be set as full immunity but worried that setting it will knock out chance of lullaby 
    mob:setMod(tpz.mod.SILENCERES, 900)
    mob:setMod(tpz.mod.LULLABYRES, 700) -- this is for lullaby since he can be slept with it, just not easily
end

function onMobDeath(mob, player, isKiller)
end