-----------------------------------
-- Area: Outer Horutoto Ruins
--  Mob: Fuligo
-----------------------------------
require("scripts/globals/regimes")
-----------------------------------

function onMobDeath(mob, player, isKiller)
    dsp.regime.checkRegime(player, mob, 669, 2, dsp.regime.type.GROUNDS)
    dsp.regime.checkRegime(player, mob, 670, 2, dsp.regime.type.GROUNDS)
end