-----------------------------------
-- Area: Sauromugue Champaign
--  Mob: Hill Lizard
-----------------------------------
require("scripts/globals/regimes")
-----------------------------------

function onMobDeath(mob, player, isKiller)
    tpz.regime.checkRegime(player, mob, 40, 1, tpz.regime.type.FIELDS)
end
