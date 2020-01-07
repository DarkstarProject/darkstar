-----------------------------------
-- Area: Valley of Sorrows
--  Mob: Valley Manticore
-----------------------------------
require("scripts/globals/regimes")
-----------------------------------

function onMobDeath(mob, player, isKiller)
    dsp.regime.checkRegime(player, mob, 140, 2, dsp.regime.type.FIELDS)
    dsp.regime.checkRegime(player, mob, 141, 2, dsp.regime.type.FIELDS)
end;
