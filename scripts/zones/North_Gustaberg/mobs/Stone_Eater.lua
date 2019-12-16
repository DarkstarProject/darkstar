-----------------------------------
-- Area: North Gustaberg
--  Mob: Stone Eater
-----------------------------------
require("scripts/globals/regimes")
-----------------------------------

function onMobDeath(mob, player, isKiller)
    dsp.regime.checkRegime(player, mob, 16, 1, dsp.regime.type.FIELDS)
end
