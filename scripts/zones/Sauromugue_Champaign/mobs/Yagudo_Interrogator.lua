-----------------------------------
-- Area: Sauromugue Champaign
--  Mob: Yagudo Interrogator
-----------------------------------
require("scripts/globals/regimes")
-----------------------------------

function onMobDeath(mob, player, isKiller)
    tpz.regime.checkRegime(player, mob, 99, 2, tpz.regime.type.FIELDS)
end
