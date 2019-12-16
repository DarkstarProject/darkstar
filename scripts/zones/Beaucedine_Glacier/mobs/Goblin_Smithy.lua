-----------------------------------
-- Area: Beaucedine Glacier
--  Mob: Goblin Smithy
-----------------------------------
require("scripts/globals/regimes")
-----------------------------------

function onMobDeath(mob, player, isKiller)
    dsp.regime.checkRegime(player, mob, 46, 2, dsp.regime.type.FIELDS)
    dsp.regime.checkRegime(player, mob, 49, 1, dsp.regime.type.FIELDS)
    dsp.regime.checkRegime(player, mob, 50, 2, dsp.regime.type.FIELDS)
end;
