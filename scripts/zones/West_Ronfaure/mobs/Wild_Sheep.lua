-----------------------------------
-- Area: West Ronfaure
--  Mob: Wild Sheep
-----------------------------------
require("scripts/globals/regimes")
-----------------------------------

function onMobDeath(mob, player, isKiller)
    tpz.regime.checkRegime(player, mob, 56, 1, tpz.regime.type.FIELDS)
end
