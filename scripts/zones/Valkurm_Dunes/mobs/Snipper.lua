-----------------------------------
-- Area: Valkurm Dunes
--  MOB: Snipper
-----------------------------------
require("scripts/globals/regimes")
-----------------------------------

function onMobDeath(mob, player, isKiller)
    dsp.regime.checkRegime(player, mob, 8, 1, dsp.regime.type.FIELDS)
    dsp.regime.checkRegime(player, mob, 9, 2, dsp.regime.type.FIELDS)
end;
