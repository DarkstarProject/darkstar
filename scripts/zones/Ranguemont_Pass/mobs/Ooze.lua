-----------------------------------
-- Area: Ranguemont Pass
--  MOB: Ooze
-----------------------------------
require("scripts/globals/regimes")
-----------------------------------

function onMobDeath(mob, player, isKiller)
    dsp.regime.checkRegime(player, mob, 603, 2, dsp.regime.type.GROUNDS)
end;
