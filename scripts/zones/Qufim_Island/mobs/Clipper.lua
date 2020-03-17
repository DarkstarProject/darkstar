-----------------------------------
-- Area: Qufim Island
--  Mob: Clipper
-----------------------------------
require("scripts/globals/regimes")
-----------------------------------

function onMobDeath(mob, player, isKiller)
    tpz.regime.checkRegime(player, mob, 41, 1, tpz.regime.type.FIELDS)
    tpz.regime.checkRegime(player, mob, 42, 1, tpz.regime.type.FIELDS)
    tpz.regime.checkRegime(player, mob, 43, 2, tpz.regime.type.FIELDS)
end
