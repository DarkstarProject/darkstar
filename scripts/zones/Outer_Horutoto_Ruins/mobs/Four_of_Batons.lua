-----------------------------------
-- Area: Outer Horutoto Ruins
--  Mob: Four of Batons
-----------------------------------
require("scripts/globals/regimes")
-----------------------------------

function onMobDeath(mob, player, isKiller)
    tpz.regime.checkRegime(player, mob, 663, 2, tpz.regime.type.GROUNDS)
end