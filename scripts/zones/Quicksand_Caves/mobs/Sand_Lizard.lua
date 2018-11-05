-----------------------------------
-- Area: Quicksand Caves
--  MOB: Sand Lizard
-----------------------------------
require("scripts/globals/regimes")
-----------------------------------

function onMobDeath(mob, player, isKiller)
    dsp.regime.checkRegime(player, mob, 817, 1, dsp.regime.type.GROUNDS)
end;