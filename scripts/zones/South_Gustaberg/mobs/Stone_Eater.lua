-----------------------------------
-- Area: South Gustaberg
--  MOB: Stone Eater
-----------------------------------
require("scripts/globals/regimes")
-----------------------------------

function onMobDeath(mob, player, isKiller)
    dsp.regime.checkRegime(player, mob, 77, 1, dsp.regime.type.FIELDS)
end
