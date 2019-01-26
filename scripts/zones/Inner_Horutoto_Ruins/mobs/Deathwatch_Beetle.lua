-----------------------------------
-- Area: Inner Horutoto Ruins
--  MOB: Deathwatch Beetle
-----------------------------------
require("scripts/globals/regimes")
-----------------------------------

function onMobDeath(mob, player, isKiller)
    dsp.regime.checkRegime(player, mob, 652, 1, dsp.regime.type.GROUNDS)
end;