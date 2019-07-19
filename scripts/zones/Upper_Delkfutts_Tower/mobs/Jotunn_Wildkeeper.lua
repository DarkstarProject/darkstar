-----------------------------------
-- Area: Upper Delkfutt's Tower
--  Mob: Jotunn Wildkeeper
-----------------------------------
require("scripts/globals/regimes")
-----------------------------------

function onMobDeath(mob, player, isKiller)
    dsp.regime.checkRegime(player, mob, 787, 2, dsp.regime.type.GROUNDS)
    dsp.regime.checkRegime(player, mob, 789, 1, dsp.regime.type.GROUNDS)
end