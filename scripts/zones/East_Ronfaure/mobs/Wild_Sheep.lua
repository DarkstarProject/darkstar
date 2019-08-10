-----------------------------------
-- Area: East Ronfaure
--  Mob: Wild Sheep
-----------------------------------
require("scripts/globals/regimes")
-----------------------------------

function onMobDeath(mob, player, isKiller)
    dsp.regime.checkRegime(player, mob, 68, 1, dsp.regime.type.FIELDS)
end;
