-----------------------------------
-- Area: Konschtat Highlands
--  Mob: Rock Eater
-----------------------------------
require("scripts/globals/regimes")
-----------------------------------

function onMobDeath(mob, player, isKiller)
    tpz.regime.checkRegime(player, mob, 20, 1, tpz.regime.type.FIELDS)
end
