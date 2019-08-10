-----------------------------------
-- Area: Buburimu Peninsula
--  Mob: Mighty Rarab
-----------------------------------
require("scripts/globals/regimes")
-----------------------------------

function onMobDeath(mob, player, isKiller)
    dsp.regime.checkRegime(player, mob, 32, 2, dsp.regime.type.FIELDS)
end;
