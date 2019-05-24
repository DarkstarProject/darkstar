-----------------------------------
-- Area: Inner Horutoto Ruins
--  MOB: Covin Bat
-----------------------------------
require("scripts/globals/regimes")
-----------------------------------

function onMobDeath(mob, player, isKiller)
    dsp.regime.checkRegime(player, mob, 653, 1, dsp.regime.type.GROUNDS)
end;