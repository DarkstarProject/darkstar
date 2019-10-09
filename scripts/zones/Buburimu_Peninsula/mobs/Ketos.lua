-----------------------------------
-- Area: Buburimu Peninsula
--  Mob: Ketos
-----------------------------------
require("scripts/globals/regimes")
-----------------------------------

function onMobDeath(mob, player, isKiller)
    dsp.regime.checkRegime(player, mob, 62, 1, dsp.regime.type.FIELDS)
end;
