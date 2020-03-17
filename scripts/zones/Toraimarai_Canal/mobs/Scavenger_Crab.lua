-----------------------------------
-- Area: Toraimarai Canal
--  Mob: Scavenger Crab
-----------------------------------
require("scripts/globals/regimes")
-----------------------------------

function onMobDeath(mob, player, isKiller)
    tpz.regime.checkRegime(player, mob, 621, 1, tpz.regime.type.GROUNDS)
end
