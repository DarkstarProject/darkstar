-----------------------------------
-- Area: Cape Teriggan
--  MOB: Robber Crab
-----------------------------------
require("scripts/globals/regimes")
-----------------------------------

function onMobDeath(mob, player, isKiller)
    dsp.regime.checkRegime(player, mob, 105, 1, dsp.regime.type.FIELDS)
    dsp.regime.checkRegime(player, mob, 106, 1, dsp.regime.type.FIELDS)
end;
