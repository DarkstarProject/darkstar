-----------------------------------
-- Area: Yhoator Jungle
--  Mob: White Lizard
-----------------------------------
require("scripts/globals/regimes")
-----------------------------------

function onMobDeath(mob, player, isKiller)
    tpz.regime.checkRegime(player, mob, 129, 1, tpz.regime.type.FIELDS)
end
