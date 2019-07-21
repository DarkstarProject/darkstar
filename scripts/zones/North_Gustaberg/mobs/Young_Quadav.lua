-----------------------------------
-- Area: North Gustaberg
--  Mob: Young Quadav
-----------------------------------
require("scripts/globals/regimes")
-----------------------------------

function onMobDeath(mob, player, isKiller)
    dsp.regime.checkRegime(player, mob, 19, 1, dsp.regime.type.FIELDS)
    dsp.regime.checkRegime(player, mob, 59, 1, dsp.regime.type.FIELDS)
end
