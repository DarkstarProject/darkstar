-----------------------------------
-- Area: Ordelle's Caves
--  Mob: Swagger Spruce
-----------------------------------
require("scripts/globals/regimes")
-----------------------------------

function onMobDeath(mob, player, isKiller)
    tpz.regime.checkRegime(player, mob, 662, 2, tpz.regime.type.GROUNDS)
end