-----------------------------------
-- Area: Meriphataud Mountains
--  Mob: Hill Lizard
-----------------------------------
require("scripts/globals/regimes")
-----------------------------------

function onMobDeath(mob, player, isKiller)
    tpz.regime.checkRegime(player, mob, 37, 1, tpz.regime.type.FIELDS)
    tpz.regime.checkRegime(player, mob, 38, 2, tpz.regime.type.FIELDS)
end
