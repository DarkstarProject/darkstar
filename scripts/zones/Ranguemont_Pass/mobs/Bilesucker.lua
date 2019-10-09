-----------------------------------
-- Area: Ranguemont Pass
--  Mob: Bilesucker
-----------------------------------
require("scripts/globals/regimes")
-----------------------------------

function onMobDeath(mob, player, isKiller)
    dsp.regime.checkRegime(player, mob, 607, 1, dsp.regime.type.GROUNDS)
end;
