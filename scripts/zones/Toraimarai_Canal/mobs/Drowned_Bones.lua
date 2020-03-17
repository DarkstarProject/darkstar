-----------------------------------
-- Area: Toraimarai Canal
--  Mob: Drowned Bones
-----------------------------------
require("scripts/globals/regimes")
-----------------------------------

function onMobDeath(mob, player, isKiller)
    tpz.regime.checkRegime(player, mob, 624, 2, tpz.regime.type.GROUNDS)
end
