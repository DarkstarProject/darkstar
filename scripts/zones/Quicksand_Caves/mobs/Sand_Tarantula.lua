-----------------------------------
-- Area: Quicksand Caves
--  MOB: Sand Tarantula
-----------------------------------
require("scripts/globals/regimes")
-----------------------------------

function onMobDeath(mob, player, isKiller)
    dsp.regime.checkRegime(player, mob, 819, 1, dsp.regime.type.GROUNDS)
end;