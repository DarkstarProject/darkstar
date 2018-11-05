-----------------------------------
-- Area: Quicksand Caves
--  MOB: Helm Beetle
-----------------------------------
require("scripts/globals/regimes")
-----------------------------------

function onMobDeath(mob, player, isKiller)
    dsp.regime.checkRegime(player, mob, 813, 1, dsp.regime.type.GROUNDS)
end;