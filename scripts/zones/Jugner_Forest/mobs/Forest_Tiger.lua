-----------------------------------
-- Area: Jugner Forest
--  MOB: Forest Tiger
-----------------------------------
require("scripts/globals/regimes")
-----------------------------------

function onMobDeath(mob, player, isKiller)
    dsp.regime.checkRegime(player, mob, 14, 2, dsp.regime.type.FIELDS)
end;
