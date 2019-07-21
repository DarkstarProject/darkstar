-----------------------------------
-- Area: North Gustaberg
--   NM: Bedrock Barry
-----------------------------------
require("scripts/globals/regimes")
require("scripts/globals/status")
-----------------------------------

function onMobSpawn(mob)
    mob:addStatusEffect(dsp.effect.STONESKIN, math.random(30, 40), 0, 300)
end

function onMobDeath(mob, player, isKiller)
    dsp.regime.checkRegime(player, mob, 16, 1, dsp.regime.type.FIELDS)
end

function onMobDespawn(mob)
    UpdateNMSpawnPoint(mob:getID())
    mob:setRespawnTime(math.random(3600, 4200))
end
