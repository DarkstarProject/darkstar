-----------------------------------
-- Area: Valkurm Dunes
--  MOB: Sand Hare
-----------------------------------
require("scripts/globals/regimes")
-----------------------------------

function onMobDeath(mob, player, isKiller)
    dsp.regime.checkRegime(player, mob, 7, 2, dsp.regime.type.FIELDS)
end;
