-----------------------------------
-- Area: Beaucedine Glacier
--  Mob: Bat Eye
-----------------------------------
require("scripts/globals/regimes")
-----------------------------------

function onMobDeath(mob, player, isKiller)
    dsp.regime.checkRegime(player, mob, 48, 1, dsp.regime.type.FIELDS)
    dsp.regime.checkRegime(player, mob, 49, 2, dsp.regime.type.FIELDS)
    dsp.regime.checkRegime(player, mob, 50, 3, dsp.regime.type.FIELDS)
end;
