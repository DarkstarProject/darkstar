-----------------------------------
-- Area: Valkurm Dunes
--  Mob: Hill Lizard
-----------------------------------
require("scripts/globals/regimes")
-----------------------------------

function onMobDeath(mob, player, isKiller)
    dsp.regime.checkRegime(player, mob, 7, 1, dsp.regime.type.FIELDS)
    dsp.regime.checkRegime(player, mob, 8, 2, dsp.regime.type.FIELDS)
end;
