-----------------------------------
-- Area: Toraimarai Canal
--  Mob: Sodden Bones
-----------------------------------
require("scripts/globals/regimes")
-----------------------------------

function onMobDeath(mob, player, isKiller)
    tpz.regime.checkRegime(player, mob, 623, 2, tpz.regime.type.GROUNDS)
end
