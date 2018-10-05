-----------------------------------
-- Area: Jugner Forest
--  MOB: Stag Beetle
-----------------------------------
require("scripts/globals/regimes")
-----------------------------------

function onMobDeath(mob, player, isKiller)
    dsp.regime.checkRegime(player, mob, 12, 1, dsp.regime.type.FIELDS)
    dsp.regime.checkRegime(player, mob, 13, 2, dsp.regime.type.FIELDS)
end;
