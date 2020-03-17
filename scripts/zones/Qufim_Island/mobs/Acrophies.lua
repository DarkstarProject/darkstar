-----------------------------------
-- Area: Qufim Island
--  Mob: Acrophies
-----------------------------------
require("scripts/globals/regimes")
-----------------------------------

function onMobDeath(mob, player, isKiller)
    tpz.regime.checkRegime(player, mob, 45, 1, tpz.regime.type.FIELDS)
end
