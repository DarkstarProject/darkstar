-----------------------------------
-- Area: Meriphataud Mountains
--  Mob: Hill Lizard
-----------------------------------
require("scripts/globals/regimes")
-----------------------------------

function onMobDeath(mob, player, isKiller)
    dsp.regime.checkRegime(player, mob, 37, 1, dsp.regime.type.FIELDS)
    dsp.regime.checkRegime(player, mob, 38, 2, dsp.regime.type.FIELDS)
end
