-----------------------------------
-- Area: Rolanberry Fields
--  Mob: Brass Quadav
-----------------------------------
require("scripts/globals/regimes")
-----------------------------------

function onMobDeath(mob, player, isKiller)
    tpz.regime.checkRegime(player, mob, 87, 2, tpz.regime.type.FIELDS)
end
