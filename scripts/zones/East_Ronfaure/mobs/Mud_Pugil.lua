-----------------------------------
-- Area: East Ronfaure
--  Mob: Mud Pugil
-----------------------------------
require("scripts/globals/regimes")
-----------------------------------

function onMobDeath(mob, player, isKiller)
    tpz.regime.checkRegime(player, mob, 64, 1, tpz.regime.type.FIELDS)
end;
