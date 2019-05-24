-----------------------------------
-- Area: North Gustaberg
--  MOB: Vulture
-----------------------------------
require("scripts/globals/regimes")
-----------------------------------

function onMobDeath(mob, player, isKiller)
    dsp.regime.checkRegime(player, mob, 18, 1, dsp.regime.type.FIELDS)
end;
