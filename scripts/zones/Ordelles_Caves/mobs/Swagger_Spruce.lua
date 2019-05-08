-----------------------------------
-- Area: Ordelle's Caves
--  MOB: Swagger Spruce
-----------------------------------
require("scripts/globals/regimes")
-----------------------------------

function onMobDeath(mob, player, isKiller)
    dsp.regime.checkRegime(player, mob, 662, 2, dsp.regime.type.GROUNDS)
end