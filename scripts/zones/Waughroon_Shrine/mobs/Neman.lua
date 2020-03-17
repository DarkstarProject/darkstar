-----------------------------------
-- Area: Waughroon Shrine
--  Mob: Neman
-- BCNM: Birds of a Feather
-----------------------------------
require("scripts/globals/status")
-----------------------------------

function onMobInitialize(mob)
    mob:setMod(tpz.mod.SLEEPRES, 50)
end

function onMobSpawn(mob)
    mob:setMobMod(tpz.mobMod.CHARMABLE, 1)
end

function onMobDeath(mob, player, isKiller)
end
