-----------------------------------
-- Area: Buburimu Peninsula
--  Mob: Sylvestre
-----------------------------------
require("scripts/globals/regimes")
-----------------------------------

function onMobDeath(mob, player, isKiller)
    dsp.regime.checkRegime(player, mob, 32, 1, dsp.regime.type.FIELDS)
    dsp.regime.checkRegime(player, mob, 33, 2, dsp.regime.type.FIELDS)
end;
