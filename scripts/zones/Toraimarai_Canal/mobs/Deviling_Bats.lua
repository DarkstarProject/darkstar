-----------------------------------
-- Area: Toraimarai Canal
--  Mob: Deviling Bats
-----------------------------------
require("scripts/globals/regimes")
-----------------------------------

function onMobDeath(mob, player, isKiller)
    tpz.regime.checkRegime(player, mob, 622, 2, tpz.regime.type.GROUNDS)
end
