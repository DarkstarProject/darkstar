-----------------------------------
-- Area: The Boyahda Tree
--  Mob: Processionaire
-----------------------------------
require("scripts/globals/regimes")
-----------------------------------

function onMobDeath(mob, player, isKiller)
    tpz.regime.checkRegime(player, mob, 724, 1, tpz.regime.type.GROUNDS)
end