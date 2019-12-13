-----------------------------------
-- Area: Valley of Sorrows
--  Mob: Peryton
-----------------------------------
require("scripts/globals/regimes")
-----------------------------------

function onMobDeath(mob, player, isKiller)
    dsp.regime.checkRegime(player, mob, 139, 2, dsp.regime.type.FIELDS)
    dsp.regime.checkRegime(player, mob, 141, 1, dsp.regime.type.FIELDS)
end;
