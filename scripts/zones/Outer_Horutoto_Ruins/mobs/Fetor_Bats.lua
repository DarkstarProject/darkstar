-----------------------------------
-- Area: Outer Horutoto Ruins
--  Mob: Fetor Bats
-----------------------------------
require("scripts/globals/regimes")
-----------------------------------

function onMobDeath(mob, player, isKiller)
    dsp.regime.checkRegime(player, mob, 669, 1, dsp.regime.type.GROUNDS)
end