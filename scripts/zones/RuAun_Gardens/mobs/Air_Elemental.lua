-----------------------------------
-- Area: RuAun Gardens
--  Mob: Air Elemental
-----------------------------------
require("scripts/globals/regimes")
-----------------------------------

function onMobDeath(mob, player, isKiller)
    dsp.regime.checkRegime(player, mob, 145, 2, dsp.regime.type.FIELDS)
end;
