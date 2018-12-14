-----------------------------------
-- Area: Xarcabard
--   NM: Duke Focalor
-----------------------------------
require("scripts/globals/regimes")
-----------------------------------

function onMobDeath(mob, player, isKiller)
    dsp.regime.checkRegime(player, mob, 55, 1, dsp.regime.type.FIELDS)
end

function onMobDespawn(mob)
    UpdateNMSpawnPoint(mob:getID())
    mob:setRespawnTime(math.random(5400,7200))
end
