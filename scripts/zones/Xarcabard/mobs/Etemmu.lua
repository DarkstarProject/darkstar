-----------------------------------
-- Area: Xarcabard
--  Mob: Etemmu
-----------------------------------
require("scripts/globals/regimes")
-----------------------------------

function onMobDeath(mob, player, isKiller)
    tpz.regime.checkRegime(player, mob, 51, 2, tpz.regime.type.FIELDS)
end
