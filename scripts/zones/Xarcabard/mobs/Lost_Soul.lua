-----------------------------------
-- Area: Xarcabard
--  MOB: Lost Soul
-----------------------------------
require("scripts/globals/regimes")
-----------------------------------

function onMobDeath(mob, player, isKiller)
    dsp.regime.checkRegime(player, mob, 51, 1, dsp.regime.type.FIELDS)
    dsp.regime.checkRegime(player, mob, 52, 1, dsp.regime.type.FIELDS)
    dsp.regime.checkRegime(player, mob, 53, 2, dsp.regime.type.FIELDS)
    dsp.regime.checkRegime(player, mob, 54, 3, dsp.regime.type.FIELDS)
end
