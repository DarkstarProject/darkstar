-----------------------------------
-- Area: North Gustaberg
--  Mob: Rock Lizard
-----------------------------------
require("scripts/globals/regimes")
-----------------------------------

function onMobDeath(mob, player, isKiller)
    tpz.regime.checkRegime(player, mob, 19, 2, tpz.regime.type.FIELDS)
end
