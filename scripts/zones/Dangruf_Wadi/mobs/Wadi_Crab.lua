-----------------------------------
-- Area: Dangruf Wadi
--  MOB: Wadi Crab
-----------------------------------
require("scripts/globals/regimes")
-----------------------------------

function onMobDeath(mob, player, isKiller)
    dsp.regime.checkRegime(player, mob, 640, 2, dsp.regime.type.GROUNDS)
end;
