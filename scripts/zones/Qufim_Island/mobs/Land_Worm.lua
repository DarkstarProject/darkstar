-----------------------------------
-- Area: Qufim Island
--  Mob: Land Worm
-----------------------------------
require("scripts/globals/regimes")
-----------------------------------

function onMobDeath(mob, player, isKiller)
    tpz.regime.checkRegime(player, mob, 41, 2, tpz.regime.type.FIELDS)
end
