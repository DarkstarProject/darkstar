-----------------------------------
-- Area: Inner Horutoto Ruins
--  MOB: Skinnymalinks
-----------------------------------
require("scripts/globals/regimes")
-----------------------------------

function onMobDeath(mob, player, isKiller)
    dsp.regime.checkRegime(player, mob, 653, 2, dsp.regime.type.GROUNDS)
end;