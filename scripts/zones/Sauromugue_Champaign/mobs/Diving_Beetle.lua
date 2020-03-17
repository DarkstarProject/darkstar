-----------------------------------
-- Area: Sauromugue Champaign
--  Mob: Diving Beetle
-----------------------------------
require("scripts/globals/regimes")
-----------------------------------

function onMobDeath(mob, player, isKiller)
    tpz.regime.checkRegime(player, mob, 40, 2, tpz.regime.type.FIELDS)
end
