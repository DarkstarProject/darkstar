-----------------------------------
-- Area: Behemoths Dominion
--  Mob: Lost Soul
-----------------------------------
require("scripts/globals/regimes")
-----------------------------------

function onMobDeath(mob, player, isKiller)
    tpz.regime.checkRegime(player, mob, 103, 2, tpz.regime.type.FIELDS)
end;
