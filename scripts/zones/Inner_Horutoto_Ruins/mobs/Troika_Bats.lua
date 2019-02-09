-----------------------------------
-- Area: Inner Horutoto Ruins
--  MOB: Troika Bats
-----------------------------------
require("scripts/globals/regimes")
-----------------------------------

function onMobDeath(mob, player, isKiller)
    dsp.regime.checkRegime(player, mob, 651, 1, dsp.regime.type.GROUNDS)
end;