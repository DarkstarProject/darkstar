-----------------------------------
-- Area: Tahrongi Canyon
--  Mob: Strolling Sapling
-----------------------------------
require("scripts/globals/regimes")
-----------------------------------

function onMobDeath(mob, player, isKiller)
    tpz.regime.checkRegime(player, mob, 30, 1, tpz.regime.type.FIELDS)
end
