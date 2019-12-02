-----------------------------------
-- Area: Toraimarai Canal
--  Mob: Plunderer Crab
-----------------------------------
require("scripts/globals/regimes")
-----------------------------------

function onMobDeath(mob, player, isKiller)
    tpz.regime.checkRegime(player, mob, 623, 1, tpz.regime.type.GROUNDS)
end
