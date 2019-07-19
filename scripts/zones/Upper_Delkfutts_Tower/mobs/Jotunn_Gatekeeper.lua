-----------------------------------
-- Area: Upper Delkfutt's Tower
--  Mob: Jotunn Gatekeeper
-----------------------------------
require("scripts/globals/regimes")
-----------------------------------

function onMobDeath(mob, player, isKiller)
    dsp.regime.checkRegime(player, mob, 786, 2, dsp.regime.type.GROUNDS)
    dsp.regime.checkRegime(player, mob, 788, 1, dsp.regime.type.GROUNDS)
end