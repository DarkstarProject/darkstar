-----------------------------------
-- Area: Valkurm Dunes
--  MOB: Goblin Ambusher
-----------------------------------
require("scripts/globals/regimes")
-----------------------------------

function onMobDeath(mob, player, isKiller)
    dsp.regime.checkRegime(player, mob, 57, 2, dsp.regime.type.FIELDS)
end;
