-----------------------------------
-- Area: Valkurm Dunes
--  Mob: Goblin Mugger
-----------------------------------
require("scripts/globals/regimes")
-----------------------------------

function onMobDeath(mob, player, isKiller)
    dsp.regime.checkRegime(player, mob, 57, 2, dsp.regime.type.FIELDS)
end;
