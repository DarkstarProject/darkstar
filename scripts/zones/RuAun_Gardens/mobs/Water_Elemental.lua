-----------------------------------
-- Area: RuAun Gardens
--  MOB: Water Elemental
-----------------------------------
require("scripts/globals/regimes")
-----------------------------------

function onMobDeath(mob, player, isKiller)
    dsp.regime.checkRegime(player, mob, 146, 3, dsp.regime.type.FIELDS)
end;
