-----------------------------------
-- Area: Buburimu Peninsula
--  Mob: Bull Dhalmel
-----------------------------------
require("scripts/globals/regimes")
-----------------------------------

function onMobDeath(mob, player, isKiller)
    dsp.regime.checkRegime(player, mob, 34, 1, dsp.regime.type.FIELDS)
    dsp.regime.checkRegime(player, mob, 35, 2, dsp.regime.type.FIELDS)
end;
