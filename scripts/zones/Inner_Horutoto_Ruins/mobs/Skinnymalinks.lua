-----------------------------------
-- Area: Inner Horutoto Ruins
--  Mob: Skinnymalinks
-----------------------------------
require("scripts/globals/regimes")
-----------------------------------

function onMobDeath(mob, player, isKiller)
    tpz.regime.checkRegime(player, mob, 653, 2, tpz.regime.type.GROUNDS)
end