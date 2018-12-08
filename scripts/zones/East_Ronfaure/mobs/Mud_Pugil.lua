-----------------------------------
-- Area: East Ronfaure
--  MOB: Mud Pugil
-----------------------------------
require("scripts/globals/regimes")
-----------------------------------

function onMobDeath(mob, player, isKiller)
    dsp.regime.checkRegime(player, mob, 64, 1, dsp.regime.type.FIELDS)
end;
