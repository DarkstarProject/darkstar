-----------------------------------
-- Area: Bearclaw Pinnacle
--  Mob: Mindertaur
--  ENM: Brothers
-----------------------------------
require("scripts/globals/status")
-----------------------------------

function onMobInitialize(mob)
    mob:setMod(dsp.mod.SILENCERES, 75)
    mob:setMod(dsp.mod.DMGMAGIC, -10)
    mob:setMod(dsp.mod.SLEEPRES, 50)
end

function onMobSpawn(mob)
    mob:setMobMod(dsp.mobMod.SUPERLINK, GetMobByID(mob:getID() - 1):getShortID())
end

function onMobDeath(mob, player, isKiller)
end
