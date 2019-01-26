-----------------------------------
-- Area: Xarcabard
--  MOB: Demon Wizard
-----------------------------------
require("scripts/globals/regimes")
-----------------------------------

function onMobDeath(mob, player, isKiller)
    dsp.regime.checkRegime(player, mob, 55, 1, dsp.regime.type.FIELDS)
end
