-----------------------------------
-- Area: Yhoator Jungle
--  Mob: Worker Crawler
-----------------------------------
require("scripts/globals/regimes")
-----------------------------------

function onMobDeath(mob, player, isKiller)
    tpz.regime.checkRegime(player, mob, 132, 1, tpz.regime.type.FIELDS)
end
