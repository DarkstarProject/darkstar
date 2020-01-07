-----------------------------------
-- Area: RuAun Gardens
--  Mob: Earth Elemental
-----------------------------------
require("scripts/globals/regimes")
-----------------------------------

function onMobDeath(mob, player, isKiller)
    dsp.regime.checkRegime(player, mob, 146, 2, dsp.regime.type.FIELDS)
end;
