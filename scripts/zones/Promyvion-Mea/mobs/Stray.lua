-----------------------------------
-- Area: Promyvion-Mea
--   NM: Stray
-----------------------------------
require("scripts/globals/promyvion")
-----------------------------------

function onMobSpawn(mob)
    dsp.promyvion.strayOnSpawn(mob)
end

function onMobDeath(mob, player, isKiller)
end