-----------------------------------
-- Area: Waughroon Shrine
--  Mob: Macha
-- BCNM: Birds of a Feather
-----------------------------------
require("scripts/globals/status")
-----------------------------------

function onMobInitialize(mob)
    mob:setMod(dsp.mod.SLEEPRES, 50)
end

function onMobDeath(mob, player, isKiller)
end
