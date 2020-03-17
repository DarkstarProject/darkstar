-----------------------------------
-- Area: Inner Horutoto Ruins
--  Mob: Deathwatch Beetle
-----------------------------------
require("scripts/globals/regimes")
-----------------------------------

function onMobDeath(mob, player, isKiller)
    tpz.regime.checkRegime(player, mob, 652, 1, tpz.regime.type.GROUNDS)
end