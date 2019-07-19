-----------------------------------
-- Area: La Theine Plateau
--  Mob: Gale Bats
-----------------------------------
require("scripts/globals/regimes")
-----------------------------------

function onMobDeath(mob, player, isKiller)
    dsp.regime.checkRegime(player, mob, 71, 1, dsp.regime.type.FIELDS)
end;
