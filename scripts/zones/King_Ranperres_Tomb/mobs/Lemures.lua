-----------------------------------
-- Area: King Ranperres Tomb
--  Mob: Lemures
-----------------------------------
require("scripts/globals/regimes")
-----------------------------------

function onMobDeath(mob, player, isKiller)
    tpz.regime.checkRegime(player, mob, 636, 2, tpz.regime.type.GROUNDS)
end