-----------------------------------
-- Area: Upper Delkfutt's Tower
--  Mob: Jotunn Wallkeeper
-----------------------------------
require("scripts/globals/regimes")
-----------------------------------

function onMobDeath(mob, player, isKiller)
    dsp.regime.checkRegime(player, mob, 786, 1, dsp.regime.type.GROUNDS)
    dsp.regime.checkRegime(player, mob, 789, 2, dsp.regime.type.GROUNDS)
end