-----------------------------------
-- Area: West Ronfaure
--  MOB: Wild Sheep
-----------------------------------
require("scripts/globals/regimes")
-----------------------------------

function onMobDeath(mob, player, isKiller)
    dsp.regime.checkRegime(player, mob, 56, 1, dsp.regime.type.FIELDS)
end;
