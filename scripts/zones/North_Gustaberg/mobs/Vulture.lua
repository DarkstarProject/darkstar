-----------------------------------
-- Area: North Gustaberg
--  Mob: Vulture
-----------------------------------
require("scripts/globals/regimes")
-----------------------------------

function onMobDeath(mob, player, isKiller)
    tpz.regime.checkRegime(player, mob, 18, 1, tpz.regime.type.FIELDS)
end
