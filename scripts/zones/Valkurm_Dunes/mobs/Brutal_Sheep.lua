-----------------------------------
-- Area: Valkurm Dunes
--  Mob: Brutal Sheep
-----------------------------------
require("scripts/globals/regimes")
-----------------------------------

function onMobDeath(mob, player, isKiller)
    dsp.regime.checkRegime(player, mob, 10, 1, dsp.regime.type.FIELDS)
end;
