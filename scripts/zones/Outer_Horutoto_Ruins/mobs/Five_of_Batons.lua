-----------------------------------
-- Area: Outer Horutoto Ruins
--  Mob: Five of Batons
-----------------------------------
require("scripts/globals/regimes")
-----------------------------------

function onMobDeath(mob, player, isKiller)
    tpz.regime.checkRegime(player, mob, 664, 2, tpz.regime.type.GROUNDS)
end