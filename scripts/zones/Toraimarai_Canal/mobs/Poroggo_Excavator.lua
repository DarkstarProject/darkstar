-----------------------------------
-- Area: Toraimarai Canal
--  Mob: Poroggo Excavator
-----------------------------------
require("scripts/globals/regimes")
-----------------------------------

function onMobDeath(mob, player, isKiller)
    tpz.regime.checkRegime(player, mob, 625, 2, tpz.regime.type.GROUNDS)
end
