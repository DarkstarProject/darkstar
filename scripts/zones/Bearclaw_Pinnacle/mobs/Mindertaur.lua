-----------------------------------
-- Area: Bearclaw Pinnacle
--  Mob: Mindertaur
--  ENM: Brothers
-----------------------------------
require("scripts/globals/status")
-----------------------------------

function onMobInitialize(mob)
    mob:setMod(tpz.mod.SILENCERES, 75)
    mob:setMod(tpz.mod.DMGMAGIC, -10)
    mob:setMod(tpz.mod.SLEEPRES, 50)
end

function onMobDeath(mob, player, isKiller)
end
