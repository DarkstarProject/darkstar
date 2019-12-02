-----------------------------------
-- Area: Konschtat Highlands
--  Mob: Mist Lizard
-----------------------------------
require("scripts/globals/regimes")
-----------------------------------

function onMobDeath(mob, player, isKiller)
    tpz.regime.checkRegime(player, mob, 20, 2, tpz.regime.type.FIELDS)
    tpz.regime.checkRegime(player, mob, 82, 2, tpz.regime.type.FIELDS)
end
