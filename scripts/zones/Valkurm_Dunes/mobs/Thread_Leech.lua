-----------------------------------
-- Area: Valkurm Dunes
--  MOB: Thread Leech
-----------------------------------
require("scripts/globals/regimes")
-----------------------------------

function onMobDeath(mob, player, isKiller)
    dsp.regime.checkRegime(player, mob, 57, 1, dsp.regime.type.FIELDS)
end;
