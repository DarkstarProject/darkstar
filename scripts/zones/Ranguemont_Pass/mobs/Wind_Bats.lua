-----------------------------------
-- Area: Ranguemont Pass
--  MOB: Wind Bats
-----------------------------------
require("scripts/globals/regimes")
-----------------------------------

function onMobDeath(mob, player, isKiller)
    dsp.regime.checkRegime(player, mob, 602, 1, dsp.regime.type.GROUNDS)
end;
