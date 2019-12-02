-----------------------------------
-- Area: Tahrongi Canyon
--  Mob: Pygmaioi
-----------------------------------
require("scripts/globals/regimes")
-----------------------------------

function onMobDeath(mob, player, isKiller)
    tpz.regime.checkRegime(player, mob, 94, 2, tpz.regime.type.FIELDS)
    tpz.regime.checkRegime(player, mob, 95, 1, tpz.regime.type.FIELDS)
end
