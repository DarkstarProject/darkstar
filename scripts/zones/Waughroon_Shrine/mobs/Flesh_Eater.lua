-----------------------------------
-- Area: Waughroon Shrine
--  Mob: Flesh Eater
-- BCNM: The Worm's Turn
-----------------------------------
require("scripts/globals/status")
-----------------------------------

function onMobSpawn(mob)
    mob:setMobMod(dsp.mobMod.CHARMABLE, 1)
end

function onMobDeath(mob, player, isKiller)
end
