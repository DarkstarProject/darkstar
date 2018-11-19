-----------------------------------
-- Area: La Theine Plateau
--  MOB: Coral Crab
-----------------------------------
require("scripts/globals/regimes")
-----------------------------------

function onMobDeath(mob, player, isKiller)
    dsp.regime.checkRegime(player, mob, 70, 2, dsp.regime.type.FIELDS)
end;
