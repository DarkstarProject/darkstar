-----------------------------------
-- Area: Outer Horutoto Ruins
--  Mob: Nine of Coins
-----------------------------------
require("scripts/globals/regimes")
-----------------------------------

function onMobDeath(mob, player, isKiller)
    tpz.regime.checkRegime(player, mob, 668, 4, tpz.regime.type.GROUNDS)
end