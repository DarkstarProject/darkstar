-----------------------------------
-- Area: Xarcabard
--  Mob: Etemmu
-----------------------------------
require("scripts/globals/regimes")
-----------------------------------

function onMobDeath(mob, player, isKiller)
    dsp.regime.checkRegime(player, mob, 51, 2, dsp.regime.type.FIELDS)
end
