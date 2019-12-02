-----------------------------------
-- Area: Konschtat Highlands
--  Mob: Goblin Butcher
-----------------------------------
require("scripts/globals/regimes")
-----------------------------------

function onMobDeath(mob, player, isKiller)
    tpz.regime.checkRegime(player, mob, 84, 3, tpz.regime.type.FIELDS)
end
