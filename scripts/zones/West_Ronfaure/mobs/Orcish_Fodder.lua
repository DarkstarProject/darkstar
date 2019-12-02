-----------------------------------
-- Area: West Ronfaure
--  Mob: Orcish Fodder
-----------------------------------
require("scripts/globals/regimes")
-----------------------------------

function onMobDeath(mob, player, isKiller)
    tpz.regime.checkRegime(player, mob, 4, 1, tpz.regime.type.FIELDS)
end
