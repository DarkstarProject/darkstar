-----------------------------------
-- Area: Toraimarai Canal
--  Mob: Hell Bat
-----------------------------------
require("scripts/globals/regimes")
-----------------------------------

function onMobDeath(mob, player, isKiller)
    tpz.regime.checkRegime(player, mob, 618, 1, tpz.regime.type.GROUNDS)
end
