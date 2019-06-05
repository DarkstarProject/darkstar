-----------------------------------
-- Area: Den of Rancor
--   NM: Tonberry Tracker
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
