-----------------------------------
-- Area: Inner Horutoto Ruins
--  MOB: Battle Bat
-----------------------------------
require("scripts/globals/regimes")
-----------------------------------

function onMobDeath(mob, player, isKiller)
    dsp.regime.checkRegime(player, mob, 649, 1, dsp.regime.type.GROUNDS)
end;