-----------------------------------
-- Area: The Boyahda Tree
--  Mob: Korrigan
-----------------------------------
require("scripts/globals/regimes")
-----------------------------------

function onMobDeath(mob, player, isKiller)
    tpz.regime.checkRegime(player, mob, 722, 1, tpz.regime.type.GROUNDS)
end