-----------------------------------
-- Area: Inner Horutoto Ruins
--  Mob: Battue Bats
-----------------------------------
require("scripts/globals/regimes")
-----------------------------------

function onMobDeath(mob, player, isKiller)
    dsp.regime.checkRegime(player, mob, 647, 1, dsp.regime.type.GROUNDS)
end