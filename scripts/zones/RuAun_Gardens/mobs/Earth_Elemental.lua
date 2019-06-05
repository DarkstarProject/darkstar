-----------------------------------
-- Area: RuAun Gardens
--  MOB: Earth Elemental
-----------------------------------
require("scripts/globals/regimes")
-----------------------------------

function onMobDeath(mob, player, isKiller)
    dsp.regime.checkRegime(player, mob, 146, 2, dsp.regime.type.FIELDS)
end;
