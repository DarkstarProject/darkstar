----------------------------------
-- Area: Labyrinth of Onzozo
--   NM: Mysticmaker Profblix
-----------------------------------
mixins = {require("scripts/mixins/job_special")}
require("scripts/globals/regimes")
-----------------------------------

function onMobDeath(mob, player, isKiller)
    dsp.regime.checkRegime(player, mob, 771, 2, dsp.regime.type.GROUNDS)
    dsp.regime.checkRegime(player, mob, 772, 2, dsp.regime.type.GROUNDS)
    dsp.regime.checkRegime(player, mob, 774, 2, dsp.regime.type.GROUNDS)
end

function onMobDespawn(mob)
    UpdateNMSpawnPoint(mob:getID())
    mob:setRespawnTime(math.random(7200, 9000)) -- 2 to 2.5 hours
end
