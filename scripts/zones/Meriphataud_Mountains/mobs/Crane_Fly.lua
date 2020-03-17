-----------------------------------
-- Area: Meriphataud Mountains
--  Mob: Crane Fly
-----------------------------------
require("scripts/globals/regimes")
-----------------------------------

function onMobDeath(mob, player, isKiller)
    tpz.regime.checkRegime(player, mob, 36, 1, tpz.regime.type.FIELDS)
    tpz.regime.checkRegime(player, mob, 37, 2, tpz.regime.type.FIELDS)
end
