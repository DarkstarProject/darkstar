-----------------------------------
-- Area: Outer Horutoto Ruins
--  Mob: Nine of Batons
-----------------------------------
require("scripts/globals/regimes")
-----------------------------------

function onMobDeath(mob, player, isKiller)
    tpz.regime.checkRegime(player, mob, 668, 2, tpz.regime.type.GROUNDS)
end