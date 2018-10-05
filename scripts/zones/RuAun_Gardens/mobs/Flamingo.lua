-----------------------------------
-- Area: RuAun Gardens
--  MOB: Flamingo
-----------------------------------
require("scripts/globals/regimes")
-----------------------------------

function onMobDeath(mob, player, isKiller)
    dsp.regime.checkRegime(player, mob, 142, 1, dsp.regime.type.FIELDS)
end;
