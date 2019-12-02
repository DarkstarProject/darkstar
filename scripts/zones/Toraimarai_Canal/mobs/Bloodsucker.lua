-----------------------------------
-- Area: Toraimarai Canal
--  Mob: Bloodsucker
-----------------------------------
require("scripts/globals/regimes")
-----------------------------------

function onMobDeath(mob, player, isKiller)
    tpz.regime.checkRegime(player, mob, 620, 2, tpz.regime.type.GROUNDS)
end
