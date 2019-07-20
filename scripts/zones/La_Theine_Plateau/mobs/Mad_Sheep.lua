-----------------------------------
-- Area: La Theine Plateau
--  Mob: Mad Sheep
-----------------------------------
require("scripts/globals/regimes")
-----------------------------------

function onMobDeath(mob, player, isKiller)
    dsp.regime.checkRegime(player, mob, 69, 1, dsp.regime.type.FIELDS)
    dsp.regime.checkRegime(player, mob, 70, 1, dsp.regime.type.FIELDS)
end;
