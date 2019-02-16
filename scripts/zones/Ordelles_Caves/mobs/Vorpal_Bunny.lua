-----------------------------------
-- Area: Ordelle's Caves
--  MOB: Vorpal Bunny
-----------------------------------
require("scripts/globals/regimes")
-----------------------------------

function onMobDeath(mob, player, isKiller)
    dsp.regime.checkRegime(player, mob, 658, 2, dsp.regime.type.GROUNDS)
end