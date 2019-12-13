-----------------------------------
-- Area: Cape Teriggan
--  Mob: Sand Cockatrice
-----------------------------------
require("scripts/globals/regimes")
-----------------------------------

function onMobDeath(mob, player, isKiller)
    dsp.regime.checkRegime(player, mob, 107, 2, dsp.regime.type.FIELDS)
    dsp.regime.checkRegime(player, mob, 108, 1, dsp.regime.type.FIELDS)
end;
