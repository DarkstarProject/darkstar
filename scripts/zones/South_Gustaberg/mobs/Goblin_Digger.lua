-----------------------------------
-- Area: South Gustaberg
--  Mob: Goblin Digger
-----------------------------------
require("scripts/globals/regimes")
-----------------------------------

function onMobDeath(mob, player, isKiller)
    tpz.regime.checkRegime(player, mob, 79, 1, tpz.regime.type.FIELDS)
end
