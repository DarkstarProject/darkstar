-----------------------------------
-- Area: Garlaige Citadel
--  MOB: Citadel Bats
-----------------------------------
require("scripts/globals/regimes")
-----------------------------------

function onMobDeath(mob, player, isKiller)
    dsp.regime.checkRegime(player, mob, 705, 2, dsp.regime.type.GROUNDS)
end;