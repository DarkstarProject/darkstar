-----------------------------------
-- Area: South Gustaberg
--  Mob: Land Crab
-----------------------------------
require("scripts/globals/regimes")
-----------------------------------

function onMobDeath(mob, player, isKiller)
    dsp.regime.checkRegime(player, mob, 80, 2, dsp.regime.type.FIELDS)
end
