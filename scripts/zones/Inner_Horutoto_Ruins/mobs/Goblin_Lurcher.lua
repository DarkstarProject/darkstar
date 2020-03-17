-----------------------------------
-- Area: Inner Horutoto Ruins
--  Mob: Goblin Lurcher
-----------------------------------
require("scripts/globals/regimes")
-----------------------------------

function onMobDeath(mob, player, isKiller)
    tpz.regime.checkRegime(player, mob, 654, 1, tpz.regime.type.GROUNDS)
end