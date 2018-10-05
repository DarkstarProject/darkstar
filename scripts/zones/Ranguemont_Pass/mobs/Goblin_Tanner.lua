-----------------------------------
-- Area: Ranguemont Pass
--  MOB: Goblin Tanner
-----------------------------------
require("scripts/globals/regimes")
-----------------------------------

function onMobDeath(mob, player, isKiller)
    dsp.regime.checkRegime(player, mob, 609, 1, dsp.regime.type.GROUNDS)
end;
