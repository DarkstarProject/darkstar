-----------------------------------
-- Area: Outer Horutoto
--  MOB: Thorn Bat
-----------------------------------
require("scripts/globals/regimes")
-----------------------------------

function onMobDeath(mob, player, isKiller)
    dsp.regime.checkRegime(player, mob, 670, 1, dsp.regime.type.GROUNDS)
end