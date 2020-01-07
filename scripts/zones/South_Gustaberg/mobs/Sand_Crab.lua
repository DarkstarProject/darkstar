-----------------------------------
-- Area: South Gustaberg
--  Mob: Sand Crab
-----------------------------------
require("scripts/globals/regimes")
-----------------------------------

function onMobDeath(mob, player, isKiller)
    dsp.regime.checkRegime(player, mob, 80, 2, dsp.regime.type.FIELDS)
end
