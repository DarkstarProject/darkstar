-----------------------------------
-- Area: RuAun Gardens
--  Mob: Eraser (Monster)
-----------------------------------
require("scripts/globals/regimes")
-----------------------------------

function onMobDeath(mob, player, isKiller)
    dsp.regime.checkRegime(player, mob, 143, 2, dsp.regime.type.FIELDS)
    dsp.regime.checkRegime(player, mob, 144, 1, dsp.regime.type.FIELDS)
end;
