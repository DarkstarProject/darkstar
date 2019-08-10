-----------------------------------
-- Area: RuAun Gardens
--  Mob: Ice Elemental
-----------------------------------
require("scripts/globals/regimes")
-----------------------------------

function onMobDeath(mob, player, isKiller)
    dsp.regime.checkRegime(player, mob, 146, 1, dsp.regime.type.FIELDS)
end;
