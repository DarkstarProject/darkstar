-----------------------------------
-- Area: Qufim Island
--  Mob: Seeker Bats
-----------------------------------
require("scripts/globals/regimes")
-----------------------------------

function onMobDeath(mob, player, isKiller)
    tpz.regime.checkRegime(player, mob, 42, 2, tpz.regime.type.FIELDS)
end
