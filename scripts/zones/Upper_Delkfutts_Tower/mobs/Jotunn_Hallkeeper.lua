-----------------------------------
-- Area: Upper Delkfutt's Tower
--  Mob: Jotunn Hallkeeper
-----------------------------------
require("scripts/globals/regimes")
-----------------------------------

function onMobDeath(mob, player, isKiller)
    dsp.regime.checkRegime(player, mob, 787, 1, dsp.regime.type.GROUNDS)
    dsp.regime.checkRegime(player, mob, 788, 2, dsp.regime.type.GROUNDS)
end