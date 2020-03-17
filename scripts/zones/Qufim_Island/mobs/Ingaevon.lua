-----------------------------------
-- Area: Qufim Island
--   NM: Ingaevon
-----------------------------------
require("scripts/globals/regimes")
-----------------------------------

function onMobDeath(mob, player, isKiller)
    tpz.regime.checkRegime(player, mob, 44, 1, tpz.regime.type.FIELDS)
    tpz.regime.checkRegime(player, mob, 45, 2, tpz.regime.type.FIELDS)
end
