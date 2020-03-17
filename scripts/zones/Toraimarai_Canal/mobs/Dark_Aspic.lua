-----------------------------------
-- Area: Toraimarai Canal
--  Mob: Dark Aspic
-----------------------------------
require("scripts/globals/regimes")
-----------------------------------

function onMobDeath(mob, player, isKiller)
    tpz.regime.checkRegime(player, mob, 619, 3, tpz.regime.type.GROUNDS)
    tpz.regime.checkRegime(player, mob, 620, 1, tpz.regime.type.GROUNDS)
end
