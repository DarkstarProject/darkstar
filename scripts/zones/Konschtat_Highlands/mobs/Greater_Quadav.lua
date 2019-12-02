-----------------------------------
-- Area: Konschtat Highlands
--  Mob: Greater Quadav
-----------------------------------
require("scripts/globals/regimes")
-----------------------------------

function onMobDeath(mob, player, isKiller)
    tpz.regime.checkRegime(player, mob, 83, 1, tpz.regime.type.FIELDS)
end
