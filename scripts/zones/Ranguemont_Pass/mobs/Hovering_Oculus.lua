-----------------------------------
-- Area: Ranguemont Pass
--  Mob: Hovering Oculus
-----------------------------------
require("scripts/globals/regimes")
-----------------------------------

function onMobDeath(mob, player, isKiller)
    dsp.regime.checkRegime(player, mob, 607, 2, dsp.regime.type.GROUNDS)
end;
