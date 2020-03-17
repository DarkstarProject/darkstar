-----------------------------------
-- Area: Yhoator Jungle
--  Mob: Goblin Hunter
-----------------------------------
require("scripts/globals/regimes")
-----------------------------------

function onMobDeath(mob, player, isKiller)
    tpz.regime.checkRegime(player, mob, 129, 2, tpz.regime.type.FIELDS)
end
