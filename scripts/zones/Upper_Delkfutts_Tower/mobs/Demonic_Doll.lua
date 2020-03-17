-----------------------------------
-- Area: Upper Delkfutt's Tower
--  Mob: Demonic Doll
-----------------------------------
require("scripts/globals/regimes")
-----------------------------------

function onMobDeath(mob, player, isKiller)
    tpz.regime.checkRegime(player, mob, 788, 3, tpz.regime.type.GROUNDS)
    tpz.regime.checkRegime(player, mob, 789, 3, tpz.regime.type.GROUNDS)
end