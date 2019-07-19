-----------------------------------
-- Area: Ranguemont Pass
--  Mob: Blade Bat
-----------------------------------
require("scripts/globals/regimes")
-----------------------------------

function onMobDeath(mob, player, isKiller)
    dsp.regime.checkRegime(player, mob, 602, 2, dsp.regime.type.GROUNDS)
end;
