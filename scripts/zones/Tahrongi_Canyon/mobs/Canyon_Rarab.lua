-----------------------------------
-- Area: Tahrongi Canyon
--  Mob: Canyon Rarab
-----------------------------------
require("scripts/globals/regimes")
-----------------------------------

function onMobDeath(mob, player, isKiller)
    tpz.regime.checkRegime(player, mob, 94, 1, tpz.regime.type.FIELDS)
end
