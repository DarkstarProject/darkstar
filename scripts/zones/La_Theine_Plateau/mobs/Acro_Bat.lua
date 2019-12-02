-----------------------------------
-- Area: La Theine Plateau
--  Mob: Acro Bat
-----------------------------------
require("scripts/globals/regimes")
-----------------------------------

function onMobDeath(mob, player, isKiller)
    tpz.regime.checkRegime(player, mob, 71, 1, tpz.regime.type.FIELDS)
end;
