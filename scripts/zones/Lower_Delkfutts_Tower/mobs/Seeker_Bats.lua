-----------------------------------
-- Area: Lower Delkfutt's Tower
--  Mob: Seeker Bats
-----------------------------------
require("scripts/globals/regimes")
-----------------------------------

function onMobDeath(mob, player, isKiller)
    dsp.regime.checkRegime(player, mob, 777, 1, dsp.regime.type.GROUNDS)
    dsp.regime.checkRegime(player, mob, 778, 1, dsp.regime.type.GROUNDS)
    dsp.regime.checkRegime(player, mob, 779, 1, dsp.regime.type.GROUNDS)
    dsp.regime.checkRegime(player, mob, 780, 1, dsp.regime.type.GROUNDS)
    dsp.regime.checkRegime(player, mob, 781, 1, dsp.regime.type.GROUNDS)
end