-----------------------------------
-- Area: Quicksand Caves
--  MOB: Sand Spider
-----------------------------------
require("scripts/globals/regimes")
-----------------------------------

function onMobDeath(mob, player, isKiller)
    dsp.regime.checkRegime(player, mob, 812, 1, dsp.regime.type.GROUNDS)
end;