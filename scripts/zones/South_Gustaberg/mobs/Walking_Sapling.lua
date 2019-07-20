-----------------------------------
-- Area: South Gustaberg
--  Mob: Walking Sapling
-----------------------------------
require("scripts/globals/regimes")
-----------------------------------

function onMobDeath(mob, player, isKiller)
    dsp.regime.checkRegime(player, mob, 78, 2, dsp.regime.type.FIELDS)
end
