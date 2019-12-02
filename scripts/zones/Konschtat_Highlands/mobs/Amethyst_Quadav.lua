-----------------------------------
-- Area: Konschtat Highlands
--  Mob: Amethyst Quadav
-----------------------------------
require("scripts/globals/regimes")
-----------------------------------

function onMobDeath(mob, player, isKiller)
    tpz.regime.checkRegime(player, mob, 83, 1, tpz.regime.type.FIELDS)
end
