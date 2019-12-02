-----------------------------------
-- Area: Konschtat Highlands
--  Mob: Strolling Sapling
-----------------------------------
require("scripts/globals/regimes")
-----------------------------------

function onMobDeath(mob, player, isKiller)
    tpz.regime.checkRegime(player, mob, 81, 1, tpz.regime.type.FIELDS)
end
