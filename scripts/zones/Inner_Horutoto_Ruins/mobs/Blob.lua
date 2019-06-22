-----------------------------------
-- Area: Inner Horutoto Ruins
--  MOB: Blob
-----------------------------------
require("scripts/globals/regimes")
-----------------------------------

function onMobDeath(mob, player, isKiller)
    dsp.regime.checkRegime(player, mob, 649, 2, dsp.regime.type.GROUNDS)
end;