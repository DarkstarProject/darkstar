-----------------------------------
-- Area: Toraimarai Canal
--  Mob: Blackwater Pugil
-----------------------------------
require("scripts/globals/regimes")
-----------------------------------

function onMobDeath(mob, player, isKiller)
    tpz.regime.checkRegime(player, mob, 624, 1, tpz.regime.type.GROUNDS)
end
