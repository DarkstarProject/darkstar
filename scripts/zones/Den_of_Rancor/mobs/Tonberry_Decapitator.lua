-----------------------------------
-- Area: Den of Rancor
--   NM: Tonberry Decapitator
-----------------------------------
mixins =
{
    require("scripts/mixins/families/tonberry"),
    require("scripts/mixins/job_special")
}
require("scripts/globals/regimes")
-----------------------------------

function onMobDeath(mob, player, isKiller)
    dsp.regime.checkRegime(player, mob, 798, 1, dsp.regime.type.GROUNDS)
    dsp.regime.checkRegime(player, mob, 799, 2, dsp.regime.type.GROUNDS)
    dsp.regime.checkRegime(player, mob, 800, 2, dsp.regime.type.GROUNDS)
end

function onMobDespawn(mob)
    mob:setRespawnTime(math.random(1260, 1440)) -- 21 to 24 minutes
end