-----------------------------------
-- Area: North Gustaberg
--  Mob: Amethyst Quadav
-----------------------------------
require("scripts/globals/regimes")
-----------------------------------

function onMobDeath(mob, player, isKiller)
    tpz.regime.checkRegime(player, mob, 19, 1, tpz.regime.type.FIELDS)
    tpz.regime.checkRegime(player, mob, 59, 1, tpz.regime.type.FIELDS)
end
