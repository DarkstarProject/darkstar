-----------------------------------
-- Area: La Theine Plateau
--  Mob: Strolling Sapling
-----------------------------------
require("scripts/globals/regimes")
-----------------------------------

function onMobDeath(mob, player, isKiller)
    dsp.regime.checkRegime(player, mob, 5, 1, dsp.regime.type.FIELDS)
end;
