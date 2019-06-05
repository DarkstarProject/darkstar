-----------------------------------
-- Area: Ranguemont Pass
--  MOB: Stirge
-----------------------------------
require("scripts/globals/regimes")
-----------------------------------

function onMobDeath(mob, player, isKiller)
    dsp.regime.checkRegime(player, mob, 606, 1, dsp.regime.type.GROUNDS)
end;
