-----------------------------------
-- Area: Konschtat Highlands
--  Mob: Onyx Quadav
-----------------------------------
require("scripts/globals/regimes")
-----------------------------------

function onMobDeath(mob, player, isKiller)
    tpz.regime.checkRegime(player, mob, 83, 1, tpz.regime.type.FIELDS)
end
