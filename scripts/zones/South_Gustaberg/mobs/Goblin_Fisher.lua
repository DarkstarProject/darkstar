-----------------------------------
-- Area: South Gustaberg
--  Mob: Goblin Fisher
-----------------------------------
require("scripts/globals/regimes")
-----------------------------------

function onMobDeath(mob, player, isKiller)
    tpz.regime.checkRegime(player, mob, 79, 1, tpz.regime.type.FIELDS)
end
