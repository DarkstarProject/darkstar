-----------------------------------
-- Area: Outer Horutoto Ruins
--  Mob: Eight of Coins
-----------------------------------
require("scripts/globals/regimes")
-----------------------------------

function onMobDeath(mob, player, isKiller)
    tpz.regime.checkRegime(player, mob, 667, 4, tpz.regime.type.GROUNDS)
end