-----------------------------------
-- Area: Xarcabard
--  Mob: Demon Warlock
-----------------------------------
require("scripts/globals/regimes")
-----------------------------------

function onMobDeath(mob, player, isKiller)
    dsp.regime.checkRegime(player, mob, 55, 1, dsp.regime.type.FIELDS)
end
