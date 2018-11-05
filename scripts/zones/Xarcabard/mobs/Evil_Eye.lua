-----------------------------------
-- Area: Xarcabard
--  MOB: Evil Eye
-----------------------------------
require("scripts/globals/regimes")
-----------------------------------

function onMobDeath(mob, player, isKiller)
    dsp.regime.checkRegime(player, mob, 53, 1, dsp.regime.type.FIELDS)
    dsp.regime.checkRegime(player, mob, 54, 2, dsp.regime.type.FIELDS)
    dsp.regime.checkRegime(player, mob, 55, 3, dsp.regime.type.FIELDS)
end;
