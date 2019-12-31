-----------------------------------
-- Area: Meriphataud Mountains
--  Mob: Stag Beetle
-----------------------------------
require("scripts/globals/regimes")
-----------------------------------

function onMobDeath(mob, player, isKiller)
    dsp.regime.checkRegime(player, mob, 38, 1, dsp.regime.type.FIELDS)
    dsp.regime.checkRegime(player, mob, 39, 2, dsp.regime.type.FIELDS)
end
