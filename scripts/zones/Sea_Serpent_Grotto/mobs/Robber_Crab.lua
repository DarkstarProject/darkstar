-----------------------------------
-- Area: Sea Serpent Grotto
--  Mob: Robber Crab
-----------------------------------
require("scripts/globals/regimes")
-----------------------------------

function onMobDeath(mob, player, isKiller)
    dsp.regime.checkRegime(player, mob, 809, 1, dsp.regime.type.GROUNDS)
    dsp.regime.checkRegime(player, mob, 810, 1, dsp.regime.type.GROUNDS)
end