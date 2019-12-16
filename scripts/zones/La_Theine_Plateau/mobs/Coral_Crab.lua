-----------------------------------
-- Area: La Theine Plateau
--  Mob: Coral Crab
-----------------------------------
require("scripts/globals/regimes")
-----------------------------------

function onMobDeath(mob, player, isKiller)
    dsp.regime.checkRegime(player, mob, 70, 2, dsp.regime.type.FIELDS)
end;
