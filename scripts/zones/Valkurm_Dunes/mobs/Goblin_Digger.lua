-----------------------------------
-- Area: Valkurm Dunes
--  Mob: Goblin Digger
-----------------------------------
require("scripts/globals/regimes")
-----------------------------------

function onMobDeath(mob, player, isKiller)
    dsp.regime.checkRegime(player, mob, 57, 2, dsp.regime.type.FIELDS)
end;
