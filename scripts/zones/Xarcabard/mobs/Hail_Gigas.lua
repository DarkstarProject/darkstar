-----------------------------------
-- Area: Xarcabard
--  Mob: Hail Gigas
-----------------------------------
require("scripts/globals/regimes")
-----------------------------------

function onMobDeath(mob, player, isKiller)
    dsp.regime.checkRegime(player, mob, 54, 1, dsp.regime.type.FIELDS)
    dsp.regime.checkRegime(player, mob, 55, 2, dsp.regime.type.FIELDS)
end
