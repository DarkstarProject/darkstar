-----------------------------------
-- Area: Inner Horutoto Ruins
--  Mob: Blade Bat
-----------------------------------
require("scripts/globals/regimes")
-----------------------------------

function onMobDeath(mob, player, isKiller)
    dsp.regime.checkRegime(player, mob, 648, 1, dsp.regime.type.GROUNDS)
end