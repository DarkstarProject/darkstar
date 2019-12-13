-----------------------------------
-- Area: Beaucedine Glacier
--  Mob: Living Statue
-----------------------------------
require("scripts/globals/regimes")
-----------------------------------

function onMobDeath(mob, player, isKiller)
    dsp.regime.checkRegime(player, mob, 47, 2, dsp.regime.type.FIELDS)
    dsp.regime.checkRegime(player, mob, 48, 2, dsp.regime.type.FIELDS)
    dsp.regime.checkRegime(player, mob, 49, 3, dsp.regime.type.FIELDS)
end;
