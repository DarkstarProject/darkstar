-----------------------------------
-- Area: North Gustaberg
--  Mob: Ground Guzzler
-----------------------------------
require("scripts/globals/regimes")
-----------------------------------

function onMobDeath(mob, player, isKiller)
    tpz.regime.checkRegime(player, mob, 16, 1, tpz.regime.type.FIELDS)
end
