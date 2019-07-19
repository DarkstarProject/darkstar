-----------------------------------
-- Area: La Theine Plateau
--  Mob: Grass Funguar
-----------------------------------
require("scripts/globals/regimes")
-----------------------------------

function onMobDeath(mob, player, isKiller)
    dsp.regime.checkRegime(player, mob, 6, 1, dsp.regime.type.FIELDS)
    dsp.regime.checkRegime(player, mob, 71, 2, dsp.regime.type.FIELDS)
end;
